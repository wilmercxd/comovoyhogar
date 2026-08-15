# ¿Cómo voy? · Hogar Barranquilla

Portal de desempeño para el equipo de Claro Hogar de Alfredo Pérez. Cada asesor entra
con su cédula y ve sus instaladas, su proyección de cierre, la comisión que va saliendo,
las ventas que se le están quedando y su retroalimentación para firmarla. El supervisor
ve al equipo completo, las firmas y el consolidado de notas.

---

## Cómo se actualiza el corte

Tres pasos, en este orden:

```bash
powershell -File generar_datos.ps1 -Corte 2026-08-13
```
```bash
powershell -File construir.ps1
```
```bash
vercel --prod
```

`generar_datos.ps1` lee todas las `SABANA HOGAR*.csv` de la carpeta padre y produce
`ventas.json`. `construir.ps1` lo inyecta en `portal_src.html` y escribe `index.html`.

Si omites `-Corte`, se toma la fecha de agenda más reciente con estado instalado.

**Nunca edites `index.html` a mano**: se regenera completo en cada corte.

---

## Las reglas de cálculo

| Concepto | Regla |
|---|---|
| Fecha de referencia | **FECHA AGENDA**, no la fecha de venta |
| Instalada | `ESTADO DIGITACION = INSTALADO` |
| Días hábiles | Lunes a sábado, sin domingos ni festivos colombianos |
| Festivos cargados | 20 jul · 7 ago · 17 ago de 2026 |
| Semanas de agosto | 1–9 · 10–16 · 17–23 · 24–31 (las del PDF de comisiones) |
| Proyección | `instaladas_al_corte × (hábiles_totales / hábiles_transcurridos)` |
| Cumplimiento | `proyección / meta` |
| Semáforo | ≥85 % verde · 70–84 % ámbar · <70 % rojo |
| % contrato digital | Columna `CONTRATO = Digital` sobre el total radicado del mes |
| OTT | Columna `ADICIONAL`, solo streaming, sobre ventas instaladas |
| Ventas duplicadas | Se deduplica por `N°OT`; gana el archivo más reciente |

Un mes cerrado no se proyecta: julio muestra su cierre definitivo.

### Metas y comisión

El tipo de meta de cada asesor está en `roster.csv` (`OUTBOUND` u omnicanal, aquí
`BLASTER`). Los escalones salen de *COMISIONES AGOSTO.pdf*:

| Piso | Outbound · mes | Outbound · semana | Omnicanal · mes | Omnicanal · semana |
|---|---|---|---|---|
| 1 | 20 · $10.000 | 6 · $10.000 | 30 · $15.000 | 8 · $15.000 |
| 2 | 25 · $15.000 | 8 · $15.000 | 35 · $20.000 | 10 · $20.000 |
| 3 | 30 · $20.000 | 10 · $20.000 | 40 · $25.000 | 12 · $25.000 |

Total = comisión base del mes (sobre la proyección) + extra bono semanal (suma de las
cuatro semanas, cada una en su propio piso). El bono semanal arranca en agosto de 2026.

---

## Supabase

Proyecto: `mrmtprhaoilwzwghzdqn`

1. SQL Editor → ejecutar `supabase/schema.sql` completo (tablas, RLS y equipo).
2. SQL Editor → ejecutar `supabase/cuentas.sql` completo (cuentas de acceso).

Ambos son idempotentes. No hay que tocar nada en el dashboard.

### Cómo entra la gente

Tres campos: **cédula, contraseña y segundo apellido**.

**La contraseña es la misma cédula.** La pantalla no lo dice: eso se explica en la
inducción. El segundo apellido se valida contra el roster antes de tocar el servidor.

El correo es sintético (`{cedula}@como-voy.local`) y nunca recibe nada; existe solo
porque Supabase necesita un usuario con email y contraseña por debajo para emitir el JWT
que hace funcionar RLS. `cuentas.sql` las crea ya confirmadas, así que el portal **nunca
llama a `signUp()`** y el ajuste "Confirm email" del dashboard no afecta el login.

Para cambiarle la contraseña a alguien, edita `clave_de()` en `cuentas.sql` y vuelve a
ejecutarlo.

### Dar de alta a alguien nuevo

1. Agregarlo a `roster.csv` (con su tipo de meta).
2. Agregarlo al `insert` del paso 9 de `schema.sql` y ejecutar ese bloque.
3. Volver a ejecutar `cuentas.sql` completo.
4. Regenerar y volver a publicar.

Al final de `cuentas.sql` hay una consulta que lista, para cada persona, qué apellido
tiene que escribir y si su cuenta quedó bien creada.

### Sobre este modelo de acceso

Los tres datos (cédula, cédula otra vez y apellido) circulan dentro del piso: quien los
sepa puede entrar como otro. Es una decisión consciente a cambio de que nadie tenga que
recordar una contraseña nueva. Lo que sostiene la seguridad real es el **Deployment
Protection de Vercel**, que es la puerta de antes. Si en algún momento hace falta más,
el camino es un OTP al correo corporativo.

### Tablas

| Tabla | Qué guarda | Quién la ve |
|---|---|---|
| `usuarios` | Cédula, nombre y rol | Cada quien el suyo; el supervisor, todos |
| `feedback` | Retroalimentación registrada por el supervisor | El asesor la suya; el supervisor, todas |
| `firmas` | Trazo, observaciones, fecha e IP | Igual que `feedback` |
| `notas` | Bitácora del supervisor | **Solo el supervisor** |
| `metas` | Metas personales del asesor | **Solo el asesor** |

### Decisiones de seguridad que no hay que deshacer

- **La cédula sale del email, no de `user_metadata`.** Cualquier usuario puede reescribir
  su propio metadata con `auth.updateUser()`; si las políticas confiaran en él, un asesor
  se haría pasar por el supervisor.
- **`usuarios` es de solo lectura desde el portal.** Si el asesor pudiera escribir su
  fila, se pondría `rol = SUPERVISOR`. El equipo se siembra desde el SQL.
- **`es_supervisor()` es `security definer`.** Una política que consulte `usuarios`
  directamente entra en recursión infinita contra su propia RLS.
- **La IP se captura en el servidor** (`ip_cliente()` lee `x-forwarded-for`). Tomada en
  el navegador, se puede alterar antes de enviarla.
- **Una firma no se edita ni se borra**: no hay políticas de update ni delete, y
  `unique (cc_asesor, feedback_id)` impide firmar dos veces.

---

## Publicar

`index.html` lleva dentro los KPIs de todo el equipo **y las cédulas de los clientes**.
Cualquiera que abra la URL se lo descarga entero. El login del portal no protege eso:
lo que protege es el control de acceso del despliegue.

> **Deployment Protection en Vercel es obligatorio, no opcional.**
> Project → Settings → Deployment Protection → *Vercel Authentication* o *Password*.

### Ruta recomendada: desplegar desde local

El repositorio guarda solo las fuentes; los datos nunca entran al historial de git.

```bash
vercel --prod
```

### Si prefieres deploy automático desde GitHub

Toca versionar `index.html` con los datos adentro. En ese caso:

1. El repositorio **tiene que ser privado**.
2. Quita `index.html` de `.gitignore`.
3. Ten presente que cada corte queda en el historial y borrarlo después no es trivial.

### Primer push

```bash
git init && git add . && git commit -m "Portal Como Voy Hogar"
```
```bash
git remote add origin <url-del-repo-privado> && git push -u origin main
```

Revisa con `git status` qué quedó incluido antes de hacer push.

---

## Llaves

En `index.html` va **solo** la llave publicable (`sb_publishable_…`). Es de cliente y está
pensada para ser visible: quien la protege es RLS.

La llave secreta (`sb_secret_…`) **no va en el portal, ni en el repositorio, ni en
Vercel**. Salta cualquier política de RLS. Si alguna vez se compartió por chat o correo,
rótala en Supabase → Settings → API Keys.

---

## Antes de publicar un corte nuevo

- [ ] `generar_datos.ps1` terminó sin errores en rojo
- [ ] Ningún asesor con instaladas > 0 y comisión en $0 sin explicación
- [ ] Las instaladas de un par de asesores cuadran contra la sábana
- [ ] Entrar con cédula y segundo apellido, firmar, salir y volver a entrar desde otro navegador
- [ ] El supervisor ve esa firma
- [ ] La hora de la firma es hora de Colombia, no UTC
- [ ] Deployment Protection sigue activa

---

## Si algo falla

| Síntoma | Causa |
|---|---|
| «Failed to fetch» al entrar | URL del proyecto mal escrita, o el `connect-src` del CSP en `vercel.json` no apunta al host correcto |
| Todo sale sin firmar en la vista del supervisor | La consulta de firmas está filtrando por cédula. El supervisor no tiene firmas propias: hay que cargar sin filtro y dejar que RLS acote |
| La hora de la firma va 5 horas adelantada | Postgres devuelve UTC sin marca de zona y el navegador la lee como local. Hay que agregar la `Z` y formatear con `timeZone` explícito |
| Faltan ventas de los días recientes | El export mezcla fechas de texto con seriales de Excel (46246 = 12/08/2026). El parser acepta ambos |
| Un asesor sale dos veces | Mojibake en los nombres. Se agrupa siempre por cédula, nunca por nombre |
| KPIs en cero sin explicación | El nombre de una columna cambió entre exportes. Las columnas se resuelven ignorando espacios y mayúsculas |
| «row violates row-level security» al firmar | La cédula de la sesión no coincide con la del feedback, o no se ejecutó el `schema.sql` completo |
| «Database error querying schema» al entrar | Una cuenta de `auth.users` quedó con campos de token en `NULL`; GoTrue los lee como texto y revienta. Lo arregla el bloque de reparación al final de `cuentas.sql` |
| «tu cuenta todavía no está lista» al entrar | Falta ejecutar `cuentas.sql`, o la persona se agregó a `roster.csv` pero no a `usuarios` |
| Alguien no entra y jura que el apellido está bien | Correr la consulta del final de `cuentas.sql`: muestra exactamente qué apellido espera el sistema para esa cédula |

Un error que produce ceros es peor que uno que rompe: nadie lo nota.

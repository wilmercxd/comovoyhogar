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
| Ventas duplicadas | Se deduplica por `N°OT`; gana la sábana de corte más reciente |
| Qué sábana es más reciente | La fecha del **nombre** del archivo, nunca la del sistema |
| Meses ya cerrados | No se modifican por sábanas posteriores |

Un mes cerrado no se proyecta: julio muestra su cierre definitivo.

### Actualizar con doble clic

`actualizar_portal.bat` corre todo el flujo de un clic: calcula la fecha de ayer (día
vencido — el día de hoy siempre llega incompleto por el rezago de un día en los estados
de instalación), y ejecuta `generar_datos.ps1 -Corte {ayer}` seguido de `construir.ps1`.
Deja la ventana abierta al final para que se vea si algo falló antes de cerrarla.

No reemplaza el paso de subir a GitHub — solo dejar `index.html` actualizado localmente.

### Cómo se combinan varias sábanas

Las sábanas se acumulan en la carpeta: el generador las lee todas y deduplica por `N°OT`.
Dos reglas gobiernan quién gana, y las dos importan:

**1. El orden sale de la fecha del nombre del archivo** (`SABANA HOGAR_dd_mm_aaaa`), no de
la fecha de modificación. La fecha del sistema es la de cuándo se descargó el archivo, no
la del corte que contiene: si se baja una sábana vieja después de una nueva, ordenar por
ella hace que la vieja le sobrescriba los estados a la nueva y las ventas recientes
desaparezcan sin que nadie lo note.

**2. Un mes ya cerrado conserva el estado de su sábana de cierre.** Que una OT de julio
cambie de estado en la sábana de agosto no puede mover el cierre de julio, que ya se
comunicó y se pagó.

La condición de la regla 2 se evalúa sobre la **fecha de agenda nueva**. Una venta que
quedó `NO INSTALADO` el 31/07 y se reagendó al 06/08 es una venta de agosto: en julio no
contaba, así que no le resta nada, y tiene que sumar en agosto. Congelarla por haber
aparecido antes en la sábana de julio la haría desaparecer de los dos meses.

**El mes en curso absorbe las agendas más futuras.** Si mientras agosto sigue abierto
aparece una venta agendada para septiembre, no abre una pestaña de septiembre: cuenta
dentro de agosto hasta que agosto cierre el 31. El tope de `$clavesMes` es siempre el mes
del corte (`$mkCorte`), nunca el mes más futuro que traiga la sábana.

Esto también aplica si la venta **ya estaba `INSTALADO` en un mes cerrado y pagado**, y
una sábana posterior le corrige la fecha agenda a otro mes: se mueve al mes nuevo igual
que cualquier otra. No es un caso hipotético — pasó el 19/08/2026 con una venta de
Yeraldin (OT `475747234`), confirmado con Wilmer como un ajuste real, no un glitch del
reporte. Por eso julio puede mostrar una diferencia nueva contra el cierre oficial
aunque nadie haya tocado nada: revisar con el supervisor antes de asumir que es un bug.

### Sábanas de nombre fijo (sin fecha en el nombre)

Algunos exportes usan un nombre fijo que se sobrescribe cada día (ej.
`SABANA HOGAR_AGOSTO_BRQ.csv`), en vez de `SABANA HOGAR_dd_mm_aaaa`. Como el nombre no
trae fecha, `Fecha-Archivo()` no puede leerla del nombre — usa el `-Corte` que se le pasó
al generador como fecha del archivo (nunca `LastWriteTime`: en una carpeta de OneDrive
esa fecha puede reflejar cuándo sincronizó, no cuándo se generó el dato).

**Validar el alcance antes de cargar un archivo así.** Uno de estos exportes llegó una
vez con 213 filas totales pero solo 12 de nuestro equipo (el resto era de otras
sub-campañas), y sin ninguna instalada — se descartó a tiempo porque el generador no
"falla" con datos incompletos, simplemente reporta menos. Comparar siempre el conteo de
filas del equipo y las instaladas contra el corte anterior antes de generar.

**Filtro por campaña:** una fila puede traer la cédula de un asesor nuestro por error de
digitación pero pertenecer a otra campaña (visto: `CAMPAÑA=STAFF` con la cédula de un
asesor de Hogar y otro nombre en la columna ASESOR). El generador descarta toda fila
cuya `CAMPAÑA` no empiece por `HOGAR` y avisa cuál — no se filtra por nombre porque los
nombres traen variantes normales (apellidos truncados) que no son error.

### Metas y comisión

**El esquema depende del mes, no solo del tipo de asesor.** Lo resuelve la función
`Esquema($mes, $tipo)` del generador y se emite en el JSON indexado por mes, para que
el portal pueda mostrar cada mes con las reglas con las que se cerró.

**Hasta julio de 2026** — cada quien por su tipo, según `roster.csv`:

| Piso | Outbound · mes | Omnicanal (`BLASTER`) · mes |
|---|---|---|
| 1 | 20 · $10.000 | 30 · $15.000 |
| 2 | 25 · $15.000 | 35 · $20.000 |
| 3 | 30 · $20.000 | 40 · $25.000 |

**Desde agosto de 2026** — esquema unificado: todo el equipo va por el de Omnicanal, sin
importar su tipo de meta. Es lo que controla la constante `$MES_UNIFICADO`.

| Piso | Mes | Semana |
|---|---|---|
| 1 | 30 · $15.000 | 8 · $15.000 |
| 2 | 35 · $20.000 | 10 · $20.000 |
| 3 | 40 · $25.000 | 12 · $25.000 |

Total = comisión base del mes (sobre la proyección) + extra bono semanal (suma de las
cuatro semanas, cada una en su propio piso). El bono semanal arranca en agosto de 2026.

El tipo del roster **sigue haciendo falta**: es lo que decide el esquema de los meses
anteriores a `$MES_UNIFICADO`. No hay que borrarlo.

---

## Supabase

Proyecto: `mrmtprhaoilwzwghzdqn`

1. SQL Editor → ejecutar `supabase/schema.sql` completo (tablas, RLS y equipo).
2. SQL Editor → ejecutar `supabase/cuentas.sql` completo (cuentas de acceso).

Ambos son idempotentes. No hay que tocar nada en el dashboard.

### Monitoreo de calidad estructurado

`public.feedback` tiene una columna `tipo` (`generico` | `monitoreo`) y una `datos`
jsonb. El modal "Registrar retroalimentación" del portal solo crea `generico` (título +
cuerpo + compromisos, como siempre). El monitoreo de calidad es `datos` con esta forma:

```
{ nota, notaMax, fechaLlamada, cliente, cedulaCliente, telefono, grabacion,
  tipificacion, duracion, criterios:[{nombre, peso, marcador, texto}], resumen,
  recomendacion }
```

`tarjetaFeedback()` despacha según `tipo`: la de monitoreo muestra la nota grande,
la cuadrícula de datos de la llamada, la tabla de criterios (evaluación coloreada
verde/ámbar/rojo/gris según el marcador — SI/NO/N/A/ALTA/MEDIA/BAJA o una fracción
X/Y, sin reescribirlo a otro vocabulario) y el resumen/recomendaciones. Ambas
tarjetas comparten el mismo bloque de firma (`construirZonaFirma()`).

`cliente`/`cedulaCliente` quedan en `null` porque el Excel de monitoreos no trae esos
datos del cliente; el portal cae al texto "no identificado en la base" en ese caso.

`supabase/cargar_monitoreos_agosto.sql` carga los monitoreos de
`Cruce_Manifiesto_Agentes.xlsx` como filas `tipo='monitoreo'`. Es idempotente: cada
INSERT trae un `where not exists` contra `datos->>'grabacion'`, así que correrlo dos
veces no duplica nada. Para un corte nuevo, regenerar este archivo con el mismo
procedimiento (parsear el Excel con Excel COM vía PowerShell, armar el jsonb por fila,
volcar a SQL con dollar-quoting) y volver a ejecutarlo.

**Si ya habías cargado monitoreos con la versión anterior** (texto plano en `cuerpo`,
`tipo='generico'`): ejecutar primero `supabase/migrar_monitoreos_viejos.sql` — borra esas
filas para que `cargar_monitoreos_agosto.sql` no las duplique. Se detiene solo con un
error si alguna ya tiene firma (borrar el feedback borraría esa firma en cascada); en ese
caso, resolver a mano antes de continuar.

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

### Capa de gamificación (agosto 2026)

Todo esto vive en `ventas.json` salvo los reconocimientos (Supabase, tabla
`reconocimientos`), y solo se muestra en el **mes en curso** — un mes cerrado no lo
necesita, ya es un resultado fijo:

- **Racha de ventas**: días hábiles consecutivos con al menos 1 instalada, contando
  hacia atrás desde el último día completo (no desde el día del corte: por el rezago
  de un día, contarlo rompería rachas que en realidad siguen vivas). Un comodín mensual
  perdona un único día flojo sin cortar la racha.
- **Gánale a tu ayer**: instaladas de ayer vs. tu mejor día del mes.
- **Ligas** (Bronce/Plata/Oro/Platino/Diamante, por tramos de cumplimiento): capa de
  juego sobre el `%` de siempre, no lo reemplaza. Se calculan en el cliente
  (`ligaDe()`), no hay nada que generar.
- **Comisión ganada vs. potencial**: `garantizada` = comisión sobre instaladas
  **reales** (no la proyección) + el extra bono semanal, que ya se calcula sobre
  instaladas reales de cada semana. `total - garantizada` es lo que todavía se puede
  ganar. Nunca es negativo: `total` siempre incluye al menos lo garantizado.
- **Efecto de arranque**: la barra de avance de un mes en curso nunca se ve en 0%
  (mínimo visual 8%), para que transmita movimiento desde el primer día. Un mes
  cerrado muestra el número real, sin piso artificial.
- **Reconocimientos**: el supervisor los da desde "Mi equipo" → "Dar reconocimiento".
  Aparecen en el nudge de login del asesor y en una vitrina en su vista, filtrados por
  el mes al que aplican. También quedan en el consolidado de notas del supervisor.

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
| `reconocimientos` | Reconocimientos que da el supervisor | El asesor los suyos; el supervisor, todos |
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
| Bajan las instaladas de un mes al meter una sábana nueva | Una sábana vieja está ganando la deduplicación. Verificar la línea `corte aaaa-mm-dd` que imprime el generador por archivo: tiene que ir en orden ascendente |
| Baja el conteo de un mes ya cerrado | Puede ser un ajuste real (una venta instalada se reagendó de mes en el reporte, ver arriba) o una sábana mal filtrada. Revisar la OT específica en los archivos antes de asumir bug |
| Ventas rechazadas que se pisan entre sí, o desaparecen del "por revisar" | `N°OT` viene como `0` (no `''`) para marcar "sin OT". El generador ya no lo trata como un OT real: si aun así se repite, revisar si apareció otro valor placeholder distinto de `0` |
| El día del corte muestra muy pocas instaladas | Normal: los estados de instalación llegan con un día de rezago. El día del corte siempre sale subestimado y se completa al día siguiente |
| Un asesor sale dos veces | Mojibake en los nombres. Se agrupa siempre por cédula, nunca por nombre |
| KPIs en cero sin explicación | El nombre de una columna cambió entre exportes. Las columnas se resuelven ignorando espacios y mayúsculas |
| «row violates row-level security» al firmar | La cédula de la sesión no coincide con la del feedback, o no se ejecutó el `schema.sql` completo |
| «Database error querying schema» al entrar | Una cuenta de `auth.users` quedó con campos de token en `NULL`; GoTrue los lee como texto y revienta. Lo arregla el bloque de reparación al final de `cuentas.sql` |
| «tu cuenta todavía no está lista» al entrar | Falta ejecutar `cuentas.sql`, o la persona se agregó a `roster.csv` pero no a `usuarios` |
| Alguien no entra y jura que el apellido está bien | Correr la consulta del final de `cuentas.sql`: muestra exactamente qué apellido espera el sistema para esa cédula |

Un error que produce ceros es peor que uno que rompe: nadie lo nota.

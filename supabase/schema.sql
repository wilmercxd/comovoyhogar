-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — esquema Supabase
--  Ejecutar completo en el SQL Editor del proyecto.
--  Es idempotente: se puede volver a correr sin romper nada.
--
--  El orden importa: Postgres valida el cuerpo de las funciones SQL al
--  crearlas, así que 'usuarios' tiene que existir antes de es_supervisor().
-- ==========================================================================

-- ==================================================== 1. funciones base
-- No dependen de ninguna tabla.

-- La cédula se deriva del email de la cuenta ({cedula}@como-voy.local).
-- NO se lee de user_metadata: el propio usuario puede reescribirlo con
-- auth.updateUser() y se haría pasar por cualquier otra cédula.
create or replace function public.mi_cc()
returns text language sql stable as $$
  select coalesce(split_part(auth.jwt() ->> 'email', '@', 1), '')
$$;

-- La IP se toma del encabezado en el servidor: si se captura en el
-- navegador, el asesor la puede alterar antes de enviarla.
create or replace function public.ip_cliente()
returns text language sql stable as $$
  select nullif(split_part(
    coalesce(current_setting('request.headers', true)::json ->> 'x-forwarded-for', ''),
  ',', 1), '')
$$;

-- ======================================================== 2. usuarios
create table if not exists public.usuarios (
  cc          text primary key,
  nombre      text not null,
  rol         text not null default 'ASESOR' check (rol in ('ASESOR','SUPERVISOR')),
  creado_en   timestamptz not null default now()
);

alter table public.usuarios enable row level security;

-- ============================================== 3. es_supervisor()
-- security definer: una política que consulte 'usuarios' directamente
-- entra en recursión infinita contra su propia RLS.
create or replace function public.es_supervisor()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from public.usuarios
    where cc = public.mi_cc() and rol = 'SUPERVISOR'
  )
$$;

-- ============================================ 4. políticas de usuarios
-- Solo lectura desde el portal. Sin insert ni update: si el asesor pudiera
-- escribir su propia fila, se pondría rol SUPERVISOR y vería a todo el equipo.
-- El equipo se siembra con el bloque INSERT del final de este archivo.
drop policy if exists usuarios_lee on public.usuarios;
create policy usuarios_lee on public.usuarios
  for select to authenticated
  using (cc = public.mi_cc() or public.es_supervisor());

-- ======================================================== 5. feedback
-- Retroalimentación que el supervisor registra y el asesor firma.
--
-- 'tipo' distingue dos formas de la misma tabla (misma firma, mismo RLS):
--   'generico'  -> título + cuerpo + compromisos en texto libre (el modal
--                  "Registrar retroalimentación" del portal solo crea este tipo)
--   'monitoreo' -> monitoreo de calidad estructurado; el desglose por criterio,
--                  la nota, los datos de la llamada y la recomendación van en
--                  'datos' (jsonb). 'cuerpo' se deja vacío en este caso.
create table if not exists public.feedback (
  id                uuid primary key default gen_random_uuid(),
  cc_asesor         text not null,
  cc_supervisor     text not null,
  nombre_supervisor text,
  tipo              text not null default 'generico' check (tipo in ('generico','monitoreo')),
  titulo            text not null,
  periodo           text,
  cuerpo            text,
  compromisos       text,
  datos             jsonb,
  creado_en         timestamptz not null default now()
);
create index if not exists feedback_asesor_idx on public.feedback (cc_asesor, creado_en desc);

-- Columnas para bases creadas antes de que existiera el monitoreo estructurado.
alter table public.feedback add column if not exists tipo  text not null default 'generico';
alter table public.feedback add column if not exists datos jsonb;
alter table public.feedback alter column cuerpo drop not null;

do $$ begin
  if not exists (select 1 from pg_constraint where conname = 'feedback_tipo_check') then
    alter table public.feedback add constraint feedback_tipo_check check (tipo in ('generico','monitoreo'));
  end if;
end $$;

alter table public.feedback enable row level security;

drop policy if exists feedback_lee on public.feedback;
create policy feedback_lee on public.feedback
  for select to authenticated
  using (cc_asesor = public.mi_cc() or public.es_supervisor());

drop policy if exists feedback_crea on public.feedback;
create policy feedback_crea on public.feedback
  for insert to authenticated
  with check (public.es_supervisor() and cc_supervisor = public.mi_cc());

drop policy if exists feedback_borra on public.feedback;
create policy feedback_borra on public.feedback
  for delete to authenticated
  using (public.es_supervisor() and cc_supervisor = public.mi_cc());

-- ========================================================== 6. firmas
create table if not exists public.firmas (
  id            uuid primary key default gen_random_uuid(),
  cc_asesor     text not null,
  nombre_asesor text,
  feedback_id   uuid not null references public.feedback(id) on delete cascade,
  trazo_base64  text not null,
  observaciones text,
  fecha_firma   timestamptz not null default now(),
  user_agent    text,
  ip            text default public.ip_cliente(),
  unique (cc_asesor, feedback_id)          -- un feedback no se firma dos veces
);
create index if not exists firmas_feedback_idx on public.firmas (feedback_id);

alter table public.firmas enable row level security;

drop policy if exists firmas_lee on public.firmas;
create policy firmas_lee on public.firmas
  for select to authenticated
  using (cc_asesor = public.mi_cc() or public.es_supervisor());

-- Solo el propio asesor firma, y solo lo que le pertenece.
drop policy if exists firmas_crea on public.firmas;
create policy firmas_crea on public.firmas
  for insert to authenticated
  with check (
    cc_asesor = public.mi_cc()
    and exists (select 1 from public.feedback f
                where f.id = feedback_id and f.cc_asesor = public.mi_cc())
  );

-- Sin update ni delete: una firma no se edita ni se borra.

-- =========================================================== 7. notas
-- Bitácora del supervisor. El asesor no las ve.
create table if not exists public.notas (
  id            uuid primary key default gen_random_uuid(),
  cc_supervisor text not null,
  cc_asesor     text,                       -- null = nota de todo el equipo
  asunto        text not null default 'Sin asunto',
  cuerpo        text not null,
  creado_en     timestamptz not null default now()
);
create index if not exists notas_fecha_idx on public.notas (creado_en desc);

alter table public.notas enable row level security;

drop policy if exists notas_supervisor on public.notas;
create policy notas_supervisor on public.notas
  for all to authenticated
  using (public.es_supervisor() and cc_supervisor = public.mi_cc())
  with check (public.es_supervisor() and cc_supervisor = public.mi_cc());

-- =========================================================== 8. metas
-- Metas personales del asesor. Privadas: el supervisor NO las ve.
create table if not exists public.metas (
  id           uuid primary key default gen_random_uuid(),
  cc_asesor    text not null,
  nombre       text not null,
  valor        bigint,
  mes          text,           -- mes en que se fijó la meta (yyyy-MM)
  plazo_meses  int,            -- en cuántos meses quiere lograrla
  creado_en    timestamptz not null default now()
);
create index if not exists metas_asesor_idx on public.metas (cc_asesor);

-- Para bases creadas antes de que existiera el plazo: 'if not exists' en la
-- tabla no agrega columnas nuevas a una tabla que ya estaba.
alter table public.metas add column if not exists plazo_meses int;

alter table public.metas enable row level security;

drop policy if exists metas_propias on public.metas;
create policy metas_propias on public.metas
  for all to authenticated
  using (cc_asesor = public.mi_cc())
  with check (cc_asesor = public.mi_cc());

-- ================================================== 9. reconocimientos
-- Reconocimientos cortos que el supervisor otorga a un asesor (mejor racha,
-- superación, meta cumplida...). El asesor los ve; alimentan el nudge de
-- login y la vitrina de "tus reconocimientos" en su vista.
create table if not exists public.reconocimientos (
  id                uuid primary key default gen_random_uuid(),
  cc_asesor         text not null,
  cc_supervisor     text not null,
  nombre_supervisor text,
  texto             text not null,
  emoji             text not null default '🏆',
  mes               text,           -- yyyy-MM al que aplica, para contarlo por mes
  creado_en         timestamptz not null default now()
);
create index if not exists reconocimientos_asesor_idx on public.reconocimientos (cc_asesor, creado_en desc);

alter table public.reconocimientos enable row level security;

drop policy if exists reconocimientos_lee on public.reconocimientos;
create policy reconocimientos_lee on public.reconocimientos
  for select to authenticated
  using (cc_asesor = public.mi_cc() or public.es_supervisor());

drop policy if exists reconocimientos_crea on public.reconocimientos;
create policy reconocimientos_crea on public.reconocimientos
  for insert to authenticated
  with check (public.es_supervisor() and cc_supervisor = public.mi_cc());

drop policy if exists reconocimientos_borra on public.reconocimientos;
create policy reconocimientos_borra on public.reconocimientos
  for delete to authenticated
  using (public.es_supervisor() and cc_supervisor = public.mi_cc());

-- ==========================================================================
--  10. Semilla del equipo
--  Como 'usuarios' es de solo lectura desde el portal, este bloque es la
--  única forma de dar de alta a alguien. Para un asesor nuevo: agregarlo
--  aquí, volver a ejecutar este INSERT y sumarlo a roster.csv.
-- ==========================================================================
insert into public.usuarios (cc, nombre, rol) values
  ('1143149771','ALFREDO RAFAEL PEREZ MARTINEZ','SUPERVISOR'),
  ('1042854178','ALEJANDRA LOPEZ QUIÑONEZ','ASESOR'),
  ('1140846401','ANDREA PAOLA TRUJILLO PARDO','ASESOR'),
  ('1042994663','CARMEN ALICIA ALBOR TRUJILLO','ASESOR'),
  ('1001995827','DIEGO ANDRES CARO PALENCIA','ASESOR'),
  ('1045705043','DOREIDIS PAOLA CASSERES CASIANI','ASESOR'),
  ('9022229','JESUS RAFAEL TAFUR NINO','ASESOR'),
  ('1123891335','JOKABETH DISHAN NELSON MARTINEZ','ASESOR'),
  ('1140828545','JORGE LEONARDO BERRIO CORPAS','ASESOR'),
  ('1143232881','KEYLIN PATRICIA CASTRO POLO','ASESOR'),
  ('1143445082','KRISTIELL SARAY DE AVILA VASQUEZ','ASESOR'),
  ('1143154495','MARTHA CECILIA PEREZ MORA','ASESOR'),
  ('1041890641','NATALIA ANDREA SILVERA FONTALVO','ASESOR'),
  ('1044213250','NICOLLE ALEMAN RIVERA','ASESOR'),
  ('1007541668','RONALDO ALBERTO GOMEZ PEREZ','ASESOR'),
  ('1140847397','ROSA MARGARITA TIBABIJO SALINAS','ASESOR'),
  ('1193561818','YERALDIN MOLINA MUÑOZ','ASESOR')
on conflict (cc) do update set nombre = excluded.nombre, rol = excluded.rol;

-- ==========================================================================
--  11. Verificación
--  Al terminar debe devolver 6 tablas y 3 funciones.
-- ==========================================================================
select 'tablas' as que, count(*) as n
  from pg_tables where schemaname = 'public'
   and tablename in ('usuarios','feedback','firmas','notas','metas','reconocimientos')
union all
select 'funciones', count(*)
  from pg_proc p join pg_namespace n on n.oid = p.pronamespace
 where n.nspname = 'public' and p.proname in ('mi_cc','es_supervisor','ip_cliente')
union all
select 'usuarios sembrados', count(*) from public.usuarios;

-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — cuentas de acceso
--
--  El asesor entra solo con CÉDULA + SEGUNDO APELLIDO. No hay correo ni
--  contraseña que escribir.
--
--  Supabase necesita igual un usuario con email y contraseña por debajo
--  para emitir el JWT que hace funcionar RLS. Este archivo crea esas
--  cuentas ya confirmadas, con:
--      email      = {cedula}@como-voy.local        (sintético, nunca se usa)
--      contraseña = {cedula}.{SEGUNDO APELLIDO}    (derivada, nunca se escribe)
--
--  Al crearlas aquí, el portal nunca llama a signUp() y el ajuste
--  "Confirm email" del dashboard deja de tener efecto sobre el login.
--
--  Ejecutar DESPUÉS de schema.sql. Es idempotente: cada vez que se corre
--  deja las contraseñas sincronizadas con los nombres de public.usuarios.
--  Correrlo de nuevo es también la forma de dar de alta a alguien nuevo.
-- ==========================================================================

create extension if not exists pgcrypto with schema extensions;

-- ------------------------------------------------------------ normalizador
-- Tiene que dar exactamente lo mismo que la función norm() del portal:
-- mayúsculas, sin tildes y con Ñ como N (MUÑOZ y MUNOZ deben coincidir).
create or replace function public.norm_txt(t text)
returns text language sql immutable as $$
  select translate(upper(btrim(coalesce(t,''))),
                   'ÁÉÍÓÚÀÈÌÒÙÄËÏÖÜÂÊÎÔÛÑÇáéíóúàèìòùäëïöüâêîôûñç',
                   'AEIOUAEIOUAEIOUAEIOUNCAEIOUAEIOUAEIOUAEIOUNC')
$$;

-- Segundo apellido = última palabra del nombre completo.
create or replace function public.ap2_de(nombre text)
returns text language sql immutable as $$
  select public.norm_txt(regexp_replace(btrim(coalesce(nombre,'')), '^.*\s', ''))
$$;

-- Clave derivada. El asesor nunca la ve: la calcula el portal sola.
create or replace function public.clave_de(cc text, nombre text)
returns text language sql immutable as $$
  select cc || '.' || public.ap2_de(nombre)
$$;

-- ------------------------------------------------------- crear / sincronizar
do $$
declare
  u        record;
  uid      uuid;
  correo   text;
  creadas  int := 0;
  actual   int := 0;
begin
  for u in select cc, nombre from public.usuarios order by nombre loop
    correo := u.cc || '@como-voy.local';
    select id into uid from auth.users where email = correo;

    if uid is null then
      uid := gen_random_uuid();

      insert into auth.users (
        instance_id, id, aud, role, email, encrypted_password,
        email_confirmed_at, created_at, updated_at,
        raw_app_meta_data, raw_user_meta_data
      ) values (
        '00000000-0000-0000-0000-000000000000', uid,
        'authenticated', 'authenticated', correo,
        extensions.crypt(public.clave_de(u.cc, u.nombre), extensions.gen_salt('bf')),
        now(), now(), now(),
        '{"provider":"email","providers":["email"]}'::jsonb,
        jsonb_build_object('cc', u.cc, 'nombre', u.nombre)
      );

      -- Sin la fila en identities, GoTrue no reconoce el login por correo.
      insert into auth.identities (
        id, user_id, provider_id, identity_data, provider,
        last_sign_in_at, created_at, updated_at
      ) values (
        gen_random_uuid(), uid, uid::text,
        jsonb_build_object('sub', uid::text, 'email', correo,
                           'email_verified', true, 'phone_verified', false),
        'email', now(), now(), now()
      );

      creadas := creadas + 1;

    else
      -- Ya existía (por ejemplo, creada en una prueba anterior con otra
      -- contraseña). Se resincroniza sin tocar el id: las firmas se
      -- relacionan por cédula, así que no se pierde nada.
      update auth.users set
        encrypted_password = extensions.crypt(public.clave_de(u.cc, u.nombre),
                                              extensions.gen_salt('bf')),
        email_confirmed_at = coalesce(email_confirmed_at, now()),
        raw_user_meta_data = jsonb_build_object('cc', u.cc, 'nombre', u.nombre),
        updated_at         = now()
      where id = uid;

      actual := actual + 1;
    end if;
  end loop;

  raise notice 'cuentas creadas: %, actualizadas: %', creadas, actual;
end $$;

-- ==========================================================================
--  Verificación
--  'clave de ejemplo' es lo que el portal manda por debajo cuando alguien
--  escribe su cédula y su segundo apellido. El asesor nunca la teclea.
-- ==========================================================================
select
  u.cc,
  u.nombre,
  public.ap2_de(u.nombre)              as escribe_este_apellido,
  public.clave_de(u.cc, u.nombre)      as clave_de_ejemplo,
  (a.id is not null)                   as tiene_cuenta,
  (a.email_confirmed_at is not null)   as confirmada,
  (i.id is not null)                   as tiene_identity
from public.usuarios u
left join auth.users a      on a.email = u.cc || '@como-voy.local'
left join auth.identities i on i.user_id = a.id and i.provider = 'email'
order by u.rol desc, u.nombre;

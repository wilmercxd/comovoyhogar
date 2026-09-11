-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — altas de septiembre 2026
--
--  Da acceso al portal a los asesores que entraron en septiembre y no estaban
--  en el seed original (supabase/schema.sql). Crea su fila en public.usuarios
--  y su cuenta de Supabase Auth (correo sintetico {cedula}@como-voy.local,
--  contraseña = la cedula), igual que supabase/cuentas.sql.
--
--  Ejecutar UNA vez en el editor SQL del proyecto de Hogar
--  (mrmtprhaoilwzwghzdqn). Es idempotente: si alguno ya existe, no lo duplica.
--
--  Como entra cada uno en el portal:
--    cedula + contraseña (= su cedula) + segundo apellido
--    1066864972  ANDRES MAURICIO RUIDIAZ GOMEZ      apellido: GOMEZ
--    1001997640  CAMILO ANDRES CABARCAS ESCORCIA    apellido: ESCORCIA
--    22550093    JARIET GUZMAN MUÑOZ                apellido: MUÑOZ
--    1044628010  ALEXANDRA MICHELL MIER HERNANDEZ   apellido: HERNANDEZ
--    1102825797  MARIA JOSE ZUÑIGA PALACIO          apellido: PALACIO
-- ==========================================================================

create extension if not exists pgcrypto with schema extensions;

-- 1) Alta en el directorio del equipo (fuente de las cuentas y del RLS)
insert into public.usuarios (cc, nombre, rol) values
  ('1066864972','ANDRES MAURICIO RUIDIAZ GOMEZ','ASESOR'),
  ('1001997640','CAMILO ANDRES CABARCAS ESCORCIA','ASESOR'),
  ('22550093','JARIET GUZMAN MUÑOZ','ASESOR'),
  ('1044628010','ALEXANDRA MICHELL MIER HERNANDEZ','ASESOR'),
  ('1102825797','MARIA JOSE ZUÑIGA PALACIO','ASESOR')
on conflict (cc) do update set nombre = excluded.nombre, rol = excluded.rol;

-- 2) Crear / sincronizar la cuenta de Auth de esos cinco (password = cedula)
do $$
declare
  u      record;
  uid    uuid;
  correo text;
begin
  for u in
    select cc, nombre from public.usuarios
    where cc in ('1066864972','1001997640','22550093','1044628010','1102825797')
  loop
    correo := u.cc || '@como-voy.local';
    select id into uid from auth.users where email = correo;

    if uid is null then
      uid := gen_random_uuid();
      -- Los campos de token van en cadena vacia, NO en NULL: GoTrue los lee como
      -- text y con NULL revienta con "Database error querying schema".
      insert into auth.users (
        instance_id, id, aud, role, email, encrypted_password,
        email_confirmed_at, created_at, updated_at,
        raw_app_meta_data, raw_user_meta_data,
        confirmation_token, recovery_token,
        email_change, email_change_token_new, email_change_token_current,
        phone_change, phone_change_token, reauthentication_token
      ) values (
        '00000000-0000-0000-0000-000000000000', uid,
        'authenticated', 'authenticated', correo,
        extensions.crypt(u.cc, extensions.gen_salt('bf')),
        now(), now(), now(),
        '{"provider":"email","providers":["email"]}'::jsonb,
        jsonb_build_object('cc', u.cc, 'nombre', u.nombre),
        '', '', '', '', '', '', '', ''
      );
      insert into auth.identities (
        id, user_id, provider_id, identity_data, provider,
        last_sign_in_at, created_at, updated_at
      ) values (
        gen_random_uuid(), uid, uid::text,
        jsonb_build_object('sub', uid::text, 'email', correo,
                           'email_verified', true, 'phone_verified', false),
        'email', now(), now(), now()
      );
    else
      update auth.users set
        encrypted_password = extensions.crypt(u.cc, extensions.gen_salt('bf')),
        email_confirmed_at = coalesce(email_confirmed_at, now()),
        raw_user_meta_data = jsonb_build_object('cc', u.cc, 'nombre', u.nombre),
        updated_at         = now()
      where id = uid;

      insert into auth.identities (
        id, user_id, provider_id, identity_data, provider,
        last_sign_in_at, created_at, updated_at
      )
      select gen_random_uuid(), uid, uid::text,
             jsonb_build_object('sub', uid::text, 'email', correo,
                                'email_verified', true, 'phone_verified', false),
             'email', now(), now(), now()
      where not exists (
        select 1 from auth.identities where user_id = uid and provider = 'email'
      );
    end if;
  end loop;
end $$;

-- 3) Reparacion de tokens en NULL (misma que cuentas.sql)
update auth.users set
  confirmation_token         = coalesce(confirmation_token, ''),
  recovery_token             = coalesce(recovery_token, ''),
  email_change               = coalesce(email_change, ''),
  email_change_token_new     = coalesce(email_change_token_new, ''),
  email_change_token_current = coalesce(email_change_token_current, ''),
  phone_change               = coalesce(phone_change, ''),
  phone_change_token         = coalesce(phone_change_token, ''),
  reauthentication_token     = coalesce(reauthentication_token, '')
where email like '%@como-voy.local';

-- 4) Verificacion: las tres ultimas columnas deben salir en true para los cinco
select
  u.cc, u.nombre,
  (a.id is not null)                 as tiene_cuenta,
  (a.email_confirmed_at is not null) as confirmada,
  (i.id is not null)                 as tiene_identity
from public.usuarios u
left join auth.users a      on a.email = u.cc || '@como-voy.local'
left join auth.identities i on i.user_id = a.id and i.provider = 'email'
where u.cc in ('1066864972','1001997640','22550093','1044628010','1102825797')
order by u.nombre;

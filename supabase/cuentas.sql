-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — cuentas de acceso
--
--  El asesor entra con CÉDULA + CONTRASEÑA + SEGUNDO APELLIDO.
--  La contraseña es la misma cédula. Eso no se dice en la pantalla:
--  se explica en la inducción.
--
--  El correo es sintético ({cedula}@como-voy.local) y nunca recibe nada;
--  existe solo porque Supabase necesita un usuario con email y contraseña
--  por debajo para emitir el JWT que hace funcionar RLS.
--
--  Al crear las cuentas aquí ya confirmadas, el portal nunca llama a
--  signUp() y el ajuste "Confirm email" del dashboard no afecta el login.
--
--  Ejecutar DESPUÉS de schema.sql. Es idempotente: correrlo de nuevo
--  resincroniza todo y es también la forma de dar de alta a alguien nuevo.
-- ==========================================================================

create extension if not exists pgcrypto with schema extensions;

-- ------------------------------------------------------------ normalizador
-- Da exactamente lo mismo que la función norm() del portal: mayúsculas,
-- sin tildes y con Ñ como N, para que Muñoz y MUNOZ se traten igual.
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

-- La contraseña es la cédula.
create or replace function public.clave_de(cc text)
returns text language sql immutable as $$
  select cc
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

      -- Los campos de token van en cadena vacía, NO en NULL: GoTrue los lee
      -- como text y con NULL revienta con "Database error querying schema".
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
        extensions.crypt(public.clave_de(u.cc), extensions.gen_salt('bf')),
        now(), now(), now(),
        '{"provider":"email","providers":["email"]}'::jsonb,
        jsonb_build_object('cc', u.cc, 'nombre', u.nombre),
        '', '', '', '', '', '', '', ''
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
      -- Ya existía. Se resincroniza sin tocar el id: las firmas se
      -- relacionan por cédula, así que no se pierde nada.
      update auth.users set
        encrypted_password = extensions.crypt(public.clave_de(u.cc), extensions.gen_salt('bf')),
        email_confirmed_at = coalesce(email_confirmed_at, now()),
        raw_user_meta_data = jsonb_build_object('cc', u.cc, 'nombre', u.nombre),
        updated_at         = now()
      where id = uid;

      -- Le puede faltar la identity si se creó a mano en una prueba anterior.
      insert into auth.identities (
        id, user_id, provider_id, identity_data, provider,
        last_sign_in_at, created_at, updated_at
      )
      select gen_random_uuid(), uid, uid::text,
             jsonb_build_object('sub', uid::text, 'email', correo,
                                'email_verified', true, 'phone_verified', false),
             'email', now(), now(), now()
      where not exists (
        select 1 from auth.identities
        where user_id = uid and provider = 'email'
      );

      actual := actual + 1;
    end if;
  end loop;

  raise notice 'cuentas creadas: %, actualizadas: %', creadas, actual;
end $$;

-- ---------------------------------------------------------------- reparación
-- Arregla las filas que hayan quedado con tokens en NULL de una corrida
-- anterior. Es la causa de "Database error querying schema" al iniciar sesión.
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

-- ==========================================================================
--  Verificación
--  Deben salir las 17 personas con las tres últimas columnas en true.
--  'escribe_este_apellido' es lo que el sistema espera en el tercer campo;
--  la contraseña es la cédula.
-- ==========================================================================
select
  u.cc,
  u.nombre,
  public.ap2_de(u.nombre)            as escribe_este_apellido,
  (a.id is not null)                 as tiene_cuenta,
  (a.email_confirmed_at is not null) as confirmada,
  (i.id is not null)                 as tiene_identity,
  (a.confirmation_token is not null and a.recovery_token is not null
   and a.email_change is not null)   as tokens_ok
from public.usuarios u
left join auth.users a      on a.email = u.cc || '@como-voy.local'
left join auth.identities i on i.user_id = a.id and i.provider = 'email'
order by u.rol desc, u.nombre;

-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — migrar monitoreos de texto plano a estructurado
--
--  La primera versión de cargar_monitoreos_agosto.sql guardaba cada
--  monitoreo como texto plano en 'cuerpo' (tipo 'generico'). La versión
--  actual los guarda estructurados en 'datos' (tipo 'monitoreo'), para que
--  el portal los muestre con nota, cuadrícula y tabla de criterios en vez
--  de un bloque de texto.
--
--  Ejecutar este archivo UNA vez, ANTES de volver a correr
--  cargar_monitoreos_agosto.sql. Si no se corre esto primero, el archivo
--  nuevo no reconoce las filas viejas (no tienen 'datos') y las duplica.
--
--  Es seguro: si algún asesor ya firmó uno de los monitoreos viejos, el
--  bloque se detiene con un error explícito y NO BORRA NADA (borrar el
--  feedback borraría esa firma en cascada). Revisar ese caso a mano antes
--  de continuar.
-- ==========================================================================

do $$
declare
  n_firmados int;
  n_borrados int;
begin
  select count(*) into n_firmados
  from public.feedback f
  join public.firmas fi on fi.feedback_id = f.id
  where f.cc_supervisor = '1143149771'
    and f.cuerpo like '%Ref. monitoreo:%';

  if n_firmados > 0 then
    raise exception
      'Hay % monitoreo(s) viejo(s) que ya tienen firma. No se borró nada. Resuelve esto a mano (ver el asesor y el monitoreo en cuestión) antes de volver a correr esta migración.',
      n_firmados;
  end if;

  delete from public.feedback
  where cc_supervisor = '1143149771'
    and cuerpo like '%Ref. monitoreo:%';
  get diagnostics n_borrados = row_count;

  raise notice 'monitoreos viejos borrados: %', n_borrados;
end $$;

-- ==========================================================================
--  Verificación: debe dar 0. Si no, algo no se borró — no correr
--  cargar_monitoreos_agosto.sql todavía.
-- ==========================================================================
select count(*) as monitoreos_viejos_restantes
from public.feedback
where cc_supervisor = '1143149771' and cuerpo like '%Ref. monitoreo:%';

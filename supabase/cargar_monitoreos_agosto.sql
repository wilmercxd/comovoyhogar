-- ==========================================================================
--  ¿CÓMO VOY? HOGAR — carga de monitoreos de calidad de agosto 2026
--  Generado desde Cruce_Manifiesto_Agentes.xlsx. Cada fila es una llamada
--  monitoreada que entra como retroalimentación para que el asesor la firme.
--
--  Idempotente: cada INSERT trae un 'where not exists' contra la referencia
--  del monitoreo (Ref. monitoreo: ...) embebida en el cuerpo, asi que correr
--  este archivo dos veces no duplica nada.
-- ==========================================================================

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$En cola · 24:05 min · Nota 0/100$mon$, $mon$Tipificación: En cola
Duración: 24:05 min
Nota final: 0/100

Rapport (0/10): No hay interacción comercial detectable con un cliente; el audio es ruido de fondo de oficina.

Escucha activa (0/12): No aplica; no se registra escucha activa hacia un usuario.

Sondeo y perfilamiento (0/15): No aplica; el audio registra conversaciones laterales sobre "oportunidades de trabajo" y "entrevistas".

Argumentación y condiciones (0/15): No aplica; no se presentan planes ni condiciones comerciales de Claro Hogar.

Manejo de objeciones (0/15): No aplica.

Agresividad comercial (0/18): Deficiente; se pierde el contacto comercial por falta de atención a la línea o error en la marcación.

Cierre efectivo y legal (0/15): Cierre nulo; la llamada finaliza sin haber iniciado una conversación con el titular de la línea.

Resumen: Llamada fallida. La grabación contiene únicamente ruido ambiente, conversaciones de pasillo y risas del personal administrativo, sin que se produzca una gestión de ventas real.

(Ref. monitoreo: 20260811_093428_IN_hogarmedblasterceoh_3204434495_7j9)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 0/15).$mon$, '2026-08-11T14:34:28Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260811_093428_IN_hogarmedblasterceoh_3204434495_7j9)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 25:24 min · Nota 94/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 25:24 min
Nota final: 94/100

Rapport (10/10): Excelente; Geraldín muestra gran paciencia y empatía con la cliente Gloria, quien se encuentra delicada de salud.

Escucha activa (12/12): Identifica la frustración con Tigo por el mal trato y el aumento de $40,000 en la tarifa.

Sondeo y perfilamiento (15/15): Descubre que la prioridad absoluta es la telefonía fija para la madre de la cliente y la necesidad de 2 decos.

Argumentación y condiciones (15/15): Explica el beneficio de tarifa fija de $113,900, plataforma gratuita permanente y 50% de descuento inicial.

Manejo de objeciones (15/15): Neutraliza miedos sobre instaladores y contratos explicando la transparencia del proceso digital.

Agresividad comercial (18/18): Alta; Geraldín mantiene el control de una llamada difícil y larga, logrando un acuerdo de seguimiento.

Cierre efectivo y legal (9/15): Cierre agendado para el miércoles; establece vínculo vía WhatsApp corporativo para resolver dudas finales.

Resumen: Llamada compleja con cliente en Medellín. La agente gestiona exitosamente la ira de la cliente contra su operador actual y sus temores hacia Claro, posicionando beneficios de estabilidad de precio y soporte directo.

(Ref. monitoreo: 20260810_154813_IN_hogarmedblasterceoh_3108676183_738)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 9/15).$mon$, '2026-08-10T20:48:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260810_154813_IN_hogarmedblasterceoh_3108676183_738)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$NO LE PARECE ATRACTIVA LA OFERTA · 6:59 min · Nota 90/100$mon$, $mon$Tipificación: NO LE PARECE ATRACTIVA LA OFERTA
Duración: 6:59 min
Nota final: 90/100

Rapport (10/10): Alejandra demuestra gran profesionalismo al ignorar con elegancia y firmeza un comentario personal inapropiado del cliente.

Escucha activa (12/12): Identifica rápidamente que el cliente no desea servicios para el hogar pero sí busca una mejora en su plan móvil de recargas.

Sondeo y perfilamiento (15/15): Perfilamiento efectivo; descubre que el cliente Álvaro Puertas tiene una línea Claro en prepago y busca migrar a un plan económico.

Argumentación y condiciones (5/15): Mínima para hogar; no aplica argumentación de servicios fijos ante la negativa rotunda del cliente por internet doméstico.

Manejo de objeciones (15/15): Excelente manejo de pivotaje; ante el rechazo de hogar, no pierde el prospecto y ofrece una solución para su necesidad móvil.

Agresividad comercial (18/18): Alta; la agente no da por perdida la llamada y gestiona internamente la transferencia al área de migraciones para capturar el negocio.

Cierre efectivo y legal (15/15): Cierre administrativo exitoso; se coordina la llamada del área móvil para finalizar la migración de plan.

Resumen: Llamada que destaca por el control emocional de la agente ante un cliente difícil. Aunque no se vende internet hogar, Alejandra realiza un pivotaje comercial excelente hacia telefonía móvil.

(Ref. monitoreo: 20260812_103701_IN_hogarmedblasterceoh_3143757774_buo)$mon$, $mon$Reforzar: Argumentación y condiciones (fue lo más bajo, 5/15).$mon$, '2026-08-12T15:37:01Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260812_103701_IN_hogarmedblasterceoh_3143757774_buo)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$COBERTURA DTH · 6:19 min · Nota 70/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:19 min
Nota final: 70/100

Rapport (10/10): Alejandra establece un tono amable y servicial desde el inicio de la llamada.

Escucha activa (12/12): Capta que la prioridad absoluta del cliente es el precio bajo ("no tan caro").

Sondeo y perfilamiento (10/15): Sondeo de ubicación; identifica que el cliente está en Cartagena/Turbana, zona retirada.

Argumentación y condiciones (15/15): Presenta con claridad los planes de 250MB ($74,900) y 900MB ($79,900) con sus beneficios.

Manejo de objeciones (8/15): El cliente solicita un plan de $30,000; la agente intenta mantener el valor de la oferta sin éxito.

Agresividad comercial (10/18): Media; intenta validar cobertura en una zona rural para ver si aplica alguna oferta especial.

Cierre efectivo y legal (5/15): Cierre informativo; el cliente rechaza la oferta por considerar que excede su presupuesto.

Resumen: Gestión para solo internet en Cartagena. El cliente busca una tarifa extremadamente baja ($30,000) que no existe en el portafolio actual. Alejandra intenta encontrar una solución técnica en Turbana, pero la brecha económica impide el cierre.

(Ref. monitoreo: 20260811_155219_IN_hogarmedblasterceoh_3126033569_cqg)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 5/15).$mon$, '2026-08-11T20:52:19Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260811_155219_IN_hogarmedblasterceoh_3126033569_cqg)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$CLIENTE CUELGA · 5:04 min · Nota 71/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 5:04 min
Nota final: 71/100

Rapport (10/10): Alejandra mantiene un tono amable y profesional durante el contacto con el señor David.

Escucha activa (12/12): Detecta que el cliente está trabajando y que su interés principal en el momento se desvía hacia el plan móvil.

Sondeo y perfilamiento (10/15): Sondeo limitado; el proceso se detiene porque el cliente no recuerda la dirección exacta de su domicilio en Bogotá.

Argumentación y condiciones (10/15): Menciona brevemente el plan de solo internet por $79,900 con Amazon Prime, pero no profundiza ante la falta de datos técnicos.

Manejo de objeciones (12/15): Maneja la barrera de la ubicación ofreciendo el WhatsApp corporativo para recibir la información cuando el cliente esté en casa.

Agresividad comercial (10/18): Media; prioriza no incomodar al cliente en su labor y asegura el vínculo digital para una venta futura.

Cierre efectivo y legal (7/15): Cierre de seguimiento; el cliente queda con el compromiso de enviar la dirección vía WhatsApp para validar cobertura.

Resumen: Intento de venta de internet en Bogotá. La llamada se convierte en una asesoría de seguimiento debido a que el cliente no cuenta con la información de su domicilio al momento del contacto.

(Ref. monitoreo: 20260812_143415_IN_hogarmedblasterceoh_3105681398_fta)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 7/15).$mon$, '2026-08-12T19:34:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260812_143415_IN_hogarmedblasterceoh_3105681398_fta)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$COBERTURA DTH · 6:35 min · Nota 72/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:35 min
Nota final: 72/100

Rapport (10/10): Alejandra mantiene un tono respetuoso y calmado ante un cliente que manifiesta frustración.

Escucha activa (12/12): Detecta de inmediato que el cliente no busca comprar, sino reclamar por un aumento en su factura actual.

Sondeo y perfilamiento (15/15): Identifica que es un trámite de postventa y que el cliente requiere una solución administrativa, no comercial.

Argumentación y condiciones (5/15): Limitada; no aplica argumentación de venta ya que el perfil del cliente corresponde a atención al cliente.

Manejo de objeciones (10/15): Maneja la molestia del cliente dándole una ruta clara de solución (marcar 611 opción 7-5-5-5).

Agresividad comercial (5/18): Baja; el agente prioriza la ética de servicio y la orientación correcta sobre el intento de una venta forzada.

Cierre efectivo y legal (15/15): Cierre de servicio exitoso; el cliente queda agradecido por la información clara sobre cómo gestionar su reclamo.

Resumen: Llamada de servicio al cliente. Alejandra redirige correctamente a un usuario de Claro Hogar que tiene dudas sobre cobros, siguiendo el protocolo de no interferir en procesos de otras áreas desde la línea de ventas.

(Ref. monitoreo: 20260811_111124_IN_hogarmedblasterceoh_3132977271_n96)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-11T16:11:24Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260811_111124_IN_hogarmedblasterceoh_3132977271_n96)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$CLIENTE CUELGA · 8:44 min · Nota 94/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 8:44 min
Nota final: 94/100

Rapport (10/10): Alejandra mantiene un trato ejecutivo y paciente ante un cliente que consulta por múltiples ubicaciones.

Escucha activa (12/12): Identifica que el cliente tiene dos locales (bodega y oficina) y busca la opción más económica para ambos.

Sondeo y perfilamiento (15/15): Sondeo geográfico dual en Bogotá; valida direcciones en Carrera 19G y Diagonal 63 Sur para diferenciar servicios.

Argumentación y condiciones (15/15): Estrategia comercial excelente; ofrece el precio residencial para la oficina comercial para ser competitiva frente a otros operadores.

Manejo de objeciones (15/15): Supera la barrera de "local vs residencial" explicando que puede gestionar una tarifa preferencial si el uso es administrativo.

Agresividad comercial (18/18): Alta; busca soluciones creativas en el portafolio para bajar los costos y capturar ambos puntos de venta.

Cierre efectivo y legal (14/15): Cierre en validación técnica; el agente procede a confirmar la viabilidad de los dos puntos bajo el esquema residencial.

Resumen: Gestión comercial estratégica en Bogotá. Alejandra destaca por su proactividad al ofrecer tarifas residenciales en predios comerciales para ganar el negocio, demostrando gran dominio del criterio de venta.

(Ref. monitoreo: 20260813_143505_IN_hogarmedblasterceoh_3102849176_qm5)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 14/15).$mon$, '2026-08-13T19:35:05Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260813_143505_IN_hogarmedblasterceoh_3102849176_qm5)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$ATENCIÓN AL CLIENTE · 5:14 min · Nota 69/100$mon$, $mon$Tipificación: ATENCIÓN AL CLIENTE
Duración: 5:14 min
Nota final: 69/100

Rapport (10/10): Alejandra mantiene un trato empático frente a un cliente que relata una mala experiencia previa.

Escucha activa (12/12): Escucha con atención el "chicharrón" del cliente sobre facturación errónea y falta de activación de SIM.

Sondeo y perfilamiento (10/15): Identifica que el cliente está en zona rural (campo) y tiene problemas con la señal de su operador actual.

Argumentación y condiciones (5/15): Ofrece planes de internet, pero la conversación se desvía totalmente al problema administrativo del cliente.

Manejo de objeciones (12/15): Maneja la frustración del cliente pidiendo disculpas en nombre de la compañía y dando una ruta de solución.

Agresividad comercial (5/18): Baja; la agente prioriza la asesoría de servicio al cliente sobre la venta dada la gravedad del reclamo.

Cierre efectivo y legal (15/15): Cierre de servicio excelente; redirige al cliente a la línea 611 para solucionar su reclamo antes de comprar.

Resumen: Llamada de asesoría administrativa. El cliente manifiesta estar "blanqueado" (sin servicio) por una mala gestión previa de Claro. Alejandra actúa correctamente al no forzar una venta y guiar al usuario hacia el área de atención para sanear su cuenta.

(Ref. monitoreo: 20260811_101157_IN_hogarmedblasterceoh_3224570286_v3w)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-11T15:11:57Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260811_101157_IN_hogarmedblasterceoh_3224570286_v3w)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA · 44:45 min · Nota 98/100$mon$, $mon$Tipificación: VENTA
Duración: 44:45 min
Nota final: 98/100

Rapport (10/10): Andrea establece un saludo profesional y valida la necesidad del cliente Eduan Daniel de un internet estable para trabajo.

Escucha activa (12/12): Escucha con atención la preferencia del cliente por la estabilidad del cableado y su requerimiento técnico de ultravelocidad.

Sondeo y perfilamiento (15/15): Sondeo técnico minucioso; descubre que el apartamento 1215 en Las Riveras (Bogotá) requiere actualización de nodo de HFC a Fibra Óptica.

Argumentación y condiciones (15/15): Argumenta los beneficios de 900 megas simétricos, resaltando que la fibra es superior para sus necesidades laborales.

Manejo de objeciones (15/15): Maneja la demora técnica explicando pedagógicamente la diferencia entre redes para garantizar que el cliente reciba la mejor tecnología.

Agresividad comercial (18/18): Alta; la agente defiende la calidad técnica, solicita corrección de nodo a su supervisor y asegura el contacto por WhatsApp para no enfriar el cierre.

Cierre efectivo y legal (10/15): Cierre en seguimiento técnico; queda pendiente de la confirmación del nodo para proceder con la biometría facial.

Resumen: Llamada de alto nivel técnico y comercial. Andrea destaca por su honestidad al detectar un error de red en sistema y gestionarlo proactivamente para entregar fibra óptica real de 900MB al cliente.

(Ref. monitoreo: 20260812_160953_IN_hogarmedblasterceoh_3166243079_qol)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-12T21:09:53Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260812_160953_IN_hogarmedblasterceoh_3166243079_qol)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$CLIENTE MINTIC - DESEA MAS VELOCIDAD · 7:55 min · Nota 97/100$mon$, $mon$Tipificación: CLIENTE MINTIC - DESEA MAS VELOCIDAD
Duración: 7:55 min
Nota final: 97/100

Rapport (10/10): Andrea genera un rapport de alta confianza, adaptándose al perfil del cliente en el sector Chico Norte de Bogotá.

Escucha activa (12/12): Identifica el "dolor" del cliente: paga $163,000 en Movistar y teme a la mala señal por experiencias previas con cobre.

Sondeo y perfilamiento (15/15): Excelente; valida cobertura de fibra óptica en el edificio Papiros para asegurar la simetría de la red requerida.

Argumentación y condiciones (15/15): Argumenta internet fibra de 900 megas, 2 decos y Win Sport+ incluido por solo $55,950 los dos primeros meses.

Manejo de objeciones (15/15): Neutraliza el miedo a la señal explicando técnicamente las ventajas de la fibra óptica frente a la red antigua del sector.

Agresividad comercial (18/18): Alta; la agente asume el control de la llamada y presiona positivamente para validar la dirección y cerrar la venta.

Cierre efectivo y legal (12/15): Cierre en proceso técnico; la agente procede a validar la nomenclatura exacta en sistema para asegurar la instalación de fibra.

Resumen: Cliente en Chico Norte (Bogotá) interesado en migrar de Movistar. Andrea posiciona exitosamente la fibra óptica y el ahorro masivo de más de $100,000 mensuales frente a la factura actual del competidor.

(Ref. monitoreo: 20260811_172020_IN_hogarmedblasterceoh_3126330994_3m6)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-11T22:20:20Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260811_172020_IN_hogarmedblasterceoh_3126330994_3m6)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA · 15:53 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 15:53 min
Nota final: 100/100

Rapport (10/10): Cristiel inicia con un saludo amable y profesional, logrando que la cliente Angélica se sienta en confianza desde el inicio.

Escucha activa (12/12): Identifica la preocupación técnica de la cliente sobre la mala señal en construcciones nuevas y la aborda con seguridad.

Sondeo y perfilamiento (15/15): Valida dirección de dos pisos en Kennedy (Bogotá) y confirma que la prioridad es la estabilidad de la señal en el segundo nivel.

Argumentación y condiciones (15/15): Posiciona internet de 500 megas con módem Dual Band y resalta el beneficio de ser cliente convergente "Todo Claro".

Manejo de objeciones (15/15): Maneja la duda sobre la permanencia de 12 meses enfatizando que el servicio está 100% garantizado durante el primer mes.

Agresividad comercial (18/18): Alta; la agente lidera el proceso hacia la validación de identidad por código OTP y la aceptación de la política de datos.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Completa la lectura legal de Habeas Data y supera una falla técnica con el SMS mediante un rellamado estratégico.

Resumen: Venta cerrada para Angélica Camelo en Bogotá. La llamada destaca por la resolución de un problema técnico con la llegada del código OTP; la agente opta por un rellamado para asegurar el cierre digital del contrato sin interferencias.

(Ref. monitoreo: 20260811_165453_IN_hogarmedblasterceoh_3134894388_a90)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-11T21:54:53Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260811_165453_IN_hogarmedblasterceoh_3134894388_a90)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$NO APTO CARTERA · 10:02 min · Nota 93/100$mon$, $mon$Tipificación: NO APTO CARTERA
Duración: 10:02 min
Nota final: 93/100

Rapport (10/10): Cristiel inicia con un saludo enérgico, logrando una conexión positiva inmediata con el cliente.

Escucha activa (12/12): Identifica el descontento del cliente con Movistar y su necesidad específica de televisión.

Sondeo y perfilamiento (15/15): Valida dirección en Tuluá, confirma segundo piso y verifica cobertura 100% fibra óptica para 900 megas.

Argumentación y condiciones (15/15): Ofrece 900 megas, TV interactiva y elección de plataforma premium (Win Sports+ o Netflix) gratis.

Manejo de objeciones (15/15): Ante una deuda de $156,208 con Claro, sugiere con agilidad colocar el servicio a nombre de un tercero.

Agresividad comercial (18/18): Alta; a pesar de la barrera crediticia, no abandona la venta y traslada la gestión a WhatsApp para salvarla.

Cierre efectivo y legal (8/15): Cierre en seguimiento; queda a la espera de que el cliente consiga al tercero para el contrato.

Resumen: Cliente en Tuluá interesado en migrar de Movistar. Se detecta deuda antigua que impide la venta directa; la agente maneja la situación sugiriendo un cambio de titularidad familiar para mantener la oferta de fibra óptica simétrica.

(Ref. monitoreo: 20260810_151635_IN_hogarmedblasterceoh_3217693659_bfa)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T20:16:35Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_151635_IN_hogarmedblasterceoh_3217693659_bfa)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 6:54 min · Nota 90/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 6:54 min
Nota final: 90/100

Rapport (10/10): Cristiel inicia con un saludo muy amable y empático, preguntando genuinamente por el bienestar de la cliente.

Escucha activa (12/12): Confirma de inmediato la preferencia de la cliente por contratar el paquete completo incluyendo televisión.

Sondeo y perfilamiento (15/15): Sondeo preciso sobre la infraestructura del hogar: 3 televisores y ubicación en el Conjunto El Club (Cartagena).

Argumentación y condiciones (15/15): Resalta el beneficio de Win Sports+ gratuito "para siempre", usando el ahorro de $35,000 como gancho comercial.

Manejo de objeciones (15/15): Maneja la indecisión familiar ofreciendo su WhatsApp corporativo para facilitar la respuesta tras hablar con el esposo.

Agresividad comercial (15/18): Media-Alta; utiliza el canal de WhatsApp para asegurar la continuidad del proceso y no enfriar el lead.

Cierre efectivo y legal (8/15): Cierre en seguimiento; se guarda el beneficio promocional a la espera de la confirmación final de la cliente.

Resumen: La cliente Juliet Julio en Cartagena consulta por cobertura para 3 decodificadores. El punto crítico es la inclusión de canales deportivos para su esposo. El agente posiciona exitosamente el ahorro en plataformas Premium para incentivar el cambio de operador.

(Ref. monitoreo: 20260810_172150_IN_hogarmedblasterceoh_3014007403_ry3)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T22:21:50Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_172150_IN_hogarmedblasterceoh_3014007403_ry3)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$Reintento · 8:06 min · Nota 95/100$mon$, $mon$Tipificación: Reintento
Duración: 8:06 min
Nota final: 95/100

Rapport (10/10): Cristiel inicia con una energía positiva sobresaliente, logrando una conexión inmediata con la cliente Angi.

Escucha activa (12/12): Identifica el descontento de la cliente con Tigo y su interés específico en la oferta de internet de $39,950.

Sondeo y perfilamiento (15/15): Sondeo preciso en Barranquilla (La Playa); confirma fibra óptica de 900 megas y detecta que la dirección no está mapeada.

Argumentación y condiciones (15/15): Argumenta 900 megas de ultravelocidad simétrica y plataforma Prime Video gratuita como valor diferencial.

Manejo de objeciones (15/15): Neutraliza el miedo al trámite de retiro de Tigo ofreciendo realizar la solicitud de desactivación desde Claro.

Agresividad comercial (18/18): Alta; asume el liderazgo de la venta, valida el crédito con éxito y solicita la creación manual de la dirección.

Cierre efectivo y legal (10/15): Cierre en proceso técnico; agenda un rellamado en 40 minutos para finalizar el contrato tras la actualización de red.

Resumen: Venta de 900MB para Angi Correa en Barranquilla. La agente Cristiel destaca por su proactividad al gestionar la creación de una dirección inexistente en sistema y asegurar la migración desde la competencia.

(Ref. monitoreo: 20260813_124344_IN_hogarmedblasterceoh_3103996027_dv1)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-13T17:43:44Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260813_124344_IN_hogarmedblasterceoh_3103996027_dv1)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA · 18:58 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 18:58 min
Nota final: 100/100

Rapport (10/10): El agente Diego Caro se presenta con seguridad y establece una conexión directa con la cliente.

Escucha activa (12/12): Identifica el deseo de la cliente de migrar desde Movistar por fallas constantes en el servicio.

Sondeo y perfilamiento (15/15): Sondeo completo en Barranquilla; valida dirección, piso 2 y captura datos de identidad exitosamente.

Argumentación y condiciones (15/15): Argumenta internet de 900 megas con 50% de descuento y plataformas Amazon Prime y Claro Video incluidas.

Manejo de objeciones (15/15): Neutraliza el miedo a pagar doble factura explicando el proceso de radicado de cancelación con Movistar.

Agresividad comercial (18/18): Alta; asume la venta con autoridad y lidera la captura de documentos por WhatsApp para agilizar.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza lectura legal de Habeas Data y agenda instalación para la franja de la tarde.

Resumen: Venta cerrada para María Silena en Barranquilla. Diego logra convencer a la cliente de cambiar de operador garantizando la gestión del retiro de Movistar y ofreciendo ultravelocidad de 900MB con instalación inmediata.

(Ref. monitoreo: 20260811_134602_IN_hogarmedblasterceoh_3007015972_dq7)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-11T18:46:02Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260811_134602_IN_hogarmedblasterceoh_3007015972_dq7)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '9022229', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 9:39 min · Nota 65/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 9:39 min
Nota final: 65/100

Rapport (10/10): El agente Jesús Tafura se presenta con propiedad como especialista, estableciendo un tono profesional y receptivo.

Escucha activa (12/12): Identifica correctamente que la cliente solo busca información y que no posee conocimientos técnicos avanzados.

Sondeo y perfilamiento (15/15): Realiza sondeo efectivo sobre el número de televisores (3) y la ubicación exacta en el barrio Cantilito de Santa Marta.

Argumentación y condiciones (15/15): Menciona la parrilla de 167 canales HD y el costo del paquete con decodificadores adicionales ($116,900).

Manejo de objeciones (8/15): Valida la objeción sobre el desconocimiento tecnológico de la cliente, pero no intenta educarla para cerrar el interés.

Agresividad comercial (5/18): Baja; el agente acepta finalizar el contacto rápidamente sin intentar rebatir la postergación para hablar con el hijo.

Cierre efectivo y legal (0/15): No se concreta venta ni compromiso de fecha; se limita a validar el número para un contacto futuro incierto.

Resumen: Cliente Liliana Toncel en Santa Marta solicita información de internet y TV. Manifiesta insatisfacción con Tigo por señal mala y caídas constantes. Delega la decisión técnica en su hijo por desconocimiento de "gigas", quedando el proceso en fase informativa sin cierre comercial activo por parte del agente.

(Ref. monitoreo: 20260810_171713_IN_hogarmedblasterceoh_3123494967_o62)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 0/15).$mon$, '2026-08-10T22:17:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '9022229' and cuerpo like '%Ref. monitoreo: 20260810_171713_IN_hogarmedblasterceoh_3123494967_o62)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$LLAMADA CAÍDA · 16:07 min · Nota 100/100$mon$, $mon$Tipificación: LLAMADA CAÍDA
Duración: 16:07 min
Nota final: 100/100

Rapport (10/10): Excelente adaptabilidad; inicia el contacto en inglés ante el saludo del cliente y transiciona fluidamente al español.

Escucha activa (12/12): Capta que el cliente busca lo "más barato" para una propiedad rentada, sin interés en plataformas de streaming.

Sondeo y perfilamiento (15/15): Valida cobertura en Britalia (Bogotá); identifica que la "Casa 37" no existe en sistema y propone validarlo por la "Casa 32".

Argumentación y condiciones (15/15): Posiciona el plan de 900 megas por $79,900 como el de mejor relación costo-beneficio, incluyendo Prime Video predeterminado.

Manejo de objeciones (15/15): Neutraliza dudas sobre la tecnología explicando que la zona cuenta con nodos de fibra óptica 100% simétrica.

Agresividad comercial (18/18): Alta; asume la venta, convence al cliente de la superioridad de la red y transiciona a la captura de datos para contrato digital.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza lectura de Habeas Data, valida identidad y envía links de aceptación digital al correo Hotmail del cliente.

Resumen: Venta cerrada para Diego Ciprián en Bogotá. Rosa maneja con destreza los problemas de nomenclatura de la propiedad, posiciona exitosamente la fibra de 900 megas y completa todo el protocolo legal de cierre digital en la misma llamada.

(Ref. monitoreo: 20260811_152721_IN_hogarmedblasterceoh_3214778344_1ip)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-11T20:27:21Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260811_152721_IN_hogarmedblasterceoh_3214778344_1ip)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 15:57 min · Nota 89/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 15:57 min
Nota final: 89/100

Rapport (10/10): Geraldín establece un saludo profesional y amable, validando el interés del cliente por el servicio.

Escucha activa (12/12): Identifica con precisión que el cliente solo está interesado en el servicio de internet individual.

Sondeo y perfilamiento (15/15): Valida la disponibilidad técnica para 500 megas de ultra velocidad con módem dual band.

Argumentación y condiciones (15/15): Argumenta el beneficio de Amazon Prime permanente y el descuento del 50% en el primer mes ($39,950).

Manejo de objeciones (15/15): Mantiene la fluidez de la llamada al no presentarse barreras de precio; refuerza el valor de la oferta.

Agresividad comercial (14/18): Media; el agente se muestra seguro en la oferta, aunque la interacción es breve y puramente informativa en esta fase.

Cierre efectivo y legal (8/15): Cierre informativo; se entregan los valores y condiciones comerciales a la espera del paso a la captura de datos.

Resumen: Consulta de internet para hogar de 500 megas. La agente Geraldín posiciona exitosamente el ahorro del primer mes y la plataforma gratuita de Amazon Prime como ganchos principales para la toma de decisión del cliente.

(Ref. monitoreo: 20260811_152258_IN_hogarmedblasterceoh_3213831395_pgo)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T20:22:58Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260811_152258_IN_hogarmedblasterceoh_3213831395_pgo)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 6:03 min · Nota 89/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 6:03 min
Nota final: 89/100

Rapport (10/10): Geraldín establece un saludo profesional y servicial, validando el interés del cliente Omar por la oferta recibida vía mensaje.

Escucha activa (12/12): Identifica el descontento por el costo en Movistar ($96,000 solo internet) y adapta la oferta para superar ese precio.

Sondeo y perfilamiento (15/15): Valida cobertura en el conjunto residencial Picasso (Bogotá); confirma torre y apartamento para asegurar red de 500 megas.

Argumentación y condiciones (15/15): Argumenta el plan de 500 megas por $79,900 con Amazon Prime permanente y el primer mes al 50% ($39,950).

Manejo de objeciones (15/15): Rebate la duda sobre el cambio de operador resaltando la tecnología de módem Dual Band y el ahorro mensual inmediato.

Agresividad comercial (14/18): Media; el agente mantiene el control, aunque permite que el cliente consulte con su hija antes de cerrar.

Cierre efectivo y legal (8/15): Cierre en seguimiento; traslada la gestión a WhatsApp para enviar la propuesta formal y esperar la respuesta familiar.

Resumen: Gestión informativa para internet en Bogotá. Geraldín posiciona exitosamente el valor de Amazon Prime y la ultravelocidad frente al costo elevado de Movistar, estableciendo un canal de seguimiento digital.

(Ref. monitoreo: 20260812_111911_IN_hogarmedblasterceoh_3508813066_fou)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T16:19:11Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260812_111911_IN_hogarmedblasterceoh_3508813066_fou)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 7:42 min · Nota 84/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 7:42 min
Nota final: 84/100

Rapport (10/10): Geraldín saluda con propiedad y establece un tono servicial, preguntando de inmediato por el interés específico de la cliente.

Escucha activa (12/12): Escucha la necesidad de ahorro de la cliente, quien paga $60,000 por solo 9MB en Movistar y busca mejorar su velocidad.

Sondeo y perfilamiento (15/15): Perfilamiento técnico en Barranquilla (Villa Norte); confirma que se requiere el servicio para un segundo piso independiente.

Argumentación y condiciones (15/15): Ofrece 500 megas con Amazon Prime permanente y descuento del 50%, dejando la factura inicial en $39,950.

Manejo de objeciones (12/15): Rebate la objeción de costo argumentando la superioridad tecnológica y calidad de Claro frente a la oferta actual de la cliente.

Agresividad comercial (12/18): Media; ofrece el WhatsApp corporativo para mantener el contacto mientras la cliente gestiona su retiro del otro operador.

Cierre efectivo y legal (8/15): Seguimiento comercial; se envía la oferta formal por WhatsApp a la espera de trámites de facturación con el competidor.

Resumen: Cliente Gloria de la Voz en Barranquilla busca reducir costos. Geraldín posiciona exitosamente el valor de Amazon Prime y la ultravelocidad, acordando retomar el contacto tras la respuesta del operador actual.

(Ref. monitoreo: 20260811_120203_IN_hogarmedblasterceoh_3114152607_22m)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T17:02:03Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260811_120203_IN_hogarmedblasterceoh_3114152607_22m)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140828545', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$Reintento · 30:30 min · Nota 100/100$mon$, $mon$Tipificación: Reintento
Duración: 30:30 min
Nota final: 100/100

Rapport (10/10): Jorge se presenta con autoridad como asesor de clientes preferenciales, generando exclusividad desde el inicio.

Escucha activa (12/12): Detecta que la cliente Janet busca cancelar su plan móvil para priorizar el presupuesto en el internet del hogar.

Sondeo y perfilamiento (15/15): Excelente; gestiona el rechazo inicial por capacidad de endeudamiento de Janet y realiza el cambio de titularidad a su hermana Patricia con éxito.

Argumentación y condiciones (15/15): Argumenta internet de 900 megas con Netflix incluido y descuento del 50% durante los dos primeros meses.

Manejo de objeciones (15/15): Resuelve dudas sobre la cancelación del plan móvil y guía a la cliente paso a paso por los procesos digitales.

Agresividad comercial (18/18): Alta; el agente lidera una llamada compleja de más de 20 minutos, superando fallas en correos y números de contacto.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Completa satisfactoriamente la validación de identidad y el proceso de biometría facial digital.

Resumen: Venta cerrada de 900MB para Janet y Patricia Valencia en Bogotá. El agente Jorge Berrío demuestra gran tenacidad al pivotar el titular del contrato por razones crediticias y completar todos los protocolos legales mediante biometría facial.

(Ref. monitoreo: 20260811_163647_IN_hogarmedblasterceoh_3144722712_fkm)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-11T21:36:47Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140828545' and cuerpo like '%Ref. monitoreo: 20260811_163647_IN_hogarmedblasterceoh_3144722712_fkm)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$ATENCIÓN AL CLIENTE · 8:26 min · Nota 94/100$mon$, $mon$Tipificación: ATENCIÓN AL CLIENTE
Duración: 8:26 min
Nota final: 94/100

Rapport (10/10): Keylin inicia con mucha energía y amabilidad, logrando una conexión empática con el señor Valentín.

Escucha activa (12/12): Escucha la problemática del cliente sobre su línea móvil desactivada por falta de pago tras un daño físico del equipo.

Sondeo y perfilamiento (15/15): Sondeo geográfico minucioso en Soledad (Río de Agua Viva); verifica carrera y nomenclatura exacta.

Argumentación y condiciones (10/15): Presenta plan Duo de $104,900 con 50% de descuento, aunque el proceso se detiene por falta de cobertura.

Manejo de objeciones (12/15): Maneja la frustración de la falta de red técnica ofreciendo una solución alternativa para su necesidad móvil.

Agresividad comercial (15/18): Alta (Pivotaje); al no poder vender hogar, detecta una oportunidad en móvil y refiere el caso al área de migración.

Cierre efectivo y legal (15/15): Cierre administrativo de hogar y derivación exitosa; captura el contacto para que un compañero le ayude con el celular.

Resumen: Consulta en Soledad que resulta negativa por cobertura técnica. La agente Keylin destaca por no dejar ir al cliente sin una solución, detectando una falla en su servicio móvil actual y gestionando un referido interno para su reactivación.

(Ref. monitoreo: 20260811_155328_IN_hogarmedblasterceoh_3122797376_74p)$mon$, $mon$Reforzar: Argumentación y condiciones (fue lo más bajo, 10/15).$mon$, '2026-08-11T20:53:28Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260811_155328_IN_hogarmedblasterceoh_3122797376_74p)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$NO HAY CONTACTO CON EL TITULAR DE LA LÍNEA · 12:43 min · Nota 93/100$mon$, $mon$Tipificación: NO HAY CONTACTO CON EL TITULAR DE LA LÍNEA
Duración: 12:43 min
Nota final: 93/100

Rapport (10/10): Keylin inicia con un saludo muy profesional y cálido, estableciendo una conexión inmediata con el señor Alejandro.

Escucha activa (12/12): Identifica la preocupación del cliente por experiencias previas de falta de cobertura y su duda sobre la señal en una casa de dos pisos.

Sondeo y perfilamiento (15/15): Realiza un sondeo geográfico exhaustivo en Pitalito (Wila); descubre que la dirección es nueva y requiere creación manual en el sistema.

Argumentación y condiciones (15/15): Presenta con claridad los planes de 250MB y 900MB, explicando los beneficios de la fibra óptica simétrica y el uso de repetidores.

Manejo de objeciones (15/15): Neutraliza el escepticismo del cliente explicando técnicamente el proceso de actualización de base de datos de Claro.

Agresividad comercial (18/18): Alta; la agente mantiene el control total, solicita el nombre para el WhatsApp y asegura un compromiso de consulta familiar.

Cierre efectivo y legal (8/15): Cierre en seguimiento; se traslada la gestión a WhatsApp para enviar las ofertas detalladas y definir el plan a contratar.

Resumen: Gestión sobresaliente en Pitalito. La agente Keylin maneja con destreza técnica la creación de una dirección no existente en sistema y posiciona el valor de la fibra simétrica ante un cliente que usa un proveedor local.

(Ref. monitoreo: 20260811_153012_IN_hogarmedblasterceoh_3219284912_6n7)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T20:30:12Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260811_153012_IN_hogarmedblasterceoh_3219284912_6n7)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 12:10 min · Nota 95/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 12:10 min
Nota final: 95/100

Rapport (10/10): Keylin inicia con un saludo muy servicial, logrando empatizar con el malestar del cliente hacia su operador actual (Movistar).

Escucha activa (12/12): Identifica que la principal molestia del cliente son los aumentos de tarifa y busca una solución estable en Claro.

Sondeo y perfilamiento (15/15): Excelente perfilamiento; descubre que la dirección en Bogotá aparece como "Local" y gestiona el cambio a "Residencial" en sistema.

Argumentación y condiciones (15/15): Argumenta plan de 500 megas por $89,900 con instalación GRATIS y plataforma permanente como valor diferencial.

Manejo de objeciones (15/15): Supera la barrera administrativa de la nomenclatura solicitando una actualización manual para no perder el beneficio residencial.

Agresividad comercial (18/18): Alta; asume el liderazgo del proceso capturando nombres, cédula y correo mientras se procesa la actualización técnica.

Cierre efectivo y legal (10/15): Cierre en proceso de validación; la agente establece un vínculo vía WhatsApp y agenda rellamado en 15 minutos para biometría.

Resumen: Gestión comercial de alto nivel para el señor Manuel en Bogotá. Keylin soluciona un error de etiquetado del predio en el sistema para ofrecer el beneficio de instalación gratuita, asegurando el prospecto mediante WhatsApp.

(Ref. monitoreo: 20260812_104858_IN_hogarmedblasterceoh_3045630109_y6t)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-12T15:48:58Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260812_104858_IN_hogarmedblasterceoh_3045630109_y6t)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$COBERTURA DTH · 22:47 min · Nota 62/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 22:47 min
Nota final: 62/100

Rapport (10/10): Presentación estándar profesional; logra captar la atención del cliente interesado en la promoción.

Escucha activa (12/12): Identifica el requerimiento de un paquete completo de internet y televisión para 3 puntos.

Sondeo y perfilamiento (10/15): Sondeo mínimo; valida la cantidad de equipos pero no profundiza en el operador actual o necesidades de navegación.

Argumentación y condiciones (12/15): Informa el costo del Triple Play ($116,900) y resalta el beneficio del 50% de descuento inicial.

Manejo de objeciones (5/15): Interacción muy corta; no hay espacio para el manejo de objeciones o argumentación de valor agregado.

Agresividad comercial (8/18): Baja; el agente entrega el precio de forma rápida sin intentar generar una necesidad o deseo mayor en el cliente.

Cierre efectivo y legal (5/15): Cierre abrupto e informativo; se pierden datos potenciales para un seguimiento posterior.

Resumen: Contacto comercial fugaz. El agente se limita a dar el precio para 3 televisores, finalizando la llamada sin realizar un perfilamiento que permita rebatir posibles dudas del usuario.

(Ref. monitoreo: 20260811_102546_IN_hogarmedblasterceoh_3144701605_q48)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 5/15).$mon$, '2026-08-11T15:25:46Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260811_102546_IN_hogarmedblasterceoh_3144701605_q48)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VOLVER A LLAMAR · 8:15 min · Nota 74/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 8:15 min
Nota final: 74/100

Rapport (10/10): Presentación profesional; la agente mantiene un tono ejecutivo y enfocado en el servicio solicitado.

Escucha activa (12/12): Confirma la preferencia de la cliente por el paquete Duo (Internet + TV) frente a la opción de solo internet.

Sondeo y perfilamiento (12/15): Sondeo geográfico en el conjunto Macarena 3; la validación de torre y apartamento se torna un poco lenta por demoras del sistema.

Argumentación y condiciones (15/15): Detalla los beneficios de 900 megas, 152 canales HD y la elección de una plataforma premium gratuita (Netflix/Disney).

Manejo de objeciones (10/15): Maneja dificultades de comunicación ("me escucha?") manteniendo la calma y repitiendo la información técnica necesaria.

Agresividad comercial (10/18): Media; el peso de la llamada se centra en la verificación de red, limitando el tiempo para un cierre más agresivo.

Cierre efectivo y legal (5/15): Fase informativa; se entregan valores y beneficios pero el contacto finaliza sin la captura de datos personales para validación.

Resumen: Consulta informativa para Triple Play en Bogotá. El proceso se dilata en la etapa técnica de ubicación del predio en el sistema, lo que impide avanzar hacia la fase de cierre legal en el mismo contacto.

(Ref. monitoreo: 20260812_163315_IN_hogarmedblasterceoh_3124741936_dm5)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 5/15).$mon$, '2026-08-12T21:33:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260812_163315_IN_hogarmedblasterceoh_3124741936_dm5)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$COBERTURA DTH · 8:02 min · Nota 77/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 8:02 min
Nota final: 77/100

Rapport (10/10): Presentación profesional; la agente Marta se identifica claramente y valida el interés del cliente.

Escucha activa (12/12): Detecta que el cliente es usuario móvil y requiere internet hogar porque no cuenta con el servicio.

Sondeo y perfilamiento (10/15): Sondeo geográfico; valida la ubicación en Tópaga (centro) pero el sistema arroja resultado negativo.

Argumentación y condiciones (10/15): Menciona los precios de referencia ($79k y $74k) a pesar de la limitación técnica de la zona.

Manejo de objeciones (15/15): Maneja con honestidad la falta de red en el sector, evitando generar falsas expectativas al usuario.

Agresividad comercial (5/18): Baja; dadas las limitaciones de infraestructura, la agente finaliza la gestión comercial rápidamente.

Cierre efectivo y legal (15/15): Cierre profesional de lead no factible; informa con claridad que no hay cobertura para prestar el servicio.

Resumen: Consulta para internet en Tópaga. El cliente manifiesta tener solo servicio móvil; Marta valida la dirección y confirma que Claro no cuenta con redes de hogar en ese punto específico, finalizando el contacto de forma correcta.

(Ref. monitoreo: 20260812_090925_IN_hogarmedblasterceoh_3147886442_h7q)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-12T14:09:25Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260812_090925_IN_hogarmedblasterceoh_3147886442_h7q)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1044213250', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VOLVER A LLAMAR · 6:26 min · Nota 77/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 6:26 min
Nota final: 77/100

Rapport (10/10): Presentación profesional; utiliza un tono pausado que genera seriedad en la propuesta comercial.

Escucha activa (12/12): Identifica que el cliente usa un operador local (Viboral) y busca mejorar su oferta actual.

Sondeo y perfilamiento (15/15): Realiza un sondeo geográfico preciso en El Carmen de Viboral, validando nomenclatura de edificio.

Argumentación y condiciones (10/15): Menciona la existencia de una oferta exclusiva, aunque el detalle se ve limitado por la brevedad del contacto.

Manejo de objeciones (10/15): Valida la preocupación del cliente sobre la cláusula de permanencia con su operador actual sin presionar.

Agresividad comercial (12/18): Media; acepta la solicitud del cliente de consultar su contrato antes de proceder con el cambio.

Cierre efectivo y legal (8/15): Cierre agendado; programa una nueva llamada para las 4:30 PM de ese mismo día para definir la venta.

Resumen: Llamada informativa para un cliente en Antioquia. La agente confirma cobertura y queda a la espera de que el cliente verifique posibles multas con su proveedor local para realizar la migración a Claro.

(Ref. monitoreo: 20260810_142708_IN_hogarmedblasterceoh_3226111492_7hq)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T19:27:08Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1044213250' and cuerpo like '%Ref. monitoreo: 20260810_142708_IN_hogarmedblasterceoh_3226111492_7hq)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$CLIENTE CUELGA · 18:37 min · Nota 86/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 18:37 min
Nota final: 86/100

Rapport (10/10): Profesional y respetuoso; Alejandra adapta su lenguaje al perfil del cliente (abogado) generando una conexión de alto nivel.

Escucha activa (12/12): Identifica la preocupación del cliente por los aumentos anuales y su necesidad de estabilidad para trabajar desde casa.

Sondeo y perfilamiento (15/15): Sondeo efectivo sobre el operador actual (Tigo) y validación de cobertura para servicios de alta velocidad.

Argumentación y condiciones (15/15): Argumenta con claridad el paquete de 900 megas por $122,000, enfatizando que es una tarifa fija con IVA incluido.

Manejo de objeciones (15/15): Excelente manejo sobre el miedo a quedarse sin internet: explica que primero se instala Claro y luego se cancela el servicio anterior.

Agresividad comercial (12/18): Media; aunque rebate con lógica, permite que el cliente postergue la entrega de datos para consultar con la familia.

Cierre efectivo y legal (7/15): Cierre informativo; el cliente queda con la oferta pero no se concreta la validación de crédito en línea.

Resumen: Cliente en Bogotá interesado en 900 megas. Alejandra genera confianza técnica y rebate objeciones sobre costos ocultos, pero la llamada finaliza en seguimiento familiar sin captura de datos inmediata.

(Ref. monitoreo: 20260810_142911_IN_hogarmedblasterceoh_3147302314_t1o)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 7/15).$mon$, '2026-08-10T19:29:11Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260810_142911_IN_hogarmedblasterceoh_3147302314_t1o)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$NO LE PARECE ATRACTIVA LA OFERTA · 9:42 min · Nota 89/100$mon$, $mon$Tipificación: NO LE PARECE ATRACTIVA LA OFERTA
Duración: 9:42 min
Nota final: 89/100

Rapport (10/10): Rapport amable y directo; proyecta una imagen servicial que facilita la entrega de información por parte del cliente.

Escucha activa (12/12): Capta el interés del cliente por un combo que ligue su telefonía móvil actual con el internet del hogar.

Sondeo y perfilamiento (15/15): Sondeo completo en el barrio Palestina (Bogotá); valida dirección sur, tipo de casa y piso para asegurar red.

Argumentación y condiciones (15/15): Presenta comparativa de planes de 250MB ($74,900) y 500MB ($79,900), resaltando la inclusión de Amazon Prime.

Manejo de objeciones (15/15): Explica el beneficio de "Todo Claro", asegurando que en 2-3 meses el plan móvil bajará de precio por convergencia.

Agresividad comercial (14/18): Media-Alta; guía al cliente hacia el plan de mayor velocidad por solo $5,000 de diferencia, maximizando el valor.

Cierre efectivo y legal (8/15): Cierre en seguimiento; el cliente queda con la información técnica y los beneficios de convergencia para definir el contrato.

Resumen: Gestión informativa para internet en Bogotá. Natalia posiciona con éxito los beneficios de ser cliente convergente, explicando cómo el servicio hogar impactará positivamente en el costo de su factura móvil actual.

(Ref. monitoreo: 20260811_112209_IN_hogarmedblasterceoh_3127466997_a2n)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T16:22:09Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260811_112209_IN_hogarmedblasterceoh_3127466997_a2n)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 7:49 min · Nota 92/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 7:49 min
Nota final: 92/100

Rapport (10/10): Rapport amable; Geraldín proyecta una actitud servicial que facilita que la cliente Tatiana exprese sus necesidades.

Escucha activa (12/12): Capta el interés por los precios y la necesidad futura de un segundo decodificador para final de mes.

Sondeo y perfilamiento (15/15): Perfilamiento técnico en Bogotá; identifica que es un apartamento en cuarto piso y valida la red para alta velocidad.

Argumentación y condiciones (15/15): Argumenta el plan de $104,900 con 50% de descuento ($52,450) y ofrece un descuento especial en decos adicionales ($7,000).

Manejo de objeciones (15/15): Maneja la necesidad de hablar con "el patrón" (decisor) ofreciendo soporte técnico-comercial vía WhatsApp para el cierre.

Agresividad comercial (18/18): Alta; utiliza concesiones comerciales (precio de decos) para incentivar la decisión y asegura el seguimiento inmediato.

Cierre efectivo y legal (7/15): Cierre agendado; queda pendiente de la confirmación de la cliente a las 4:00 PM tras hablar con su pareja.

Resumen: Gestión informativa y de preventa en Bogotá. Geraldín destaca por su capacidad de negociación al ofrecer valores preferenciales en equipos adicionales para asegurar la toma del servicio Triple Play.

(Ref. monitoreo: 20260813_133313_IN_hogarmedblasterceoh_3208763155_ykg)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 7/15).$mon$, '2026-08-13T18:33:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260813_133313_IN_hogarmedblasterceoh_3208763155_ykg)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 11:17 min · Nota 92/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 11:17 min
Nota final: 92/100

Rapport (10/10): Rapport amable; Martha logra que la cliente exponga su mala experiencia previa con otros técnicos.

Escucha activa (12/12): Escucha la frustración de la cliente por una negación de servicio anterior y valida su molestia.

Sondeo y perfilamiento (15/15): Excelente; valida cobertura confirmando que un local vecino ya cuenta con el servicio activo.

Argumentación y condiciones (15/15): Explica que gestionará la creación de la dirección (Casa 29) para garantizar que los técnicos instalen.

Manejo de objeciones (15/15): Derriba la objeción de "no hay cobertura" usando los datos reales de los vecinos en el sistema.

Agresividad comercial (15/18): Alta; la agente toma el control para "forzar" la viabilidad técnica y no perder la venta por un error de base de datos.

Cierre efectivo y legal (10/15): Cierre en seguimiento; se ve dificultado por fallas técnicas en la recepción de mensajes del cliente.

Resumen: Gestión de rescate de cliente en Billonverde. Tras una negación previa de Claro, Marta demuestra proactividad al validar vecinos con señal y comprometerse a actualizar la nomenclatura en sistema para proceder con la venta.

(Ref. monitoreo: 20260812_093315_IN_hogarmedblasterceoh_3203543991_wfz)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-12T14:33:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260812_093315_IN_hogarmedblasterceoh_3203543991_wfz)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$Reintento · 7:40 min · Nota 69/100$mon$, $mon$Tipificación: Reintento
Duración: 7:40 min
Nota final: 69/100

Rapport (10/10): Rapport amable; Natalia proyecta una actitud servicial que facilita la consulta técnica del usuario.

Escucha activa (12/12): Detecta que el cliente paga $70,000 en Tigo por un combo de móvil y hogar, buscando una oferta competitiva.

Sondeo y perfilamiento (15/15): Perfilamiento técnico en Bogotá; explica el proceso de portabilidad y los beneficios de ser cliente convergente.

Argumentación y condiciones (10/15): Argumentación limitada; tiene dificultad para competir con el precio de Tigo ($70k por 500MB) basándose solo en el plan hogar.

Manejo de objeciones (12/15): Intenta rebatir la objeción de precio explicando la futura migración del plan móvil a $33,000 para bajar el costo global.

Agresividad comercial (10/18): Media; el agente intenta pivotar hacia una solución de portabilidad móvil para igualar la oferta de la competencia.

Cierre efectivo y legal (0/15): Cierre fallido por problemas técnicos; la llamada se entrecorta y finaliza abruptamente durante la negociación.

Resumen: Intento de portabilidad en Bogotá. La agente Natalia intenta capturar un cliente de Tigo mediante el beneficio de "Todo Claro", pero la comunicación se interrumpe antes de concretar la validación crediticia.

(Ref. monitoreo: 20260812_105048_IN_hogarmedblasterceoh_3022572235_nsa)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 0/15).$mon$, '2026-08-12T15:50:48Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260812_105048_IN_hogarmedblasterceoh_3022572235_nsa)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$Reintento · 30:40 min · Nota 100/100$mon$, $mon$Tipificación: Reintento
Duración: 30:40 min
Nota final: 100/100

Rapport (10/10): Rapport cálido y profesional; genera un ambiente de alta confianza desde el primer segundo de la interacción.

Escucha activa (12/12): Detecta la prioridad de "economía" del cliente y adapta la oferta al paquete preferencial más asequible ($55,450).

Sondeo y perfilamiento (15/15): Perfilamiento completo sobre la ubicación en Soacha y los planes de mudanza futura del cliente a zona rural.

Argumentación y condiciones (15/15): Argumenta con precisión: 900 Mbps en fibra óptica y tarifa fija. Explica el decodificador que vuelve Smart los TVs.

Manejo de objeciones (15/15): Derriba objeciones sobre el traslado futuro asegurando la disponibilidad de servicio satelital en veredas.

Agresividad comercial (18/18): Alta; el agente asume la venta con seguridad y transiciona directamente a la captura de datos y consulta de crédito.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza lectura de Habeas Data, validación OTP y envía links de precontrato digital.

Resumen: Venta cerrada para Jeffer Sánchez en Soacha. El cliente buscaba economía tras una mala experiencia con Movistar. El agente logró capturar la venta mediante fibra óptica de alta velocidad y la gestión legal completa del contrato digital.

(Ref. monitoreo: 20260810_172804_IN_hogarmedblasterceoh_3203977365_r1a)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-10T22:28:04Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_172804_IN_hogarmedblasterceoh_3203977365_r1a)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VOLVER A LLAMAR · 15:54 min · Nota 90/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 15:54 min
Nota final: 90/100

Rapport (10/10): Rapport efectivo; gestiona con fluidez la transición del contacto inicial con la esposa al esposo (decisor técnico).

Escucha activa (12/12): Identifica una necesidad crítica: el cliente requiere el servicio hoy pero se muda de domicilio en octubre.

Sondeo y perfilamiento (15/15): Sondeo técnico exhaustivo buscando la dirección por nombre de conjunto ante inconsistencias de nomenclatura.

Argumentación y condiciones (15/15): Informa que el primer traslado de domicilio es gratuito, eliminando la barrera económica de la mudanza futura.

Manejo de objeciones (15/15): Maneja la duda del traslado explicando la logística de instalación inmediata en Los Patios y posterior migración a Pórtico.

Agresividad comercial (15/18): Media-Alta; presiona por la fecha de instalación mientras gestiona la búsqueda manual de la red en sistema.

Cierre efectivo y legal (8/15): Cierre en seguimiento técnico; queda pendiente de ubicar la nomenclatura exacta para confirmar la red HFC/Fibra.

Resumen: El señor Edinson requiere internet inmediato pero tiene un traslado programado. Andrea asegura la intención de venta ofreciendo el traslado gratis, quedando a la espera de la validación exacta de la dirección.

(Ref. monitoreo: 20260810_142248_IN_hogarmedblasterceoh_3219133309_x5d)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T19:22:48Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260810_142248_IN_hogarmedblasterceoh_3219133309_x5d)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$CLIENTE CUELGA · 6:50 min · Nota 97/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 6:50 min
Nota final: 97/100

Rapport (10/10): Rapport eficiente y servicial; la agente facilita que la cliente ubique sus datos a través de un recibo de luz.

Escucha activa (12/12): Capta de inmediato el interés en el paquete dúo (Internet + TV) para 2 televisores específicos.

Sondeo y perfilamiento (15/15): Perfilamiento técnico rápido; confirma 500 megas de híbrido de fibra óptica para la zona de la cliente.

Argumentación y condiciones (15/15): Argumenta oferta de $111,900 con 50% de descuento ($55,900), 2 decos Full HD y plataforma premium gratis.

Manejo de objeciones (15/15): Elimina barreras de entrada resaltando que por estar en Bogotá no tiene costo de instalación, incentivando el cierre.

Agresividad comercial (18/18): Alta; transiciona de forma fluida de la información a la solicitud de datos personales para la carga del contrato.

Cierre efectivo y legal (12/15): Cierre en captura de datos; la agente asegura el compromiso de la cliente al resaltar los beneficios económicos inmediatos.

Resumen: Gestión comercial exitosa en Bogotá. Andrea utiliza la ausencia de costos de instalación como cierre poderoso ("ahora o nunca") para capturar un nuevo servicio de Triple Play para dos puntos de televisión.

(Ref. monitoreo: 20260811_154855_IN_hogarmedblasterceoh_3208422580_dq6)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-11T20:48:55Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260811_154855_IN_hogarmedblasterceoh_3208422580_dq6)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA · 20:29 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 20:29 min
Nota final: 100/100

Rapport (10/10): Rapport empático; la agente Andrea atiende con calma la preocupación de la cliente sobre posibles reportes negativos.

Escucha activa (12/12): Detecta que la cliente teme estar reportada por una supuesta deuda en Cali que ella desconoce.

Sondeo y perfilamiento (15/15): Sondeo de datos personales y ubicación en Valledupar; verifica historial para despejar dudas de suplantación.

Argumentación y condiciones (15/15): Argumenta con seguridad que el sistema de Hogar la muestra "completamente aprobada" a pesar de los ruidos en servicios móviles.

Manejo de objeciones (15/15): Maneja la objeción de cartera explicando que para este nuevo contrato no hay impedimento legal vigente.

Agresividad comercial (18/18): Alta; no permite que el temor crediticio enfríe el proceso y procede de inmediato a subir los datos al sistema.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza lectura de Habeas Data (Leyes 1266 y 1581) y obtiene el consentimiento grabado.

Resumen: Cliente Yulianis Mendoza en Valledupar. Andrea logra derribar la barrera del miedo al reporte crediticio asegurando la aprobación en el sistema Hogar, cerrando una venta que el cliente consideraba improbable.

(Ref. monitoreo: 20260810_180414_IN_hogarmedblasterceoh_3158496917_6f0)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-10T23:04:14Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260810_180414_IN_hogarmedblasterceoh_3158496917_6f0)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA · 12:01 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 12:01 min
Nota final: 100/100

Rapport (10/10): Rapport excepcional; Cristiel establece una conexión cálida y profesional con la señora Ludis desde el inicio.

Escucha activa (12/12): Confirma la necesidad de la cliente de un paquete dúo con internet y televisión para un solo punto.

Sondeo y perfilamiento (15/15): Sondeo impecable en Barranquilla; valida dirección, tipo de vivienda y realiza consulta de crédito exitosa.

Argumentación y condiciones (15/15): Argumenta con fuerza el uso del módem Dual Band y el beneficio vitalicio de Netflix como valor diferencial.

Manejo de objeciones (15/15): Supera la barrera del "cupo de crédito" solicitando la habilitación manual para no detener el proceso de venta.

Agresividad comercial (18/18): Alta; asume la venta con total seguridad, entrega su WhatsApp y agenda la instalación para el día siguiente.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza resumen de contrato grabado, valida aceptación de condiciones y agenda visita técnica.

Resumen: Venta cerrada para Ludis de la Cruz en Barranquilla. La agente Cristiel maneja magistralmente el proceso, desde la superación de bloqueos de crédito hasta el cierre legal con agenda inmediata para Triple Play.

(Ref. monitoreo: 20260812_140858_IN_hogarmedblasterceoh_3104253049_wug)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-12T19:08:58Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260812_140858_IN_hogarmedblasterceoh_3104253049_wug)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA · 21:49 min · Nota 98/100$mon$, $mon$Tipificación: VENTA
Duración: 21:49 min
Nota final: 98/100

Rapport (10/10): Rapport fluido y eficiente; Andrea genera confianza inmediata con la cliente Daniela Torres.

Escucha activa (12/12): Capta el interés por solo internet y la necesidad de la cliente de no pagar instalación inicial.

Sondeo y perfilamiento (15/15): Excelente perfilamiento; detecta que la dirección en Bogotá no está creada en sistema y procede con la actualización manual.

Argumentación y condiciones (15/15): Argumenta con claridad el plan de $89,900 que no tiene costo de instalación y ofrece plataforma a elección.

Manejo de objeciones (15/15): Supera la barrera técnica del sistema iniciando una solicitud de creación de nomenclatura para no perder el lead.

Agresividad comercial (18/18): Alta; asume la venta capturando cédula y realizando lectura de Habeas Data mientras el sistema actualiza la dirección.

Cierre efectivo y legal (10/15): Cierre en proceso técnico; la agente agenda un rellamado en 20 minutos para finalizar la captura de datos tras la actualización de red.

Resumen: Gestión comercial de alto desempeño. Andrea maneja con destreza los problemas de base de datos, asegura la aprobación crediticia de la cliente y mantiene el control de la venta mediante rellamado.

(Ref. monitoreo: 20260812_174113_IN_hogarmedblasterceoh_3138205461_tkt)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-12T22:41:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260812_174113_IN_hogarmedblasterceoh_3138205461_tkt)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 9:10 min · Nota 97/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 9:10 min
Nota final: 97/100

Rapport (10/10): Rapport muy positivo y fluido; Natalia proyecta una actitud servicial y entusiasta que genera confianza.

Escucha activa (12/12): Capta la necesidad de 3 decodificadores y el interés por los beneficios de ahorro de Claro Pay.

Sondeo y perfilamiento (15/15): Sondeo técnico completo en Medellín (Aranjuez); valida estrato y tipo de vivienda (casa) para asegurar cobertura.

Argumentación y condiciones (15/15): Argumenta con éxito los 900 megas y el ahorro adicional del 10% al pagar por la App de la compañía.

Manejo de objeciones (15/15): Excelente manejo de la restricción del sistema, explicando el proceso de escalamiento de datos para no desmotivar a la cliente.

Agresividad comercial (18/18): Alta; recolecta todos los datos para la preventa y asegura el vínculo inmediato por WhatsApp.

Cierre efectivo y legal (12/15): Cierre en proceso; deja la venta lista para ser montada tras la aprobación de la restricción de datos.

Resumen: Cliente Lina en Medellín solicita Triple Play. Natalia realiza una excelente labor pedagógica sobre el beneficio de "Todo Claro" y gestiona proactivamente un bloqueo administrativo para salvar la venta.

(Ref. monitoreo: 20260810_155024_IN_hogarmedblasterceoh_3122507209_l6y)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-10T20:50:24Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260810_155024_IN_hogarmedblasterceoh_3122507209_l6y)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA · 17:43 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 17:43 min
Nota final: 100/100

Rapport (10/10): Rapport muy positivo; aprovecha la disposición del cliente que manifiesta que "quería llamarlos".

Escucha activa (12/12): Identifica el "dolor" del cliente: malas experiencias con Tigo por cobros deshonestos y falta de atención.

Sondeo y perfilamiento (15/15): Valida que el cliente ya tiene plan móvil Claro, facilitando la oferta de convergencia "Todo Claro".

Argumentación y condiciones (15/15): Posiciona el beneficio de Netflix gratuito y la ultravelocidad de la fibra óptica como solución definitiva.

Manejo de objeciones (15/15): Neutraliza la desconfianza hacia los operadores resaltando la transparencia del contrato grabado y el soporte directo.

Agresividad comercial (18/18): Alta; realiza una transición rápida de la queja hacia la validación de identidad y agenda técnica.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Validación de identidad exitosa, aceptación de términos y agenda programada para el día siguiente.

Resumen: Venta cerrada para el señor John en el sector de Los Patios. El cliente migra de Tigo por insatisfacción; la agente asegura el cierre mediante beneficios premium y una agenda técnica inmediata.

(Ref. monitoreo: 20260810_165253_IN_hogarmedblasterceoh_3213817026_1xk)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-10T21:52:53Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260810_165253_IN_hogarmedblasterceoh_3213817026_1xk)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 7:56 min · Nota 89/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 7:56 min
Nota final: 89/100

Rapport (10/10): Rapport profesional; la agente genera un ambiente de confianza para que la cliente comparta sus malas experiencias pasadas.

Escucha activa (12/12): Detecta que la cliente María quiere volver a Claro tras fallas con ETV y temores por caídas de señal previas.

Sondeo y perfilamiento (15/15): Identifica que el servicio actual está a nombre del esposo y perfila la necesidad de un paquete Triple Play completo.

Argumentación y condiciones (15/15): Presenta 900 megas (fibra), 179 canales HD, 50% de descuento por 2 meses y una plataforma premium a elección.

Manejo de objeciones (15/15): Maneja el miedo al trámite administrativo ofreciendo realizar la solicitud de cancelación de ETV directamente desde Claro.

Agresividad comercial (14/18): Media-Alta; ante la necesidad de consultar con el esposo, utiliza el WhatsApp corporativo para enviar el radicado de asesoría.

Cierre efectivo y legal (8/15): Cierre en seguimiento; la cliente se compromete a avisar una vez hable con su pareja y llegue la factura de ETV.

Resumen: María Cárdenas desea migrar de ETV a Claro por fallas de servicio. Geraldín argumenta los beneficios de la fibra óptica y asegura el seguimiento de la venta mediante contacto digital directo.

(Ref. monitoreo: 20260811_102919_IN_hogarmedblasterceoh_3143341470_quj)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T15:29:19Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260811_102919_IN_hogarmedblasterceoh_3143341470_quj)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 6:12 min · Nota 79/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 6:12 min
Nota final: 79/100

Rapport (10/10): Rapport profesional; mantiene un tono respetuoso y pausado que genera credibilidad en la información técnica.

Escucha activa (12/12): Identifica que el cliente es usuario de ETB fibra óptica y que su principal motivación de cambio es el ahorro económico.

Sondeo y perfilamiento (15/15): Perfilamiento geográfico exacto en el Edificio Colonial (Bogotá), validando torre y apartamento para confirmar red HFC.

Argumentación y condiciones (12/15): Presenta planes de 250MB y 500MB, pero tiene dificultades para competir técnicamente cuando el cliente exige "fibra real".

Manejo de objeciones (10/15): Manejo de objeciones aceptable; intenta rebatir la superioridad de la fibra de ETB argumentando estabilidad, pero no convence al cliente.

Agresividad comercial (12/18): Media; ofrece la posibilidad de retiro sin compromiso si el servicio no cumple expectativas para forzar el interés.

Cierre efectivo y legal (8/15): Cierre agendado; el cliente solicita tiempo para evaluar la propuesta técnica frente a su proveedor actual.

Resumen: El cliente José Acero en Bogotá busca economía pero teme bajar la calidad de su internet ETB. Natalia ofrece planes HFC con ahorro significativo, pero la brecha tecnológica impide un cierre inmediato, quedando el contacto en seguimiento para la próxima semana.

(Ref. monitoreo: 20260811_140029_IN_hogarmedblasterceoh_3112872913_q4h)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T19:00:29Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260811_140029_IN_hogarmedblasterceoh_3112872913_q4h)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$COBERTURA DTH · 6:32 min · Nota 92/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:32 min
Nota final: 92/100

Rapport (10/10): Rapport sobresaliente; muestra preocupación genuina por el bienestar del cliente tras un terremoto reciente.

Escucha activa (12/12): Atención plena a los comentarios personales del cliente, construyendo una relación de confianza inmediata.

Sondeo y perfilamiento (15/15): Sondeo minucioso de la dirección en zona de veredas para una validación de cobertura técnica precisa.

Argumentación y condiciones (15/15): Informa con honestidad que el sistema no permite la instalación por falta de cobertura técnica en el lote.

Manejo de objeciones (15/15): Neutraliza la decepción del cliente prometiendo monitorear la zona para futuros despliegues de la red de Claro.

Agresividad comercial (10/18): Media; prioriza la satisfacción y atención humana sobre la presión comercial dada la limitación técnica.

Cierre efectivo y legal (15/15): Cierre profesional de llamada fallida por cobertura; se registra el interés para bases de datos futuras.

Resumen: Intento de contratación en sector rural que resulta negativo por cobertura. La llamada destaca por la gran cortesía y calidez humana del agente ante situaciones externas de emergencia (sismo) vividas por el cliente.

(Ref. monitoreo: 20260810_153710_IN_hogarmedblasterceoh_3214375653_epn)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 10/18).$mon$, '2026-08-10T20:37:10Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_153710_IN_hogarmedblasterceoh_3214375653_epn)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 9:06 min · Nota 89/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 9:06 min
Nota final: 89/100

Rapport (10/10): Saludo amable y enérgico; genera un ambiente propicio para que la cliente (hija de la titular) exponga sus dudas.

Escucha activa (12/12): Escucha con atención la pregunta técnica sobre la diferencia entre fibra y cableado tradicional.

Sondeo y perfilamiento (15/15): Sondeo preciso en Bogotá (Carrera 92); identifica cobertura de red híbrida y explica pedagógicamente su funcionamiento.

Argumentación y condiciones (15/15): Posiciona el Duo de $104,900 con 50% de descuento y plataforma a elección, comparándolo con la oferta de solo internet.

Manejo de objeciones (15/15): Maneja con destreza la duda técnica sobre el "híbrido", asegurando estabilidad de señal desde el poste al hogar.

Agresividad comercial (14/18): Media-Alta; mantiene el control de la llamada a pesar de que la decisora (la madre) se encuentra en una reunión.

Cierre efectivo y legal (8/15): Cierre agendado; se programa un rellamado para las 5:00 PM para concretar la venta directamente con la titular.

Resumen: Llamada de asesoría técnica y comercial en Bogotá. La agente destaca por su claridad al explicar la tecnología HFC y logra agendar un compromiso de cierre para el final de la tarde.

(Ref. monitoreo: 20260812_160120_IN_hogarmedblasterceoh_3195348189_xx8)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T21:01:20Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260812_160120_IN_hogarmedblasterceoh_3195348189_xx8)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$COBERTURA DTH · 5:00 min · Nota 82/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 5:00 min
Nota final: 82/100

Rapport (10/10): Saludo amable; Martha establece un tono receptivo frente a las dudas iniciales del cliente.

Escucha activa (12/12): Identifica que el cliente ya ha tenido intentos fallidos de contratación por falta de cobertura en su zona.

Sondeo y perfilamiento (15/15): Realiza una validación rigurosa de la nomenclatura en Acacías (Meta), confirmando la ubicación exacta.

Argumentación y condiciones (10/15): Argumenta precios de internet ($39k) y duo ($55k) como referencia comercial a pesar del resultado negativo del sistema.

Manejo de objeciones (15/15): Maneja la limitación técnica con honestidad, informando que no hay cobertura actual en la dirección brindada.

Agresividad comercial (5/18): Baja; dada la inviabilidad técnica, el agente prioriza finalizar el contacto administrativamente.

Cierre efectivo y legal (15/15): Cierre profesional de lead no factible; se agradece el interés y se informa con claridad la situación técnica.

Resumen: Intento de venta en Acacías que resulta negativo. Martha destaca por su paciencia al validar la dirección entrecortada y por su honestidad al confirmar la falta de redes de Claro en ese punto específico.

(Ref. monitoreo: 20260811_120850_IN_hogarmedblasterceoh_3112239759_5f8)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-11T17:08:50Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260811_120850_IN_hogarmedblasterceoh_3112239759_5f8)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$Reintento · 5:07 min · Nota 86/100$mon$, $mon$Tipificación: Reintento
Duración: 5:07 min
Nota final: 86/100

Rapport (10/10): Saludo cálido y profesional; la agente proyecta dominio del portafolio desde el primer segundo.

Escucha activa (12/12): Capta de inmediato que la cliente solo requiere internet y adapta la oferta a esa necesidad única.

Sondeo y perfilamiento (15/15): Perfilamiento preciso en Bogotá (La Estancia); valida torre y apartamento para confirmar red HFC.

Argumentación y condiciones (15/15): Argumenta con beneficios técnicos: módem de largo alcance doble banda y 500 megas por $79,900.

Manejo de objeciones (12/15): No se presentan objeciones de peso; la agente mantiene el valor percibido frente al mercado.

Agresividad comercial (15/18): Media-Alta; resalta Amazon Prime incluido y el descuento del 50% como motor de decisión inmediata.

Cierre efectivo y legal (7/15): Fase informativa avanzada; se entrega el valor preferencial pero no se concreta la captura de datos en línea.

Resumen: Consulta de internet para hogar en el sector de la Estancia, Bogotá. La agente Cristiel detalla las ventajas del módem avanzado y la ultravelocidad, posicionando a Amazon Prime como el principal valor agregado del plan.

(Ref. monitoreo: 20260810_142115_IN_hogarmedblasterceoh_3234361316_unk)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 7/15).$mon$, '2026-08-10T19:21:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_142115_IN_hogarmedblasterceoh_3234361316_unk)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA · 26:48 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 26:48 min
Nota final: 100/100

Rapport (10/10): Saludo cordial y fluido; genera un ambiente de confianza que facilita el intercambio de información.

Escucha activa (12/12): Escucha atentamente las dudas sobre la cláusula de permanencia y las resuelve vinculándolas a la protección del precio.

Sondeo y perfilamiento (15/15): Perfilamiento minucioso en Medellín (Belén); valida si es casa o edificio para asegurar la viabilidad de la fibra óptica.

Argumentación y condiciones (15/15): Argumentación sólida: 900 Mbps, 2 decos y plataforma gratuita; explica detalladamente las condiciones del contrato.

Manejo de objeciones (15/15): Transforma la objeción de "permanencia" en un beneficio de "congelación de tarifa" por 12 meses.

Agresividad comercial (18/18): Alta; asume la venta con seguridad y lidera el paso a paso de la captura de datos y validación de correo.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Realiza el envío de condiciones comerciales y el cliente realiza la aceptación digital del precontrato.

Resumen: Venta cerrada de Triple Play en Medellín. El agente logra que el cliente acepte la permanencia tras entender el valor de la tarifa protegida. Se completa satisfactoriamente el protocolo legal digital.

(Ref. monitoreo: 20260810_154141_IN_hogarmedblasterceoh_3112688797_1r5)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-10T20:41:41Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260810_154141_IN_hogarmedblasterceoh_3112688797_1r5)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$CLIENTE CUELGA · 5:07 min · Nota 47/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 5:07 min
Nota final: 47/100

Rapport (10/10): Saludo cordial y profesional de la agente Alejandra López.

Escucha activa (12/12): Identifica que el cliente busca unificar servicios de Hogar y Datos bajo un solo paquete.

Sondeo y perfilamiento (10/15): Valida que el cliente tiene ETV en hogar y Claro en postpago móvil.

Argumentación y condiciones (5/15): Breve; menciona la posibilidad de unificación pero la llamada se corta antes de presentar la oferta económica.

Manejo de objeciones (5/15): El cliente pregunta por paquetes de telefonía de la competencia y el agente no alcanza a rebatir.

Agresividad comercial (5/18): Baja; la interacción es demasiado corta para demostrar empuje comercial.

Cierre efectivo y legal (0/15): Cierre fallido por caída de llamada o desconexión abrupta.

Resumen: Intento de venta de convergencia. El cliente manifiesta interés en unir su plan móvil de $80,000 con el servicio de hogar de ETV. La agente Alejandra empieza a validar planes regionales pero la comunicación se interrumpe prematuramente.

(Ref. monitoreo: 20260811_120526_IN_hogarmedblasterceoh_3115097826_7et)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 0/15).$mon$, '2026-08-11T17:05:26Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260811_120526_IN_hogarmedblasterceoh_3115097826_7et)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$Reintento · 5:13 min · Nota 89/100$mon$, $mon$Tipificación: Reintento
Duración: 5:13 min
Nota final: 89/100

Rapport (10/10): Saludo cordial y profesional; genera un ambiente propicio para el intercambio de información técnica.

Escucha activa (12/12): Escucha atentamente la consulta sobre internet para una casa y valida la disposición del cliente.

Sondeo y perfilamiento (15/15): Realiza validación de cobertura confirmando una "excelente red" para 500 megas en la ubicación indicada.

Argumentación y condiciones (15/15): Presenta comparativa clara: 250MB por $74,900 con plataforma a elección vs 500MB por $79,900 con Amazon Prime.

Manejo de objeciones (15/15): Proactiva al preguntar si desea incluir televisión para mejorar el valor percibido del paquete.

Agresividad comercial (14/18): Media; guía al cliente a través de las dos opciones de solo internet para que él mismo identifique la mejor relación costo-beneficio.

Cierre efectivo y legal (8/15): Cierre en seguimiento; el cliente queda con las dos ofertas planteadas para decidir entre el plan de 250 o 500 megas.

Resumen: Gestión informativa para internet hogar. Alejandra detalla las diferencias entre los planes de entrada y gama media, resaltando la inclusión de plataformas digitales como valor agregado en ambos casos.

(Ref. monitoreo: 20260811_152802_IN_hogarmedblasterceoh_3219415138_q7f)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T20:28:02Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260811_152802_IN_hogarmedblasterceoh_3219415138_q7f)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$En cola · 7:40 min · Nota 50/100$mon$, $mon$Tipificación: En cola
Duración: 7:40 min
Nota final: 50/100

Rapport (10/10): Saludo cordial y profesional; Keylin valida rápidamente el interés de la cliente por el servicio de hogar.

Escucha activa (12/12): Identifica que la cliente tiene la expectativa de un plan de "$40,000" y aclara el valor real de la oferta.

Sondeo y perfilamiento (8/15): Sondeo interrumpido; alcanza a validar la dirección en el barrio Socorro de Bogotá antes de la falla técnica.

Argumentación y condiciones (10/15): Explica que el pago de $44,900 corresponde al primer mes con descuento de un plan de 500MB.

Manejo de objeciones (5/15): No se presentan objeciones de peso en la breve interacción previa a la caída del sistema.

Agresividad comercial (5/18): Baja; la llamada se torna pasiva debido a problemas constantes de señal en la línea de la cliente.

Cierre efectivo y legal (0/15): Cierre fallido; la llamada se corta abruptamente durante la verificación del apartamento en el segundo piso.

Resumen: Intento de venta de internet en Bogotá. La agente aclara los términos de la promoción del 50% de descuento, pero la comunicación se interrumpe por fallas de señal de la cliente durante la etapa de perfilamiento técnico.

(Ref. monitoreo: 20260811_102546_IN_hogarmedblasterceoh_3144542170_bxm)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 0/15).$mon$, '2026-08-11T15:25:46Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260811_102546_IN_hogarmedblasterceoh_3144542170_bxm)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 7:42 min · Nota 85/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 7:42 min
Nota final: 85/100

Rapport (10/10): Saludo cordial y profesional; Marta establece un ambiente receptivo para la consulta de la cliente.

Escucha activa (12/12): Identifica la duda técnica sobre la cobertura en el edificio y el interés por cambiar de operador.

Sondeo y perfilamiento (15/15): Valida dirección exacta en Bogotá y confirma disponibilidad de 500 megas en red híbrida.

Argumentación y condiciones (15/15): Argumenta plan de $79,900 con Amazon Prime gratuito y 50% de descuento en el primer mes.

Manejo de objeciones (15/15): Acepta la solicitud de consulta con el operador actual sin presionar, pero asegura el seguimiento.

Agresividad comercial (10/18): Media; el agente se mantiene en rol informativo, permitiendo la postergación por parte de la cliente.

Cierre efectivo y legal (8/15): Cierre en seguimiento; agenda un contacto para la tarde y establece vínculo por WhatsApp.

Resumen: Cliente interesada en migrar a Claro pero duda de la cobertura en su edificio. Marta confirma la viabilidad técnica de 500MB y posiciona el beneficio de Amazon Prime, dejando el cierre pendiente para una rellamada en la tarde.

(Ref. monitoreo: 20260812_092344_IN_hogarmedblasterceoh_3133071734_9ns)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T14:23:44Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260812_092344_IN_hogarmedblasterceoh_3133071734_9ns)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$Reintento · 7:29 min · Nota 62/100$mon$, $mon$Tipificación: Reintento
Duración: 7:29 min
Nota final: 62/100

Rapport (10/10): Saludo cordial y profesional; Marta se presenta con propiedad como asesora de Claro Hogar.

Escucha activa (12/12): Escucha el interés del cliente por una publicidad específica y adapta la respuesta a la solicitud de información.

Sondeo y perfilamiento (10/15): Sondeo básico; se limita a preguntar por la cantidad de televisores en el hogar (2).

Argumentación y condiciones (12/15): Menciona el paquete de internet y televisión por $110,900 con 50% de descuento los dos primeros meses.

Manejo de objeciones (5/15): No se desarrolla manejo de objeciones ya que la llamada es puramente informativa y breve.

Agresividad comercial (8/18): Baja; el agente se mantiene en un rol reactivo, entregando solo la información solicitada sin empujar hacia la preventa.

Cierre efectivo y legal (5/15): Cierre informativo; no se concreta validación de datos ni agenda de seguimiento formal.

Resumen: Llamada informativa breve. Marta detalla los costos del paquete Duo para dos televisores, pero la interacción carece de profundidad comercial para asegurar el interés del cliente hacia el cierre.

(Ref. monitoreo: 20260811_124259_IN_hogarmedblasterceoh_3106621166_0lb)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 5/15).$mon$, '2026-08-11T17:42:59Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260811_124259_IN_hogarmedblasterceoh_3106621166_0lb)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$ATENCIÓN AL CLIENTE · 5:05 min · Nota 87/100$mon$, $mon$Tipificación: ATENCIÓN AL CLIENTE
Duración: 5:05 min
Nota final: 87/100

Rapport (10/10): Saludo cordial y profesional; Rosa mantiene un tono servicial durante todo el contacto.

Escucha activa (12/12): Capta que la cliente Kendy no quiere internet hogar, sino un plan móvil económico de $46,000.

Sondeo y perfilamiento (15/15): Identifica que la cliente es usuaria prepago de Claro y busca una migración a plan postpago.

Argumentación y condiciones (5/15): Argumentación nula para hogar; la agente reconoce que su área no maneja esos valores de telefonía.

Manejo de objeciones (15/15): Excelente manejo de pivotaje; al no ser su área, no abandona el lead y ofrece derivarlo a ventas móvil.

Agresividad comercial (15/18): Alta; proactividad para capturar el negocio móvil a pesar de estar asignada a la campaña de hogar.

Cierre efectivo y legal (15/15): Cierre de servicio exitoso; captura el nombre para remitir el contacto al departamento de migración.

Resumen: Llamada de redireccionamiento comercial. La cliente busca un plan de celular y Rosa, al detectar que no es prospecto para hogar, gestiona eficazmente el referido interno para asegurar que Claro no pierda la oportunidad de venta móvil.

(Ref. monitoreo: 20260812_124452_IN_hogarmedblasterceoh_3128614137_9k2)$mon$, $mon$Reforzar: Argumentación y condiciones (fue lo más bajo, 5/15).$mon$, '2026-08-12T17:44:52Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260812_124452_IN_hogarmedblasterceoh_3128614137_9k2)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VOLVER A LLAMAR · 16:05 min · Nota 93/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 16:05 min
Nota final: 93/100

Rapport (10/10): Saludo cordial y receptivo; Jokabeth establece una base de confianza inmediata con el señor Alexando.

Escucha activa (12/12): Identifica claramente que el cliente busca un paquete Triple Play (Internet + TV) para su vivienda en Bogotá.

Sondeo y perfilamiento (15/15): Valida dirección en el barrio El Paraíso; confirma cobertura de red híbrida y determina que el cliente requiere instalación desde cero.

Argumentación y condiciones (15/15): Argumenta el plan de $104,900 con 50% de descuento los dos primeros meses, enfatizando que es una tarifa fija sin incrementos.

Manejo de objeciones (15/15): Ante una deuda detectada de $60,000, sugiere con agilidad el cambio de titularidad a nombre de la esposa para salvar la venta.

Agresividad comercial (18/18): Alta; no permite que el reporte crediticio detenga el proceso y orienta al cliente para conseguir los datos del tercero de inmediato.

Cierre efectivo y legal (8/15): Cierre en seguimiento; agenda un rellamado en 15 minutos para capturar la cédula de la esposa y formalizar el contrato.

Resumen: Gestión proactiva en Bogotá. La agente Jokabeth detecta una mora en el sistema y, en lugar de finalizar la llamada, propone un cambio de titular familiar, manteniendo el interés comercial del cliente.

(Ref. monitoreo: 20260812_140205_IN_hogarmedblasterceoh_3102743748_3hn)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T19:02:05Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260812_140205_IN_hogarmedblasterceoh_3102743748_3hn)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VOLVER A LLAMAR · 11:14 min · Nota 86/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 11:14 min
Nota final: 86/100

Rapport (10/10): Saludo cordial y servicial; Jokabeth establece un tono receptivo que invita al cliente a consultar sus dudas.

Escucha activa (12/12): Identifica el descontento del cliente con ETV por fallas en el servicio y su interés en una oferta de internet de ultravelocidad.

Sondeo y perfilamiento (12/15): Valida dirección en Bogotá (Portal de Santa Fe 5); el sondeo se ve afectado por ruido ambiental externo en la línea del cliente.

Argumentación y condiciones (15/15): Propone 900 megas por $79,900 con 50% de descuento el primer mes y Amazon Prime gratuito.

Manejo de objeciones (15/15): Maneja la duda sobre el trámite de retiro de ETV explicando que solo requiere la referencia de pago para apoyarlo.

Agresividad comercial (14/18): Media; mantiene el interés del cliente a pesar de las interrupciones externas, aunque no concreta la captura de datos inmediata.

Cierre efectivo y legal (8/15): Cierre en seguimiento; el cliente queda en consultar en su casa para tomar la decisión final.

Resumen: Cliente en Bogotá interesado en cambiar su internet de ETV a Claro. La agente Jokabeth posiciona con éxito los 900MB de fibra, pero la llamada se dificulta por interferencias de ruido en el entorno del cliente, quedando el proceso en fase de consulta familiar.

(Ref. monitoreo: 20260811_130115_IN_hogarmedblasterceoh_3102128995_xvj)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-11T18:01:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260811_130115_IN_hogarmedblasterceoh_3102128995_xvj)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 7:50 min · Nota 62/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 7:50 min
Nota final: 62/100

Rapport (10/10): Saludo cordial; Geraldín establece un tono servicial desde el inicio de la consulta.

Escucha activa (12/12): Detecta que el cliente busca bajar costos porque su factura actual de Claro es elevada.

Sondeo y perfilamiento (15/15): Al validar la dirección en Ibagué, descubre que el cliente ya tiene el servicio de Claro activo.

Argumentación y condiciones (5/15): Explica correctamente que su línea es solo para ventas nuevas y no puede realizar ajustes de retención.

Manejo de objeciones (5/15): No aplica manejo comercial agresivo ya que el perfil corresponde a postventa/atención al cliente.

Agresividad comercial (5/18): Baja; prioriza la orientación correcta sobre el intento de una venta que sería anulada por el sistema.

Cierre efectivo y legal (10/15): Cierre por direccionamiento; indica al cliente marcar la opción 3 en la línea 611 para su trámite.

Resumen: Llamada en Ibagué donde el cliente busca reducir su factura actual. La agente identifica que es una solicitud de servicio al cliente y no de ventas, derivándolo al área encargada según los lineamientos.

(Ref. monitoreo: 20260810_150054_IN_hogarmedblasterceoh_3143437324_sjf)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-10T20:00:54Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260810_150054_IN_hogarmedblasterceoh_3143437324_sjf)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 14:00 min · Nota 88/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 14:00 min
Nota final: 88/100

Rapport (10/10): Saludo cordial; Geraldín establece una comunicación fluida y servicial desde el inicio.

Escucha activa (12/12): Identifica que el cliente requiere el internet para un segundo piso y que la decisión final depende de la consulta familiar.

Sondeo y perfilamiento (15/15): Realiza una búsqueda exhaustiva en el barrio Libertadores (Bogotá); valida cobertura híbrida en un segundo piso.

Argumentación y condiciones (15/15): Argumenta los planes vigentes y la importancia de la dirección exacta para garantizar el valor de la promoción.

Manejo de objeciones (14/15): Maneja la postergación por "hablar con la familia" ofreciendo seguimiento digital inmediato sin presionar de forma molesta.

Agresividad comercial (14/18): Media; mantiene el vínculo comercial a través de WhatsApp corporativo para no perder el lead caliente.

Cierre efectivo y legal (8/15): Cierre en seguimiento; establece contacto por WhatsApp y agenda rellamado para el día lunes.

Resumen: Llamada de seguimiento en Bogotá. La agente Geraldín confirma la cobertura técnica y asegura la continuidad del proceso de venta mediante un canal de comunicación digital directo con el cliente.

(Ref. monitoreo: 20260813_140437_IN_hogarmedblasterceoh_3103428260_prp)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-13T19:04:37Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260813_140437_IN_hogarmedblasterceoh_3103428260_prp)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$COBERTURA DTH · 14:20 min · Nota 94/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 14:20 min
Nota final: 94/100

Rapport (10/10): Saludo cordial; Geraldine establece comunicación fluida con una cliente ya rechazada anteriormente por falta de cobertura.

Escucha activa (12/12): Escucha con atención los detalles técnicos que brinda la cliente sobre el cableado reciente que vio en su conjunto.

Sondeo y perfilamiento (15/15): Realiza búsqueda exhaustiva en el Multifamiliar La Esperanza (Villavicencio), validando nomenclatura de servicios públicos.

Argumentación y condiciones (15/15): Honestidad técnica: informa que las torres 6, 7 y 8 están en adecuación y aún no están activas para la venta.

Manejo de objeciones (12/15): Neutraliza la decepción explicando que la presencia de técnicos confirma que pronto habrá disponibilidad total.

Agresividad comercial (15/18): Alta (Pivotaje); al no poder vender hogar, ofrece migrar una línea prepago a plan postpago para no perder el contacto comercial.

Cierre efectivo y legal (15/15): Cierre administrativo de hogar y derivación exitosa a área móvil; captura datos para la migración de plan telefónico.

Resumen: Intento de venta en Villavicencio que resulta en un "no-go" temporal por infraestructura. La agente destaca por su proactividad al detectar una oportunidad en telefonía móvil y referir a la cliente.

(Ref. monitoreo: 20260811_100613_IN_hogarmedblasterceoh_3174846782_6yd)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 12/15).$mon$, '2026-08-11T15:06:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260811_100613_IN_hogarmedblasterceoh_3174846782_6yd)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1007541668', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 12:01 min · Nota 95/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 12:01 min
Nota final: 95/100

Rapport (10/10): Saludo cordial; se identifica rápidamente y genera un ambiente de confianza para el intercambio de datos.

Escucha activa (12/12): Detecta un conflicto administrativo con un servicio previo del inquilino anterior en la vivienda.

Sondeo y perfilamiento (15/15): Excelente perfilamiento; descubre que el sistema bloquea la venta por una orden de traslado activa de un tercero.

Argumentación y condiciones (15/15): Argumenta los beneficios de 900 megas y el 50% de descuento durante los dos primeros meses.

Manejo de objeciones (15/15): Maneja la objeción del sistema sugiriendo colocar el contrato a nombre de la esposa para agilizar la instalación.

Agresividad comercial (18/18): Alta; busca soluciones creativas ante bloqueos y transiciona a la captura de la nueva cédula.

Cierre efectivo y legal (10/15): Cierre pendiente de ajuste; se compromete a llamar en media hora tras ajustar la dirección en plataforma.

Resumen: Venta en Pereira para Edwin Hernández. Ante un bloqueo por una orden activa ajena, el agente sugiere contratar a nombre de la pareja para garantizar la instalación inmediata de la fibra óptica.

(Ref. monitoreo: 20260810_164836_IN_hogarmedblasterceoh_3174478672_2ru)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-10T21:48:36Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1007541668' and cuerpo like '%Ref. monitoreo: 20260810_164836_IN_hogarmedblasterceoh_3174478672_2ru)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$CLIENTE CUELGA · 5:09 min · Nota 41/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 5:09 min
Nota final: 41/100

Rapport (10/10): Saludo corporativo estándar; mantiene un tono formal y ejecutivo durante el breve contacto.

Escucha activa (12/12): Identifica que la cliente usa Claro en el móvil pero tiene el hogar con la competencia (Tigo).

Sondeo y perfilamiento (8/15): Sondeo limitado; solo alcanza a preguntar por el operador actual antes de que la interacción se torne tensa.

Argumentación y condiciones (5/15): Alcanza a mencionar el beneficio del 50% de descuento de forma genérica al inicio.

Manejo de objeciones (2/15): Deficiente; ante una pregunta de la cliente sobre su ubicación, la agente se pone a la defensiva y no gestiona la duda.

Agresividad comercial (4/18): Baja; la agente abandona la gestión prematuramente al sentirse cuestionada por la cliente.

Cierre efectivo y legal (0/15): Cierre abrupto por decisión de la agente; no deja canal de seguimiento ni concreta oferta.

Resumen: Intento de venta en Bogotá. La llamada se corta cuando la cliente pregunta desde qué ciudad llaman; la agente responde que es "información personal" y finaliza el contacto de forma tajante, perdiendo una oportunidad clara de convergencia.

(Ref. monitoreo: 20260810_173829_IN_hogarmedblasterceoh_3165045661_ffs)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 0/15).$mon$, '2026-08-10T22:38:29Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260810_173829_IN_hogarmedblasterceoh_3165045661_ffs)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$LLAMADA CAÍDA · 7:54 min · Nota 89/100$mon$, $mon$Tipificación: LLAMADA CAÍDA
Duración: 7:54 min
Nota final: 89/100

Rapport (10/10): Saludo ejecutivo y profesional; Rosa establece una comunicación clara e identifica el interés del cliente por el paquete Duo.

Escucha activa (12/12): Identifica la preferencia del cliente por incluir Win Sports+ como plataforma premium para evitar pagos adicionales.

Sondeo y perfilamiento (15/15): Valida dirección en Fusagasugá (Calle 3) y confirma cobertura de 500 megas en un primer piso.

Argumentación y condiciones (15/15): Argumenta plan de $111,900 con 50% de descuento ($55,950) y destaca la parrilla de 165 canales HD.

Manejo de objeciones (15/15): Maneja la postergación por viaje del cliente sugiriendo un cierre el sábado para asegurar la agenda del martes.

Agresividad comercial (14/18): Media; mantiene el control de la oferta y utiliza el WhatsApp corporativo para no perder el contacto comercial.

Cierre efectivo y legal (8/15): Cierre en seguimiento; el cliente queda con el mensaje de WhatsApp para formalizar el contrato el fin de semana.

Resumen: Cliente en Fusagasugá interesado en internet y televisión. La agente Rosa posiciona con éxito el beneficio de Win Sports+ y acuerda un contacto de seguimiento para cuando el cliente regrese de su viaje.

(Ref. monitoreo: 20260812_162751_IN_hogarmedblasterceoh_3138621520_mzm)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T21:27:51Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260812_162751_IN_hogarmedblasterceoh_3138621520_mzm)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA · 10:47 min · Nota 97/100$mon$, $mon$Tipificación: VENTA
Duración: 10:47 min
Nota final: 97/100

Rapport (10/10): Saludo ejecutivo; Geraldine se identifica como área de ventas y valida el interés previo reportado por el sistema.

Escucha activa (12/12): Confirma el alto interés del señor Duan Daniel por adquirir el servicio de Claro Hogar para su vivienda.

Sondeo y perfilamiento (15/15): Sondeo geográfico preciso en el conjunto Macarena 3 (Bogotá); valida torre 5 y apartamento 504 para confirmar red.

Argumentación y condiciones (15/15): Argumenta con base en la "excelente cobertura" disponible en el conjunto residencial para servicios de fibra óptica.

Manejo de objeciones (15/15): No se presentan objeciones de peso; el cliente se muestra decidido y colaborativo desde el inicio de la interacción.

Agresividad comercial (18/18): Alta; transiciona de forma inmediata y fluida a la lectura del guion legal para la aprobación del crédito y toma de datos.

Cierre efectivo y legal (12/15): Venta en proceso; realiza la lectura formal de las Leyes 1266 y 1581, quedando a la espera de una actualización de dirección de 20 min.

Resumen: Gestión de lead caliente para Duan Sánchez en Bogotá. La agente aprovecha la disposición inmediata del cliente para avanzar directamente a la etapa legal y validación de crédito en el conjunto Macarena 3.

(Ref. monitoreo: 20260811_121119_IN_hogarmedblasterceoh_3118628376_zxo)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-11T17:11:19Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260811_121119_IN_hogarmedblasterceoh_3118628376_zxo)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$NO LE PARECE ATRACTIVA LA OFERTA · 12:32 min · Nota 92/100$mon$, $mon$Tipificación: NO LE PARECE ATRACTIVA LA OFERTA
Duración: 12:32 min
Nota final: 92/100

Rapport (10/10): Saludo enérgico y amable; Natalia proyecta una actitud muy profesional que invita al cliente a exponer su caso.

Escucha activa (12/12): Escucha atentamente la situación del cliente, quien admite tener una deuda por haber servido de fiador a un tercero.

Sondeo y perfilamiento (15/15): Sondeo técnico en el barrio La Igualdad (Bogotá); confirma disponibilidad de 500 megas para un segundo piso.

Argumentación y condiciones (15/15): Argumenta el plan Triple Play por $104,900 con 50% de descuento, destacando el beneficio gratuito de Win Sports+.

Manejo de objeciones (15/15): Maneja con honestidad la barrera crediticia detectada ($171,111), explicando que es el único impedimento para la instalación.

Agresividad comercial (15/18): Media-Alta; a pesar del reporte negativo, realiza todo el proceso de perfilamiento para dejar la oferta lista ante un eventual pago.

Cierre efectivo y legal (10/15): Cierre informativo-barrera; indica al cliente que una vez saneada la deuda podrá retomar la contratación de inmediato.

Resumen: Intento de venta para Javier Rodríguez en Bogotá. Natalia identifica una deuda antigua de hogar que el cliente reconoce; aunque no se cierra la venta hoy, la agente realiza una labor de asesoría crediticia impecable para recuperar al usuario.

(Ref. monitoreo: 20260811_125110_IN_hogarmedblasterceoh_3102229611_dws)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-11T17:51:10Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260811_125110_IN_hogarmedblasterceoh_3102229611_dws)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 8:27 min · Nota 95/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 8:27 min
Nota final: 95/100

Rapport (10/10): Saludo enérgico; establece una comunicación bidireccional efectiva desde el inicio.

Escucha activa (12/12): Escucha que el cliente requiere estabilidad para teletrabajo y monitoreo de cámaras de seguridad.

Sondeo y perfilamiento (15/15): Excelente; al ver limitaciones en sistema, busca la dirección del frente para confirmar red de fibra óptica.

Argumentación y condiciones (15/15): Posiciona la fibra óptica simétrica de 900 megas como la solución ideal para la estabilidad de sus equipos.

Manejo de objeciones (15/15): Rebate la comparación con Tigo ofreciendo una actualización inmediata de nodo para garantizar la mejor tecnología.

Agresividad comercial (18/18): Alta; toma la iniciativa de mandar a actualizar la red del cliente en sistema para ser más competitiva.

Cierre efectivo y legal (10/15): Cierre para re-llamada en 15 minutos; el agente envía información por WhatsApp para validación final.

Resumen: Cliente Milton en Medellín busca internet para una bodega. Natalia logra identificar una oportunidad de mejora tecnológica superior a la oferta inicial del sistema mediante una validación de campo manual.

(Ref. monitoreo: 20260810_142958_IN_hogarmedblasterceoh_3125346927_r0o)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-10T19:29:58Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260810_142958_IN_hogarmedblasterceoh_3125346927_r0o)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA · 8:50 min · Nota 89/100$mon$, $mon$Tipificación: VENTA
Duración: 8:50 min
Nota final: 89/100

Rapport (10/10): Saludo estándar y profesional; Geraldine se identifica claramente como área de ventas preferencial.

Escucha activa (12/12): Escucha el interés de la cliente por conocer el costo mensual exacto tras la oferta inicial.

Sondeo y perfilamiento (15/15): Valida cobertura en Facatativá (El Manantial); confirma torres y apartamento para asegurar fibra simétrica.

Argumentación y condiciones (15/15): Presenta 179 canales HD, internet fibra y plataforma premium por $104,900 con promo de $52,450.

Manejo de objeciones (15/15): Maneja la postergación familiar (esperar al esposo) ofreciendo contacto directo por WhatsApp para no enfriar el lead.

Agresividad comercial (14/18): Media; utiliza la promesa de instalación para el día de mañana como incentivo de cierre rápido.

Cierre efectivo y legal (8/15): Seguimiento por WhatsApp; la cliente se compromete a avisar una vez consulte la decisión con su pareja.

Resumen: Cliente Alice Sanabria en Facatativá interesada en el plan Duo. La agente confirma cobertura de fibra y establece un canal de comunicación directo para cerrar la venta a las 5:30 PM tras la llegada del esposo.

(Ref. monitoreo: 20260810_143625_IN_hogarmedblasterceoh_3143129431_q8s)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T19:36:25Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260810_143625_IN_hogarmedblasterceoh_3143129431_q8s)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 9:56 min · Nota 68/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 9:56 min
Nota final: 68/100

Rapport (10/10): Saludo formal y respetuoso por parte de la agente Alejandra López.

Escucha activa (12/12): Identifica rápidamente que la cliente manifiesta no tener deudas y que ya cuenta con servicios activos de la compañía.

Sondeo y perfilamiento (10/15): Sondeo limitado; la interacción finaliza pronto al confirmar que la cliente no es un prospecto de venta nueva.

Argumentación y condiciones (5/15): No se desarrolla argumentación comercial debido a la falta de interés y tenencia previa de servicios.

Manejo de objeciones (10/15): Acepta la posición de la cliente sin forzar una venta innecesaria, priorizando la satisfacción del usuario actual.

Agresividad comercial (4/18): Baja; el contacto se limita a una validación administrativa de estado de cuenta.

Cierre efectivo y legal (15/15): Cierre administrativo correcto; agradece la atención y finaliza la llamada de forma profesional.

Resumen: Llamada de validación de base de datos. Alejandra identifica que la usuaria ya es cliente y que no hay oportunidad de venta adicional en el momento, cerrando el contacto de manera eficiente.

(Ref. monitoreo: 20260813_135649_IN_hogarmedblasterceoh_3202292819_9f5)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 4/18).$mon$, '2026-08-13T18:56:49Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260813_135649_IN_hogarmedblasterceoh_3202292819_9f5)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$CONTESTADOR · 9:59 min · Nota 97/100$mon$, $mon$Tipificación: CONTESTADOR
Duración: 9:59 min
Nota final: 97/100

Rapport (10/10): Saludo muy cordial; Rosa genera un clima de confianza preguntando por el bienestar del cliente en Tabio.

Escucha activa (12/12): Escucha la necesidad de internet en una zona rural ("Vereda Lourdes") y comprende la falta de nomenclatura oficial.

Sondeo y perfilamiento (15/15): Sondeo proactivo; busca referencias de vecinos con servicio para identificar el nodo de fibra óptica más cercano.

Argumentación y condiciones (15/15): Explica que requiere una foto de un recibo público para "crear" la dirección en el sistema de Claro y proceder.

Manejo de objeciones (15/15): Supera la barrera de la ubicación rural sugiriendo el uso de WhatsApp para el envío de documentos probatorios.

Agresividad comercial (18/18): Alta; la agente lidera la solución técnica coordinando con su supervisor para no perder el cliente por falta de dirección.

Cierre efectivo y legal (12/15): Cierre en seguimiento; establece contacto por WhatsApp corporativo para recibir la factura y habilitar el punto de venta.

Resumen: Gestión para internet en zona rural de Tabio. Ante la falta de dirección urbana, la agente Rosa gestiona proactivamente la creación del punto técnico mediante la captura de documentos vía digital, asegurando la viabilidad del negocio.

(Ref. monitoreo: 20260811_121415_IN_hogarmedblasterceoh_3112921101_ebm)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-11T17:14:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260811_121415_IN_hogarmedblasterceoh_3112921101_ebm)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 16:44 min · Nota 93/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 16:44 min
Nota final: 93/100

Rapport (10/10): Saludo profesional y directo; Jokabeth valida rápidamente el interés del cliente por el servicio de internet.

Escucha activa (12/12): Detecta que el cliente busca solo internet de alta velocidad con un beneficio económico inicial sustancial.

Sondeo y perfilamiento (15/15): Excelente; al no ver la casa en sistema, confirma que el vecino tiene red y procede con la creación de la dirección en fibra óptica.

Argumentación y condiciones (15/15): Argumenta plan de 900 megas por $79,900, resaltando el ahorro del 50% el primer mes y Amazon Prime vitalicio.

Manejo de objeciones (15/15): Neutraliza la duda sobre la creación de la dirección explicando el procedimiento administrativo de Claro para nuevos puntos.

Agresividad comercial (18/18): Alta; realiza la validación crediticia del señor Nicolás (aprobado) antes de que este cuelgue para "consultar con la familia".

Cierre efectivo y legal (8/15): Cierre en seguimiento; el cliente queda aprobado en sistema y la agente agenda el rellamado para finalizar tras la actualización de red.

Resumen: Gestión de preventa exitosa para Nicolás en Bogotá. Jokabeth asegura la aptitud crediticia del cliente y gestiona la creación técnica de la nomenclatura, garantizando la viabilidad de la fibra de 900MB.

(Ref. monitoreo: 20260812_123450_IN_hogarmedblasterceoh_3143727603_1pn)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T17:34:50Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260812_123450_IN_hogarmedblasterceoh_3143727603_1pn)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$Reintento · 6:09 min · Nota 95/100$mon$, $mon$Tipificación: Reintento
Duración: 6:09 min
Nota final: 95/100

Rapport (10/10): Saludo profesional; Cristiel genera un ambiente de confianza a pesar de la desconfianza inicial del cliente hacia otro asesor.

Escucha activa (12/12): Identifica el interés en la convergencia (unificar móvil y hogar) y la queja sobre información errónea previa ("Jorge es mentirosito").

Sondeo y perfilamiento (15/15): Sondeo técnico en Medellín (Barrio Manrique); valida nomenclatura exacta de apartamento en primer piso para asegurar red.

Argumentación y condiciones (15/15): Explica con claridad los beneficios de ser cliente "Todo Claro", resaltando la mejora en la línea móvil tras la instalación.

Manejo de objeciones (15/15): Neutraliza el escepticismo del cliente garantizando transparencia en el proceso y validando la dirección real en sistema.

Agresividad comercial (18/18): Alta; la agente toma el control de la llamada, desvirtúa la mala experiencia previa y lidera hacia la validación de cobertura.

Cierre efectivo y legal (10/15): Cierre en proceso de validación; se asegura el compromiso de continuar tras despejar las dudas de veracidad.

Resumen: Gestión de rescate en Medellín. Cristiel logra recuperar la confianza de un cliente que dudaba de Claro por una gestión previa, posicionando exitosamente los beneficios de la convergencia móvil-hogar.

(Ref. monitoreo: 20260813_154634_IN_hogarmedblasterceoh_3226416134_8a7)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-13T20:46:34Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260813_154634_IN_hogarmedblasterceoh_3226416134_8a7)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA · 29:56 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 29:56 min
Nota final: 100/100

Rapport (10/10): Saludo profesional; Diego genera confianza al validar rápidamente la promoción que el cliente vio.

Escucha activa (12/12): Identifica la necesidad de cubrir dos pisos con señal y 3 puntos de televisión específicos.

Sondeo y perfilamiento (15/15): Sondeo técnico impecable; valida nomenclatura en Bogotá y confirma infraestructura para fibra óptica.

Argumentación y condiciones (15/15): Ofrece Triple Play de 500 megas, 3 decos y plataformas premium por $116,900 con 50% de descuento.

Manejo de objeciones (15/15): Resuelve dudas sobre incrementos de tarifa anteriores asegurando transparencia a través del contrato grabado.

Agresividad comercial (18/18): Alta; guía al cliente paso a paso por la biometría facial y validación de identidad digital.

Cierre efectivo y legal (15/15): VENTA EXITOSA. Completa el resumen del servicio, validación OTP y agenda visita técnica para el miércoles.

Resumen: Venta cerrada para Pedro Ballesteros en Bogotá. El agente Diego maneja una llamada técnica estructurada, logrando la aprobación de 500 megas para 3 televisores y completando satisfactoriamente todos los protocolos legales digitales.

(Ref. monitoreo: 20260811_100007_IN_hogarmedblasterceoh_3183585495_h7a)$mon$, $mon$Reforzar: Manejo de objeciones (fue lo más bajo, 15/15).$mon$, '2026-08-11T15:00:07Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260811_100007_IN_hogarmedblasterceoh_3183585495_h7a)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$Reintento · 16:57 min · Nota 97/100$mon$, $mon$Tipificación: Reintento
Duración: 16:57 min
Nota final: 97/100

Rapport (10/10): Saludo profesional; genera confianza inmediata con un cliente que manifiesta haber sido engañado por otro operador.

Escucha activa (12/12): Escucha con atención el "dolor" del cliente sobre cobros inesperados y dobles facturaciones pasadas con Movistar.

Sondeo y perfilamiento (15/15): Perfilamiento técnico en Bogotá (Edificio Confamiliar); confirma cobertura de fibra óptica simétrica de 900 megas.

Argumentación y condiciones (15/15): Posiciona a Claro como una red superior y transparente, garantizando que el valor pactado será el que llegue en factura.

Manejo de objeciones (15/15): Neutraliza el miedo a la doble facturación ofreciendo tramitar la cancelación del competidor y entregar radicado.

Agresividad comercial (18/18): Alta; se posiciona como ejecutiva de gerencia para brindar respaldo total al cliente y transiciona a la captura de datos.

Cierre efectivo y legal (12/15): Cierre en captura de datos; el agente inicia la validación de identidad y lectura de Habeas Data para formalizar.

Resumen: Gestión comercial de alto nivel para John Fredy Gómez en Bogotá. Cristiel logra derribar la desconfianza del cliente mediante una oferta de fibra óptica 100% simétrica y el compromiso de gestionar el retiro de su operador actual.

(Ref. monitoreo: 20260812_154531_IN_hogarmedblasterceoh_3218823184_suj)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 12/15).$mon$, '2026-08-12T20:45:31Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260812_154531_IN_hogarmedblasterceoh_3218823184_suj)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1193561818', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 12:37 min · Nota 87/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 12:37 min
Nota final: 87/100

Rapport (10/10): Saludo profesional; Geraldín atiende la objeción inicial de precio con un tono calmado y conciliador.

Escucha activa (12/12): Escucha la preocupación del cliente por los costos y su larga permanencia en el domicilio (17 años).

Sondeo y perfilamiento (15/15): Sondeo técnico en el conjunto Agapantos 1 (Bogotá); corrige un error de torre y confirma fibra óptica 100% simétrica.

Argumentación y condiciones (15/15): Argumenta la superioridad de la fibra simétrica sobre otras redes, justificando el valor por la calidad tecnológica.

Manejo de objeciones (12/15): Intenta rebatir el "está muy caro" posicionando la estabilidad de la red, aunque el cliente se mantiene cauteloso.

Agresividad comercial (13/18): Media; enfoca su agresividad comercial en la demostración técnica de la velocidad simétrica disponible.

Cierre efectivo y legal (10/15): Cierre informativo-técnico; el cliente queda con la validación de red exitosa para proceder con la oferta.

Resumen: Consulta técnica en Bogotá. La agente Geraldín realiza una excelente labor de ubicación del predio en sistema y posiciona técnicamente la fibra óptica como la mejor solución para un usuario antiguo del sector.

(Ref. monitoreo: 20260813_134432_IN_hogarmedblasterceoh_3213916863_pk1)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-13T18:44:32Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1193561818' and cuerpo like '%Ref. monitoreo: 20260813_134432_IN_hogarmedblasterceoh_3213916863_pk1)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$NO LE PARECE ATRACTIVA LA OFERTA · 7:08 min · Nota 82/100$mon$, $mon$Tipificación: NO LE PARECE ATRACTIVA LA OFERTA
Duración: 7:08 min
Nota final: 82/100

Rapport (10/10): Saludo profesional; la agente se identifica con claridad y atiende el requerimiento de información del cliente.

Escucha activa (12/12): Responde puntualmente a las dudas del cliente sobre el costo de decodificadores adicionales ($7,000 para HD).

Sondeo y perfilamiento (15/15): Realiza perfilamiento crediticio inmediato al consultar la cédula del cliente ante el temor de este por estar reportado.

Argumentación y condiciones (10/15): Presenta el Triple Play por $111,900 con 50% de descuento, pero la oferta se ve limitada al detectar mora en el sistema.

Manejo de objeciones (15/15): Valida con honestidad la deuda de hace 5 años, explicando que el sistema no permite el bypass para el servicio de hogar.

Agresividad comercial (5/18): Baja; una vez confirmada la deuda y la falta de un tercero para el contrato, la agente finaliza la gestión comercial.

Cierre efectivo y legal (15/15): Cierre administrativo correcto por no apto; informa al cliente la razón técnica del rechazo.

Resumen: Cliente interesado en Internet + TV para 3 puntos. El agente detecta una deuda antigua con Claro Hogar (5 años) que impide la venta. Se destaca la transparencia de la agente al validar el estado crediticio y cerrar el ciclo sin falsas promesas.

(Ref. monitoreo: 20260811_151304_IN_hogarmedblasterceoh_3132809492_lu3)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-11T20:13:04Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260811_151304_IN_hogarmedblasterceoh_3132809492_lu3)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$Reintento · 5:06 min · Nota 63/100$mon$, $mon$Tipificación: Reintento
Duración: 5:06 min
Nota final: 63/100

Rapport (10/10): Saludo profesional; Natalia establece una comunicación fluida con la cliente desde el primer contacto.

Escucha activa (12/12): Identifica la duda de la cliente sobre una publicidad de internet de "$40 mil" y adapta la respuesta técnica.

Sondeo y perfilamiento (8/15): Sondeo limitado; la brevedad de la llamada impide profundizar en las necesidades de navegación del hogar.

Argumentación y condiciones (10/15): Explica que el valor de $44,900 es un descuento promocional por un solo mes, aclarando la tarifa plena posterior.

Manejo de objeciones (10/15): Maneja la expectativa de precio de la cliente aclarando las condiciones de la oferta vista en internet.

Agresividad comercial (8/18): Baja; el agente se mantiene en un rol informativo sin presionar hacia la captura de datos para validación.

Cierre efectivo y legal (5/15): Cierre informativo; se entregan las condiciones de los planes de 500 a 900 megas pero sin compromiso de venta.

Resumen: Llamada informativa donde la cliente indaga por un plan de bajo costo. Natalia aclara que el precio de $44,900 aplica solo al primer mes y detalla el portafolio de ultravelocidad con plataformas premium.

(Ref. monitoreo: 20260811_120814_IN_hogarmedblasterceoh_3118783741_008)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 5/15).$mon$, '2026-08-11T17:08:14Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260811_120814_IN_hogarmedblasterceoh_3118783741_008)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 6:32 min · Nota 79/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 6:32 min
Nota final: 79/100

Rapport (10/10): Saludo profesional; Natalia genera confianza al validar rápidamente el interés del cliente por el Triple Play.

Escucha activa (12/12): Capta el interés por el paquete completo y la necesidad de una instalación inmediata en un conjunto residencial.

Sondeo y perfilamiento (15/15): Excelente; detecta un bloqueo en el sistema por un servicio activo de un tercero y busca la solución de actualización.

Argumentación y condiciones (10/15): Argumenta los planes de 500 megas, aunque la llamada se centra en la resolución del conflicto de dirección.

Manejo de objeciones (12/15): Maneja la duda sobre la ocupación del predio explicando que se puede realizar una actualización de nomenclatura para vender.

Agresividad comercial (12/18): Media; se enfoca en "limpiar" el predio en sistema para habilitar la preventa sin comprometer tiempos falsos.

Cierre efectivo y legal (8/15): Cierre en seguimiento; queda pendiente de la confirmación del área técnica para proceder con la captura de datos.

Resumen: Gestión comercial en Bogotá (Arboleda Santa Teresita). La agente identifica un bloqueo administrativo por un suscriptor anterior y gestiona proactivamente la liberación del punto técnico para no perder la venta.

(Ref. monitoreo: 20260812_114800_IN_hogarmedblasterceoh_3212223837_ge4)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-12T16:48:00Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260812_114800_IN_hogarmedblasterceoh_3212223837_ge4)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1044213250', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 10:37 min · Nota 83/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 10:37 min
Nota final: 83/100

Rapport (10/10): Saludo profesional; Nicolle se identifica como área preferencial y genera un ambiente de respeto con el cliente.

Escucha activa (12/12): Identifica que el interesado es un colaborador de Claro y valida el proceso especial de descuento para empleados.

Sondeo y perfilamiento (15/15): Perfilamiento técnico en Facatativá (Barrio Juan Pablo Segundo); valida nomenclatura de edificio y piso.

Argumentación y condiciones (12/15): Argumenta el plan Triple Play de 500 megas, aclarando que el descuento de empleado se aplica tras la instalación.

Manejo de objeciones (12/15): Maneja la duda sobre el precio final ($49,650) explicando la ruta de fidelización para activar el beneficio corporativo.

Agresividad comercial (12/18): Media; realiza la gestión administrativa de preventa siguiendo los lineamientos para personal interno.

Cierre efectivo y legal (10/15): Cierre de trámite; procede con la activación del servicio para que el colaborador gestione luego su tarifa especial.

Resumen: Llamada de preventa para un colaborador de Claro en Facatativá. La agente Nicolle gestiona la solicitud de un Triple Play de 500 megas y orienta al cliente sobre el protocolo interno para la aplicación del descuento de nómina.

(Ref. monitoreo: 20260811_153410_IN_hogarmedblasterceoh_3124215488_lak)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 12/18).$mon$, '2026-08-11T20:34:10Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1044213250' and cuerpo like '%Ref. monitoreo: 20260811_153410_IN_hogarmedblasterceoh_3124215488_lak)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 11/08/2026$mon$, $mon$VOLVER A LLAMAR · 9:46 min · Nota 84/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 9:46 min
Nota final: 84/100

Rapport (10/10): Saludo profesional; Rosa establece una comunicación clara con el señor Jorge desde el inicio.

Escucha activa (12/12): Identifica que el cliente se encuentra en medio de un proceso de mudanza y ya tiene técnicos en su domicilio.

Sondeo y perfilamiento (15/15): Valida la dirección en Bogotá y descubre que el titular actual es el hermano, realizando un cruce de datos efectivo.

Argumentación y condiciones (10/15): Argumentación limitada; la interacción se centra más en la resolución del problema de traslado que en la venta nueva.

Manejo de objeciones (15/15): Maneja con paciencia la confusión del cliente sobre el estado de su orden de traslado, validando que no hay pedido activo.

Agresividad comercial (12/18): Media; a pesar de la situación técnica, intenta consultar la cédula del cliente para verificar elegibilidad crediticia.

Cierre efectivo y legal (10/15): Cierre de servicio; orienta al cliente a comunicarse con el 611 para formalizar el traslado que creía tener en curso.

Resumen: El cliente Jorge Sánchez en Bogotá está trasteándose y cree tener un traslado programado. La agente Rosa detecta que el servicio está a nombre del hermano y que no existe tal orden en sistema, brindando asesoría para evitar que el cliente se quede sin señal.

(Ref. monitoreo: 20260811_134722_IN_hogarmedblasterceoh_3007943603_seh)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-11T18:47:22Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260811_134722_IN_hogarmedblasterceoh_3007943603_seh)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$COBERTURA DTH · 6:26 min · Nota 72/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:26 min
Nota final: 72/100

Rapport (10/10): Saludo profesional; Rosa establece una comunicación ejecutiva con la señora Alida.

Escucha activa (12/12): Identifica la molestia de la cliente por recibir llamadas cuando le han dicho que no hay cobertura.

Sondeo y perfilamiento (15/15): Valida dirección en Los Olivos (1ra etapa) y confirma que el predio no aparece mapeado en sistema.

Argumentación y condiciones (5/15): Argumentación limitada; la llamada se desvía totalmente hacia el problema de infraestructura técnica.

Manejo de objeciones (12/15): Explica correctamente que las llamadas son masivas y no discriminan ubicación hasta la validación manual.

Agresividad comercial (8/18): Baja; se limita a la asesoría técnica sin intentar un pivotaje comercial o captura de referidos.

Cierre efectivo y legal (10/15): Cierre administrativo; se compromete a consultar con su jefe una certificación de cobertura para el punto.

Resumen: La cliente Alida Porras reclama por la insistencia de las llamadas de ventas dada la falta de red en su sector. Rosa realiza un sondeo técnico y escala el caso para una posible certificación de cobertura por parte del área de ingeniería.

(Ref. monitoreo: 20260812_110542_IN_hogarmedblasterceoh_3004221193_w63)$mon$, $mon$Reforzar: Argumentación y condiciones (fue lo más bajo, 5/15).$mon$, '2026-08-12T16:05:42Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260812_110542_IN_hogarmedblasterceoh_3004221193_w63)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143445082', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 9:31 min · Nota 86/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 9:31 min
Nota final: 86/100

Rapport (10/10): Saludo profesional; se identifica como especialista del área preferencial para captar la atención del cliente.

Escucha activa (12/12): Responde con agilidad a las dudas sobre el costo de bajar el plan de Duo a solo internet ($79,900).

Sondeo y perfilamiento (15/15): Identifica que el servicio actual está a nombre de la esposa, perfilando la necesidad de una línea nueva.

Argumentación y condiciones (15/15): Presenta comparativa clara entre planes de 250MB ($74,900) y 900MB ($79,900) con Amazon Prime.

Manejo de objeciones (15/15): Explica el trámite de cancelación con el operador actual y la unificación de titularidad necesaria en el predio.

Agresividad comercial (12/18): Media; insiste en el contacto vía WhatsApp para enviar información detallada y cerrar la gestión luego.

Cierre efectivo y legal (7/15): Cierre pendiente de consulta; el cliente se compromete a escribir por WhatsApp tras hablar con su esposa.

Resumen: Cliente en Madrid, Cundinamarca, busca reducir costos de su factura actual. El agente propone un cambio de titularidad para acceder a beneficios de cliente nuevo y ultravelocidad, manteniendo el contacto vía digital.

(Ref. monitoreo: 20260810_170839_IN_hogarmedblasterceoh_3209762719_it6)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 7/15).$mon$, '2026-08-10T22:08:39Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143445082' and cuerpo like '%Ref. monitoreo: 20260810_170839_IN_hogarmedblasterceoh_3209762719_it6)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 12/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 11:03 min · Nota 71/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 11:03 min
Nota final: 71/100

Rapport (10/10): Tono respetuoso y pausado; Natalia atiende la solicitud de información sobre el cambio de plataforma.

Escucha activa (12/12): Identifica correctamente que la cliente ya tiene el servicio activo y busca es una solución a un problema de instalación.

Sondeo y perfilamiento (15/15): Sondeo técnico; al validar la cédula en el sistema, confirma que el estado del suscriptor es "Activo" y hay una visita pendiente.

Argumentación y condiciones (5/15): No aplica argumentación de venta ya que el perfil del contacto corresponde a un reclamo de soporte técnico.

Manejo de objeciones (10/15): Maneja la frustración de la cliente por el incumplimiento del técnico dándole la ruta de escalamiento correcta.

Agresividad comercial (4/18): Baja; el agente prioriza la ética de servicio al cliente sobre el intento de una venta que el sistema rechazaría.

Cierre efectivo y legal (15/15): Cierre de servicio exitoso; orienta a la cliente a usar el WhatsApp de soporte (314) para reprogramar su visita técnica.

Resumen: Llamada de postventa. Natalia identifica que la cliente ya posee el servicio y que su molestia radica en una falla técnica, procediendo a redirigirla correctamente según los protocolos de la línea de ventas.

(Ref. monitoreo: 20260812_095411_IN_hogarmedblasterceoh_3115607007_mef)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 4/18).$mon$, '2026-08-12T14:54:11Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260812_095411_IN_hogarmedblasterceoh_3115607007_mef)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$En cola · 40:01 min · Nota 0/100$mon$, $mon$Tipificación: En cola
Duración: 40:01 min
Nota final: 0/100

Rapport (NO): No existe interacción verbal identificable entre el agente y un cliente en el audio.

Escucha activa (NO): El audio solo contiene diálogos de una radionovela o programa dramático de fondo.

Sondeo y perfilamiento (NO): No se realiza ningún tipo de sondeo, perfilamiento ni captura de datos.

Argumentación y condiciones (NO): Ausencia total de argumentación de servicios o productos.

Manejo de objeciones (NO): No hay gestión de objeciones por falta de interlocutor activo.

Agresividad comercial (NO): Registro sin gestión comercial aparente.

Cierre efectivo y legal (NO): Llamada fallida por error técnico o de sistema.

Resumen: Esta grabación corresponde a un estado de "en cola" o error de captura. Se escucha audio ambiental de un programa de televisión/radio, pero no existe gestión por parte de un asesor.

(Ref. monitoreo: 20260814_165556_IN_hogarmedblasterceoh_3242243659_s00)$mon$, null, '2026-08-14T21:55:56Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260814_165556_IN_hogarmedblasterceoh_3242243659_s00)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$En cola · 5:08 min · Nota 0/100$mon$, $mon$Tipificación: En cola
Duración: 5:08 min
Nota final: 0/100

Rapport (NO): Sin gestión comercial. El audio no registra interacción verbal entre asesor y cliente.

Escucha activa (NO): No hay escucha activa de requerimientos comerciales.

Sondeo y perfilamiento (NO): Ausencia total de captura de datos o perfilamiento.

Argumentación y condiciones (NO): No se argumentan productos ni servicios de la compañía.

Manejo de objeciones (NO): Sin gestión de barreras de venta.

Agresividad comercial (NO): Registro sin actividad comercial detectable.

Cierre efectivo y legal (NO): Llamada fallida o error de sistema; solo se escucha audio ambiental.

Resumen: Grabación fallida tipificada como "En cola". El audio solo contiene diálogos de un programa dramático de radio o televisión de fondo, sin presencia de gestión comercial por parte de la asesora Martha.

(Ref. monitoreo: 20260814_174714_IN_hogarmedblasterceoh_3164172062_dli)$mon$, null, '2026-08-14T22:47:14Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260814_174714_IN_hogarmedblasterceoh_3164172062_dli)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$COBERTURA DTH · 6:25 min · Nota 75/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:25 min
Nota final: 75/100

Rapport (SI): Andrea inicia con un tono amable y profesional.

Escucha activa (SI): Identifica que el cliente tiene interés pero debe consultar la decisión de cancelación con su pareja.

Sondeo y perfilamiento (SI): Realiza la validación de dirección en el Barrio Calamares ante la falta de registro inicial de "Campiña".

Argumentación y condiciones (MEDIA): Se centra en ofrecer ayuda para la cancelación con el otro operador, aunque no profundiza en la parrilla de Claro.

Manejo de objeciones (SI): Gestiona la indecisión del cliente ante la consulta familiar.

Agresividad comercial (SI): Propone una rellamada para el día siguiente para concretar.

Cierre efectivo y legal (NO): La llamada finaliza como un seguimiento pendiente.

Resumen: Andrea contacta a un cliente interesado en cambiarse de operador. Valida la cobertura en un barrio cercano tras errores en el sistema y agenda una llamada de seguimiento para que el usuario consulte con su esposa.

(Ref. monitoreo: 20260814_180359_IN_hogarmedblasterceoh_3002555273_vgs)$mon$, null, '2026-08-14T23:03:59Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260814_180359_IN_hogarmedblasterceoh_3002555273_vgs)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140828545', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VOLVER A LLAMAR · 6:37 min · Nota 85/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 6:37 min
Nota final: 85/100

Rapport (SI): Establece una comunicación fluida y profesional desde el inicio.

Escucha activa (SI): Identifica la preferencia del cliente por planes que incluyan televisión.

Sondeo y perfilamiento (SI): Solicita validación de dirección mediante recibo público para evitar errores en conjunto residencial.

Argumentación y condiciones (SI): Detalla oferta de $104,900, 2 plataformas gratis y 50% de descuento en las 2 primeras facturas.

Manejo de objeciones (SI): Gestiona la duda de la cliente de consultar con su esposo ofreciendo envío de info.

Agresividad comercial (SI): Utiliza el beneficio de "prorrateo sin costo" para incentivar la toma inmediata.

Cierre efectivo y legal (NO): Queda pendiente de validación con el cónyuge de la interesada.

Resumen: Jorge atiende consulta sobre planes hogar. Valida cobertura en conjunto María del Carmen. Ofrece paquete con TV, plataformas (Netflix/Disney) y descuentos. La cliente pide información por WhatsApp para hablar con su esposo.

(Ref. monitoreo: 20260813_115915_IN_hogarmedblasterceoh_3112215815_wcx)$mon$, null, '2026-08-13T16:59:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140828545' and cuerpo like '%Ref. monitoreo: 20260813_115915_IN_hogarmedblasterceoh_3112215815_wcx)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA · 30:36 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 30:36 min
Nota final: 100/100

Rapport (SI): Establece una conexión de confianza respondiendo asertivamente a dudas técnicas.

Escucha activa (SI): Capta la preocupación genuina de la cliente sobre las penalidades por retiro de contrato.

Sondeo y perfilamiento (SI): Valida la situación del suscriptor anterior (Alexander Peña) para gestionar el ingreso del nuevo titular.

Argumentación y condiciones (SI): Argumenta que las 900 megas de fibra óptica son la máxima velocidad certificada disponible.

Manejo de objeciones (SI): Despeja dudas sobre el contrato y el proceso de retiro sin cargos abusivos ni demoras.

Agresividad comercial (SI): Dirige con seguridad a la cliente hacia la firma digital mediante el código recibido por SMS.

Cierre efectivo y legal (SI): Logra la firma digital del contrato en línea y confirma el agendamiento técnico de instalación.

Resumen: Martha asesora a una cliente con dudas sobre permanencia. Resuelve inquietudes, limpia el registro del servicio anterior y cierra la venta de 900 megas con firma digital y agendamiento exitoso.

(Ref. monitoreo: 20260814_134125_IN_hogarmedblasterceoh_3237681576_02f)$mon$, null, '2026-08-14T18:41:25Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260814_134125_IN_hogarmedblasterceoh_3237681576_02f)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA · 24:23 min · Nota 100/100$mon$, $mon$Tipificación: VENTA
Duración: 24:23 min
Nota final: 100/100

Rapport (SI): Excelente manejo del tono de voz y empatía inicial.

Escucha activa (SI): Entiende que el cliente requiere el servicio para un local comercial pequeño.

Sondeo y perfilamiento (SI): Valida dirección en Bogotá y aclara si es casa o local para aplicar la tarifa correcta.

Argumentación y condiciones (SI): Ofrece 500 megas + TV avanzada por $104,900 con beneficios digitales incluidos.

Manejo de objeciones (SI): Aclara dudas sobre los pagos post-promoción y el inicio de facturación.

Agresividad comercial (SI): Guía al cliente con seguridad hacia la entrega de datos para el cierre.

Cierre efectivo y legal (SI): Realiza lectura de Habeas Data, valida identidad con PIN y efectúa resumen legal de venta.

Resumen: Keylin asesora a cliente para internet de local/bodega. Perfila el uso y ofrece combo de $104,900. Logra concretar la venta completa, incluyendo validación de crédito y lectura de contrato legal para firma digital.

(Ref. monitoreo: 20260813_133713_IN_hogarmedblasterceoh_3138335246_y84)$mon$, null, '2026-08-13T18:37:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260813_133713_IN_hogarmedblasterceoh_3138335246_y84)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 21:02 min · Nota 80/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 21:02 min
Nota final: 80/100

Rapport (SI): Jokabeth mantiene un trato cordial; genera confianza al validar datos de líneas móviles.

Escucha activa (SI): Entiende que el cliente ya tiene servicios móviles y busca convergencia hogar.

Sondeo y perfilamiento (SI): Valida minuciosamente en sistema una supuesta deuda y confirma que el cliente es apto.

Argumentación y condiciones (SI): Argumenta el plan de $104,900 y detalla los beneficios de las líneas existentes.

Manejo de objeciones (SI): Gestiona la duda de la cliente sobre el agendamiento técnico en días festivos.

Agresividad comercial (ALTA): Motiva a la cliente a aceptar la agenda de instalación para el día siguiente.

Cierre efectivo y legal (NO): No se concreta el cierre legal por fallas técnicas en el sistema de registro digital.

Resumen: Jokabeth valida la aptitud de Rosa Agua Limpia para el servicio. Ofrece combo de $104,900. La cliente acepta el agendamiento para el sábado, pero fallas en el sistema impiden finalizar el proceso digital.

(Ref. monitoreo: 20260814_113636_IN_hogarmedblasterceoh_3053397105_fo9)$mon$, null, '2026-08-14T16:36:36Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260814_113636_IN_hogarmedblasterceoh_3053397105_fo9)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$Reintento · 8:18 min · Nota 75/100$mon$, $mon$Tipificación: Reintento
Duración: 8:18 min
Nota final: 75/100

Rapport (SI): Logra conexión inmediata al mencionar que son "tocayos" de ciudad (Barranquilla).

Escucha activa (SI): Entiende perfectamente la frustración del cliente por el incumplimiento de una visita técnica.

Sondeo y perfilamiento (SI): Detecta inconsistencias en la orden de trabajo anterior y valida la dirección de un solo piso.

Argumentación y condiciones (SI): Argumenta que ella se hará cargo personalmente de la gestión para asegurar la instalación.

Manejo de objeciones (SI): Calma la molestia del cliente garantizando una nueva orden prioritaria con su supervisor.

Agresividad comercial (SI): Toma el control de la situación para rescatar una venta que estaba en riesgo por mala logística.

Cierre efectivo y legal (NO): Queda pendiente la reprogramación de la visita técnica en sistema.

Resumen: Alejandra atiende una queja por instalación fallida. Identifica que la orden previa fue mal gestionada, asume la responsabilidad del caso y promete escalar con su supervisor para agendar técnicos rápidamente en el barrio Rosario.

(Ref. monitoreo: 20260814_103337_IN_hogarmedblasterceoh_3012545421_jby)$mon$, null, '2026-08-14T15:33:37Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260814_103337_IN_hogarmedblasterceoh_3012545421_jby)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA · 6:13 min · Nota 75/100$mon$, $mon$Tipificación: VENTA
Duración: 6:13 min
Nota final: 75/100

Rapport (SI): Mantiene el estándar de cortesía en la interacción.

Escucha activa (SI): Capta rápidamente los datos técnicos del conjunto residencial.

Sondeo y perfilamiento (SI): Valida dirección exacta incluyendo torre 4 y apartamento 408 para confirmar fibra óptica.

Argumentación y condiciones (SI): Menciona el plan de 900 megas, decodificadores HD y plataformas premium.

Manejo de objeciones (N/A): No se presentan barreras por parte del cliente en el fragmento.

Agresividad comercial (SI): Presenta la oferta de mayor velocidad de forma inmediata.

Cierre efectivo y legal (NO): El audio es un fragmento que se corta durante la oferta inicial.

Resumen: Andrea valida la cobertura de fibra óptica para una cliente en el conjunto Senderos de Magdalena en Bogotá. Ofrece el plan de navegación de 900 megas con todos los beneficios digitales antes del corte del audio.

(Ref. monitoreo: 20260814_183455_IN_hogarmedblasterceoh_3208241954_uv7)$mon$, null, '2026-08-14T23:34:55Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260814_183455_IN_hogarmedblasterceoh_3208241954_uv7)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 14:08 min · Nota 75/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 14:08 min
Nota final: 75/100

Rapport (SI): Mantiene la calma y el respeto ante la desconfianza y agresividad inicial del usuario.

Escucha activa (SI): Identifica que el cliente tuvo una mala experiencia previa con supuestos estafadores por WhatsApp.

Sondeo y perfilamiento (SI): Valida dirección en Armenia (Edificio San Francisco) y consulta interés en combo de TV.

Argumentación y condiciones (SI): Detalla plan de $104,900 con 50% de descuento, 52 canales y plataformas premium.

Manejo de objeciones (SI): Gestiona el miedo al fraude pidiendo el nombre en lugar de datos sensibles al inicio.

Agresividad comercial (SI): Enfatiza que la oferta incluye decodificador HD y beneficios exclusivos por tomarlo hoy.

Cierre efectivo y legal (NO): No se concreta el cierre legal debido a distracciones externas y conversaciones de fondo del cliente.

Resumen: El cliente expresa temor por fraudes pasados. Jokabeth logra generar confianza, valida cobertura en Armenia y presenta la oferta de $104,900, aunque la interacción pierde foco al final.

(Ref. monitoreo: 20260814_161412_IN_hogarmedblasterceoh_3214423065_13v)$mon$, null, '2026-08-14T21:14:12Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260814_161412_IN_hogarmedblasterceoh_3214423065_13v)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$CLIENTE MINTIC - DESEA MAS VELOCIDAD · 5:24 min · Nota 65/100$mon$, $mon$Tipificación: CLIENTE MINTIC - DESEA MAS VELOCIDAD
Duración: 5:24 min
Nota final: 65/100

Rapport (SI): Mantiene tono amable y disposición de servicio.

Escucha activa (SI): Capta la necesidad de fibra simétrica y mayor velocidad.

Sondeo y perfilamiento (SI): Solicita dirección para validar factibilidad técnica.

Argumentación y condiciones (SI): Menciona plan de 500 megas y plataformas incluidas.

Manejo de objeciones (N/A): No se presentan objeciones; el cliente queda en pensar la velocidad.

Agresividad comercial (SI): Proactividad al validar cobertura inmediatamente.

Cierre efectivo y legal (NO): Llamada orientada a consulta técnica inicial.

Resumen: Cliente consulta disponibilidad de fibra simétrica en su zona tras problemas de señal anteriores. Andrea valida cobertura de 500 megas y ofrece paquete con TV por $111,900. El cliente indica que debe "pensar el tema de velocidad".

(Ref. monitoreo: 20260813_181412_IN_hogarmedblasterceoh_3203052161_j8m)$mon$, null, '2026-08-13T23:14:12Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260813_181412_IN_hogarmedblasterceoh_3203052161_j8m)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 6:45 min · Nota 60/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 6:45 min
Nota final: 60/100

Rapport (SI): Mantiene un tono de voz audible y profesional a pesar de las fallas en la comunicación.

Escucha activa (SI): Detecta que el audio se entrecorta y busca una solución alternativa para no perder los datos del cliente.

Sondeo y perfilamiento (MEDIA): Alcanza a capturar la torre y el apartamento antes de que la señal falle críticamente.

Argumentación y condiciones (N/A): No se llega a la fase de oferta debido a los problemas técnicos de la llamada.

Manejo de objeciones (N/A): No se presentan objeciones; la interrupción es puramente técnica.

Agresividad comercial (MEDIA): Intenta rescatar la gestión proponiendo el contacto inmediato por WhatsApp.

Cierre efectivo y legal (NO): Audio muy breve e incompleto centrado en la captura de dirección.

Resumen: Jokabeth intenta perfilar la dirección del cliente (Torre 4, Apt 204). Debido a la mala calidad del audio, la asesora decide suspender la llamada y continuar la captura de información por WhatsApp.

(Ref. monitoreo: 20260814_134147_IN_hogarmedblasterceoh_3132297993_j7t)$mon$, null, '2026-08-14T18:41:47Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260814_134147_IN_hogarmedblasterceoh_3132297993_j7t)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042994663', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 14:57 min · Nota 85/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 14:57 min
Nota final: 85/100

Rapport (SI): Mantiene un tono profesional y organizado durante toda la interacción.

Escucha activa (SI): Comprende que el internet móvil de la cliente no es suficiente para sus necesidades en casa.

Sondeo y perfilamiento (SI): Valida dirección en Barrios Unidos (Bogotá) y perfila el uso para un espacio pequeño.

Argumentación y condiciones (SI): Compara planes de $79k vs $89k; explica que el superior ahorra $52k de instalación.

Manejo de objeciones (SI): Aclara dudas sobre ciclos de facturación y el inicio del cobro tras la instalación técnica.

Agresividad comercial (SI): Recomienda el plan de $89,900 como la opción más inteligente por el ahorro en instalación.

Cierre efectivo y legal (NO): La llamada finaliza con el compromiso de devolver la llamada en 15 minutos para concretar.

Resumen: Carmen asesora a una cliente interesada en instalar internet fijo. Realiza un comparativo de costos, explica los beneficios de la fibra óptica y agenda una rellamada inmediata tras capturar los datos de identificación.

(Ref. monitoreo: 20260814_170645_IN_hogarmedblasterceoh_3162292304_88q)$mon$, null, '2026-08-14T22:06:45Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042994663' and cuerpo like '%Ref. monitoreo: 20260814_170645_IN_hogarmedblasterceoh_3162292304_88q)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 13:01 min · Nota 85/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 13:01 min
Nota final: 85/100

Rapport (SI): Natalia genera mucha seguridad proporcionando su nombre y código de vendedora.

Escucha activa (SI): Identifica el temor de la cliente a posibles estafas telefónicas y lo gestiona.

Sondeo y perfilamiento (SI): Valida el excelente historial crediticio de Jessica Pérez tras la lectura de Habeas Data.

Argumentación y condiciones (SI): Argumenta beneficios de ahorro del 5 al 10% utilizando la aplicación Claro Pay.

Manejo de objeciones (SI): Brinda soporte activo ofreciendo gestionar personalmente la cancelación con Movistar.

Agresividad comercial (ALTA): Toma el control absoluto del proceso de portabilidad de servicios.

Cierre efectivo y legal (NO): Queda pendiente de la actualización técnica de la dirección en el sistema.

Resumen: Natalia asesora a Jessica Pérez para realizar el cambio de Movistar a Claro. Gana su confianza ante sospechas de fraude, valida crédito aprobado y ofrece ayuda para la cancelación del operador actual.

(Ref. monitoreo: 20260814_110148_IN_hogarmedblasterceoh_3142065597_yzb)$mon$, null, '2026-08-14T16:01:48Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260814_110148_IN_hogarmedblasterceoh_3142065597_yzb)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$NO LE PARECE ATRACTIVA LA OFERTA · 6:42 min · Nota 65/100$mon$, $mon$Tipificación: NO LE PARECE ATRACTIVA LA OFERTA
Duración: 6:42 min
Nota final: 65/100

Rapport (SI): Natalia inicia con un saludo profesional y amable.

Escucha activa (SI): Identifica que el cliente tiene poco uso de red y busca el internet más bajo.

Sondeo y perfilamiento (SI): Indaga si el cliente ya es usuario previo del servicio de Claro Hogar.

Argumentación y condiciones (N/A): El fragmento de audio es insuficiente para desarrollar la oferta comercial completa.

Manejo de objeciones (N/A): No se presentan objeciones o barreras en el fragmento capturado.

Agresividad comercial (MEDIA): Gestión estándar de seguimiento sobre una base de interesados.

Cierre efectivo y legal (NO): Audio incompleto que solo cubre la fase de contacto y perfilamiento inicial.

Resumen: Natalia contacta a un cliente del área de seguimiento. El usuario manifiesta interés en un plan de internet básico debido al bajo uso que le da en el hogar. Natalia valida su estatus previo con la compañía.

(Ref. monitoreo: 20260813_161721_IN_hogarmedblasterceoh_3214888945_bhd)$mon$, null, '2026-08-13T21:17:21Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260813_161721_IN_hogarmedblasterceoh_3214888945_bhd)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA · 10:13 min · Nota 75/100$mon$, $mon$Tipificación: VENTA
Duración: 10:13 min
Nota final: 75/100

Rapport (SI): Presentación clara de marca y agente.

Escucha activa (SI): Reconoce el interés del cliente en planes hogar.

Sondeo y perfilamiento (SI): Perfila servicios (internet solo vs con TV) y televisores.

Argumentación y condiciones (SI): Detalla 900 megas y beneficios de ser "Todo Claro".

Manejo de objeciones (SI): Rebate el uso de operador de barrio resaltando falta de permanencia y ofertas.

Agresividad comercial (SI): Insta a tomar la oferta hoy para no perder beneficios.

Cierre efectivo y legal (NO): La llamada queda pendiente de hablar con la esposa.

Resumen: El asesor contacta a Jairo, quien tiene internet de barrio y desea pasarse a Claro. Andrea argumenta los beneficios de convergencia móvil-hogar y descuentos del 50%. Se acuerda llamar a la esposa a las 3 PM para titularidad.

(Ref. monitoreo: 20260813_134956_IN_hogarmedblasterceoh_3202083876_2sy)$mon$, null, '2026-08-13T18:49:56Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260813_134956_IN_hogarmedblasterceoh_3202083876_2sy)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 8:54 min · Nota 75/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 8:54 min
Nota final: 75/100

Rapport (SI): Presentación comercial clara y con buena disposición de servicio.

Escucha activa (SI): Identifica que el requerimiento es para un local comercial/bodega en Cúcuta.

Sondeo y perfilamiento (SI): Realiza un sondeo preciso de la ubicación en Cenabastos (Bodega 3, módulo 2).

Argumentación y condiciones (SI): Intenta validar la cobertura técnica específica para el sector de bodegas.

Manejo de objeciones (SI): Gestiona la dificultad de la nomenclatura solicitando soporte visual por WhatsApp.

Agresividad comercial (MEDIA): Enfocada en la solución técnica para dar viabilidad a la venta.

Cierre efectivo y legal (NO): La llamada finaliza para continuar la validación técnica mediante fotos por chat.

Resumen: Natalia gestiona una solicitud para una bodega en Cúcuta. Ante la complejidad de la dirección en la zona comercial, solicita al cliente enviar fotos de la ubicación para confirmar factibilidad técnica.

(Ref. monitoreo: 20260814_112815_IN_hogarmedblasterceoh_3228946974_ldd)$mon$, null, '2026-08-14T16:28:15Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260814_112815_IN_hogarmedblasterceoh_3228946974_ldd)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 5:23 min · Nota 65/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 5:23 min
Nota final: 65/100

Rapport (SI): Presentación comercial estándar y profesional.

Escucha activa (SI): Registra el interés inicial antes de la aclaración del cliente.

Sondeo y perfilamiento (SI): Captura dirección exacta en la localidad de Usme, Bogotá.

Argumentación y condiciones (SI): Logra mencionar la oferta de 500 megas simétricas por $79,900 con plataformas gratis.

Manejo de objeciones (N/A): El cliente interrumpe para informar que ya es usuario del servicio.

Agresividad comercial (ALTA): Expone los beneficios rápidamente para generar interés inmediato.

Cierre efectivo y legal (NO): Venta no aplicable por duplicidad de servicio.

Resumen: Diego realiza una llamada de prospección en Bogotá. Logra exponer la oferta de internet con descuento, pero el cliente aclara que ya cuenta con los servicios de Claro Hogar activos.

(Ref. monitoreo: 20260814_155633_IN_hogarmedblasterceoh_3126264299_dkx)$mon$, null, '2026-08-14T20:56:33Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260814_155633_IN_hogarmedblasterceoh_3126264299_dkx)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 10:02 min · Nota 100/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 10:02 min
Nota final: 100/100

Rapport (SI): Presentación comercial fluida, segura y con tono profesional.

Escucha activa (SI): Identifica correctamente que el servicio es para una bodega/local y no para una vivienda.

Sondeo y perfilamiento (SI): Valida dirección en Bogotá y perfila el uso de internet para cámaras de seguridad del negocio.

Argumentación y condiciones (SI): Ofrece tarifa "Negocios" de $82,900 con antivirus incluido y beneficio de primer mes gratis.

Manejo de objeciones (N/A): El cliente se muestra receptivo y conforme con la oferta de 500 megas presentada.

Agresividad comercial (ALTA): Guía proactivamente al cliente hacia la entrega de datos personales para la facturación.

Cierre efectivo y legal (SI): Realiza lectura de Habeas Data, valida identidad y solicita autorización legal completa del cliente.

Resumen: Keylin cierra una venta para un local comercial. Identifica el perfil de bodega, argumenta la tarifa de $82,900 con beneficios de seguridad y completa satisfactoriamente el proceso legal de venta.

(Ref. monitoreo: 20260814_101541_IN_hogarmedblasterceoh_3007800686_d85)$mon$, null, '2026-08-14T15:15:41Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260814_101541_IN_hogarmedblasterceoh_3007800686_d85)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$CLIENTE CUELGA · 13:12 min · Nota 75/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 13:12 min
Nota final: 75/100

Rapport (SI): Presentación como ejecutiva preferencial de Claro Hogar con tono entusiasta.

Escucha activa (SI): Detecta que el cliente tiene información errónea sobre el tiempo de duración del descuento.

Sondeo y perfilamiento (SI): Valida dirección en Bogotá (Conjunto El Carmelo) incluyendo interior y apartamento.

Argumentación y condiciones (SI): Explica que la promoción vigente es de 2 meses al 50% y no de 3 meses como creía el usuario.

Manejo de objeciones (SI): Rebate con firmeza y respeto la "información falsa" que el cliente recibió previamente.

Agresividad comercial (SI): Mantiene al cliente en línea mientras lidia con la lentitud del sistema de validación.

Cierre efectivo y legal (NO): Finaliza con el compromiso de contactar por WhatsApp corporativo una vez habilitada la cobertura.

Resumen: Rosa contacta a un usuario para otorgar beneficios. Aclara dudas sobre la vigencia de las promociones de descuento y realiza una validación técnica detallada de la dirección en Bogotá antes de pasar la gestión a chat.

(Ref. monitoreo: 20260814_181606_IN_hogarmedblasterceoh_3212360834_tqz)$mon$, null, '2026-08-14T23:16:06Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260814_181606_IN_hogarmedblasterceoh_3212360834_tqz)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 12:53 min · Nota 60/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 12:53 min
Nota final: 60/100

Rapport (SI): Presentación cordial y clara del área comercial.

Escucha activa (SI): Confirma el estado de los servicios actuales del hogar del usuario.

Sondeo y perfilamiento (SI): Pregunta directamente por el operador actual de internet y televisión para iniciar el comparativo.

Argumentación y condiciones (N/A): No se llega a la fase de oferta debido a la brevedad del fragmento de audio.

Manejo de objeciones (N/A): No se presentan objeciones en los primeros segundos de contacto.

Agresividad comercial (MEDIA): Intento proactivo de prospección sobre una base de datos de interesados.

Cierre efectivo y legal (NO): La llamada no progresa más allá del saludo inicial y sondeo básico de operador.

Resumen: Rosa contacta a un usuario para otorgar beneficios de Claro Hogar. La llamada se centra en validar con qué operador cuenta el cliente actualmente, pero no se desarrolla una oferta comercial completa.

(Ref. monitoreo: 20260813_134024_IN_hogarmedblasterceoh_3202664146_utf)$mon$, null, '2026-08-13T18:40:24Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260813_134024_IN_hogarmedblasterceoh_3202664146_utf)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 6:36 min · Nota 70/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 6:36 min
Nota final: 70/100

Rapport (SI): Presentación formal indicando que llama del centro de experiencia.

Escucha activa (SI): Logra retomar el hilo de la conversación a pesar de las dificultades de audio iniciales.

Sondeo y perfilamiento (SI): Perfila el hogar preguntando por la cantidad de televisores (dos).

Argumentación y condiciones (SI): Detalla oferta de $110,900 con 50% de descuento por dos meses ($55,400) y plataforma premium.

Manejo de objeciones (N/A): No se presentan objeciones por parte de la cliente en el fragmento capturado.

Agresividad comercial (SI): Proactiva al lanzar la oferta de descuento inmediata para generar interés.

Cierre efectivo y legal (NO): Audio incompleto; queda en fase de seguimiento comercial.

Resumen: Llamada de seguimiento donde Martha perfila a la cliente para un combo de internet y TV. Explica el beneficio de las dos facturas a mitad de precio y las opciones de plataformas digitales.

(Ref. monitoreo: 20260813_142254_IN_hogarmedblasterceoh_3212061244_akx)$mon$, null, '2026-08-13T19:22:54Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260813_142254_IN_hogarmedblasterceoh_3212061244_akx)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$COBERTURA DTH · 6:18 min · Nota 60/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:18 min
Nota final: 60/100

Rapport (SI): Presentación formal y clara como ejecutiva del área de seguimiento.

Escucha activa (SI): Identifica que el cliente tiene Tigo y tiene interés genuino en cambiarse de operador.

Sondeo y perfilamiento (SI): Valida dirección en el Barrio Popular y confirma si es casa normal o apartamento.

Argumentación y condiciones (NO): No logra argumentar beneficios debido a que el sistema arroja falta de factibilidad técnica.

Manejo de objeciones (N/A): No se llega a la etapa de negociación de términos.

Agresividad comercial (BAJA): Finaliza la interacción de forma rápida al detectar la imposibilidad técnica de venta.

Cierre efectivo y legal (NO): Venta perdida por falta de cobertura en la zona solicitada.

Resumen: Alejandra contacta a un cliente interesado en cambiarse de Tigo por mal servicio. Tras validar minuciosamente la dirección, confirma que Claro no tiene cobertura en ese sector específico y finaliza la llamada profesionalmente.

(Ref. monitoreo: 20260814_155716_IN_hogarmedblasterceoh_3196616253_pvu)$mon$, null, '2026-08-14T20:57:16Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260814_155716_IN_hogarmedblasterceoh_3196616253_pvu)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$MEJORES PROMOCIONES · 14:45 min · Nota 75/100$mon$, $mon$Tipificación: MEJORES PROMOCIONES
Duración: 14:45 min
Nota final: 75/100

Rapport (SI): Respuesta empática y entusiasta ante el saludo del cliente.

Escucha activa (SI): Identifica la duda puntual sobre los costos de internet individual vs. televisión.

Sondeo y perfilamiento (SI): Indaga sobre la preferencia de servicios para ajustar la tarifa.

Argumentación y condiciones (SI): Argumenta plan de $79,900 con 50% de descuento y Amazon Prime incluido.

Manejo de objeciones (SI): Respalda la calidad del servicio aclarando que el técnico no instala si la señal no es óptima.

Agresividad comercial (SI): Se apoya en una "especialista" (Natalia) para generar mayor confianza técnica en el usuario.

Cierre efectivo y legal (NO): El fragmento de audio finaliza durante la explicación técnica de las megas.

Resumen: El cliente consulta por promociones de internet. Martha ofrece el plan básico y ante dudas técnicas, interviene un refuerzo (Silvera) para explicar el proceso de instalación y validación de red.

(Ref. monitoreo: 20260813_113317_IN_hogarmedblasterceoh_3104716149_3lr)$mon$, null, '2026-08-13T16:33:17Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260813_113317_IN_hogarmedblasterceoh_3104716149_3lr)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$Reintento · 8:43 min · Nota 80/100$mon$, $mon$Tipificación: Reintento
Duración: 8:43 min
Nota final: 80/100

Rapport (SI): Saludo adecuado y disposición de servicio.

Escucha activa (SI): Identifica que el cliente busca un servicio para su hogar en Cajicá.

Sondeo y perfilamiento (SI): Valida minuciosamente la dirección en el Conjunto Rivera del Valle.

Argumentación y condiciones (SI): Explica el descuento del 50% por dos meses y la inclusión de dos plataformas digitales.

Manejo de objeciones (SI): Recomienda al cliente tomar un servicio nuevo como la mejor decisión inmediata.

Agresividad comercial (SI): Solicita al cliente elegir su plataforma preferida (Netflix, HBO, etc.) para avanzar en el proceso.

Cierre efectivo y legal (NO): Fragmento incompleto centrado en la etapa de oferta.

Resumen: Diego contacta a un prospecto en Cajicá para ofrecer un combo de internet y TV. Detalla la promoción de los dos meses a mitad de precio y perfila la elección de plataformas premium para la cuenta del cliente.

(Ref. monitoreo: 20260814_153502_IN_hogarmedblasterceoh_3103019693_86u)$mon$, null, '2026-08-14T20:35:02Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260814_153502_IN_hogarmedblasterceoh_3103019693_86u)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1045705043', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 30:40 min · Nota 95/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 30:40 min
Nota final: 95/100

Rapport (SI): Saludo amable; Doreidis genera un ambiente de confianza desde el inicio.

Escucha activa (SI): Comprende que el esposo es quien maneja la parte técnica y la esposa será la titular.

Sondeo y perfilamiento (SI): Sondeo profundo sobre el operador actual (ETB) y las fallas de instalación previas.

Argumentación y condiciones (SI): Argumenta el plan de 900 megas con Prime Video y el primer mes a mitad de precio ($39,900).

Manejo de objeciones (SI): Ofrece ayuda activa para la cancelación del servicio actual del cliente (ETB).

Agresividad comercial (ALTA): Gestiona la venta con ambos cónyuges, asegurando que todos los beneficios queden claros.

Cierre efectivo y legal (SI): Captura datos completos de la titular, correos y números de contacto para el contrato.

Resumen: Doreidis logra una venta de solo internet de 900 megas. Supera barreras técnicas con el esposo del cliente, explica el proceso de cancelación con ETB y formaliza la captura de datos con la nueva titular.

(Ref. monitoreo: 20260814_175445_IN_hogarmedblasterceoh_3006633249_6iz)$mon$, null, '2026-08-14T22:54:45Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1045705043' and cuerpo like '%Ref. monitoreo: 20260814_175445_IN_hogarmedblasterceoh_3006633249_6iz)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 8:35 min · Nota 75/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 8:35 min
Nota final: 75/100

Rapport (SI): Saludo amable; genera entorno de confianza al validar datos de identidad.

Escucha activa (SI): Identifica que el cliente tiene servicio con ETB y busca una mejora en el costo mensual.

Sondeo y perfilamiento (SI): Confirma la dirección y valida que la zona cuenta con migración reciente a fibra óptica simétrica.

Argumentación y condiciones (SI): Ofrece plan de 900 megas por $79,900, resaltando la superioridad técnica de la fibra.

Manejo de objeciones (SI): Rebate el argumento del cliente sobre el costo de la competencia comparando beneficios de velocidad.

Agresividad comercial (SI): Enfocada en demostrar el valor del servicio frente al precio actual del usuario.

Cierre efectivo y legal (NO): La llamada queda en estado de comparación; el cliente no toma la decisión inmediata.

Resumen: Natalia gestiona un seguimiento para el señor Nelson. Explica que la zona migró a fibra y ofrece 900 megas por $79,900 para competir con el costo actual que el cliente paga en ETB, quien considera que su factura es muy alta.

(Ref. monitoreo: 20260813_142313_IN_hogarmedblasterceoh_3007175148_g17)$mon$, null, '2026-08-13T19:23:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260813_142313_IN_hogarmedblasterceoh_3007175148_g17)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 8:25 min · Nota 85/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 8:25 min
Nota final: 85/100

Rapport (SI): Saludo amable; genera entorno de servicio inmediato.

Escucha activa (SI): Capta el interés del cliente en un combo de televisión e internet.

Sondeo y perfilamiento (SI): Solicita dirección exacta y valida torre/apartamento para verificar cobertura de 900 megas.

Argumentación y condiciones (SI): Explica el costo de $104,900 con 50% de descuento y beneficios de Amazon Prime.

Manejo de objeciones (SI): Aclara costos de decodificadores adicionales de forma transparente.

Agresividad comercial (SI): Ofrece alternativas de solo internet para ajustarse al presupuesto del cliente.

Cierre efectivo y legal (NO): La llamada finaliza porque el cliente debe gestionar primero la cancelación con otro operador.

Resumen: Cliente consulta por plan de internet y TV. Jokabeth ofrece 900 megas por $104,900 con descuento inicial. Valida cobertura en Bogotá. El cliente pregunta por decos extra y decide llamar más tarde tras contactar a su operador actual.

(Ref. monitoreo: 20260813_173414_IN_hogarmedblasterceoh_3203444889_img)$mon$, null, '2026-08-13T22:34:14Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260813_173414_IN_hogarmedblasterceoh_3203444889_img)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140828545', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA · 13:15 min · Nota 85/100$mon$, $mon$Tipificación: VENTA
Duración: 13:15 min
Nota final: 85/100

Rapport (SI): Saludo cordial y directo al beneficio comercial.

Escucha activa (SI): Confirma el número de puntos de TV necesarios (un televisor).

Sondeo y perfilamiento (SI): Realiza un sondeo técnico profundo (interiores, número de apartamentos).

Argumentación y condiciones (SI): Menciona precio fijo de $104,900, plataformas gratis y descuento de mitad de precio.

Manejo de objeciones (N/A): No se presentan objeciones en el fragmento capturado.

Agresividad comercial (SI): Enfatiza que la promoción es "por tomarlo hoy" para generar urgencia.

Cierre efectivo y legal (NO): El audio se interrumpe durante la fase de validación técnica de la dirección.

Resumen: Jorge ofrece paquete de TV e Internet resaltando que el precio es fijo. Detalla los beneficios de Claro Video y la elección de una plataforma adicional. Valida meticulosamente la dirección en Bogotá antes del corte de audio.

(Ref. monitoreo: 20260813_154607_IN_hogarmedblasterceoh_3144520832_ikk)$mon$, null, '2026-08-13T20:46:07Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140828545' and cuerpo like '%Ref. monitoreo: 20260813_154607_IN_hogarmedblasterceoh_3144520832_ikk)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA · 28:57 min · Nota 65/100$mon$, $mon$Tipificación: VENTA
Duración: 28:57 min
Nota final: 65/100

Rapport (SI): Saludo cordial y disposición inmediata de asesoría.

Escucha activa (SI): Escucha el interés por las megas y el costo de instalación.

Sondeo y perfilamiento (SI): Solicita la dirección (Sector San Carlos) para validar disponibilidad técnica.

Argumentación y condiciones (SI): Menciona renta de $79,900 con Amazon Prime gratuito de forma permanente.

Manejo de objeciones (N/A): La cliente se muestra receptiva a la información inicial de tarifas.

Agresividad comercial (SI): Enfocada en pasar rápidamente a la validación en sistema para concretar.

Cierre efectivo y legal (NO): Audio parcial que solo cubre la etapa de sondeo y oferta básica.

Resumen: Cliente consulta precio de internet para su hogar. Martha ofrece el plan de $79,900 y solicita la dirección exacta para confirmar la velocidad de navegación disponible en la zona.

(Ref. monitoreo: 20260813_150612_IN_hogarmedblasterceoh_3222699060_k19)$mon$, null, '2026-08-13T20:06:12Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260813_150612_IN_hogarmedblasterceoh_3222699060_k19)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$CLIENTE CUELGA · 10:00 min · Nota 80/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 10:00 min
Nota final: 80/100

Rapport (SI): Saludo cordial y profesional; Rosa establece una disposición de servicio inmediata.

Escucha activa (SI): Identifica que el cliente rechaza la televisión y busca un plan de solo internet que sea económico.

Sondeo y perfilamiento (SI): Valida dirección en Popayán (Barrio La Pradera) y solicita el número de cédula para verificación.

Argumentación y condiciones (SI): Compara el combo de $104,900 con la opción de solo internet de $79,900, detallando descuentos.

Manejo de objeciones (SI): Ante la objeción de precio, pivota inmediatamente hacia la oferta más barata disponible.

Agresividad comercial (SI): Guía al cliente hacia el canal de WhatsApp para recibir el soporte físico de la dirección.

Cierre efectivo y legal (NO): La llamada se traslada a WhatsApp para recibir la foto del recibo público y confirmar cobertura.

Resumen: Rosa ofrece inicialmente un combo con TV; ante la negativa del cliente por el costo, argumenta el plan de solo internet de 900 megas por $79,900. Solicita un recibo de servicios para precisar la ubicación en Popayán.

(Ref. monitoreo: 20260814_152603_IN_hogarmedblasterceoh_3154171257_m0j)$mon$, null, '2026-08-14T20:26:03Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260814_152603_IN_hogarmedblasterceoh_3154171257_m0j)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042854178', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$CLIENTE CUELGA · 11:48 min · Nota 50/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 11:48 min
Nota final: 50/100

Rapport (SI): Saludo cordial; intenta romper el hielo validando el entorno del cliente.

Escucha activa (SI): Capta la oportunidad al mencionar que la vecina (Lina) ya cuenta con el servicio activo.

Sondeo y perfilamiento (SI): Inicia validación de cobertura técnica en la zona residencial.

Argumentación y condiciones (N/A): El fragmento de audio es muy breve y no alcanza a desarrollar la propuesta comercial.

Manejo de objeciones (N/A): No se presentan objeciones en los pocos segundos de interacción registrados.

Agresividad comercial (MEDIA): Proactiva al usar testimonios de terceros (vecinos) para generar aprobación.

Cierre efectivo y legal (NO): Llamada incompleta orientada a prospección inicial.

Resumen: Breve contacto donde Alejandra intenta validar cobertura mencionando que una vecina ya tiene el servicio activo con Claro. La llamada se interrumpe antes de poder realizar un sondeo profundo o una oferta.

(Ref. monitoreo: 20260814_113734_IN_hogarmedblasterceoh_3148086613_92w)$mon$, null, '2026-08-14T16:37:34Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042854178' and cuerpo like '%Ref. monitoreo: 20260814_113734_IN_hogarmedblasterceoh_3148086613_92w)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140846401', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 8:57 min · Nota 85/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 8:57 min
Nota final: 85/100

Rapport (SI): Saludo cordial; pregunta por el bienestar del cliente.

Escucha activa (SI): Identifica que el cliente busca un plan con línea fija.

Sondeo y perfilamiento (SI): Indaga sobre televisores y valida dirección para cobertura.

Argumentación y condiciones (SI): Detalla megas, decodificadores y 50% de descuento.

Manejo de objeciones (SI): Aplica urgencia ante la duda del cliente de consultar.

Agresividad comercial (SI): Propone horarios de seguimiento específicos.

Cierre efectivo y legal (NO): No se concreta la venta legal en el audio.

Resumen: Andrea contacta a una cliente interesada en internet, TV y línea fija. Explica la promoción de $113,900 con 50% de descuento inicial. La cliente solicita enviar información por WhatsApp para consultar con su madre; Andrea agenda rellamada a las 5:30 PM.

(Ref. monitoreo: 20260813_154910_IN_hogarmedblasterceoh_3144578199_u7b)$mon$, null, '2026-08-13T20:49:10Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140846401' and cuerpo like '%Ref. monitoreo: 20260813_154910_IN_hogarmedblasterceoh_3144578199_u7b)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$Reintento · 6:54 min · Nota 50/100$mon$, $mon$Tipificación: Reintento
Duración: 6:54 min
Nota final: 50/100

Rapport (SI): Saludo empático para romper el hielo.

Escucha activa (SI): Confirma interés previo registrado en sistema.

Sondeo y perfilamiento (SI): Solicita ciudad y dirección para iniciar gestión.

Argumentación y condiciones (N/A): No se llega a la fase de oferta comercial.

Manejo de objeciones (N/A): Audio muy breve centrado en datos de ubicación.

Agresividad comercial (MEDIA): Proactivo al sugerir revisar un recibo físico.

Cierre efectivo y legal (NO): Audio incompleto; solo cubre fase de contacto inicial.

Resumen: Llamada de seguimiento donde el agente intenta validar la dirección del cliente en Medellín. Existe confusión sobre si es calle o carrera; Diego solicita al cliente buscar un recibo de servicios públicos para dar continuidad.

(Ref. monitoreo: 20260813_154451_IN_hogarmedblasterceoh_3126444610_8ft)$mon$, null, '2026-08-13T20:44:51Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260813_154451_IN_hogarmedblasterceoh_3126444610_8ft)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$CONTESTADOR · 9:31 min · Nota 75/100$mon$, $mon$Tipificación: CONTESTADOR
Duración: 9:31 min
Nota final: 75/100

Rapport (SI): Saludo entusiasta; da la bienvenida a Claro Hogar de forma acogedora.

Escucha activa (SI): Capta que el cliente llama por una publicidad específica de 44,000 pesos.

Sondeo y perfilamiento (SI): Indaga si el interés es solo por internet o si también desea incluir televisión.

Argumentación y condiciones (SI): Explica plan de $89,900 con 50% de descuento ($44,900), plataforma premium gratis y exención de instalación.

Manejo de objeciones (N/A): El cliente se muestra interesado y receptivo a la información de costos.

Agresividad comercial (SI): Resalta los beneficios adicionales (plataformas digitales) para aumentar el valor percibido.

Cierre efectivo y legal (NO): El audio finaliza mientras la asesora espera la respuesta sobre la preferencia de televisión.

Resumen: El cliente consulta por una publicidad de internet de $44,000. Rosa aclara que es un descuento del 50% sobre la tarifa fija, detalla las plataformas incluidas y sondea la necesidad de televisión.

(Ref. monitoreo: 20260813_142916_IN_hogarmedblasterceoh_3214451433_t9x)$mon$, null, '2026-08-13T19:29:16Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260813_142916_IN_hogarmedblasterceoh_3214451433_t9x)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 11:29 min · Nota 65/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 11:29 min
Nota final: 65/100

Rapport (SI): Saludo inicial amable y profesional que establece disposición de servicio.

Escucha activa (SI): Confirma dirección y ciudad (Bogotá) con total precisión antes de validar.

Sondeo y perfilamiento (SI): Valida si es casa o edificio y el número de piso para determinar la tecnología aplicable.

Argumentación y condiciones (N/A): El fragmento de audio es muy breve y no alcanza el desarrollo de la oferta comercial.

Manejo de objeciones (N/A): No se presentan barreras por parte del cliente en esta etapa inicial.

Agresividad comercial (MEDIA): Gestión estándar orientada a la captura y validación de datos técnicos en sistema.

Cierre efectivo y legal (NO): Llamada incompleta; el audio finaliza durante la toma de datos básicos.

Resumen: Jokabeth valida cobertura de fibra óptica para un inmueble en Bogotá. Confirma la disponibilidad técnica positiva y solicita el nombre del cliente para iniciar formalmente el registro.

(Ref. monitoreo: 20260814_171636_IN_hogarmedblasterceoh_3108019869_cqb)$mon$, null, '2026-08-14T22:16:36Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260814_171636_IN_hogarmedblasterceoh_3108019869_cqb)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143154495', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$NO APTO CARTERA · 7:04 min · Nota 60/100$mon$, $mon$Tipificación: NO APTO CARTERA
Duración: 7:04 min
Nota final: 60/100

Rapport (SI): Saludo inicial amable y profesional.

Escucha activa (SI): Registra correctamente los datos de contacto y validación de la cliente.

Sondeo y perfilamiento (SI): Solicita cédula y correo electrónico para consulta en base de datos.

Argumentación y condiciones (N/A): No se llega a la fase de oferta debido al bloqueo preventivo del sistema.

Manejo de objeciones (SI): Informa con claridad que la cliente posee un saldo pendiente de un servicio anterior (enero 2026).

Agresividad comercial (MEDIA): Gestión orientada a la verificación de estatus crediticio.

Cierre efectivo y legal (NO): Venta rechazada por política de cartera.

Resumen: Martha consulta datos de la cliente y detecta que no es apta para la venta por una deuda pendiente con Claro Hogar. La llamada finaliza tras la notificación del estado de cuenta.

(Ref. monitoreo: 20260813_132310_IN_hogarmedblasterceoh_3026393331_mvw)$mon$, null, '2026-08-13T18:23:10Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143154495' and cuerpo like '%Ref. monitoreo: 20260813_132310_IN_hogarmedblasterceoh_3026393331_mvw)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$Reintento · 29:09 min · Nota 50/100$mon$, $mon$Tipificación: Reintento
Duración: 29:09 min
Nota final: 50/100

Rapport (SI): Saludo personalizado ("Juan Pablo") y profesional.

Escucha activa (SI): Comprende la frustración del cliente por el alto costo de su servicio actual con Movistar.

Sondeo y perfilamiento (SI): Valida la dirección en un edificio en Bucaramanga.

Argumentación y condiciones (BAJA): Genera confusión al prometer una tarifa de $79,900 mientras en el contrato enviado aparece $89,900.

Manejo de objeciones (NO): No logra explicar la diferencia de precios, lo que genera desconfianza y molestia en el cliente.

Agresividad comercial (MEDIA): Intenta forzar el cierre enviando el precontrato por WhatsApp.

Cierre efectivo y legal (NO): El cliente desiste por la falta de transparencia en los valores.

Resumen: Diego intenta realizar una venta de internet solo en Bucaramanga. Sin embargo, la inconsistencia entre el precio ofrecido verbalmente y el reflejado en el contrato digital causa la pérdida de confianza del cliente, quien decide no continuar.

(Ref. monitoreo: 20260814_111923_IN_hogarmedblasterceoh_3102646193_clf)$mon$, null, '2026-08-14T16:19:23Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260814_111923_IN_hogarmedblasterceoh_3102646193_clf)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1042994663', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VOLVER A LLAMAR · 6:43 min · Nota 85/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 6:43 min
Nota final: 85/100

Rapport (SI): Saludo profesional y amable; establece una disposición de servicio inmediata.

Escucha activa (SI): Identifica la insatisfacción de la cliente por el costo de su factura actual frente a la de sus vecinos.

Sondeo y perfilamiento (SI): Confirma que es cliente actual de Claro y valida la composición del núcleo familiar para cambio de titularidad.

Argumentación y condiciones (SI): Explica que las ofertas vigentes son para ventas nuevas y asesora sobre los tiempos de desconexión.

Manejo de objeciones (SI): Gestiona el deseo de cancelación sugiriendo el "carrusel comercial" (cambio de titular a nombre de la hija).

Agresividad comercial (ALTA): Mantiene el interés de la cliente sugiriendo una estrategia legal para acceder a beneficios de cliente nuevo.

Cierre efectivo y legal (NO): Llamada de asesoría y seguimiento; la cliente debe gestionar primero la baja en la línea de soporte.

Resumen: Carmen asesora a una cliente de Claro que busca pagar menos. Ante la imposibilidad de aplicar promociones a clientes antiguos, Carmen sugiere que la hija (Neli) tome el servicio como titular nueva tras la cancelación.

(Ref. monitoreo: 20260814_152032_IN_hogarmedblasterceoh_3504204750_ca8)$mon$, null, '2026-08-14T20:20:32Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1042994663' and cuerpo like '%Ref. monitoreo: 20260814_152032_IN_hogarmedblasterceoh_3504204750_ca8)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$CLIENTE CUELGA · 11:31 min · Nota 75/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 11:31 min
Nota final: 75/100

Rapport (SI): Saludo profesional; genera confianza al validar la ubicación del cliente inmediatamente.

Escucha activa (SI): Identifica que el cliente tiene caídas de señal con su operador actual a pesar de tener 900 megas.

Sondeo y perfilamiento (SI): Valida dirección en Barranquilla y confirma si es casa o edificio para aplicar tecnología simétrica.

Argumentación y condiciones (SI): Propone 500 megas simétricas para garantizar estabilidad y evitar las bajas de internet que sufre.

Manejo de objeciones (SI): Explica que la competencia falla por "empalmes" técnicos deficientes con otros operadores.

Agresividad comercial (SI): Mantiene una postura experta al asesorar sobre la estabilidad técnica vs. solo velocidad.

Cierre efectivo y legal (NO): El audio se interrumpe durante el proceso de verificación de cobertura en el sistema.

Resumen: Rosa atiende a un cliente con fallas técnicas en su servicio actual. Rosa argumenta que Claro ofrece fibra simétrica real y explica por qué la competencia está fallando en la zona, validando la dirección del usuario.

(Ref. monitoreo: 20260813_115125_IN_hogarmedblasterceoh_3127758979_rhv)$mon$, null, '2026-08-13T16:51:25Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260813_115125_IN_hogarmedblasterceoh_3127758979_rhv)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1045705043', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$VOLVER A LLAMAR · 5:28 min · Nota 85/100$mon$, $mon$Tipificación: VOLVER A LLAMAR
Duración: 5:28 min
Nota final: 85/100

Rapport (SI): Saludo respetuoso y disposición de asesoría personalizada.

Escucha activa (SI): Entiende que el cliente rechaza la telefonía fija y tiene servicios satelitales en una finca.

Sondeo y perfilamiento (SI): Identifica al cliente como "Todo Claro" y sondea la cantidad de televisores necesaria (dos).

Argumentación y condiciones (SI): Ofrece combo de TV e internet por $110,900 con dos meses de descuento inicial ($55,400).

Manejo de objeciones (SI): Valida el deseo del cliente de cancelar un servicio actual por mala calidad técnica.

Agresividad comercial (SI): Agenda rellamada exacta en una hora para permitir la consulta con el padre del usuario.

Cierre efectivo y legal (NO): Queda en seguimiento pendiente de la decisión familiar del cliente.

Resumen: Doreidis asesora a un cliente interesado en cambiar su servicio de finca por mal funcionamiento. Ofrece un paquete de TV y datos con beneficios de convergencia móvil y programa un seguimiento inmediato para cierre.

(Ref. monitoreo: 20260814_163634_IN_hogarmedblasterceoh_3228531964_3ha)$mon$, null, '2026-08-14T21:36:34Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1045705043' and cuerpo like '%Ref. monitoreo: 20260814_163634_IN_hogarmedblasterceoh_3228531964_3ha)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$Reintento · 14:25 min · Nota 60/100$mon$, $mon$Tipificación: Reintento
Duración: 14:25 min
Nota final: 60/100

Rapport (SI): Saludo y presentación comercial correcta.

Escucha activa (SI): Entiende que el cliente comparte internet de un tercero.

Sondeo y perfilamiento (SI): Sondeo exhaustivo para hallar la cuenta real en sistema.

Argumentación y condiciones (SI): Ofrece plan de 500 megas con 50% de descuento.

Manejo de objeciones (SI): Aclara dudas sobre la estabilidad de la cuota fija.

Agresividad comercial (MEDIA): Persistente en la búsqueda de datos pero se detiene en validación.

Cierre efectivo y legal (NO): Falta información del titular (esposo) para proceder.

Resumen: Diego intenta formalizar un servicio nuevo para una cliente que compartía red con vecinos. Identifica inconsistencias en la dirección y propone plan de $104,900. La cliente, extranjera, debe consultar con su esposo para la titularidad.

(Ref. monitoreo: 20260813_100717_IN_hogarmedblasterceoh_3102299702_jda)$mon$, null, '2026-08-13T15:07:17Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260813_100717_IN_hogarmedblasterceoh_3102299702_jda)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1045705043', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$COBERTURA DTH · 7:09 min · Nota 70/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 7:09 min
Nota final: 70/100

Rapport (SI): Tono de voz profesional y bienvenida clara al área de seguimiento.

Escucha activa (SI): Identifica que el interés principal es internet de alta velocidad sin servicios adicionales.

Sondeo y perfilamiento (SI): Indaga sobre la utilidad que le darán al internet en casa para recomendar la velocidad ideal.

Argumentación y condiciones (SI): Presenta estrategia escalonada: 900 megas con Prime ($79k) vs. 250 megas con plataforma a elección ($74k).

Manejo de objeciones (N/A): El fragmento se centra en la exposición de ofertas competitivas; el cliente se muestra receptivo.

Agresividad comercial (SI): Utiliza beneficios de plataformas digitales para aumentar el valor de la oferta básica.

Cierre efectivo y legal (NO): Audio parcial que finaliza durante la etapa de perfilamiento de la oferta preferida.

Resumen: Doreidis presenta dos opciones de solo internet, resaltando el 50% de descuento en la primera factura y la inclusión de plataformas como Prime Video o Disney, orientando al cliente según su necesidad de velocidad.

(Ref. monitoreo: 20260814_162713_IN_hogarmedblasterceoh_3126654833_eir)$mon$, null, '2026-08-14T21:27:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1045705043' and cuerpo like '%Ref. monitoreo: 20260814_162713_IN_hogarmedblasterceoh_3126654833_eir)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$CLIENTE CUELGA · 30:38 min · Nota 85/100$mon$, $mon$Tipificación: CLIENTE CUELGA
Duración: 30:38 min
Nota final: 85/100

Rapport (SI): Tono de voz profesional; se posiciona como ejecutiva preferencial.

Escucha activa (SI): Comprende la preocupación de la cliente por el costo de instalación.

Sondeo y perfilamiento (SI): Perfila la compra para un tercero (el padre de la cliente) y valida documentos.

Argumentación y condiciones (SI): Explica la ventaja del plan de $89,900 que exime el pago de instalación de $52,000.

Manejo de objeciones (SI): Rebate comparando el ahorro a largo plazo entre los planes de solo internet.

Agresividad comercial (SI): Identifica oportunidad de convergencia al saber que la cliente ya tiene móvil Claro.

Cierre efectivo y legal (NO): Según el registro del audio, el cliente cuelga antes de finalizar el proceso legal.

Resumen: Rosa asesora sobre internet para el padre de la cliente. Argumenta el beneficio de no pagar instalación con el plan superior y realiza el sondeo documental antes de que la llamada se interrumpa.

(Ref. monitoreo: 20260813_164906_IN_hogarmedblasterceoh_3115394191_xnz)$mon$, null, '2026-08-13T21:49:06Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260813_164906_IN_hogarmedblasterceoh_3115394191_xnz)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA · 9:10 min · Nota 85/100$mon$, $mon$Tipificación: VENTA
Duración: 9:10 min
Nota final: 85/100

Rapport (SI): Tono entusiasta y profesional durante la presentación inicial.

Escucha activa (SI): Responde con precisión a las dudas sobre costos mensuales.

Sondeo y perfilamiento (SI): Valida ubicación en Bogotá y especificaciones de la vivienda (piso 5).

Argumentación y condiciones (SI): Argumenta los beneficios de ser "Todo Claro" (móvil + hogar) y el mes de prueba.

Manejo de objeciones (SI): Explica claramente que el servicio no tiene cláusulas abusivas y permite retiro tras prueba.

Agresividad comercial (SI): Resalta la antigüedad del cliente para ofrecer beneficios exclusivos.

Cierre efectivo y legal (NO): El cliente se encuentra trabajando y solicita rellamada a las 4:00 PM.

Resumen: Jokabeth gestiona seguimiento con un cliente que tiene móvil Claro. Ofrece 500 megas y TV por $104,900 con 50% de descuento por 2 meses. Explica el ciclo de facturación y agenda rellamada por disponibilidad del cliente.

(Ref. monitoreo: 20260813_141331_IN_hogarmedblasterceoh_3229652390_xuv)$mon$, null, '2026-08-13T19:13:31Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260813_141331_IN_hogarmedblasterceoh_3229652390_xuv)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '9022229', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 14/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 9:12 min · Nota 65/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 9:12 min
Nota final: 65/100

Rapport (SI): Trato muy respetuoso y profesional hacia la cliente titular.

Escucha activa (SI): Reconoce y premia verbalmente la puntualidad de la cliente en sus pagos de móvil y hogar.

Sondeo y perfilamiento (SI): Valida identidad de María Gabi Jiménez y confirma que posee servicios activos.

Argumentación y condiciones (N/A): Llamada de carácter administrativo y de soporte, no se presenta oferta de venta nueva.

Manejo de objeciones (SI): Gestiona la desconfianza de la cliente (temor a spam) ofreciendo contacto por canal oficial de WhatsApp.

Agresividad comercial (BAJA): Centrado exclusivamente en la resolución de un caso de facturación existente.

Cierre efectivo y legal (NO): No es una llamada de venta; finaliza con compromiso de seguimiento por chat.

Resumen: Jesús contacta a María para revisar un caso en su facturación. Ante el temor de la cliente de ser una llamada fraudulenta, Jesús acuerda escribirle por WhatsApp para brindar seguridad y dar continuidad al trámite.

(Ref. monitoreo: 20260814_172109_IN_hogarmedblasterceoh_3103484758_2ur)$mon$, null, '2026-08-14T22:21:09Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '9022229' and cuerpo like '%Ref. monitoreo: 20260814_172109_IN_hogarmedblasterceoh_3103484758_2ur)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1041890641', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 13/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 14:35 min · Nota 95/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 14:35 min
Nota final: 95/100

Rapport (SI): Uso de lenguaje muy cercano y empático ("Hola mi amor") para calmar la molestia inicial del cliente.

Escucha activa (SI): Gestiona la frustración del cliente por el exceso de llamadas previas sin perder el control.

Sondeo y perfilamiento (SI): Valida dirección en Barranquilla y detecta en sistema un cupo de crédito aprobado por $625,000.

Argumentación y condiciones (SI): Argumenta beneficios de "Todo Claro" (10% de devolución) y acceso a plataformas gratuitas como Netflix.

Manejo de objeciones (SI): Rebate comparaciones con Tigo/Movistar resaltando la superioridad de red de Claro en la ciudad.

Agresividad comercial (ALTA): Persuasiva y entusiasta; utiliza cierres emocionales y beneficios de tecnología (patinetas/TVs).

Cierre efectivo y legal (SI): Valida datos de crédito, confirma identidad y explica cómo usar el cupo tecnológico aprobado.

Resumen: Natalia maneja a un cliente difícil con gran carisma. Valida un cupo de crédito para tecnología, ofrece el plan hogar con beneficios de convergencia y cierra la venta resaltando el ahorro del 10% mensual.

(Ref. monitoreo: 20260813_160138_IN_hogarmedblasterceoh_3243945798_1y0)$mon$, null, '2026-08-13T21:01:38Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1041890641' and cuerpo like '%Ref. monitoreo: 20260813_160138_IN_hogarmedblasterceoh_3243945798_1y0)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1001995827', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$VENTA DE SEGUIMIENTO · 12:26 min · Nota 93/100$mon$, $mon$Tipificación: VENTA DE SEGUIMIENTO
Duración: 12:26 min
Nota final: 93/100

Rapport (10/10): El agente Diego Caro inicia con un saludo amable y directo, presentándose como especialista para generar confianza inmediata.

Escucha activa (12/12): Escucha con empatía el relato de la cliente sobre una estafa de $140,000, validando su frustración antes de avanzar.

Sondeo y perfilamiento (15/15): Sondeo técnico preciso en Medellín (Manrique); verifica dirección y realiza consulta de crédito exitosa.

Argumentación y condiciones (15/15): Argumenta el plan de 250 megas por $74,900 sin costo de instalación, resaltando la inclusión de plataformas premium.

Manejo de objeciones (15/15): Explica pedagógicamente que la deuda móvil no impide el servicio hogar, despejando el miedo al reporte en Datacrédito.

Agresividad comercial (18/18): Alta; el agente se convierte en consultor para "limpiar" el camino crediticio y no perder la oportunidad de venta.

Cierre efectivo y legal (8/15): Cierre en seguimiento; traslada la gestión a WhatsApp para guiar a la cliente en el saneamiento de su cartera.

Resumen: Consulta para internet en Medellín. El agente descubre que la cliente Andrea Díaz tiene una deuda de $72,696 y fue víctima de estafa. Diego actúa proactivamente para viabilizar la instalación de 250MB.

(Ref. monitoreo: 20260810_155149_IN_hogarmedblasterceoh_3216352896_isr)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 8/15).$mon$, '2026-08-10T20:51:49Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1001995827' and cuerpo like '%Ref. monitoreo: 20260810_155149_IN_hogarmedblasterceoh_3216352896_isr)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1123891335', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$COBERTURA DTH · 6:54 min · Nota 82/100$mon$, $mon$Tipificación: COBERTURA DTH
Duración: 6:54 min
Nota final: 82/100

Rapport (10/10): Jokabeth mantiene un tono profesional y respetuoso frente a un cliente que manifiesta insatisfacción previa.

Escucha activa (12/12): Identifica la molestia del cliente por promesas incumplidas anteriores donde los técnicos nunca llegaron a instalar.

Sondeo y perfilamiento (15/15): Realiza una validación minuciosa de la dirección en Sincelejo (Mercado el Papayo) para encontrar el error de red.

Argumentación y condiciones (10/15): Argumentación limitada por la realidad del sistema; informa con honestidad que no hay cobertura técnica real.

Manejo de objeciones (15/15): Valida la queja del cliente sobre la falta de cumplimiento de Claro, evitando falsas expectativas comerciales.

Agresividad comercial (5/18): Baja; la agente prioriza la ética técnica sobre la presión de venta en una zona que sabe que no es factible.

Cierre efectivo y legal (15/15): Cierre profesional de llamada fallida; informa con claridad la inviabilidad, cerrando el ciclo de dudas del cliente.

Resumen: Cliente en Sincelejo interesado en combo Internet+TV. La llamada destaca por la honestidad de Jokabeth, quien tras validar la red, confirma que no hay cobertura, explicando los fracasos de instalaciones previas.

(Ref. monitoreo: 20260810_172206_IN_hogarmedblasterceoh_3003752414_9np)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-10T22:22:06Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1123891335' and cuerpo like '%Ref. monitoreo: 20260810_172206_IN_hogarmedblasterceoh_3003752414_9np)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1143232881', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$CLIENTE PIDE NO VOLVER A LLAMAR · 10:18 min · Nota 95/100$mon$, $mon$Tipificación: CLIENTE PIDE NO VOLVER A LLAMAR
Duración: 10:18 min
Nota final: 95/100

Rapport (10/10): Keylin inicia con mucha energía, estableciendo una conexión positiva con el señor Sneider desde el saludo.

Escucha activa (12/12): Identifica que la prioridad es la telefonía fija para la madre del cliente y detecta la necesidad de un nuevo nodo.

Sondeo y perfilamiento (15/15): Sondeo de alto nivel; descubre que la dirección en Medellín requiere crear el "Piso 2" en la plataforma de Claro.

Argumentación y condiciones (15/15): Presenta Triple Play de 500MB con 50% de descuento ($53,450) y detalla los beneficios del módem Dual Band.

Manejo de objeciones (15/15): Resuelve dudas sobre la unificación de facturas y los descuentos adicionales por ser cliente convergente "Todo Claro".

Agresividad comercial (18/18): Alta; mantiene el control total de la llamada y asegura un compromiso de re-llamada para cerrar con el titular.

Cierre efectivo y legal (10/15): Cierre agendado; se programa contacto para el día siguiente a las 10:00 AM para finalizar la captura de datos.

Resumen: Gestión comercial en Medellín. Keylin explica el proceso de actualización de nomenclatura y posiciona exitosamente el beneficio de convergencia móvil y hogar para unificar cuentas.

(Ref. monitoreo: 20260810_154213_IN_hogarmedblasterceoh_3003338344_zok)$mon$, $mon$Reforzar: Cierre efectivo y legal (fue lo más bajo, 10/15).$mon$, '2026-08-10T20:42:13Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1143232881' and cuerpo like '%Ref. monitoreo: 20260810_154213_IN_hogarmedblasterceoh_3003338344_zok)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$CONTESTADOR · 7:37 min · Nota 86/100$mon$, $mon$Tipificación: CONTESTADOR
Duración: 7:37 min
Nota final: 86/100

Rapport (10/10): Rapport cálido; logra que la cliente Sandra Ruiz se mantenga interesada a pesar de tener un servicio activo.

Escucha activa (12/12): Identifica que la cliente paga $69,000 en Movistar y detecta la oportunidad de mejora con beneficios adicionales.

Sondeo y perfilamiento (15/15): Excelente; utiliza el ID para encontrar el registro histórico en Ibagué (Barrio El Bunde) y validar la red HFC.

Argumentación y condiciones (15/15): Propone plan de 500 megas por $79,900 resaltando que incluye Amazon Prime permanente y mayor estabilidad.

Manejo de objeciones (12/15): Maneja la negativa inicial con profesionalismo, manteniendo el valor de la oferta sin ser invasiva.

Agresividad comercial (12/18): Media; ante el rechazo, aplica con acierto la técnica de solicitar referidos para maximizar el contacto.

Cierre efectivo y legal (10/15): Cierre informativo; deja la puerta abierta para una futura migración y captura datos de potenciales clientes.

Resumen: Recuperación de excliente en Ibagué. Rosa ofrece un plan HFC con valor agregado para competir contra Movistar. Se destaca la proactividad al solicitar referidos tras la negativa de la cliente.

(Ref. monitoreo: 20260810_150332_IN_hogarmedblasterceoh_3115692070_2ys)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 12/18).$mon$, '2026-08-10T20:03:32Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260810_150332_IN_hogarmedblasterceoh_3115692070_2ys)%');

insert into public.feedback (cc_asesor, cc_supervisor, nombre_supervisor, titulo, periodo, cuerpo, compromisos, creado_en)
select '1140847397', '1143149771', 'ALFREDO RAFAEL PEREZ MARTINEZ', $mon$Monitoreo de llamada del 10/08/2026$mon$, $mon$YA TIENE SERVICIO CON CLARO · 5:20 min · Nota 57/100$mon$, $mon$Tipificación: YA TIENE SERVICIO CON CLARO
Duración: 5:20 min
Nota final: 57/100

Rapport (10/10): Rosa cumple con el protocolo corporativo, manteniendo un tono formal y ejecutivo durante la interacción.

Escucha activa (12/12): Capta rápidamente que la cliente actual tiene Movistar y que su hijo es quien toma las decisiones técnicas.

Sondeo y perfilamiento (10/15): Pregunta por el barrio (Los Nogales) pero el proceso se interrumpe al no encontrar red disponible en el primer barrido.

Argumentación y condiciones (5/15): Argumentación deficiente; se rinde ante el primer obstáculo del sistema sin buscar alternativas de cobertura cercana.

Manejo de objeciones (5/15): No se presenta manejo de objeciones; la agente acepta la limitación técnica sin intentar retener el interés del lead.

Agresividad comercial (5/18): Baja; se limita a la validación de cobertura básica sin proactividad comercial para futuras expansiones.

Cierre efectivo y legal (10/15): Cierre administrativo rápido; agradece el tiempo de forma cortés pero no deja un canal de seguimiento.

Resumen: Llamada de prospección en el barrio Los Nogales. Al verificar que no existe red disponible en el sistema, la agente finaliza el contacto de manera tajante, perdiendo oportunidad de bases de datos.

(Ref. monitoreo: 20260810_165312_IN_hogarmedblasterceoh_3113124645_b7j)$mon$, $mon$Reforzar: Agresividad comercial (fue lo más bajo, 5/18).$mon$, '2026-08-10T21:53:12Z'::timestamptz
where not exists (select 1 from public.feedback where cc_asesor = '1140847397' and cuerpo like '%Ref. monitoreo: 20260810_165312_IN_hogarmedblasterceoh_3113124645_b7j)%');

-- ==========================================================================
--  Verificación
-- ==========================================================================
select count(*) as monitoreos_de_agosto from public.feedback where periodo like '%Nota%/100';

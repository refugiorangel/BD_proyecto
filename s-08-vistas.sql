--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creación de vistas

--Vista para mascota, tipo y status
create or replace view v_mascota_status_tipo 
(mascota_id, nombre_mascota, folio, tipo, subcategoria, status)
as select mascota_id, m.nombre, folio, t.nombre, t.subcategoria, s.nombre from mascota m join tipo t using(tipo_id) 
join status s using (status_id);

--Vista para centro operativo y trabajor encargado
create or replace view v_centro_empleado
(centro_operativo_id, nombre_centro, direccion, empleado_id, nombre_empleado, curp)
as select centro_operativo_id, c.nombre, direccion, empleado_id, e.nombre, curp
from centro_operativo c join empleado e using (empleado_id);

--Vista para refugio y su pagina web
create or replace view v_refugio_web
(centro_operativo_id, nombre_refugio, direccion_web)
as select centro_operativo_id, nombre, web from refugio natural join centro_operativo natural join refugio_web;

--Vista para empleado y sus titulos
create or replace view v_empleado_web 
(nombre, curp, titulo, fecha_titulacion)
as select nombre, curp, titulo, fecha_titulacion from empleado natural join empleado_titulo;

--Vista para empleado y su antiguedad
create or replace view v_empleado_antiguedad
(empeado_id, nombre_completo, curp, fehca_ingreso, antiguedad)
as select empleado_id, ap_paterno || ' ' || ap_materno || ' ' ||nombre as nombre_completo, curp, fecha_ingreso,trunc((sysdate - fecha_ingreso)/365) from empleado;

--Vista para mascota y su tiempo en el refugio
create or replace view v_mascota_tiempo
(mascota_id, nombre, folio, fecha_ingreso, tiempo_en_refugio)
as select mascota_id, m.nombre, folio, fecha_ingreso,trunc((sysdate - fecha_ingreso)/365) from mascota m join status s using (status_id) 
where s.nombre = 'disponible adopcion';

--vista para mascota y sus años de vida
create or replace view v_mascota_anios
(mascota_id, nombre, folio, fecha_nacimiento, anios_vida)
as select mascota_id, m.nombre, folio, fecha_nacimiento, trunc((sysdate - fecha_nacimiento)/365) 
from mascota m join status s using (status_id) where s.nombre = 'disponible adopcion';
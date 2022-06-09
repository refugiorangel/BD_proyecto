--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creacion de las consultas

--Consulta para todas las mascotas con su suptipo
select mascota_id, folio, tipo_ingreso, s.nombre, mascota_madre_id as madre_id, 
mascota_padre_id as padre_id, donado_cliente_id_fk
from mascota m, nacido n, donado s, status s where
m.mascota_id = n.mascota_id (+) and
m.mascota_id = d.mascota_id (+) and
m.status_id = s.status_id and
s.nombre = 'en refugio';

--Consulta para las mascotas que han sido adoptadas
select mascota_id, folio, 
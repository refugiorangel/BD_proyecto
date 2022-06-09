--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: crea un archivo csv

connect sys/system as sysdba
create or replace dicetory csv_dir as '/tmp/proyecto/csv';
grant read, write on directory csv_dir to rang_proy_admin;
connect rang_proy_admin/admin

create or replace fuction fx_creaCsv(
 v_status varchar2
)return varchar2 is 
 cursor cur_mascotas is
 select m.mascota_id, m.nombre, m.folio, m.fecha_ingreso, m.fecha_nacimiento, m.tipo_ingreso, m.centro_operativo_id,
 n.mascota_madre_id, n.mascota_padre_id, n.centro_operativo_id as centro_nacimiento_id,
 d.cliente_id as cliente_donador_id,
 t.nombre as tipo_animal, t.subcategoria t.nivel_cuidados 
 from mascota m 
 natural join tipo t using (tipo_id) 
 natural join status s using (status_id) 
 right outer join nacido n on m.mascota_id = n.mascota_id
 right outer join donado d on m.mascota_id = d.mascota_id
 where s.nombre = v_status;
 v_str varchar2;

begin
 v_str := 'mascota_id,nombre,folio,fecha_ingreso,fecha_nacimiento,tipo_ingreso,centro_operativo_id,mascota_madre_id,mascota_padre_id'
 ||',centro_nacimiento_id,cliente_donador_id,tipo_animal,subcategoria,nivel_cuidados';
 for i in cur_mascotas loop
  
 end loop;
end;
/

!mkdir -p /tmp/proyecto/csv
!cp empleado_ext.csv /tmp/proyecto/csv
!chmod 777 /tmp/proyecto/csv
--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: asigna al ganador en mascota_solicitud y actualiza es estatus de mascota

--Procedimiento para asignar un dato a la tabla mascota_solicitud
create or replace procedure pr_creaSolicitud(
    v_mascota_folio in varchar2, v_cliente_username in varchar2
) is
 v_fecha date;
 v_mascota_id number;
 v_cliente_id number;
 v_count number;
 v_status_id number;
begin
 select sysdate into v_fecha from dual;
 select mascota_id into v_mascota_id from mascota where folio = v_mascota_folio;
 select cliente_id into v_cliente_id from cliente where username = v_cliente_username;
 select count(*) into v_count from mascota_solicitud where mascota_id = v_mascota_id;
 if v_count = 0 then
  select status_id into v_status_id from status where nombre = 'solicitada adopcion';
  update mascota set status_id = v_status_id, fecha_status = v_fecha where mascota_id = v_mascota_id;
 end if;
 insert into mascota_solicitud (mascota_id, cliente_id, fecha_solicitud ) values (v_mascota_id,v_cliente_id,v_fecha);
end;
/

--Asigna al cliente que va adoptar y si este da alguna donacion
create or replace procedure pr_asignaGanador(
 v_mascota_folio in varchar2, v_cliente_username in varchar2, v_monto in number default null, v_fecha_donacion in char default null
) is 
 v_fecha date;
 v_status_id number;
 v_mascota_id number;
 v_cliente_id number;
begin

 select status_id into v_status_id from status where nombre = 'adoptada';
 select sysdate into v_fecha from dual;
 select mascota_id into v_mascota_id from mascota where folio = v_mascota_folio;
 select cliente_id into v_cliente_id from cliente where username = v_cliente_username;
 update mascota_solicitud set ganador=1 where mascota_id = v_mascota_id and cliente_id = v_cliente_id;
 update mascota set fecha_status = v_fecha, status_id = v_status_id, cliente_id = v_cliente_id where mascota_id = v_mascota_id;
 if v_monto is not null then
  if v_fecha_donacion is not null then 
   insert into donacion values (v_mascota_id,v_cliente_id,v_monto,v_fecha_donacion);
  else
   insert into donacion values (v_mascota_id, v_cliente_id,v_monto,v_fecha);
  end if;
 end if;
end;
/
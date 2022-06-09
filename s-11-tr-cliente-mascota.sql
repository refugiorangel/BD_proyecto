--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Valida que un cliente solo pueda tener 5 mascotas 
--              y que una mascota solo tenga un duenio

create or replace trigger trg_cliente_mascota_ganador
before insert or update of ganador, cliente_id,mascota_id on mascota_solicitud
for each row
declare 
 v_count number;
 v_id number;
begin
 v_id := :new.cliente_id;
 select coun(*) into v_count from mascota_solicitud where cliente_id =v_id and ganador = 1;
 
 if v_count = 5 then
  raise_application_error(-20001, 'EL CLIENTE CON ID '||v_id' YA CUENTA CON 5 MASCOTAS');
 end if;

 v_id := :new.mascota_id;
 select count(*) into v_count from mascota_solicitud where mascota_id = v_id and ganador = 1;

 if v_count = 1 then
  raise_application_error(-20002, 'LA MASCOTA YA CUENTA CON DUENIO');
 end if;

 
end;
/
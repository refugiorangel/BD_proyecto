--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creacion del segundo trigger, auto insert en historico

create or replace trigger trg_hist_ststus_mascota
after insert or update of status_id, fecha_status on mascota 
for each row
declare
v_status_id number;
v_fecha_status date;
v_hist_id number;
v_mascota_id number;
begin


select historico_status_mascota_seq.nextval into v_hist_id from dual;

v_status_id := :new.status_id;
v_fecha_status := :new.fehca_status;
v_mascota_id := :new.mascota_id;


insert into historico_status_mascota values (v_hist_id,v_fecha_status,v_status_id,v_mascota_id);
end;
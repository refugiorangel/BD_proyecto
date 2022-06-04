--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creacion del tercer trigger, valida que el numero de las consultas sean consecutivas

create or replace trigger trg_mascota_cliente_consultas
before insert or delete or update fehca_consulta, numero on mascota_cliente_clinica
for each row
declare
 v_count number;
 v_num_ant number;
 v_fecha_des date;
 v_fecha_ant date;
begin 
 case 
  when inserting then
   select max(numero), max(fecha_consulta) into v_num_ant,v_fecha_ant from mascota_cliente_clinica 
    where cliente_id = :new.cliente_id and mascota_id = :new.mascota_id;
   
   if 1 != :new.numero - v_num_ant then
    raise_application_error(-20010,'NUMEROS CONSECUTIVOS INCORRECTOS. SE ESPERA '||v_num_ant + 1||'. SE OBTIENE '|| :new.numero);
   end if;

   if :new.fecha_consulta < v_fecha_ant then
    raise_application_error(-20011, 'IMCOMPATIBILIDAD DE FECHAS. CONSULTA '||:new.numero||' CON FECHA '||:new.fecha_consulta
    ||'. SE ESPERA FECHA POSTERIOR A '||v_fecha_ant);
   end if;
   
  when deleting then
   select max(numero) into v_num_ant from mascota_cliente_clinica 
   where mascota_id = :old.mascota_id and cliente_id = :old.cliente_id;
  
   if :old.numero != v_num_ant then
    raise_application_error(-20012,'LA CONSULTA A ELIMINAR NO ES LA ULTIMA');
   end if; 
  
  when updating ('fecha_consulta') then
   select fecha_consulta into v_fecha_ant from mascota_cliente_clinica 
    where mascota_id = :new.mascota_id and cliente_id = :new.cliente_id and numero = :new.numero-1;
   select fecha_consulta into v_fecha_des from mascota_cliente_clinica 
    where mascota_id = :new.mascota_id and cliente_id = :new.cliente_id and numero = :new.numero+1;
   select max(numero) into v_num_ant from mascota_cliente_clinica 
    where cliente_id = :new.cliente_id and mascota_id = :new.mascota_id;
   
   if :new.numero = 1 then
    if :new.fecha_consulta > v_fecha_des then
     raise_application_error(-20013,'ERROR FECHA POSTERIOR');
    end if;
   elsif :new.numero = v_num_ant then
    if :new.fecha_consulta < v_fecha_ant then
     raise_application_error(-20014,'ERROR FECHA ANTERIOR');
    end if;
   else
    if :new.fecha_consulta > v_fecha_des or :new.fecha_consulta < v_fecha_ant then
     raise_application_error(-20015,'ERROR FECHA INTERMEDIA');
    end if;
   end if;

 end case;
end;
/
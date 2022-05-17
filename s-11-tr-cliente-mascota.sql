--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creacion del primer trigger, valida que un cliente solo pueda tener 5 mascotas

create or replace trigger trg_cliente_mascota_ganador
after insert of update of ganador on mascota_cliente
begin
    
end;
/
--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: crea una funcion que calcula el total de donaciones que ha hecho un cliente

create or replace function fx_cliente_donaciones(
 v_str varchar2, v_tipo char
) return number is
 v_id number;
 v_sum number;
begin
 
 case v_tipo
  when 'C' then
   select cliente_id into v_id from cliente where username = v_str;
   select sum(monto_donativo) into v_sum from donacion where cliente_id = v_id;
   
  when 'M' then
   select sum(monto_donativo) into v_sum from donacion where to_char(fecha_donativo,'MM/YYYY') = v_str;
 end case;
end;
/
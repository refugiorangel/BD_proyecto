--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: crea una funcion que calcula la factura de una 
--              mascota adoptada de acuerdo al mes o segun el cliente

create or replace function fx_factura_mascota(
 v_str varchar2,
 v_tipo_factura char(1),
 v_fecha varchar2 default null

) return number is
 v_mascota_id number;
 v_cliente_id number;
 v_centro_id number;
 v_empleado_id number;
 v_sum number;
begin

 case v_tipo_factura

  when 'M' then
   select mascota_id into v_mascota_id from mascota where folio = v_str;
   if v_fecha is not null then
    select sum(costo) into v_sum from mascota_cliente_clinica where mascota_id = v_mascota_id 
    and to_char(fecha_consulta, 'MM/YYYY') = v_fecha;
   else
    select sum(costo) into v_sum from mascota_cliente_clinica where mascota_id = v_mascota_id;
   end if;

  when 'E' then
   select empleado_id into v_empleado_id from empleado where curp = v_str;
   if v_fecha is not null then
    select sum(costo) into v_sum from mascota_cliente_clinica where empleado_id = v_empleado_id 
    and to_char(fecha_consulta, 'MM/YYYY') = v_fecha;
   else
    select sum(costo) into v_sum from mascota_cliente_clinica where empleado_id = v_empleado_id;
   end if;

  when 'C' then
   select cliente_id into v_cliente_id from cliente where username = v_str;
      if v_fecha is not null then
    select sum(costo) into v_sum from mascota_cliente_clinica where cliente_id = v_cliente_id 
    and to_char(fecha_consulta, 'MM/YYYY') = v_fecha;
   else
    select sum(costo) into v_sum from mascota_cliente_clinica where cliente_id = v_cliente_id;
   end if;

  when 'L' then
   select centro_operativo_id into v_centro_id from centro_operativo where codigo = v_str;
      if v_fecha is not null then
    select sum(costo) into v_sum from mascota_cliente_clinica where centro_operativo_id = v_centro_id 
    and to_char(fecha_consulta, 'MM/YYYY') = v_fecha;
   else
    select sum(costo) into v_sum from mascota_cliente_clinica where centro_operativo_id = v_centro_id;
   end if;

  when 'F' then
   select sum(costo) into v_sum from mascota_cliente_clinica where to_char(fecha_consulta, 'MM/YYYY') = v_str;
 
 end case;
 return v_sum;
end;
/
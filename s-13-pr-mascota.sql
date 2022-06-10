--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: crea una nueva mascota junto con su subtipo y la tabla tipo

create or replace function fx_obtieneTipoid(
    v_nombre in varchar2, v_subcategoria in varchar2, v_nivel_cuidados in number
) return number is
 v_id number;
 v_count number;
begin
 select count(*) into v_count from tipo where nombre = v_nombre 
 and subcategoria = v_subcategoria and nivel_cuidados = v_nivel_cuidados;
 if v_count != 0 then 
  select tipo_id into v_id from tipo where nombre = v_nombre and subcategoria = v_subcategoria 
   and nivel_cuidados = v_nivel_cuidados;
 else 
  select tipo_seq.nextval into v_id from dual;
  insert into tipo values (v_id,v_nombre,v_subcategoria,v_nivel_cuidados);
 end if;
 return v_id;
end;
/
 
create or replace procedure pr_creaMascota(
    v_nombre in varchar2, v_folio in varchar2,v_fecha_nac in date, v_tipo in varchar2, 
    v_subcategoria in varchar2, v_nivel_cuidados in number, v_refugio_codigo in varchar2,
    --En caso de ser nacido por
    v_madre_folio in varchar2 default null, v_padre_folio in varchar2 default null, v_refugio_nacido_codigo in varchar2 default null,
    --Caso donde es donado por un cliente
    v_cliente_username in varchar2 default null
) is 
 v_id number;
 v_cliente_id number;
 v_tipo_id number;
 v_madre_id number;
 v_padre_id number;
 v_nacido_id number;
 v_centro_id number;
 v_status_id number;
 
begin

 select centro_operativo_id into v_centro_id from centro_operativo where codigo = v_refugio_codigo;
 select status_id into v_status_id from status where nombre = 'en refugio';
 select mascota_seq.nextval into v_id from dual;
 v_tipo_id := fx_obtieneTipoid(v_tipo, v_subcategoria, v_nivel_cuidados);

 if v_cliente_username is not null then
 
  select cliente_id into v_cliente_id from cliente where username = v_cliente_username;
  
  insert into mascota 
  (mascota_id, nombre, folio, fecha_status, fecha_ingreso, fecha_nacimiento, tipo_ingreso, tipo_id, status_id, centro_operativo_id)
  values (v_id, v_nombre, v_folio, sysdate, sysdate, v_fecha_nac, 'D', v_tipo_id, v_status_id,v_centro_id);
  
  insert into donado values (v_id,v_cliente_id);
 
 elsif v_madre_folio is not null and v_refugio_nacido_codigo is not null then  
  select mascota_id into v_madre_id from mascota where folio = v_madre_folio;
  select centro_operativo_id into v_nacido_id from centro_operativo where codigo = v_refugio_nacido_codigo;
  
  insert into mascota 
    (mascota_id, nombre, folio, fecha_status, fecha_ingreso, fecha_nacimiento, tipo_ingreso,tipo_id,status_id,centro_operativo_id)
   values (v_id, v_nombre, v_folio, sysdate, sysdate, v_fecha_nac, 'N', v_tipo_id, v_status_id,v_centro_id);
  
  if v_padre_folio is not null then
   select mascota_id into v_padre_id from mascota where folio = v_padre_folio;
   insert into nacido values (v_id, v_madre_id,v_padre_id,v_nacido_id);
  else 
   insert into nacido (mascota_id, mascota_madre_id, centro_operativo_id) 
    values (v_id, v_madre_id,v_nacido_id);
  end if;
  
 elsif v_cliente_username is null and v_madre_folio is null and v_padre_folio is null and v_refugio_nacido_codigo is null then
  insert into mascota (mascota_id, nombre, folio, fecha_ingreso, fecha_status, fecha_nacimiento, tipo_id, status_id, centro_operativo_id)
  values (v_id, v_nombre, v_folio, sysdate,sysdate,v_fecha_nac,v_tipo_id,v_status_id,v_centro_id);
  
 end if;
end;
/
--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: crea un nuevo centro operativo con su subtipo
create or replace prodedure pr_asginaPaginas(
 v_refugio_id in number, v_nombres in paginas
) is 
 v_id number;
begin
 for i in v_nombres.first..v_nombres.last loop
  select refugio_web_seq.nextval into v_id from dual;
  insert into refugio_web values (v_id, i, v_refugio_id);
 end loop;
end;
/

create or replace procedure pr_centro_operativo(
    v_nombre in varchar2, v_codigo in char(5), v_latitud in varchar2, v_longitud in varchar2
    v_direccion in varchar2, v_curp in varchar2,
    --si es refugio
    v_capacidad_maxima in number default null, v_lema in number default null, v_num_registro default null,
    v_centro_codigo in number default null, v_nombes in paginas default null,
    --si es clinica
    v_tel_emergencia in number default null, v_tel_cliente in number default null, v_hora_inicio in number default null,
    v_hora_fin in number default null,
    --si es oficina
    v_rfc in varchar2 default null, v_responsable in varchar2 default null
) is
 v_id number;
 v_centro_id number;
 v_empleado_id number;
 v_refugio number := 0;
 v_clinica number := 0;
 v_oficina number := 0;

begin

 select centro_operativo_seq.nextval into v_id from dual;
 select empledo_id into v_empleado_id from empleado where curp = v_curp;

 if v_capacidad_maxima is not null and v_lema is not null and v_num_registro is not null and v_nombres is not null then
  v_refugio := 1;
  if v_centro_codigo is not null then
   select centro_operativo_id into v_centro_id from centro_operativo where codigo = v_centro_codigo;
   insert into refugio values (v_id,v_capacidad_maxima,empty_blob(),v_lema,v_num_registro,v_centro_id);
  else 
   insert into refugio values (v_id,v_capacidad_maxima,empty_blob(),v_lema,v_num_registro,);
  end if;
  exec pr_asginaPaginas(v_id, v_nombres);
 end if;

 if v_tel_emergencia is not null and v_tel_cliente is not null and v_hora_fin is not null and v_hora_inicio is not null then
  v_clinica := 1;
  insert into clinica values (v_id,v_tel_emergencia,v_tel_cliente,v_hora_inicio,v_hora_fin);
 end if;

 if v_rfc is not null and v_responsable is not null then
  v_oficina := 1;
  insert into oficina values (v_id, v_rfc,empty_blob(),v_responsable);
 end if;
 
 if v_clinica = 0 and v_refugio = 0 and v_oficina = 0 then
  raise_application_error(-20021,'ERROR DE SUBTIPOS. NO ES POSIBLE AGREGAR UN CENTRO OPERATIVO SIN UN SUBTIPO');
 end if;
 
 insert into centro_operativo values
 (v_id, v_nombre, v_codigo, v_latitud, v_longitud, v_direccion, v_refugio, v_clinica, v_oficina,v_empleado_id);
end;
/

create or replace type paginas is table of varchar2(100);
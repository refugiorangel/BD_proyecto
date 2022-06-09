--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creación de sinonimos

--Sinonimo tabla historico_status_mascota
create or replace public synonym historico for historico_status_mascota;
create or replace public synonym mascota_adoptada_consultas for mascota_revision;
create or replace public synonym mascota_donada for donada;

--Dando permisos de lectura al usuario invidato
grant select on nacido to rang_proy_invitado;
grant select on empleado_titulo to rang_proy_invitado;
grant select on tipo to rang_proy_invitado;

--Conectando con el usuario invitado
connect rang_proy_invitado/invit

--Creando sinonimos del usuario invitado
create or replace synonym mascota_nacida for rang_proy_admin.nacido;
create or replace synonym tipo_mascota for rang_proy_admin.tipo;
create or replace synonym empleado_titulo for rang_proy_admin.empleado_titulo;

--Conectando con el usuario admin
connect rang_proy_admin/admin
--Creando sinonimo PL/SQL
set serveroutput on
Prompt =========
Prompt INICIANDO PROCEDIMIENTO PARA CREAR SINONIMOS
Prompt =========
Prompt 
declare
 c_line varchar2(400) := 'create or replace synonym rr_';
 v_line varchar2(400);
 cursor cur_names is select table_name from user_tables;
begin
 for i in cur_names loop
  v_line := c_line || i.table_name || ' for ' ||i.table_name;
  execute immediate v_line;
  dbms_output.put_line('OK! SINONIMO CREADO rr_'||i.table_name||' PARA '||i.table_name);
 end loop;
end;
/
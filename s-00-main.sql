--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: llama a todos los archivos
set serveroutput on
declare
v_count_admin number(1,0);
v_count_invitado number(1,0);
begin
select count(*) into v_count_admin
from dba_users
where username ='RANG_PROY_ADMIN';
select count(*) into v_count_invitado
from dba_users
where username = 'RANG_PROY_INVITADO';
if v_count_admin > 0 then
execute immediate 'RANG_PROY_ADMIN';
dbms_output.put_line('Usuario eliminado');
else
dbms_output.put_line('El usuario no existe, no se requiere eliminar');
end if;
if v_count_invitado > 0 then
execute immediate 'RANG_PROY_INVITADO';
dbms_output.put_line('Usuario eliminado');
else
dbms_output.put_line('El usuario no existe, no se requiere eliminar');
end if;
end;
/


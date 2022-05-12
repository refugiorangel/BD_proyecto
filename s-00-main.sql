--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: llama a todos los archivos
set serveroutput on
declare
v_count number(1,0);
begin
select count(*) into v_count
from dba_users
where username ='RR_PROY_ADMIN';
if v_count > 0 then
execute immediate 'RR_PROY_ADMIN';
dbms_output.put_line('Usuario eliminado');
else
dbms_output.put_line('El usuario no existe, no se requiere eliminar');
end if;
end;
/
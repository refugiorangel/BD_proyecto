--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: elimina a los usuario y roles
set serveroutput on
declare
    v_admin number(1,0);
    v_admin_role number(1,0);
    v_invitado_role number(1,0);
    v_invitado number(1,0);
begin
    select count(*) into v_admin
    from dba_users
    where username ='RANG_PROY_ADMIN';

    select count(*) into v_invitado
    from dba_users
    where username = 'RANG_PROY_INVITADO';

    select count(*) into v_admin_role
    from dba_roles
    where role = 'ROL_ADMIN';

    select count(*) into v_invitado_role
    from dba_roles
    where role = 'ROL_INVITADO';

    if v_admin > 0 then
        execute immediate 'drop user RANG_PROY_ADMIN cascade';
        dbms_output.put_line('Usuario eliminado');
    else
        dbms_output.put_line('El usuario no existe, no se requiere eliminar');
    end if;

    if v_invitado > 0 then
        execute immediate 'drop user RANG_PROY_INVITADO cascade';
        dbms_output.put_line('Usuario eliminado');
    else
        dbms_output.put_line('El usuario no existe, no se requiere eliminar');
    end if;

    if v_invitado_role > 0 then
        execute immediate 'drop role rol_invitado';
        dbms_output.put_line('Role eliminado');
    else
        dbms_output.put_line('El rol no existe, no se requiere eliminar');
    end if;

    if v_admin_role > 0 then
        execute immediate 'drop role rol_admin';
        dbms_output.put_line('Role eliminado');
    else
        dbms_output.put_line('El rol no existe, no se requiere eliminar');
    end if;
end;
/

!rm -rf /tmp/proyecto
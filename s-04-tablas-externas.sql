--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 15/05/2022
--@Descripción: Creación de tablas externas

--Tabla externa historico
connect sys/system as sysdba
create or replace directory tmp_dir as '/tmp/proyecto/externa';
grant read, write on directory tmp_dir to rang_proy_admin;
connect rang_proy_admin/admin
create table empleado_ext(
    empleado_id         number(10,0),
    nombre              varchar2(20),
    ap_paterno          varchar2(20),
    ap_materno          varchar2(20),
    curp                char(18),
    email               varchar2(20),
    cedula              varchar2(8),
    sueldo_mensual      number(7,2),
    fecha_ingreso       date,  
    gerente             number(1,0),
    administrativo      number(1,0),
    veterinario         number(1,0)
) organization external (
    type oracle_loader
    default directory tmp_dir 
    access parameters (
        records delimited by newline
        badfile tmp_dir: 'empleado_ext_bad.log'
        logfile tmp_dir: 'empleado_ext.log'
        fields terminated by ','
        lrtrim
        missing field values are null
        (
            empleado_id, nombre, ap_paterno, ap_materno,curp,
            email, cedula,sueldo_mensual, fecha_ingreso date mask "dd/mm/yyyy", gerente,
            administrativo, veterinario
        )
    )
    location ('empleado_ext.csv')
) reject limit unlimited;

!mkdir -p /tmp/proyecto/externa
!cp empleado_ext.csv /tmp/proyecto/externa
!chmod 777 /tmp/proyecto/externa
--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 15/05/2022
--@Descripción: Creación de tablas externas

--Tabla externa historico
create table empleado_ext(
    empleado_id         number(10,0)    not null,
    nombre              varchar2(20)    not null,
    ap_paterno          varchar2(20)    not null,
    ap_materno          varchar2(20)    not null,
    curp                char(18)        not null,
    email               varchar2(20)    not null,
    cedula              varchar2(8)     not null,
    sueldo_mensual      number(7,2)     not null,
    fecha_ingreso       date            not null,  
    es_gerente          number(1,0)     not null,
    es_administrativo   number(1,0)     not null,
    es_veterinario      number(1,0)     not null,
    constraint empleado_pk
        primary key (empleado_id),
    constraint empleado_tipo_chk
        check ((es_gerente,es_administrativo,es_veterinario) in ((1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(1,1,1))),
    constraint empleado_curp_uk
        unique (curp),
    constraint empleado_email_ik
        unique (email)
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
            email, cedula,sueldo_mensual, fecha_ingreso, gerente,
            administrativo, veterinario
        )
    )
    location ('empleado_ext.csv')
) reject limit unlimited;

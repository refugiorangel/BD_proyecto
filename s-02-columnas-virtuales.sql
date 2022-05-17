--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 17/05/2022
--@Descripción: Nuevas tablas con columnas virtuales

--Columnas viruales en mascota
create table mascota_virtual(
    mascota_id              number(10,0)    not null,
    nombre                  varchar2(20)    not null,
    folio                   char(8)         not null,
    fecha_ingreso           date     default sysdate,
    fecha_status            date     default sysdate,
    fecha_nacimiento        date            not null,
    tipo_ingreso            char(1)         not null,
    fecha_adopcion          date                null,
    causa_muerte            varchar2(100)       null,
    tipo_id                 number(10,0)    not null, 
    status_id               number(10,0)    not null,
    centro_operativo_id     number(10,0)    not null,
    anios_vida generated always as (get_years(fecha_nacimiento)) virtual,
    dias_refugio generated always as (get_days(fecha_ingreso)) virtual,
    constraint mascota_virtual_pk
        primary key (mascota_id),
    constraint mascota_virtual_folio_uk
        unique (folio),
    constraint mascota_virtual_origren_chk
        check (tipo_ingreso in ('N','D')),
    constraint mascota_virtual_status_id_fk
        foreign key (status_id)
        references status(status_id),
    constraint mascota_virtual_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references refugio(centro_operativo_id),
    constraint mascota_virtual_tipo_id_fk
        foreign key (tipo_id)
        references tipo(tipo_id)
);

--Columna virtual en empleado
create table empleado_virtual(
    empleado_id         number(10,0)    not null,
    nombre              varchar2(20)    not null,
    ap_paterno          varchar2(20)    not null,
    ap_materno          varchar2(20)    not null,
    curp                char(18)        not null,
    email               varchar2(20)    not null,
    cedula              varchar2(8)     not null,
    sueldo_mensual      number(7,2)     not null,
    fecha_ingreso       date     default sysdate,  
    es_gerente          number(1,0)     not null,
    es_administrativo   number(1,0)     not null,
    es_veterinario      number(1,0)     not null,
    anios_trabajados generated always as (get_years(fecha_ingreso)) virtual,
    constraint empleado_virtual_pk
        primary key (empleado_id),
    constraint empleado_virtual_tipo_chk
        check ((es_gerente,es_administrativo,es_veterinario) in ((1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(1,1,1))),
    constraint empleado_virtual_curp_uk
        unique (curp),
    constraint empleado_virtual_email_uk
        unique (email)
);

create or replace function get_days (fecha_ingreso date) return number deterministic is
begin
    return trunc(sysdate - fecha_ingreso);
end;
/

create or replace function get_years (fecha_nacimiento date) return number deterministic is
begin 
    return trunc((sysdate - fecha_nacimiento)/365);
end;
/
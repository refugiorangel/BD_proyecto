--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 15/05/2022
--@Descripción: Creación de tablas temporales

--Tabla temporal mascota sin subtipos
create global temporary table mascota_temporal(
    mascota_id          number(10,0)    not null,
    nombre              varchar2(20)    not null,
    folio               char(8)         not null,
    fecha_ingreso       date            not null,
    fecha_adopcion      date            not null,
    fecha_status        date            not null,
    fecha_nacimiento    date            not null,
    causa_muerte        varchar2(100)       null,
    tipo_id             char(1)             null,
    status_id           number(10,0)    not null,
    centro_operativo_id number(10,0)    not null,
    mascota_padre_id    number(10,0)        null,
    mascota_madre_id    number(10,0)        null,
    cliente_id          number(10,0)        null,
    centro_nacido_id    number(10,0)        null,
    constraint mascota_temporal_pk
        primary key (mascota_id),
    constraint mascota_tempporal_folio_uk
        unique (folio)
) on commit preserve rows;

--tabla temporal centro sin subtipos
create global temporary table centro_temporal(
    centro_operativo_id     number(10,0)    not null,
    nombre                  varchar2(20)    not null,
    codigo                  char(5)         not null,
    latitud                 varchar2(20)    not null,
    longitud                varchar2(20)    not null,
    direccion               varchar2(100)   not null,
    empleado_id             number(10,0)    not null,
    tipo                    char(2)         not null,
    capacidad_maxima        number(4,0)         null,
    logo                    varchar2(40)        null,
    lema                    varchar2(100)       null,
    munero_registro         char(8)             null,
    centro_alterno_id       number(10,0)        null,
    tel_emergencia          char(10)            null,
    tel_cliente             char(10)            null,
    hora_inicio             varchar2(5)         null,
    hora_fin                varchar2(5)         null,
    rfc                     char(18)            null,
    e_firma                 blob                null,
    responsable             varchar2(100)       null,
    constraint centro_temporal_pk
        primary key (centro_operativo_id),
    constraint centro_temporal_codigo_uk
        unique (codigo),
    constraint centro_temporal_empleado_id_uk
        unique (empleado_id),
    constraint centro_temporal_tipo_chk
        check (tipo in ('RE','CL','OF','RC')),
    constraint centro_temporal_alterno_chk
        check (centro_operativo_id != centro_alterno_id),
    constraint centro_temporal_rfc_uk
        unique (rfc),
    constraint centro_temporal_responsable_uk
        unique (responsable) 
) on commit delete rows;
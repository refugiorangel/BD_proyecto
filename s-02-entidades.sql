--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 09/05/2022
--@Descripción: Creación de tablas y constraints

--Tabla empleado
create table empleado(
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
        check (es_gerente,es_administrativo,es_veterinario) in ((1,0,0),(0,1,0),(0,0,1),(1,1,0),(1,0,1),(1,1,1)),
    constraint empleado_curp_uk
        unique (curp),
    constraint empleado_email_ik
        unique (email)
);

--Tabla empleado_titulo
create table empleado_titulo(
    empleado_titulo_id  number(10,0)    not null,
    fecha_titulacion    date            not null,
    titulo              varchar2(40)    not null,
    empleado_id         number(10,0)    not null,
    constraint empleado_titulo_pk
        primary key (empleado_titulo_id),
    constraint empleado_titulo_empleado_id_fk
        foreign key (empleado_id)
        references empleado (empleado_id)
);

--Tabla centro_operativo
create table centro_operativo(
    centro_operativo_id     number(10,0)    not null,
    nombre        varchar2(20)    not null,
    codigo        char(5)         not null,
    latitud       varchar2(20)    not null,
    longitud      varchar2(20)    not null,
    direccion     varchar2(100)   not null,
    es_refugio    number(1,0)     not null,
    es_clinica    number(1,0)     not null,
    es_oficina    number(1,0)     not null,
    empleado_id   number(10,0)    not null,
    constraint centro_operativo_pk
        primary key (centro_operativo_id),
    constraint centro_operativo_tipo_chk
        check (es_refugio,es_clinica,es_oficina) in ((1,0,0),(0,1,0),(0,0,1),(1,1,0)),
    constraint centro_operativo_codigo_uk 
        unique (codigo),
    constraint centro_operativo_empleado_id_fk
        foreign key (empleado_id)
        references empleado(empleado_id),
    constraint cnetro_operativo_empleado_id_chk
        unique (empleado_id)
);

--tabla administrativo
create table administrativo(
    empleado_id         number(10,0)    not null,
    constraint administrativo_pk
        primary key (empleado_id),
    constraint aministrativo_empleado_id_fk
        foreign key (empleado_id)
        references empleado(empleado_id)
);

--tabla gerente
create table gerente(
    empleado_id         number(10,0)    not null,
    constraint gerente_pk
        primary key (empleado_id),
    constraint gerente_empleado_id_fk
        foreign key (empleado_id)
        references empleado(empleado_id)
);

--Tabla veterinario
create table veterinario(
    empleado_id         number(10,0)    not null,
    constraint veterinario_pk
        primary key (veterinario_pk),
    constraint veterinario_empleado_id_fk
        foreign key (empleado_id)
        references empleado(empleado_id)
);

--Tabla refugio
create table refugio(
    centro_operativo_id number(10,0)    not null,
    capacidad_maxima    number(5,0)     not null,
    logo                varchar2(40)    not null,
    lema                varchar2(100)   not null,
    numero_registro     char(8)         not null,
    centro_alterno_id   number(10,0)        null,
    constraint refugio_pk
        primary key (centro_operativo_id),
    constraint refugio_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references centro_operativo(centro_operativo_id),
    constraint refugio_centro_alterno_id_fk
        foreign key (centro_alterno_id)
        references refugio(centro_operativo_id),
    constraint refugio_centro_alterno_chk
        check ((refugio_alterno_id is not null and centro_operativo_id != centro_alterno_id) or centro_alterno_id is null),
    constraint refugio_centro_alterno_id_uk
        unique (centro_alterno_id)
);

--Tabla refugio_web
create table refugio_web(
    refugio_web_id      number(10,0)    not null,
    web                 varchar2(100)   not null,
    centro_operativo_id number(10,0)    not null,
    constraint refugio_web_pk
        primary key (refugio_web_id),
    constraint refugio_web_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references refugio(centro_operativo_id),
    constraint refugio_web_uk
        unique (web)
);

--Tabla clinica
create table clinica(
    centro_operativo_id           number(10,0)    not null,
    tel_emergencia      char(10)        not null,
    tel_cliente         char(10)        not null,
    hora_inicio         varchar2(5)     not null,
    hora_fin            varchar2(5)     not null,
    constraint clinica_pk
        primary key (centro_operativo_id),
    constraint clinica_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references  centro_operativo(centro_operativo_id),
    constraint clinica_tel_emergencia_uk
        unique tel_emergencia,
    constraint clinica_tel_cliente_uk
        unique tel_cliente
);

--Tabla oficina
create table oficina(
    centro_operativo_id      number(10,0)    not null,
    rfc            char(18)        not null,
    e_firma        blob            not null,
    responsable    varchar2(100)   not null,
    constraint oficina_pk
        primary key (centro_operativo_id),
    constraint oficina_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references centro_operativo(centro_operativo_id),
    constraint oficina_responsable_uk
        unique (responsable),
    constraint oficina_e_firma_uk
        unique (e_firma),
    constraint oficina_rfc_uk
        unique (rfc)
);

--Tabla tipo
create table tipo(
    tipo_id         number(10,0)    not null,
    nombre          varchar2(20)    not null,
    subcategoria    varchar2(20)    not null,
    nivel_cuidados  number(1)       not null,
    constraint tipo_pk
        primary key (tipo_id),
    constraint tipo_nivel_cuidados_chk
        check (nivel_cuidados > 0 and nivel_cuidados < 6)
);

--Tabla status
create table status(
    status_id       number(10,0)    not null,
    nombre          varchar2(20)    not null,
    constraint status_pk
        primary key (status_id)
);

--Tabla cliente
create table cliente(
    cliente_id      number(10,0)    not null,
    nombre          varchar2(20)    not null,
    ap_paterno      varchar2(20)    not null,
    ap_materno      varchar2(20)    not null,
    direccion       varchar2(100)   not null,
    ocupacion       varchar2(20)    not null,
    username        varchar2(20)    not null,
    password        varchar2(20)    not null,
    constraint cliente_pk
        primary key (cliente_id),
    constraint cliente_username_uk
        unique (username)
);

--Tabla mascota
create table mascota(
    mascota_id              number(10,0)    not null,
    nombre                  varchar2(10,0)  not null,
    folio                   char(8)         not null,
    fecha_ingreso           date            not null,
    fecha_adopcion          date            not null,
    fecha_status            date     default sysdate,
    fecha_nacimiento        date            not null,
    tipo_ingreso            char(1)         not null,
    causa_muerte            varchar2(100)       null,
    tipo_id                 number(10,0)    not null, 
    status_id               number(10,0)    not null,
    centro_operativo_id     number(10,0)    not null,
    constraint mascota_pk
        primary key (mascota_id),
    constraint mascota_folio_uk
        unique (folio),
    constraint mascota_origren_chk
        check tipo_ingreso in ('N','D'),
    constraint mascota_status_id_fk
        foreign key (status_id)
        references status(status_id),
    constraint mascota_centro_operativo_id_fk
        foreign key (centro_operativo_id)
        references refugio(centro_operativo_id),
    constraint mascota_tipo_id_fk
        foreign key (tipo_id)
        references tipo(tipo_id)
);

--Tabla nacido
create table nacido(
    mascota_id              number(10,0)    not null,
    es_madre                number(1,0)         null,
    es_padre                number(1,0)         null,
    mascota_progenitor_id   number(10,0)    not null,
    constraint nacido_pk
        primary key (mascota_id),
    constraint nacido_mascota_id_fk
        foreign key (mascota_id)
        references mascota(mascota_id),
    constraint nacido_mascota_progenitor_id_fk
        foreign key (mascota_progenitor_id)
        references mascota(mascota_id),
    constraint check nacido_parcial_exclusiva_chk 
        check (mascota_id != mascota_progenitor_id)
);

--Tabla donado
create table donado(
    mascota_id      number(10,0)    not null,
    cliente_id      number(10,0)    not null,
    constraint donado_pk
        primary key (mascota_id),
    constraint donado_mascota_id_fk
        foreign key (mascota_id)
        references mascota(mascota_id),
    constraint donado_cliente_id_fk
        foreign key (cliente_id)
        references cliente(cliente_id),
);

--Tabla historico_status_mascota
create table historico_status_mascota(
    historico_status_mascota_id     number(10,0)    not null,
    fecha_status                    date            not null,
    status_id                       number(10,0)    not null,
    mascota_id                      number(10,0)    not null,
    constraint historico_status_mascota_pk
        primary key (historico_status_mascota_id),
    constraint historico_status_mascota_status_id_fk
        foreign key (status_id)
        references status(status_id),
    constraint historico_status_mascota_mascota_id
        foreign key (mascota_id)
        references mascota(mascota_id)
);

--Tabla mascota_cliente
create table mascota_cliente(
    mascota_id      number(10,0)    not null,
    cliente_id      number(10,0)    not null,
    ganador         number(1,0)     not null,
    monto_donativo  number(6,2)         null,
    fecha_donativo  date                null,
    descripcion     varchar2(200)       null,
    constraint mascota_cliente_pk
        primary key (mascota_id,cliente_id),
    constraint mascota_cliente_mascota_id_fk
        foreign key (mascota_id)
        references mascota(mascota_id),
    constraint mascota_cliente_cliente_id_fk
        foreign key (cliente_id)
        references cliente(cliente_id),
    constraint mascota_cliente_adoptado_chk
        check adoptado in (1,0),
    constraint mascota_cliente_descripcion_chk
        check ((adoptado=0 and descripcion is not null) or adoptado=1),
    constraint mascota_cliente_donativo_chk
        check ((monto_donativo is not null and fecha_donativo is not null and ganador=1) or (monto_donativo is null and fecha_donativo is null))
);

--Tabla mascota_cliente_clinica
create table mascota_cliente_clinica(
    costo               number(6,0)     not null,
    numero              number(2,0)     not null,
    nivel_salud         number(2,0)     not null,
    observaciones       varchar2(200)   not null,
    fecha_consulta      date            not null,
    centro_operativo_id number(10,0)    not null,
    mascota_id          number(10,0)    not null,
    constraint mascota_cliente_clinica_pk
        primary key (),
    constraint mascota_cliente_clinica_centro_operativo_id_fk
        foreign key(centro_operativo_id)
        references clinica(centro_operativo),
    constraint mascota_cliente_clinica_mascota_id_fk
        foreign key (mascota_id)
        references (mascota_id),
    constraint mascota_cliente_clinica_nivel_salud_chk
        check (nivel_salud <=10 and nivel_salud >=1)
);

create table empleado_mascota(
    emlpeado_id     number(10,0)    not null,
    mascota_id      number(10,0)    not null,
    estado          number(2,0)     not null,
    foto            varchar2(40)    not null,
    descripcion     varchar2(200)   not null,
    fecha_revision  date            not null,
    constraint empleado_mascota_pk
        primary key (empleado_id, mascota_id),
    constraint empleado_mascota_empleado_id_fk
        foreign key (empleado_id)
        references empleado(empleado_id),
    constraint empleado_mascota_mascota_id_fk
        foreign key (mascota_id)
        references mascota(mascota_id),
    constraint macota_empleado_estado_chk
        check (estado <=10 and estado >=1)
);
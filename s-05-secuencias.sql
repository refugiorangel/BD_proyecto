--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: crea las secuencias para las tablas

--secuencia tabla empleado
create sequence empleado_seq
    start with 0
    increment by 1 
    minvalue 0
    nocycle
    cache 5;

--Secuencia empleado_titulo
create sequence empleado_titulo_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle;

--Sequencia tabla centro
create sequence centro_operativo_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle
    cache 5;

--Sequencua tabla refugio web
create sequence refugio_web_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle;

--Sequencia tabla status
create sequence status_seq
    start with 0
    minvalue 0
    maxvalue 7
    nocycle;

--Sequencia tabla tipo
create sequence tipo_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle;

--Sequencia tabla historico status mascota
create sequence historico_status_mascota_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle
    cache 5;

--Sequencia tabla cliente
create sequence cliente_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle
    cache 5;

--Sequencia tabla mascota
create sequence mascota_seq
    start with 0
    increment by 1
    minvalue 0
    nocycle
    cache 5;

--
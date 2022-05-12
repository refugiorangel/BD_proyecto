--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: crea las secuencias para las tablas

--secuencia tabla empleado
create sequence empleado_seq
    start with 0
    min value 1
    increment by 1
    no cycle
    cache 5;

--Secuencia tabla centro
create sequence centro_seq
    start with 0
    min value 1
    increment by 1
    no cycle
    cache 5;

--Sequencua tabla refugio web
create sequence refugio_web_seq
    start with 0
    increment by 1
    min value 1
    no cycle
    cache 5;

--Sequencia tabla status
create sequence status_seq
    start with 0
    min value 1
    max value 7
    cycle
    cache 5;

--Sequencia tabla tipo
create sequence tipo_seq
    start with 0
    incremebt by 1
    min value 1
    no cycle;

--Sequencia tabla historico status mascota
create sequence historico_status_mascota_seq
    start with 0
    increment by 1
    min value 1
    no cycle;

--Sequencia tabla cliente
create sequence cliente_seq
    start with 0
    increment by 1
    min value 1
    no cycle;

--Sequencia tabla mascota
create sequence mascota_seq
    start with 0
    increment by 1
    min value 1
    no cycle;

--
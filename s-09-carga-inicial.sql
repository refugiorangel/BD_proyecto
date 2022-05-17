--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Carga inicial a las tablas

--Tabla status
insert into status values(status_seq.nextval,'en refugio');
insert into status values(status_seq.nextval,'disponible adopcion');
insert into status values(status_seq.nextval,'solicitada adopcion');
insert into status values(status_seq.nextval,'adoptada');
insert into status values(status_seq.nextval,'enferma');
insert into status values(status_seq.nextval,'fallecida refugio');
insert into status values(status_seq.nextval,'fallecida hogar');

--Tabla tipo
insert into tipo values(tipo_seq.nextval,'ave','canario',3);
insert into tipo values(tipo_seq.nextval,'ave','gallina',3);
insert into tipo values(tipo_seq.nextval,'ave','pavo',3);
insert into tipo values(tipo_seq.nextval,'perro','bulldog',3);
insert into tipo values(tipo_seq.nextval,'perro','chichuahua',3);
insert into tipo values(tipo_seq.nextval,'perro','pitbull',3);
insert into tipo values(tipo_seq.nextval,'gato','persa',3);
insert into tipo values(tipo_seq.nextval,'conejo','holandes',3);
insert into tipo values(tipo_seq.nextval,'conejo','californiano',3);
insert into tipo values(tipo_seq.nextval,'huron','bull',3);
insert into tipo values(tipo_seq.nextval,'huron','whippet',3);

insert into empleado values (empleado_seq.nextval,'MARGARITA','FAJES','BUENROSTRO','FABM770222MMSJNR00','margarita@gmail.com','12345678',12000.00,to_date('10/12/2015','DD/MM/YYYY'),1,1,1);
insert into centro_operativo values (centro_operativo_seq.nextval,'Ignacio ramirez','1234A','66° 33’ 9’’ N','11° 04’ 13’’ E','Calle 83 S/N C.P. 15902',1,1,0,empleado_seq.currval);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('03/02/2000','DD/MM/YYYY'),'Medico Veterinario',empleado_seq.currval);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('15/05/2012','DD/MM/YYYY'),'Licenciado en Administracion',empleado_seq.currval);
insert into empleado values (empleado_seq.nextval,'MARGARITA','FAJES','BUENROSTRO','FABM770222MMSJNR00','margarita@gmail.com','12345678',7000.00,to_date('10/12/2015','DD/MM/YYYY'),1,1,1);
insert into refugio values (centro_operativo_seq.currval,300,'igacio_ramirez.pgn','Los animales tambien sienten','cdkjn1392',);
insert into clinica values (centro_operativo_seq.currval,'5519478502','5620481029','9:00','15:00');


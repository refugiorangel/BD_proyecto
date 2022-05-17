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

--Tabla emplado
insert into empleado values (empleado_seq.nextval,'MARGARITA','FAJES','BUENROSTRO','FABM770222MMSJNR00','margarita@gmail.com','12345678',12000.00,to_date('10/12/2015','DD/MM/YYYY'),1,1,1);
insert into empleado values (empleado_seq.nextval,'MARISOL','SANCHEZ','PEREZ','SAPM880429MTSNRR00','marisol@gmail.com','73302099',6401,to_date('19/6/2017','DD/MM/YYYY'),0,1,0);
insert into emplaedo values (empleado_seq.nextval,'MAGDALENA','GONZALEZ','RODRIGUEZ','GORM680121MTSNDG06','magdalena@gmail.com','77419974',8408,to_date('27/1/2011','DD/MM/YYYY'),0,0,1);
insert into empleado values (empleado_seq.nextval,'TERESO','ALVAREZ','LOPEZ','AALT601015HTSLPR00','tereso@gmail.com','86146195',9020,to_date('06/09/2008','DD/MM/YYYY'),1,1,0);
insert into empleado values (empleado_seq.nextval,'EFRAIN','GONZALEZ','RUBIO','GORE781222HTSNBF01','efrain@gmail.com','57843675',14541,to_date('16/09/2018','DD/MM/YYYY'),1,0,1);
insert into empleado values (empleado_seq.nextval,'RAUL','ESPRIELLA','NIETO','EINR840427HTSSTL05','raul@gmail.com','26470963',15012,to_date('30/9/2010','DD/MM/YYYY'),1,0,0);

--Tabla centro_operativo
insert into centro_operativo values (centro_operativo_seq.nextval,'Ignacio ramirez','1234A','74.0267','-113.0729','Calle 83 S/N C.P. 15902',1,1,0,1);
insert into centro_operativo values (centro_operativo_seq.nextval,'Operativa Norte','4A23B','-60.5934','136.4859','Calle Morelos Esq. Anáhuac, Col. Santa Isabel Tola C.P. 07010',0,0,1,6);
insert into centro_operativo values (centro_operativo_seq.nextval,'Operativa Sur','SDF23','-3.6545','-105.7351','Av. Nuevo León S/N, Col. Villa Milpa Alta C.P. 12000',0,1,0,5);
insert into centro_operatico values (centro_operativo_seq.nextval,'Operativa Poniente','MHJ567','69.5940','85.8739','Asistencia Pública y Norte 3, Col. Federal C.P. 08700',1,0,0,4);

--Tabla refugio
insert into refugio values (1,500,'ignacio_ramirez.png','Los ojos de un animal tienen el poder de hablar un gran lenguaje','12345678');
insert into refugio values (4,800,'poniente.png','Mi raza favorira es adoptado','23456789');

--Tabla clinica
insert into clinica values (1,'5595792045','5519037519','9:00','17:00');
insert into clinica values (3,'5610934810','5629374920','10:00','20:00');

--Tabla oficina
insert into oficina values (2,'PONC100520988',,'ESPRIELLA NIETO EINR840427HTSSTL05');

--Tabla empleado_titulo
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('03/02/2000','DD/MM/YYYY'),'Medico Veterinario',1);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('15/05/2012','DD/MM/YYYY'),'Licenciado en Administracion',1);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('20/01/2005','DD/MM/YYYY'),'Licenciado en Contaduria y Administracion',2);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('30/12/2004','DD/MM/YYYY'),'Medico Veterinario Zootecnista',3);

--Tabla refugio_web
insert into refugio_web values (refugio_web_seq.nextval,'https://www.ignacioramirez.org',1);
insert into refugio_web values (refugio_web_seq.nextval,'https://www.clinicaramirez.org',1);
insert into refugio_web values (refugio_web_seq.nextval,'https://www.refugioponiente.org',4);

--Tabla mascota
insert into mascota values ();

--Tabla nacido
insert into nacido values ();

--Tabla donado
insert into donado values ();

--Tabla cliente
insert into cliente values ();

--Tabla historio_status_mascota
insert into historio_status_mascota values ();

--Tabla mascota_cliente
insert into mascota_cliente values ();

--Tabla mascota_cliente_clinica
insert into mascota_cliente_clinica values ();

--Tabla empleado_mascota
insert into empleado_mascota values ();

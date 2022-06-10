--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Carga inicial a las tablas

--Tabla status
insert into status values(status_seq.nextval,'en refugio','ERF');
insert into status values(status_seq.nextval,'disponible adopcion','DAP');
insert into status values(status_seq.nextval,'solicitada adopcion','SAP');
insert into status values(status_seq.nextval,'adoptada','ADP');
insert into status values(status_seq.nextval,'enferma','ENF');
insert into status values(status_seq.nextval,'fallecida refugio','FER');
insert into status values(status_seq.nextval,'fallecida hogar','FEH');

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
insert into empleado values (empleado_seq.nextval,'MAGDALENA','GONZALEZ','RODRIGUEZ','GORM680121MTSNDG06','magdalena@gmail.com','77419974',8408,to_date('27/1/2011','DD/MM/YYYY'),0,0,1);
insert into empleado values (empleado_seq.nextval,'TERESO','ALVAREZ','LOPEZ','AALT601015HTSLPR00','tereso@gmail.com','86146195',9020,to_date('06/09/2008','DD/MM/YYYY'),1,1,0);
insert into empleado values (empleado_seq.nextval,'EFRAIN','GONZALEZ','RUBIO','GORE781222HTSNBF01','efrain@gmail.com','57843675',14541,to_date('16/09/2018','DD/MM/YYYY'),1,0,1);
insert into empleado values (empleado_seq.nextval,'RAUL','ESPRIELLA','NIETO','EINR840427HTSSTL05','raul@gmail.com','26470963',15012,to_date('30/9/2010','DD/MM/YYYY'),1,0,0);

--Tabla centro_operativo
insert into centro_operativo values (centro_operativo_seq.nextval,'Ignacio ramirez','1234A','74.0267','-113.0729','Calle 83 S/N C.P. 15902',1,1,0,1);
insert into centro_operativo values (centro_operativo_seq.nextval,'Operativa Norte','4A23B','-60.5934','136.4859','Calle Morelos Esq. Anáhuac, Col. Santa Isabel Tola C.P. 07010',0,0,1,6);
insert into centro_operativo values (centro_operativo_seq.nextval,'Operativa Sur','SDF23','-3.6545','-105.7351','Av. Nuevo León S/N, Col. Villa Milpa Alta C.P. 12000',0,1,0,5);
insert into centro_operativo values (centro_operativo_seq.nextval,'Operativa Poniente','MHJ57','69.5940','85.8739','Asistencia Pública y Norte 3, Col. Federal C.P. 08700',1,0,0,4);

--Tabla refugio
insert into refugio values (1,500,empty_blob(),'Los ojos de un animal tienen el poder de hablar un gran lenguaje','12345678',null);
insert into refugio values (4,800,empty_blob(),'Mi raza favorira es adoptado','23456789',1);

--Tabla clinica
insert into clinica values (1,'5595792045','5519037519','9:00','17:00');
insert into clinica values (3,'5610934810','5629374920','10:00','20:00');

--Tabla oficina
insert into oficina values (2,'PONC100520988',empty_blob(),'ESPRIELLA NIETO EINR840427HTSSTL05');

--Tabla empleado_titulo
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('03/02/2000','DD/MM/YYYY'),'Medico Veterinario',1);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('15/05/2012','DD/MM/YYYY'),'Licenciado en Administracion',1);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('20/01/2005','DD/MM/YYYY'),'Licenciado en Contaduria y Administracion',2);
insert into empleado_titulo values (empleado_titulo_seq.nextval,to_date('30/12/2004','DD/MM/YYYY'),'Medico Veterinario Zootecnista',3);

--Tabla refugio_web
insert into refugio_web values (refugio_web_seq.nextval,'https://www.ignacioramirez.org',1);
insert into refugio_web values (refugio_web_seq.nextval,'https://www.clinicaramirez.org',1);
insert into refugio_web values (refugio_web_seq.nextval,'https://www.refugioponiente.org',4);

--Tabla cliente
insert into cliente values (cliente_seq.nextval,'Juan','Camacho','De la cruz','calle plazuela de los reyes n 4 col. los reyes coyoacan','Licenciado en Tecnologia de Alimentos','JUAN_CAMACHO', dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw('123home456')));
insert into cliente values (cliente_seq.nextval,'Paulo Anibal','Bouchikhi', 'Buzea','Real del Padure No. 407','Soldado','paulo_anibal',dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw('paulo123')));
insert into cliente values (cliente_seq.nextval,'Casia Nazarena','Joga','Dahmouni','Cagide No. 310','Actor','casia_joga',dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw('casga098')));
insert into cliente values (cliente_seq.nextval,'Thalia','Motellon','Pitalua','Igoryok No. 90','Licenciado en Biotecnologia','thalia_pita',dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw('thalia')));
insert into cliente values (cliente_seq.nextval,'Robertino Joaquin','Santacruz','Snoussi','Calle Guaira No. 561','Licenciado en Analista-Programacion','robert_snou', dbms_obfuscation_toolkit.md5(input => utl_raw.cast_to_raw('robertino96')));

--Tabla mascota
insert into mascota values (mascota_seq.nextval,'Trufa','12345678',to_date('25/05/2022','DD/MM/YYYY'),to_date('25/05/2022','DD/MM/YYYY'),to_date('15/02/2019','DD/MM/YYYY'),'D',null,null,6,1,1,null);
insert into mascota values (mascota_seq.nextval,'Pelota','23456789',to_date('10/04/2021','DD/MM/YYYY'),to_date('30/05/2021','DD/MM/YYYY'),to_date('01/10/2021','DD/MM/YYYY'),null,to_date('15/06/2021','DD/MM/YYYY'),null,4,4,null,2);
insert into mascota values (mascota_seq.nextval,'Taco','34567890',default, default, sysdate,'N',null,null,6,1,1,null);
insert into mascota values (mascota_seq.nextval,'Kinder','13579246',default,default,sysdate,'N',null,null,6,1,1,null);
insert into mascota values (mascota_seq.nextval,'Coco','24680135',to_date('08/05/2022','DD/MM/YYYY'),to_date('20/05/2022','DD/MM/YYYY'),to_date('12/12/2021','DD/MM/YYYY'),null,null,null,7,3,4,null);

--Tabla nacido 3,4
insert into nacido values (3,null,1,1);
insert into nacido values (4,null,1,1);

--Tabla donado 1
insert into donado values (1,4);

--Tabla historio_status_mascota
insert into historico_status_mascota values (historico_status_mascota_seq.nextval,sysdate,1,3);
insert into historico_status_mascota values (historico_status_mascota_seq.nextval,to_date('10/04/2021','DD/MM/YYYY'),1,2);
insert into historico_status_mascota values (historico_status_mascota_seq.nextval,to_date('25/04/2021','DD/MM/YYYY'),2,2);
insert into historico_status_mascota values (historico_status_mascota_seq.nextval,to_date('15/05/2021','DD/MM/YYYY'),3,2);
insert into historico_status_mascota values (historico_status_mascota_seq.nextval,to_date('30/05/2021','DD/MM/YYYY'),4,2);

--Tabla mascota_solicitud
insert into mascota_solicitud values (5,5,to_date('20/05/2022','DD/MM/YYYY'),null,null);
insert into mascota_solicitud values (5,1,to_date('30/05/2022','DD/MM/YYYY'),null,null);
insert into mascota_solicitud values (2,1,to_date('15/05/2021','DD/MM/YYYY'),null,1);

--Tabla mascota_revision
insert into mascota_revision values (2,1,700.00,5,'LA MASCOTA SE ENCUENTRA BIEN',to_date('20/11/2021','DD/MM/YYYY'),3,1);
insert into mascota_revision values (2,2,1000.00,4,'LA MASCOTA TIENE INFLAMACION',to_date('10/05/2022','DD/MM/YYYY'),1,3);

--Tabla donacion
insert into donacion values (2,2,2000.00,to_date('30/05/2021','DD/MM/YYYY'));

--Tabla empleado_mascota
insert into empleado_mascota values (5,2,10,empty_blob(),'NO PRESENTA ENFERMEDADES',to_date('20/04/2021','DD/MM/YYYY'));
insert into empleado_mascota values (1,2,10,empty_blob(),'NO PRESENTA ENFERMEDADES',to_date('20/04/2021','DD/MM/YYYY'));

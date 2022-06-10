--@Autor: Rangel de la Rosa Jose Refugio
--@Fecha creación: 09/05/2022
--@Descripción: llama a todos los archivos

--Conectand como sys
connect sys/system as sysdba
--Elimina a los usuarios y roles si ya estan creados
@@s-00-elimina.sql 
--Crea los roles y usuarios
@@s-01-usuarios.sql
--Conectarse como usuario rang_proy_admin
connect rang_proy_admin/admin
--Crea las tablas necesarias
@@s-02-entidades.sql 
@@s-02-columnas-virtuales.sql
--Crea las tablas temporales
@@s-03-tablas-temporales.sql
--Crea las tablas externas
@@s-04-tablas-externas.sql
--Crea las secuencias
@@s-05-secuencias.sql 
--Crea los indices
@@s-06-indices.sql
--Crea los sinonimos
@@s-07-sinonimos.sql
--Conectar como usuario admin
connect rang_proy_admin/admin
--Crea las vistas
@@s-08-vistas.sql
--Carga inicial de datos
@@s-09-carga-inicial.sql
--Consulta de datos
--@@s-10-consultas.SQL
--Crea trigger para el historico
@@s-11-tr-historico-mascota.sql
--Crea trigger para clinete mascota
@@s-11-tr-cliente-mascota.sql
--Crea trigger para las consultas de una mascota
@@s-11-tr-mascota-cliente-consultas.sql
--Prueba para el historico
--@@s-12-tr-historico-mascota-prueba.sql
--Prueba para mascota clietne
--@@s-12-tr-cliente-mascota-prueba.sql
--Prueba para las consultas de una mascota
--@@s-12-tr-mascota-cliente-consultas.sql
--Crea procedimiento para centro_operativo
@@s-13-pr-centro-operativo.sql
--Crea procedimiento para mascota_adoptado
@@s-13-pr-mascota-cliente-adoptado.sql
--Crea procedimiento crear una nueva mascota
@@s-13-pr-mascota.sql
--Prueba para el procedimiento de crear un centro
--@@s-14-pr-centro-operativo-prueba.sql
--Prueba para la adopcion de un cliente
--@@s-14-pr-mascota-cliente-adoptado-prueba.sql
--Prueba para crear una nueva mascota
--@@s-14-pr-mascota-prueba.sql
--Crea funcion para obtener la factura de la tabla mascota_revision segun los parametros
@@s-15-fx-factura-mascota.sql
--Crea funcion para retornar blob
@@s-15-fx-retorna-blob.sql
--Crea funcion para obtener el total de donaciones por cliente o por mes
@@s-15-fx-cliente-donaciones.sql




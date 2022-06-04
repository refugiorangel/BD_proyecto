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
@@s-10-consultas.SQL
--Crea trigger para el historico
@@s-11-tr-historico-mascota.sql
--Crea trigger para 


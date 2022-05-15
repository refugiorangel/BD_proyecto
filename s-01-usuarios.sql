--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 09/05/2022
--@Descripción: Creación de usuarios

--Conectando como sys
connect sys/system as sysdba

--Creando roles
create role rol_admin;
create role rol_invitado;
grant create session, create table, create sequence, create procedure, create index to rol_invitado;
grant create session;

--Creando usuarios;
create user rang_proy_admin identified by admin quota unlimited on users;
create user rang_proy_invitado identified by inv quota 500m on users;
grant rol_admin to rang_proy_admin;
grant rol_invitado to rang_proy_invitado;


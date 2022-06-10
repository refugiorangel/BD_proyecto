--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 09/05/2022
--@Descripción: Creación de usuarios

--Creando roles
create role rol_admin;
create role rol_invitado;
grant create session, create table, create sequence, create procedure, create any index, create trigger, 
create synonym, create public synonym, create view, create type to rol_admin;
grant create session, create synonym to rol_invitado;

--Creando usuarios;
create user rang_proy_admin identified by admin quota unlimited on users;
create user rang_proy_invitado identified by invit quota 500m on users;
grant rol_admin to rang_proy_admin;
grant rol_invitado to rang_proy_invitado;


--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 16/05/2022
--@Descripción: Creación de sinonimos

--Sinonimo tabla historico_status_mascota
create or replace synonym historico for historico_status_mascota;
create or replace synonym mascota_adoptada_consultas for mascota_cliente_clinica;
create or replace synonym mascota_donada for donada;

--Dando permisos de lectura al usuario invidato
grant select on nacido, tipo, empleado_titulo to rang_proy_invitado;

--Conectando con el usuario invitado
connect rang_pory_invitado/invit

--Creando sinonimos del usuario invitado
create or replace synonym mascota_nacida for rang_proy_admin.nacido;
create or replace synonym tipo_mascota for rang_proy_admin.tipo;
create or replace synonym empleado_titulo for rang_proy_admin.empleado_titulo;

--Creando sinonimo PL/SQL


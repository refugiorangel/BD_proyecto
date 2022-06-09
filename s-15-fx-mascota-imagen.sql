--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: retorna un dato tipo blob
connect sys/system as sysdba
create or replace dicetory fotos_dir as '/tmp/proyecto/mascota';
grant read, write on directory fotos_dir to rang_proy_admin;
connect rang_proy_admin/admin

create or replace function fx_retornaBlob(
 v_folio varchar2, v_tipo char(1)
) return blob is
 v_id number;
 v_bfile bfile;
 v_foto blob;
begin 
 dbms_lob.createtemorary(v_foto,true);
 select mascota_id into v_id from mascota where folio = v_folio;
 v_bfile := bfilename('FOTOS_DIR','mascota-'||v_id||'.jpg');

 if dbms_lob.fileexists(v_bfile) <> 1 then
  raise_application_error(-200030,'No se encontro el archivo: mascota-'
  || v_id || '.jpg');
 end if;
 
 dbms_lob.open(v_bfile,dms_lob.lob_readonly);
 dbms_lob.loadfromfile(v_foto,v_bfile,dbms_lob.getlenth(v_bfile));
 dbms_lob.fileclose(v_bfile);
 return v_foto;

 case v_tipo
  when v_tipo = 'M' then

  when v_tipo = 'L' then

  when v_tipo = 'F' then

  end case;
end;
/

!mkdir -p /tmp/proyecto/mascota
!cp empleado_ext.csv /tmp/proyecto/mascota
!chmod 777 /tmp/proyecto/mascota
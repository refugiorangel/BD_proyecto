--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 06/06/2022
--@Descripción: retorna un dato tipo blob
connect sys/system as sysdba
create or replace directory foto_mascota as '/tmp/proyecto/fotos';
create or replace directory logo_refugio as '/tmp/proyecto/logos';
create or replace directory firma_oficina as '/tmp/proyecto/firmas';
grant read, write on directory fotos_mascota to rang_proy_admin;
grant read, write on directory logo_refugio to rang_proy_admin;
grant read, write on directory firma_oficina to rang_proy_admin;
connect rang_proy_admin/admin

create or replace function fx_retornaBlob(
 v_id number, v_tipo char
) return blob is
 v_bfile bfile;
 v_blob blob;
begin 
 dbms_lob.createtemporary(v_blob,true);
 
 case v_tipo
  
  when 'M' then 
  
   v_bfile := bfilename('FOTO_MASCOTA','mascota-'||v_id||'.jpg');

   if dbms_lob.fileexists(v_bfile) <> 1 then
    raise_application_error(-200030,'No se encontro el archivo: mascota-'
    || v_id || '.jpg');
   end if;
 
   dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
   dbms_lob.loadfromfile(v_blob ,v_bfile,dbms_lob.getlength(v_bfile));
   dbms_lob.fileclose(v_bfile);
   
  when 'L' then
  
   v_bfile := bfilename('LOGO_REFUGO','refugio-'||v_id||'.jpg');
   
   if dbms_lob.fileexists(v_bfile) <> 1 then
    raise_application_error(-200031,'No se encontro el archivo: refugio-'
    || v_id || '.jpg');
   end if;
 
   dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
   dbms_lob.loadfromfile(v_blob ,v_bfile,dbms_lob.getlength(v_bfile));
   dbms_lob.fileclose(v_bfile);
  
  when 'F' then
  
   v_bfile := bfilename('FIRMA_ORIFINA','oficina-'||v_id||'.png');
   
   if dbms_lob.fileexists(v_bfile) <> 1 then
    raise_application_error(-200032,'No se encontro el archivo: oficina-'
    || v_id || '.pdf');
   end if;
 
   dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
   dbms_lob.loadfromfile(v_blob ,v_bfile,dbms_lob.getlength(v_bfile));
   dbms_lob.fileclose(v_bfile);
  
 end case;
 return v_blob ;
end;
/

!cp fotos.zip /tmp/proyecto
!cp logos.zip /tmp/proyecto
!cp firmas.zip /tmp/proyecto

!unzip /tmp/proyecto/fotos.zip -d /tmp/proyecto/fotos
!unzip /tmp/proyecto/logos.zip -d /tmp/proyecto/logos
!unzip /tmp/proyecto/firmas.zip -d /tmp/proyecto/firmas

!rm /tmp/proyecto/*.zip

!chmod 777 /tmp/proyecto/fotos
!chmod 777 /tmp/proyecto/logos
!chmod 777 /tmp/proyecto/firmas
--@Autor: Rangel de la Rosa José Refugio
--@Fecha creación: 15/05/2022
--@Descripción: Creación de tablas externas

--Tabla externa historico
create table empleado_ext(
 
) organization external (
    type oracle_loader
    default directory tmp_dir 
    access parameters (
        records delimited by newline
        badfile tmp_dir: 'empleado_ext_bad.log'
        logfile tmp_dir: 'empleado_ext.log'
        fields terminated by ','
        lrtrim
        missing field values are null
        (

        )
    )
    location ('empleado_ext.csv')
) reject limit unlimited;

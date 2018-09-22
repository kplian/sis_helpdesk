/*****************************I-SCP-JRR-HD-0-22/09/2018*************/
CREATE TABLE hd.ttipo_requerimiento (
  id_tipo_requerimiento SERIAL, 
  codigo VARCHAR(20), 
  nombre VARCHAR(200), 
  CONSTRAINT ttipo_requerimiento_pkey PRIMARY KEY(id_tipo_requerimiento)
) INHERITS (pxp.tbase)
WITHOUT OIDS;
/*****************************F-SCP-JRR-HD-0-22/09/2018*************/

/*****************************I-SCP-JRR-HD-1-22/09/2018*************/
alter table hd.ttipo_requerimiento
add column cantidad integer;
/*****************************F-SCP-JRR-HD-1-22/09/2018*************/

/*****************************I-SCP-JPS-HD-2-22/09/2018*************/
CREATE TABLE hd.trequerimiento (
  id_requerimiento BIGSERIAL,
  CONSTRAINT trequerimiento_pkey PRIMARY KEY(id_requerimiento)
) INHERITS (pxp.tbase)
WITH (oids = false);
/*****************************F-SCP-JPS-HD-2-22/09/2018*************/
<<<<<<< HEAD

/*****************************I-SCP-FPT-HD-0-22/09/2018*************/
alter table hd.ttipo_requerimiento
add column id_institucion_externa integer;
/*****************************F-SCP-FPT-HD-0-22/09/2018*************/



=======
 
>>>>>>> f0a90f5745ee4ba75fda7353390c4d109c8adb9b
/*****************************I-SCP-JRR-HD-3-22/09/2018*************/
alter table hd.trequerimiento
add column id_usuario integer;
/*****************************F-SCP-JRR-HD-3-22/09/2018*************/
<<<<<<< HEAD
>>>>>>> 7fd8ce62d2f46ad5669461d93658352823bab4a9
=======
/*****************************I-SCP-JGL-HD-0-22/09/2018*************/
alter table hd.trequerimiento
add column descripcion varchar;
/*****************************F-SCP-JGL-HD-0-22/09/2018*************/
>>>>>>> f0a90f5745ee4ba75fda7353390c4d109c8adb9b

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


/*****************************I-SCP-FPT-HD-0-22/09/2018*************/
alter table hd.ttipo_requerimiento
add column id_institucion_externa integer;
/*****************************F-SCP-FPT-HD-0-22/09/2018*************/


/*****************************I-SCP-JRR-HD-3-22/09/2018*************/
alter table hd.trequerimiento
add column id_usuario integer;
/*****************************F-SCP-JRR-HD-3-22/09/2018*************/


/*****************************I-SCP-JMH-HD-0-22/09/2018*************/
alter table hd.trequerimiento
add column id_requerimiento_anterior integer;

alter table hd.trequerimiento
add column solucion_externa varchar(200);
/*****************************F-SCP-JMH-HD-0-22/09/2018*************/


/*****************************I-SCP-JGL-HD-0-22/09/2018*************/
alter table hd.trequerimiento
add column descripcion varchar;
/*****************************F-SCP-JGL-HD-0-22/09/2018*************/


/*****************************I-SCP-JMH-HD-0-05/10/2018*************/
ALTER TABLE hd.ttipo_requerimiento
  DROP COLUMN id_institucion_externa;

alter table hd.trequerimiento
add column id_institucion_externa integer;

ALTER TABLE hd.trequerimiento
  ADD COLUMN id_tipo_requerimiento INTEGER;

COMMENT ON COLUMN hd.trequerimiento.id_tipo_requerimiento
IS 'IDENTIFICADOR FORANEO DE LA TABLA DONDE ESTAN LOS TIPOS DE REQUERIMIENTOS';
/*****************************F-SCP-JMH-HD-0-05/10/2018*************/

/*****************************I-SCP-JRR-HD-0-06/10/2018*************/
alter table hd.ttipo_requerimiento
RENAME COLUMN cantidad TO cantidad_prueba;
/*****************************F-SCP-JRR-HD-0-06/10/2018*************/

/*****************************I-SCP-JRR-HD-1-06/10/2018*************/
ALTER TABLE hd.ttipo_requerimiento ALTER COLUMN cantidad_prueba TYPE numeric; 
/*****************************F-SCP-JRR-HD-1-06/10/2018*************/

/*****************************I-SCP-JRR-HD-0-12/10/2018*************/
alter table hd.trequerimiento
add column id_proceso_macro integer;

alter table hd.trequerimiento
add column id_proceso_wf integer;

alter table hd.trequerimiento
add column id_estado_wf integer;

alter table hd.trequerimiento
add column estado integer;

alter table hd.trequerimiento
add column numero_tramite varchar(25);
/*****************************F-SCP-JRR-HD-0-12/10/2018*************/


/*****************************I-SCP-JRR-HD-0-13/10/2018*************/
ALTER TABLE hd.trequerimiento ALTER COLUMN estado TYPE varchar(50); 
/*****************************F-SCP-JRR-HD-0-13/10/2018*************/

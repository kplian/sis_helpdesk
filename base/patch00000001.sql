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

ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_requerimiento_fk FOREIGN KEY (id_requerimiento_anterior)
    REFERENCES hd.trequerimiento(id_requerimiento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_institucion_externa_fk FOREIGN KEY (id_institucion_externa)
    REFERENCES param.tinstitucion(id_institucion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_usuario_fk FOREIGN KEY (id_usuario)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_tipo_requerimiento_fk FOREIGN KEY (id_tipo_requerimiento)
    REFERENCES hd.ttipo_requerimiento(id_tipo_requerimiento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
/*****************************F-SCP-JMH-HD-0-05/10/2018*************/


/*****************************I-SCP-JRR-HD-0-22/09/2018*************/
CREATE TABLE hd.ttipo_requerimiento (
  id_tipo_requerimiento SERIAL, 
  codigo VARCHAR(20), 
  nombre VARCHAR(200), 
  CONSTRAINT ttipo_requerimiento_pkey PRIMARY KEY(id_tipo_requerimiento)
) INHERITS (pxp.tbase)
WITHOUT OIDS;
/*****************************F-SCP-JRR-HD-0-22/09/2018*************/

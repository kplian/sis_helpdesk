/****************************I-DEP-JMH-HD-0-22/09/2018*************/
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
    
/****************************F-DEP-JMH-HD-0-22/09/2018*************/

/****************************I-DEP-JRR-HD-0-06/10/2018*************/
select pxp.f_insert_testructura_gui ('HD', 'SISTEMA');
/****************************F-DEP-JRR-HD-0-06/10/2018*************/

/****************************I-DEP-JRR-HD-1-06/10/2018*************/
select pxp.f_insert_testructura_gui ('HDTIRE', 'HD');
select pxp.f_insert_testructura_gui ('HDREQ', 'HD');
/****************************F-DEP-JRR-HD-1-06/10/2018*************/

/****************************I-DEP-JRR-HD-0-12/10/2018*************/
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_proceso_macro_fk FOREIGN KEY (id_proceso_macro)
    REFERENCES wf.tproceso_macro(id_proceso_macro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_estado_wf_fk FOREIGN KEY (id_estado_wf)
    REFERENCES wf.testado_wf(id_estado_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
ALTER TABLE hd.trequerimiento
  ADD CONSTRAINT trequerimiento_id_proceso_wf_fk FOREIGN KEY (id_proceso_wf)
    REFERENCES wf.tproceso_wf(id_proceso_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;   
/****************************F-DEP-JRR-HD-0-12/10/2018*************/

/****************************I-DEP-JRR-HD-0-13/10/2018*************/
CREATE OR REPLACE VIEW hd.vrequerimiento AS 
SELECT r.*, tr.codigo as tipo_requerimiento
FROM hd.trequerimiento r
INNER JOIN hd.ttipo_requerimiento tr 
	ON tr.id_tipo_requerimiento = r.id_tipo_requerimiento; 
	
/****************************F-DEP-JRR-HD-0-13/10/2018*************/



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





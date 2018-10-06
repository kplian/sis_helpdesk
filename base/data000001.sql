/***********************************I-DAT-JRR-HD-0-06/10/2018****************************************/

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('HD', 'Sistema Help Desk', '2014-01-16', 'HD', 'activo', 'helpdesk', NULL);

select pxp.f_insert_tgui ('HELP DESK', '', 'HD', 'si', 1, '', 1, '', '', 'HD');

/***********************************F-DAT-JRR-HD-0-06/10/2018****************************************/


/***********************************I-DAT-JRR-HD-1-06/10/2018****************************************/

select pxp.f_insert_tgui ('Requerimiento', 'Requerimiento', 'HDREQ', 'si', 2, 'sis_helpdesk/vista/requerimiento/Requerimiento.php', 2, '', 'Requerimiento', 'HD');

/***********************************F-DAT-JRR-HD-1-06/10/2018****************************************/
/***********************************I-DAT-JRR-HD-2-06/10/2018****************************************/

select pxp.f_insert_tgui ('Tipo Requerimiento', 'Tipo Requerimiento', 'HDTIRE', 'si', 1, 'sis_helpdesk/vista/tipo_requerimiento/TipoRequerimiento.php', 2, '', 'TipoRequerimiento', 'HD');

/***********************************F-DAT-JRR-HD-2-06/10/2018****************************************/


/***********************************I-DAT-JRR-HD-0-13/10/2018****************************************/

select wf.f_import_tproceso_macro ('insert','HD', 'HD', 'Help Desk','si');
select wf.f_import_tcategoria_documento ('insert','legales', 'Legales');
select wf.f_import_tcategoria_documento ('insert','proceso', 'Proceso');
select wf.f_import_ttipo_proceso ('insert','HELPD',NULL,NULL,'HD','Help Desk','hd.vrequerimiento','id_requerimiento','si','','obligatorio','','HELPD',NULL);
select wf.f_import_ttipo_estado ('insert','solicitado','HELPD','Solicitado','si','no','no','listado','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','pendiente_asignacion','HELPD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','asignado','HELPD','Asignado','no','no','no','listado','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','en_proceso','HELPD','En Proceso','no','no','no','listado','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','finalizado','HELPD','Finalizado','no','no','si','anterior','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_documento ('insert','ESC1','HELPD','Imagen del problema 1','Imagen del problema 1','','escaneado',1.00,'{}');
select wf.f_import_ttipo_documento ('insert','ESC2','HELPD','Imagen del problema 2','Imagen del problema 2','','escaneado',2.00,'{}');
select wf.f_import_testructura_estado ('insert','solicitado','asignado','HELPD',1,'');
select wf.f_import_testructura_estado ('insert','asignado','en_proceso','HELPD',1,'');
select wf.f_import_testructura_estado ('insert','en_proceso','finalizado','HELPD',1,'');
select wf.f_import_tfuncionario_tipo_estado ('insert','asignado','HELPD','22222',NULL,'"{$tabla.tipo_requerimiento}"="SOF"');
select wf.f_import_tfuncionario_tipo_estado ('insert','asignado','HELPD','44444',NULL,'"{$tabla.tipo_requerimiento}"="HAR"');
select wf.f_import_tfuncionario_tipo_estado ('insert','en_proceso','HELPD','33333',NULL,'"{$tabla.tipo_requerimiento}"="SOF"');
select wf.f_import_tfuncionario_tipo_estado ('insert','en_proceso','HELPD','11111',NULL,'"{$tabla.tipo_requerimiento}"="HAR"');
----------------------------------
--COPY LINES TO SUBSYSTEM dependencies.sql FILE  
---------------------------------

select wf.f_import_ttipo_documento_estado ('insert','ESC1','HELPD','solicitado','HELPD','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','ESC2','HELPD','solicitado','HELPD','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','ESC1','HELPD','asignado','HELPD','exigir','superior','');



/***********************************F-DAT-JRR-HD-0-13/10/2018****************************************/

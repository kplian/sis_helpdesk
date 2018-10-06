/***********************************I-DAT-JRR-HD-0-06/10/2018****************************************/

INSERT INTO segu.tsubsistema ( codigo, nombre, fecha_reg, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('HD', 'Sistema Help Desk', '2014-01-16', 'HD', 'activo', 'helpdesk', NULL);

select pxp.f_insert_tgui ('HELP DESK', '', 'HD', 'si', 1, '', 1, '', '', 'HD');

/***********************************F-DAT-JRR-HD-0-06/10/2018****************************************/

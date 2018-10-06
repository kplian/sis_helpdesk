CREATE OR REPLACE FUNCTION "hd"."ft_requerimiento_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Help Desk
 FUNCION: 		hd.ft_requerimiento_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'hd.trequerimiento'
 AUTOR: 		 (admin)
 FECHA:	        06-10-2018 06:50:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				06-10-2018 06:50:50								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'hd.trequerimiento'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'hd.ft_requerimiento_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'HD_REQ_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		06-10-2018 06:50:50
	***********************************/

	if(p_transaccion='HD_REQ_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						req.id_requerimiento,
						req.id_requerimiento_anterior,
						req.id_institucion_externa,
						req.id_usuario,
						req.id_tipo_requerimiento,
						req.estado_reg,
						req.descripcion,
						req.solucion_externa,
						req.id_usuario_reg,
						req.usuario_ai,
						req.fecha_reg,
						req.id_usuario_ai,
						req.id_usuario_mod,
						req.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
						usu.cuenta as desc_usuario,
						tre.nombre as desc_tipo_requerimiento,
						reqant.descripcion as desc_requerimiento_anterior,
						ins.nombre as desc_institucion
							
						from hd.trequerimiento req
						inner join segu.tusuario usu1 on usu1.id_usuario = req.id_usuario_reg
						inner join segu.tusuario usu on usu.id_usuario = req.id_usuario
						inner join hd.ttipo_requerimiento tre on tre.id_tipo_requerimiento = req.id_tipo_requerimiento
						left join segu.tusuario usu2 on usu2.id_usuario = req.id_usuario_mod
				        left join hd.trequerimiento reqant on reqant.id_requerimiento = req.id_requerimiento_anterior
				        left join param.tinstitucion ins on ins.id_institucion = req.id_institucion_externa
				        
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'HD_REQ_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		06-10-2018 06:50:50
	***********************************/

	elsif(p_transaccion='HD_REQ_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(req.id_requerimiento)
					    from hd.trequerimiento req
						inner join segu.tusuario usu1 on usu1.id_usuario = req.id_usuario_reg
						inner join segu.tusuario usu on usu.id_usuario = req.id_usuario
						inner join hd.ttipo_requerimiento tre on tre.id_tipo_requerimiento = req.id_tipo_requerimiento
						left join segu.tusuario usu2 on usu2.id_usuario = req.id_usuario_mod
				        left join hd.trequerimiento reqant on reqant.id_requerimiento = req.id_requerimiento_anterior
				        left join param.tinstitucion ins on ins.id_institucion = req.id_institucion_externa
				        
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else
					     
		raise exception 'Transaccion inexistente';
					         
	end if;
					
EXCEPTION
					
	WHEN OTHERS THEN
			v_resp='';
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
			v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
			v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
			raise exception '%',v_resp;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
COST 100;
ALTER FUNCTION "hd"."ft_requerimiento_sel"(integer, integer, character varying, character varying) OWNER TO postgres;

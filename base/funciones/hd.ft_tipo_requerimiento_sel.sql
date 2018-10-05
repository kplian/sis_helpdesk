CREATE OR REPLACE FUNCTION "hd"."ft_tipo_requerimiento_sel"(	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$
/**************************************************************************
 SISTEMA:		Sistema Help Desk
 FUNCION: 		hd.ft_tipo_requerimiento_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'hd.ttipo_requerimiento'
 AUTOR: 		 (admin)
 FECHA:	        05-10-2018 18:49:31
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-10-2018 18:49:31								Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'hd.ttipo_requerimiento'	
 #
 ***************************************************************************/

DECLARE

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'hd.ft_tipo_requerimiento_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'HD_TRE_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		05-10-2018 18:49:31
	***********************************/

	if(p_transaccion='HD_TRE_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tre.id_tipo_requerimiento,
						tre.codigo,
						tre.cantidad_prueba,
						tre.nombre,
						tre.estado_reg,
						tre.id_usuario_ai,
						tre.usuario_ai,
						tre.fecha_reg,
						tre.id_usuario_reg,
						tre.fecha_mod,
						tre.id_usuario_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from hd.ttipo_requerimiento tre
						inner join segu.tusuario usu1 on usu1.id_usuario = tre.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tre.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'HD_TRE_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		05-10-2018 18:49:31
	***********************************/

	elsif(p_transaccion='HD_TRE_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_tipo_requerimiento)
					    from hd.ttipo_requerimiento tre
					    inner join segu.tusuario usu1 on usu1.id_usuario = tre.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tre.id_usuario_mod
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
ALTER FUNCTION "hd"."ft_tipo_requerimiento_sel"(integer, integer, character varying, character varying) OWNER TO postgres;

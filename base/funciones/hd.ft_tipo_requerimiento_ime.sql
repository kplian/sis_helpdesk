CREATE OR REPLACE FUNCTION "hd"."ft_tipo_requerimiento_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Sistema Help Desk
 FUNCION: 		hd.ft_tipo_requerimiento_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'hd.ttipo_requerimiento'
 AUTOR: 		 (admin)
 FECHA:	        05-10-2018 18:49:31
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				05-10-2018 18:49:31								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'hd.ttipo_requerimiento'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_tipo_requerimiento	integer;
			    
BEGIN

    v_nombre_funcion = 'hd.ft_tipo_requerimiento_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'HD_TRE_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-10-2018 18:49:31
	***********************************/

	if(p_transaccion='HD_TRE_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into hd.ttipo_requerimiento(
			codigo,
			cantidad_prueba,
			nombre,
			estado_reg,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
			v_parametros.codigo,
			v_parametros.cantidad_prueba,
			v_parametros.nombre,
			'activo',
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_tipo_requerimiento into v_id_tipo_requerimiento;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Requerimiento almacenado(a) con exito (id_tipo_requerimiento'||v_id_tipo_requerimiento||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_requerimiento',v_id_tipo_requerimiento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'HD_TRE_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-10-2018 18:49:31
	***********************************/

	elsif(p_transaccion='HD_TRE_MOD')then

		begin
			--Sentencia de la modificacion
			update hd.ttipo_requerimiento set
			codigo = v_parametros.codigo,
			cantidad_prueba = v_parametros.cantidad_prueba,
			nombre = v_parametros.nombre,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_tipo_requerimiento=v_parametros.id_tipo_requerimiento;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Requerimiento modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_requerimiento',v_parametros.id_tipo_requerimiento::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'HD_TRE_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		05-10-2018 18:49:31
	***********************************/

	elsif(p_transaccion='HD_TRE_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from hd.ttipo_requerimiento
            where id_tipo_requerimiento=v_parametros.id_tipo_requerimiento;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Tipo Requerimiento eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_tipo_requerimiento',v_parametros.id_tipo_requerimiento::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

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
ALTER FUNCTION "hd"."ft_tipo_requerimiento_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

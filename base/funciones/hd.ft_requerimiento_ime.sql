CREATE OR REPLACE FUNCTION "hd"."ft_requerimiento_ime" (	
				p_administrador integer, p_id_usuario integer, p_tabla character varying, p_transaccion character varying)
RETURNS character varying AS
$BODY$

/**************************************************************************
 SISTEMA:		Help Desk
 FUNCION: 		hd.ft_requerimiento_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'hd.trequerimiento'
 AUTOR: 		 (admin)
 FECHA:	        06-10-2018 06:50:50
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				06-10-2018 06:50:50								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'hd.trequerimiento'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_requerimiento	integer;
			    
BEGIN

    v_nombre_funcion = 'hd.ft_requerimiento_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'HD_REQ_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		06-10-2018 06:50:50
	***********************************/

	if(p_transaccion='HD_REQ_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into hd.trequerimiento(
			id_requerimiento_anterior,
			id_institucion_externa,
			id_usuario,
			id_tipo_requerimiento,
			estado_reg,
			descripcion,
			solucion_externa,
			id_usuario_reg,
			usuario_ai,
			fecha_reg,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod
          	) values(
			v_parametros.id_requerimiento_anterior,
			v_parametros.id_institucion_externa,
			v_parametros.id_usuario,
			v_parametros.id_tipo_requerimiento,
			'activo',
			v_parametros.descripcion,
			v_parametros.solucion_externa,
			p_id_usuario,
			v_parametros._nombre_usuario_ai,
			now(),
			v_parametros._id_usuario_ai,
			null,
			null
							
			
			
			)RETURNING id_requerimiento into v_id_requerimiento;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Requerimiento almacenado(a) con exito (id_requerimiento'||v_id_requerimiento||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_requerimiento',v_id_requerimiento::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'HD_REQ_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		06-10-2018 06:50:50
	***********************************/

	elsif(p_transaccion='HD_REQ_MOD')then

		begin
			--Sentencia de la modificacion
			update hd.trequerimiento set
			id_requerimiento_anterior = v_parametros.id_requerimiento_anterior,
			id_institucion_externa = v_parametros.id_institucion_externa,
			id_usuario = v_parametros.id_usuario,
			id_tipo_requerimiento = v_parametros.id_tipo_requerimiento,
			descripcion = v_parametros.descripcion,
			solucion_externa = v_parametros.solucion_externa,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_requerimiento=v_parametros.id_requerimiento;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Requerimiento modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_requerimiento',v_parametros.id_requerimiento::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'HD_REQ_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		06-10-2018 06:50:50
	***********************************/

	elsif(p_transaccion='HD_REQ_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from hd.trequerimiento
            where id_requerimiento=v_parametros.id_requerimiento;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Requerimiento eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_requerimiento',v_parametros.id_requerimiento::varchar);
              
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
ALTER FUNCTION "hd"."ft_requerimiento_ime"(integer, integer, character varying, character varying) OWNER TO postgres;

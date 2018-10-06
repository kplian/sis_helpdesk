<?php
/**
*@package pXP
*@file gen-MODRequerimiento.php
*@author  (admin)
*@date 06-10-2018 06:50:50
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODRequerimiento extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarRequerimiento(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='hd.ft_requerimiento_sel';
		$this->transaccion='HD_REQ_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_requerimiento','int8');
		$this->captura('id_requerimiento_anterior','int4');
		$this->captura('id_institucion_externa','int4');
		$this->captura('id_usuario','int4');
		$this->captura('id_tipo_requerimiento','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('descripcion','varchar');
		$this->captura('solucion_externa','varchar');
		$this->captura('id_usuario_reg','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		$this->captura('desc_usuario','varchar');
		$this->captura('desc_tipo_requerimiento','varchar');
		$this->captura('desc_requerimiento_anterior','varchar');
		$this->captura('desc_institucion','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_requerimiento_ime';
		$this->transaccion='HD_REQ_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_requerimiento_anterior','id_requerimiento_anterior','int4');
		$this->setParametro('id_institucion_externa','id_institucion_externa','int4');
		$this->setParametro('id_usuario','id_usuario','int4');
		$this->setParametro('id_tipo_requerimiento','id_tipo_requerimiento','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('solucion_externa','solucion_externa','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_requerimiento_ime';
		$this->transaccion='HD_REQ_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_requerimiento','id_requerimiento','int8');
		$this->setParametro('id_requerimiento_anterior','id_requerimiento_anterior','int4');
		$this->setParametro('id_institucion_externa','id_institucion_externa','int4');
		$this->setParametro('id_usuario','id_usuario','int4');
		$this->setParametro('id_tipo_requerimiento','id_tipo_requerimiento','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('solucion_externa','solucion_externa','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_requerimiento_ime';
		$this->transaccion='HD_REQ_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_requerimiento','id_requerimiento','int8');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
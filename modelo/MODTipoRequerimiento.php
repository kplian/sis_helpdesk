<?php
/**
*@package pXP
*@file gen-MODTipoRequerimiento.php
*@author  (admin)
*@date 05-10-2018 18:49:31
*@description Clase que envia los parametros requeridos a la Base de datos para la ejecucion de las funciones, y que recibe la respuesta del resultado de la ejecucion de las mismas
*/

class MODTipoRequerimiento extends MODbase{
	
	function __construct(CTParametro $pParam){
		parent::__construct($pParam);
	}
			
	function listarTipoRequerimiento(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='hd.ft_tipo_requerimiento_sel';
		$this->transaccion='HD_TRE_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_tipo_requerimiento','int4');
		$this->captura('codigo','varchar');
		$this->captura('cantidad_prueba','numeric');
		$this->captura('nombre','varchar');
		$this->captura('estado_reg','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('usuario_ai','varchar');
		$this->captura('fecha_reg','timestamp');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('id_usuario_mod','int4');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function insertarTipoRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_tipo_requerimiento_ime';
		$this->transaccion='HD_TRE_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('cantidad_prueba','cantidad_prueba','numeric');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarTipoRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_tipo_requerimiento_ime';
		$this->transaccion='HD_TRE_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipo_requerimiento','id_tipo_requerimiento','int4');
		$this->setParametro('codigo','codigo','varchar');
		$this->setParametro('cantidad_prueba','cantidad_prueba','numeric');
		$this->setParametro('nombre','nombre','varchar');
		$this->setParametro('estado_reg','estado_reg','varchar');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function eliminarTipoRequerimiento(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='hd.ft_tipo_requerimiento_ime';
		$this->transaccion='HD_TRE_ELI';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_tipo_requerimiento','id_tipo_requerimiento','int4');

		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
}
?>
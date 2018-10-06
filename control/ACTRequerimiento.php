<?php
/**
*@package pXP
*@file gen-ACTRequerimiento.php
*@author  (admin)
*@date 06-10-2018 06:50:50
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTRequerimiento extends ACTbase{    
			
	function listarRequerimiento(){
		$this->objParam->defecto('ordenacion','id_requerimiento');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODRequerimiento','listarRequerimiento');
		} else{
			$this->objFunc=$this->create('MODRequerimiento');
			
			$this->res=$this->objFunc->listarRequerimiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarRequerimiento(){
		$this->objFunc=$this->create('MODRequerimiento');	
		if($this->objParam->insertar('id_requerimiento')){
			$this->res=$this->objFunc->insertarRequerimiento($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarRequerimiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarRequerimiento(){
			$this->objFunc=$this->create('MODRequerimiento');	
		$this->res=$this->objFunc->eliminarRequerimiento($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
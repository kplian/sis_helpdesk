<?php
/**
*@package pXP
*@file gen-ACTTipoRequerimiento.php
*@author  (admin)
*@date 05-10-2018 18:49:31
*@description Clase que recibe los parametros enviados por la vista para mandar a la capa de Modelo
*/

class ACTTipoRequerimiento extends ACTbase{    
			
	function listarTipoRequerimiento(){
		$this->objParam->defecto('ordenacion','id_tipo_requerimiento');

		$this->objParam->defecto('dir_ordenacion','asc');
		if($this->objParam->getParametro('tipoReporte')=='excel_grid' || $this->objParam->getParametro('tipoReporte')=='pdf_grid'){
			$this->objReporte = new Reporte($this->objParam,$this);
			$this->res = $this->objReporte->generarReporteListado('MODTipoRequerimiento','listarTipoRequerimiento');
		} else{
			$this->objFunc=$this->create('MODTipoRequerimiento');
			
			$this->res=$this->objFunc->listarTipoRequerimiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
				
	function insertarTipoRequerimiento(){
		$this->objFunc=$this->create('MODTipoRequerimiento');	
		if($this->objParam->insertar('id_tipo_requerimiento')){
			$this->res=$this->objFunc->insertarTipoRequerimiento($this->objParam);			
		} else{			
			$this->res=$this->objFunc->modificarTipoRequerimiento($this->objParam);
		}
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
						
	function eliminarTipoRequerimiento(){
			$this->objFunc=$this->create('MODTipoRequerimiento');	
		$this->res=$this->objFunc->eliminarTipoRequerimiento($this->objParam);
		$this->res->imprimirRespuesta($this->res->generarJson());
	}
			
}

?>
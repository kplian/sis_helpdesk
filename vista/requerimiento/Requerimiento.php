<?php
/**
*@package pXP
*@file gen-Requerimiento.php
*@author  (admin)
*@date 06-10-2018 06:50:50
*@description Archivo con la interfaz de usuario que permite la ejecucion de todas las funcionalidades del sistema
*/

header("content-type: text/javascript; charset=UTF-8");
?>
<script>
Phx.vista.Requerimiento=Ext.extend(Phx.gridInterfaz,{

	constructor:function(config){
		this.maestro=config.maestro;
    	//llama al constructor de la clase padre
		Phx.vista.Requerimiento.superclass.constructor.call(this,config);
		this.init();
		this.load({params:{start:0, limit:this.tam_pag}})
	},
			
	Atributos:[
		{
			//configuracion del componente
			config:{
					labelSeparator:'',
					inputType:'hidden',
					name: 'id_requerimiento'
			},
			type:'Field',
			form:true 
		},
		{
			config: {
				name: 'id_usuario',
				fieldLabel: 'Usuario',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_seguridad/control/Usuario/listarUsuario',
					id: 'id_usuario',
					root: 'datos',
					sortInfo: {
						field: 'cuenta',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_usuario', 'cuenta'],
					remoteSort: true,
					baseParams: {par_filtro: 'USUARI.cuenta'}
				}),
				valueField: 'id_usuario',
				displayField: 'cuenta',
				gdisplayField: 'desc_usuario',
				hiddenName: 'id_usuario',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_usuario']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'usu.cuenta',type: 'string'},
			grid: true,
			form: true
		},
		
		{
			config: {
				name: 'id_tipo_requerimiento',
				fieldLabel: 'Tipo Requerimiento',
				allowBlank: false,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_helpdesk/control/TipoRequerimiento/listarTipoRequerimiento',
					id: 'id_tipo_requerimiento',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_tipo_requerimiento', 'nombre', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'tre.nombre#tre.codigo'}
				}),
				valueField: 'id_tipo_requerimiento',
				displayField: 'nombre',
				gdisplayField: 'desc_tipo_requerimiento',
				hiddenName: 'id_tipo_requerimiento',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_tipo_requerimiento']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'tre.nombre',type: 'string'},
			grid: true,
			form: true,
			bottom_filter : true
		},
		
		{
			config:{
				name: 'descripcion',
				fieldLabel: 'Descripcion',
				allowBlank: false,
				anchor: '80%',
				gwidth: 200
			},
				type:'TextArea',
				filters:{pfiltro:'req.descripcion',type:'string'},
				id_grupo:1,
				grid:true,
				form:true,
				bottom_filter : true
		},
		
		{
			config:{
				name: 'solucion_externa',
				fieldLabel: 'Solucion Externa',
				allowBlank:false,
				emptyText:'Columna...',
	       		typeAhead: true,
	       		triggerAction: 'all',
	       		lazyRender:true,
	       		mode: 'local',
				gwidth: 150,
				store:['si','no']
			},
				type:'ComboBox',
				filters:{	
	       		         type: 'list',
	       				 options: ['si','no'],	
	       				 pfiltro: 'req.solucion_externa'
	       		 	},
				id_grupo:1,
				grid:true,
				form:true
		},
		{
			config: {
				name: 'id_requerimiento_anterior',
				fieldLabel: 'Requerimiento Anterior',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_helpdesk/control/Requerimiento/listarRequerimiento',
					id: 'id_requerimiento_anterior',
					root: 'datos',
					sortInfo: {
						field: 'fecha_reg',
						direction: 'DESC'
					},
					totalProperty: 'total',
					fields: ['id_requerimiento_anterior', 'descripcion'],
					remoteSort: true,
					baseParams: {par_filtro: 'req.descripcion'}
				}),
				valueField: 'id_requerimiento_anterior',
				displayField: 'descripcion',
				gdisplayField: 'desc_requerimiento_anterior',
				hiddenName: 'id_requerimiento_anterior',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_requerimiento_anterior']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'reqant.descripcion',type: 'string'},
			grid: true,
			form: true
		},
		{
			config: {
				name: 'id_institucion_externa',
				fieldLabel: 'Institucion Externa',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_parametros/control/Institucion/listarInstitucion',
					id: 'id_institucion',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_institucion', 'nombre', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'instit.nombre#instit.codigo'}
				}),
				valueField: 'id_institucion',
				displayField: 'nombre',
				gdisplayField: 'desc_institucion',
				hiddenName: 'id_institucion_externa',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_institucion']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'ins.nombre',type: 'string'},
			grid: true,
			form: true
		},
		
		
		
		{
			config:{
				name: 'estado_reg',
				fieldLabel: 'Estado Reg.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:10
			},
				type:'TextField',
				filters:{pfiltro:'req.estado_reg',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		
		
		{
			config:{
				name: 'usr_reg',
				fieldLabel: 'Creado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu1.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'usuario_ai',
				fieldLabel: 'Funcionaro AI',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:300
			},
				type:'TextField',
				filters:{pfiltro:'req.usuario_ai',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_reg',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'req.fecha_reg',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'id_usuario_ai',
				fieldLabel: 'Fecha creación',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'req.id_usuario_ai',type:'numeric'},
				id_grupo:1,
				grid:false,
				form:false
		},
		{
			config:{
				name: 'usr_mod',
				fieldLabel: 'Modificado por',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:4
			},
				type:'Field',
				filters:{pfiltro:'usu2.cuenta',type:'string'},
				id_grupo:1,
				grid:true,
				form:false
		},
		{
			config:{
				name: 'fecha_mod',
				fieldLabel: 'Fecha Modif.',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
							format: 'd/m/Y', 
							renderer:function (value,p,record){return value?value.dateFormat('d/m/Y H:i:s'):''}
			},
				type:'DateField',
				filters:{pfiltro:'req.fecha_mod',type:'date'},
				id_grupo:1,
				grid:true,
				form:false
		}
	],
	tam_pag:50,	
	title:'Requerimiento',
	ActSave:'../../sis_helpdesk/control/Requerimiento/insertarRequerimiento',
	ActDel:'../../sis_helpdesk/control/Requerimiento/eliminarRequerimiento',
	ActList:'../../sis_helpdesk/control/Requerimiento/listarRequerimiento',
	id_store:'id_requerimiento',
	fields: [
		{name:'id_requerimiento', type: 'string'},
		{name:'id_requerimiento_anterior', type: 'numeric'},
		{name:'id_institucion_externa', type: 'numeric'},
		{name:'id_usuario', type: 'numeric'},
		{name:'id_tipo_requerimiento', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'descripcion', type: 'string'},
		{name:'solucion_externa', type: 'string'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'usuario_ai', type: 'string'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		
		{name:'desc_usuario', type: 'string'},
		{name:'desc_tipo_requerimiento', type: 'string'},
		{name:'desc_requerimiento_anterior', type: 'string'},
		{name:'desc_institucion', type: 'string'},
		
		
	],
	sortInfo:{
		field: 'id_requerimiento',
		direction: 'ASC'
	},
	bdel:true,
	bsave:true
	}
)
</script>
		
		
<?php
	include_once("class-persona.php");

	class Cliente extends Persona{

		private $idCliente;
		private $fechaIngreso;
		private $idPersona;

		public function __construct($idCliente,
					$fechaIngreso,
					$idPersona){
			parent::__construct(
					$idPersona,
					$pNombre,
					$sNombre,
					$pApellido,
					$sApellido,
					$direccion,
					$correo,
					$noIdentidad);

			$this->idCliente = $idCliente;
			$this->fechaIngreso = $fechaIngreso;
			$this->idPersona = $idPersona;
		}
		public function getIdCliente(){
			return $this->idCliente;
		}
		public function setIdCliente($idCliente){
			$this->idCliente = $idCliente;
		}
		public function getFechaIngreso(){
			return $this->fechaIngreso;
		}
		public function setFechaIngreso($fechaIngreso){
			$this->fechaIngreso = $fechaIngreso;
		}
		public function getIdPersona(){
			return $this->idPersona;
		}
		public function setIdPersona($idPersona){
			$this->idPersona = $idPersona;
		}
		public function __toString(){
			return "IdCliente: " . $this->idCliente .
				" FechaIngreso: " . $this->fechaIngreso .
				" IdPersona: " . $this->idPersona;
		}
	}
?>
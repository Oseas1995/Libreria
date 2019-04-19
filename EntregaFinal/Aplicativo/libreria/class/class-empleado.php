<?php
	include_once("class-persona.php");

	class Empleado extends Persona{

		private $idEmpleado;
		private $fechaIngreso;
		private $idPersona;

		public function __construct($idEmpleado,
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

			$this->idEmpleado = $idEmpleado;
			$this->fechaIngreso = $fechaIngreso;
			$this->idPersona = $idPersona;
		}
		public function getIdEmpleado(){
			return $this->idEmpleado;
		}
		public function setIdEmpleado($idEmpleado){
			$this->idEmpleado = $idEmpleado;
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
			return "IdEmpleado: " . $this->idEmpleado .
				" FechaIngreso: " . $this->fechaIngreso .
				" IdPersona: " . $this->idPersona;
		}
	}
?>
<?php

	class Persona{

		protected $idPersona;
		protected $pNombre;
		protected $sNombre;
		protected $pApellido;
		protected $sApellido;
		protected $direccion;
		protected $correo;
		protected $noIdentidad;

		public function __construct($idPersona,
					$pNombre,
					$sNombre,
					$pApellido,
					$sApellido,
					$direccion,
					$correo,
					$noIdentidad){
			$this->idPersona = $idPersona;
			$this->pNombre = $pNombre;
			$this->sNombre = $sNombre;
			$this->pApellido = $pApellido;
			$this->sApellido = $sApellido;
			$this->direccion = $direccion;
			$this->correo = $correo;
			$this->noIdentidad = $noIdentidad;
		}
		public function getIdPersona(){
			return $this->idPersona;
		}
		public function setIdPersona($idPersona){
			$this->idPersona = $idPersona;
		}
		public function getPNombre(){
			return $this->pNombre;
		}
		public function setPNombre($pNombre){
			$this->pNombre = $pNombre;
		}
		public function getSNombre(){
			return $this->sNombre;
		}
		public function setSNombre($sNombre){
			$this->sNombre = $sNombre;
		}
		public function getPApellido(){
			return $this->pApellido;
		}
		public function setPApellido($pApellido){
			$this->pApellido = $pApellido;
		}
		public function getSApellido(){
			return $this->sApellido;
		}
		public function setSApellido($sApellido){
			$this->sApellido = $sApellido;
		}
		public function getDireccion(){
			return $this->direccion;
		}
		public function setDireccion($direccion){
			$this->direccion = $direccion;
		}
		public function getCorreo(){
			return $this->correo;
		}
		public function setCorreo($correo){
			$this->correo = $correo;
		}
		public function getNoIdentidad(){
			return $this->noIdentidad;
		}
		public function setNoIdentidad($noIdentidad){
			$this->noIdentidad = $noIdentidad;
		}
		public function __toString(){
			return "IdPersona: " . $this->idPersona .
				" PNombre: " . $this->pNombre .
				" SNombre: " . $this->sNombre .
				" PApellido: " . $this->pApellido .
				" SApellido: " . $this->sApellido .
				" Direccion: " . $this->direccion .
				" Correo: " . $this->correo .
				" NoIdentidad: " . $this->noIdentidad;
		}


	}
?>
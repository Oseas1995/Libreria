<?php

	class Libro{

		private $idLibro;
		private $nombre;
		private $anioPublicacion;
		private $Categoria_idCategoria;
		private $Idioma_idIdioma;
		private $precioCosto;
		private $precioVenta;

		public function __construct($idLibro,
					$nombre,
					$anioPublicacion,
					$Categoria_idCategoria,
					$Idioma_idIdioma,
					$precioCosto,
					$precioVenta){
			$this->idLibro = $idLibro;
			$this->nombre = $nombre;
			$this->anioPublicacion = $anioPublicacion;
			$this->Categoria_idCategoria = $Categoria_idCategoria;
			$this->Idioma_idIdioma = $Idioma_idIdioma;
			$this->precioCosto = $precioCosto;
			$this->precioVenta = $precioVenta;
		}
		public function getIdLibro(){
			return $this->idLibro;
		}
		public function setIdLibro($idLibro){
			$this->idLibro = $idLibro;
		}
		public function getNombre(){
			return $this->nombre;
		}
		public function setNombre($nombre){
			$this->nombre = $nombre;
		}
		public function getAnioPublicacion(){
			return $this->anioPublicacion;
		}
		public function setAnioPublicacion($anioPublicacion){
			$this->anioPublicacion = $anioPublicacion;
		}
		public function getCategoria_idCategoria(){
			return $this->Categoria_idCategoria;
		}
		public function setCategoria_idCategoria($Categoria_idCategoria){
			$this->Categoria_idCategoria = $Categoria_idCategoria;
		}
		public function getIdioma_idIdioma(){
			return $this->Idioma_idIdioma;
		}
		public function setIdioma_idIdioma($Idioma_idIdioma){
			$this->Idioma_idIdioma = $Idioma_idIdioma;
		}
		public function getPrecioCosto(){
			return $this->precioCosto;
		}
		public function setPrecioCosto($precioCosto){
			$this->precioCosto = $precioCosto;
		}
		public function getPrecioVenta(){
			return $this->precioVenta;
		}
		public function setPrecioVenta($precioVenta){
			$this->precioVenta = $precioVenta;
		}
		public function __toString(){
			return "IdLibro: " . $this->idLibro .
				" Nombre: " . $this->nombre .
				" AnioPublicacion: " . $this->anioPublicacion .
				" Categoria_idCategoria: " . $this->Categoria_idCategoria .
				" Idioma_idIdioma: " . $this->Idioma_idIdioma .
				" PrecioCosto: " . $this->precioCosto .
				" PrecioVenta: " . $this->precioVenta;
		}
	}
?>
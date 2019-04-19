<?php

	class Conexion{

		private $usuario="asd";
		private $contrasena="oracle";
		private $host="localhost";
		private $baseDatos="localhost/XE";
		private $puerto="1521";
		private $link;

		public function __construct(){
			$this->establecerConexion();
		}

		public function establecerConexion(){
			/*Establecer la conexion con los parametros de configuracion de la db*/
			$this->link=oci_connect($this->usuario,$this->contrasena,$this->baseDatos);

			if (!$this->link){
				// ########No se puede conectar a la db por lo tanto salir de la conexion #########
				echo "No se pudo conectar con Oracle";
				exit;
			}else{
				 echo "conexion exitosa"; ####conexion exitosa######

				//Ejemplo para ejecutar y mostrar una consulta en el html
				// $stid = $this->ejecutarInstruccion('SELECT * FROM TBL_PERSONA');

				// echo "<table border='1'>\n";
				// while ($row = $this->obtenerFila($stid)) {
				//     echo "<tr>\n";
				//     foreach ($row as $item) {
				//         echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
				//     }
				//     echo "</tr>\n";
				// }
				// echo "</table>\n";
				// $this->liberarResultado($stid); //liberar todos los recursos asociados a esta consulta, direccion de memoria de cursores etc,...
			}
		}

		public function cerrarConexion(){
			oci_close($this->link);
		}

		public function ejecutarInstruccion($sql){
			$stid = oci_parse($this->link, $sql);
			oci_execute($stid);
			/*ejecuta la query y retorna un arreglo que almacena los identificadores de la consulta*/
			return $stid;
		}

		public function obtenerFila($stid){
			return oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
		}

		public function cantidadRegistros($stid){
			return oci_fetch_row($stid);
		}

		public function liberarResultado($stid){
			oci_free_statement($stid);
		}

		// public function antiInyeccion($text){
		// 	return mysqli_real_escape_string($this->link, $text);
		// }

		// public function ultimoId(){
		// 	return mysqli_insert_id($this->link);
		// }

		public function getUsuario(){
			return $this->usuario;
		}
		public function setUsuario($usuario){
			$this->usuario = $usuario;
		}
		public function getContrasena(){
			return $this->contrasena;
		}
		public function setContrasena($contrasena){
			$this->contrasena = $contrasena;
		}
		public function getHost(){
			return $this->host;
		}
		public function setHost($host){
			$this->host = $host;
		}
		public function getBaseDatos(){
			return $this->baseDatos;
		}
		public function setBaseDatos($baseDatos){
			$this->baseDatos = $baseDatos;
		}
		public function getPuerto(){
			return $this->puerto;
		}
		public function setPuerto($puerto){
			$this->puerto = $puerto;
		}
		public function getLink(){
			return $this->link;
		}
		public function setLink($link){
			$this->link = $link;
		}

	}
?>
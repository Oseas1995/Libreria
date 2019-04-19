<DOCTYPE HTML>
<meta charset = "utf8" />
<?php
// crear conexion con oracle
$conexion = oci_connect("asd", "oracle", "localhost/xe");

if (!$conexion) {
  $m = oci_error();
  echo $m['message'], "n";
  exit;
} else {
  echo "Conexión con éxito a Oracle!"; }

$eliminar = oci_parse($conexion, "INSERT INTO PERSONA (idPersona,pnombre,snombre,papellido,sapellido,direccion,correo) VALUES (30,'Louis','Lucy','Dexter','Josiah','376-9729 Sed Avda.','Louis.Dexter@gmail.com')");
oci_execute($eliminar);

?>
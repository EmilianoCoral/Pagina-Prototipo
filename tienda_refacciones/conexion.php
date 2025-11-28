<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "tienda_refacciones";

$conexion = new mysqli($servername, $username, $password, $database);

if ($conexion->connect_error) {
    die("Error en la conexión: " . $conexion->connect_error);
}
?>

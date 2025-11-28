<?php
session_start();
include('conexion.php');

$id_usuario = $_SESSION['id_usuario'];

$sql = "DELETE FROM carrito WHERE id_usuario = ?";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();

header("Location: carrito.php");
exit();
?>

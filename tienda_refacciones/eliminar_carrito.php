<?php
session_start();
include('conexion.php');

$id = $_POST['id'];

$sql = "DELETE FROM carrito WHERE id = ?";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: carrito.php");
exit();
?>

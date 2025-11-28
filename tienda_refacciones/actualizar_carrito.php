<?php
session_start();
include('conexion.php');

$id_carrito = $_POST['id_carrito'];
$accion = $_POST['accion'];

if ($accion === "sumar") {
    $sql = "UPDATE carrito SET cantidad = cantidad + 1 WHERE id = ?";
} else {
    $sql = "UPDATE carrito SET cantidad = GREATEST(cantidad - 1, 1) WHERE id = ?";
}

$stmt = $conexion->prepare($sql);
$stmt->bind_param("i", $id_carrito);
$stmt->execute();

header("Location: carrito.php");
exit();
?>

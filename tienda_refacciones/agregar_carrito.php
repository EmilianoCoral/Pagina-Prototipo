<?php
session_start();
include('conexion.php');

// Verificar si el usuario está logueado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.php");
    exit();
}

$id_usuario = $_SESSION['id_usuario'];
$id_producto = $_POST['id_producto'];

// Verificar si el producto ya está en el carrito
$consulta = $conexion->prepare(
    "SELECT id, cantidad FROM carrito WHERE id_usuario = ? AND id_producto = ?"
);
$consulta->bind_param("ii", $id_usuario, $id_producto);
$consulta->execute();
$resultado = $consulta->get_result();

if ($resultado->num_rows > 0) {
    // Ya existe → aumentar cantidad
    $row = $resultado->fetch_assoc();
    $nueva_cantidad = $row['cantidad'] + 1;

    $update = $conexion->prepare("UPDATE carrito SET cantidad = ? WHERE id = ?");
    $update->bind_param("ii", $nueva_cantidad, $row['id']);
    $update->execute();

} else {
    // No existe → insertar nuevo registro
    $insert = $conexion->prepare(
        "INSERT INTO carrito (id_usuario, id_producto, cantidad) VALUES (?, ?, 1)"
    );
    $insert->bind_param("ii", $id_usuario, $id_producto);
    $insert->execute();
}

header("Location: carrito.php");
exit();
?>

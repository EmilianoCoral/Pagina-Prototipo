<?php
include 'conexion.php';
session_start();

$id_usuario = $_SESSION['id_usuario'];

$sql = "SELECT c.fecha_compra, p.nombre, p.precio, c.cantidad, c.total
        FROM compras c
        INNER JOIN productos p ON c.id_producto = p.id
        WHERE c.id_usuario = ? 
        ORDER BY c.fecha_compra DESC";

$stmt = $conexion->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$result = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilos.css">
    <title>Mis compras</title>
</head>
<body>

<img src="img/Refacciones_de_radios.jpg" alt="Logo de la tienda" class="logo">

<!-- Menú lateral -->
<div class="menu">
    <h2>Menú</h2>
    <ul>
        <li><a href="index.php">Inicio</a></li>
        <li><a href="carrito.php">Carrito</a></li>
        <li><a href="descuentos.php">Descuentos</a></li>
        <li><a href="logout.php">Cerrar sesión</a></li>
    </ul>
</div>

<div class="contenido">

    <div class="titulo">
        <h1>Historial de compras</h1>
        <p>Lista de todos los productos adquiridos</p>
    </div>

    <table class="tabla-compras">
        <tr>
            <th>Fecha</th>
            <th>Producto</th>
            <th>Precio Unitario</th>
            <th>Cantidad</th>
            <th>Total Pagado</th>
        </tr>

        <?php while($row = $result->fetch_assoc()) { ?>
        <tr>
            <td><?= $row['fecha_compra'] ?></td>
            <td><?= $row['nombre'] ?></td>
            <td>$<?= number_format($row['precio'], 2) ?></td>
            <td><?= $row['cantidad'] ?></td>
            <td>$<?= number_format($row['total'], 2) ?></td>
        </tr>
        <?php } ?>

    </table>

</div>

</body>
</html>

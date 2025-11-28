<?php
include 'conexion.php';
session_start();

// Obtener solo descuentos activos
$sql = "SELECT p.nombre, p.precio, d.porcentaje
        FROM descuentos d
        INNER JOIN productos p ON d.id_producto = p.id
        WHERE d.activo = 1";

$result = $conexion->query($sql);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilos.css">
    <title>Descuentos</title>
</head>
<body>

<img src="img/Refacciones_de_radios.jpg" alt="Logo de la tienda" class="logo">

<!-- Menú lateral -->
<div class="menu">
    <h2>Menú</h2>
    <ul>
        <li><a href="index.php">Productos</a></li>
        <li><a href="carrito.php">Carrito</a></li>
        <li><a href="compras.php">Compras</a></li>
        <li><a href="logout.php">Cerrar sesión</a></li>
    </ul>
</div>

<!-- Contenido -->
<div class="contenido">

    <div class="titulo">
        <h1>Descuentos disponibles</h1>
        <p>Promociones activas en la tienda</p>
    </div>

    <table class="tabla-descuentos">
        <tr>
            <th>Producto</th>
            <th>Precio normal</th>
            <th>Descuento</th>
            <th>Precio final</th>
        </tr>

        <?php if ($result->num_rows > 0) { 
            while($row = $result->fetch_assoc()) { 
                $precio_final = $row['precio'] - ($row['precio'] * ($row['porcentaje'] / 100));
        ?>
        <tr>
            <td><?= $row['nombre'] ?></td>
            <td>$<?= number_format($row['precio'], 2) ?></td>
            <td><?= $row['porcentaje'] ?>%</td>
            <td><strong>$<?= number_format($precio_final, 2) ?></strong></td>
        </tr>

        <?php } 
        } else { ?>
        <tr>
            <td colspan="4" style="text-align:center; padding:15px;">
                No hay descuentos disponibles en este momento.
            </td>
        </tr>
        <?php } ?>

    </table>

</div>

</body>
</html>

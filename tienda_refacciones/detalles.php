<?php
include "conexion.php";

if (!isset($_GET['id'])) {
    die("ID de producto no válido.");
}

$id = intval($_GET['id']);

$stmt = $conexion->prepare("SELECT * FROM productos WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    die("Producto no encontrado.");
}

$producto = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo $producto['nombre']; ?></title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>

<div class="contenido" style="margin-left:250px;">
    <div class="detalles-container">
        <img src="<?php echo $producto['imagen']; ?>" alt="Imagen del producto">

        <div class="info">
            <h2><?php echo $producto['nombre']; ?></h2>
            <p><strong>Precio:</strong> $<?php echo number_format($producto['precio'], 2); ?> MXN</p>
            <p><strong>Descripción:</strong> <?php echo $producto['descripcion']; ?></p>

            <form action="agregar_carrito.php" method="POST">
                <input type="hidden" name="id_producto" value="<?= $producto['id'] ?>">
                <button class="btn-agregar">Agregar al carrito</button>
            </form>

            <a href="index.php" class="btn-regresar">Volver</a>
        </div>
    </div>
</div>

</body>
</html>

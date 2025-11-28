<?php
session_start();
include('conexion.php');

// Si el usuario no ha iniciado sesión, lo redirige al login
if (!isset($_SESSION['nombre_usuario'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tienda de Refacciones Electrónicas</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body>
  <img src="img/Refacciones_de_radios.jpg" alt="Logo de la tienda" class="logo">

  <aside class="menu">
    <h2>🔧 Menú</h2>
    <ul>
      <li><a href="compras.php">Compras</a></li>
      <li><a href="descuentos.php">Descuentos</a></li>
      <li><a href="carrito.php">Carrito de compras</a></li>
      <li><a href="logout.php">Cerrar sesión</a></li>
    </ul>
  </aside>

  <main class="contenido">
    <div class="titulo">
      <h1>Bienvenido, <?php echo htmlspecialchars($_SESSION['nombre_usuario']); ?> 👋</h1>
      <p>Refacciones de Radio y Equipos Electrónicos</p>
    </div>

    <section class="galeria">
      <?php
// Consulta a la base de datos para obtener los productos disponibles
$sql = "SELECT * FROM productos WHERE disponible = 1";
$resultado = $conexion->query($sql);

if ($resultado->num_rows > 0) {
    while ($fila = $resultado->fetch_assoc()) {
        // Imagen por defecto si no hay
        $img = !empty($fila['imagen']) ? $fila['imagen'] : "https://via.placeholder.com/180x140.png?text=Sin+Imagen";
        ?>
        <div class="producto">
            <img src="<?= htmlspecialchars($img) ?>"
                 alt="<?= htmlspecialchars($fila['nombre']) ?>"
                 width="180" height="140">

            <h3><?= htmlspecialchars($fila['nombre']) ?></h3>

            <p>$<?= number_format($fila['precio'], 2) ?> MXN</p>

            <!-- Formulario seguro para agregar al carrito -->
            <form action="agregar_carrito.php" method="POST" style="margin-bottom:8px;">
                <input type="hidden" name="id_producto" value="<?= (int)$fila['id'] ?>">
                <button type="submit" class="btn-agregar">Agregar al carrito</button>
            </form>

            <!-- Enlace a página de detalles -->
            <a href="detalles.php?id=<?= (int)$fila['id'] ?>" class="btn-detalles">Ver detalles</a>
        </div>
        <?php
    }
} else {
    echo "<p>No hay productos disponibles.</p>";
}
?>

    </section>

  </main>
</body>
</html>

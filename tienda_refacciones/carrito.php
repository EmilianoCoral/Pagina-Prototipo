<?php
session_start();
include('conexion.php');

// Si no hay sesión, redirige
if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.php");
    exit();
}

$id_usuario = $_SESSION['id_usuario'];

// Obtener productos del carrito
$sql = "
    SELECT c.id, c.cantidad, p.nombre, p.precio, p.imagen
    FROM carrito c
    INNER JOIN productos p ON c.id_producto = p.id
    WHERE c.id_usuario = ?
";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$resultado = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Carrito de Compras</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body>

<img src="img/Refacciones_de_radios.jpg" class="logo">

<aside class="menu">
  <h2>🔧 Menú</h2>
  <ul>
    <li><a href="index.php">Inicio</a></li>
    <li><a href="descuentos.php">Descuentos</a></li>
    <li><a href="compras.php">Compras</a></li>
    <li><a href="logout.php">Cerrar sesión</a></li>
  </ul>
</aside>

<main class="contenido">
  <div class="titulo">
    <h1>🛒 Carrito de Compras</h1>
    <p>Productos agregados</p>
  </div>

  <!-- Botón Vaciar Carrito -->
  <form method="POST" action="vaciar_carrito.php" style="text-align:right; margin-bottom:20px;">
      <button style="background:#dc3545; color:white; padding:10px 15px; border:none; border-radius:6px; cursor:pointer;">
        🗑 Vaciar carrito
      </button>
  </form>

  <section class="galeria">

<?php
if ($resultado->num_rows > 0) {
    $total = 0;

    while ($item = $resultado->fetch_assoc()) {
        $img = (!empty($item['imagen'])) ? $item['imagen'] : "https://via.placeholder.com/180x140.png?text=Sin+Imagen";
        $subtotal = $item['precio'] * $item['cantidad'];
        $total += $subtotal;

        echo '
        <div class="producto">
            <img src="' . $img . '">

            <h3>' . htmlspecialchars($item['nombre']) . '</h3>
            <p>Precio: $' . number_format($item['precio'], 2) . ' MXN</p>

            <div style="margin:10px 0;">
                <form method="POST" action="actualizar_carrito.php" style="display:inline;">
                    <input type="hidden" name="id_carrito" value="' . $item['id'] . '">
                    <input type="hidden" name="accion" value="restar">
                    <button style="padding:5px 10px;">−</button>
                </form>

                <strong style="margin:0 10px;">' . $item['cantidad'] . '</strong>

                <form method="POST" action="actualizar_carrito.php" style="display:inline;">
                    <input type="hidden" name="id_carrito" value="' . $item['id'] . '">
                    <input type="hidden" name="accion" value="sumar">
                    <button style="padding:5px 10px;">+</button>
                </form>
            </div>

            <h4>Subtotal: $' . number_format($subtotal, 2) . ' MXN</h4>

            <form method="POST" action="eliminar_carrito.php">
                <input type="hidden" name="id" value="' . $item['id'] . '">
                <button style="background:#dc3545; color:white; padding:8px; border:none; border-radius:5px; cursor:pointer;">
                    ❌ Eliminar
                </button>
            </form>
        </div>';
    }

    echo '
    <div class="total-carrito" style="grid-column:1/-1; text-align:center; margin-top:20px;">
        <h2>Total: $' . number_format($total, 2) . ' MXN</h2>
        <button class="btn-comprar">Finalizar compra</button>
    </div>';
    
} else {
    echo "<p>🛍 Tu carrito está vacío.</p>";
}
?>

  </section>
</main>

</body>
</html>

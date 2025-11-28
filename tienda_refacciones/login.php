<?php
session_start();
include('conexion.php'); // Conecta a la base de datos ($conexion)

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    // Consulta el usuario por correo
    $query = "SELECT * FROM usuarios WHERE correo = ?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param("s", $correo);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows > 0) {
        $usuario = $resultado->fetch_assoc();

        // Verifica la contraseña
        if (password_verify($contrasena, $usuario['contrasena'])) {

            // Guarda los datos en la sesión
            $_SESSION['nombre_usuario'] = $usuario['nombre_usuario'];
            $_SESSION['id_usuario'] = $usuario['id'];

            // Redirige al index.php
            header("Location: index.php");
            exit();
        } else {
            $error = "❌ Contraseña incorrecta.";
        }
    } else {
        $error = "⚠️ Correo no registrado.";
    }
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Iniciar Sesión</title>
  <link rel="stylesheet" href="estilos.css">
</head>
<body class="login-page">
  <div class="login-container">
    <h2>🔐 Iniciar Sesión</h2>

    <?php if(isset($error)) echo "<p class='error'>$error</p>"; ?>

    <form method="POST" action="">
      <input type="email" name="correo" placeholder="Correo electrónico" required>
      <input type="password" name="contrasena" placeholder="Contraseña" required>
      <button type="submit">Entrar</button>
    </form>

    <p>¿No tienes cuenta? <a href="registro.php">Regístrate aquí</a></p>
  </div>
</body>
</html>

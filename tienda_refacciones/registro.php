<?php 
include('conexion.php'); // Carga $conexion

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre_usuario = trim($_POST['nombre_usuario']);
    $correo = trim($_POST['correo']);
    $contrasena = $_POST['contrasena'];
    $confirmar = $_POST['confirmar'];

    // Validar coincidencia de contraseñas
    if ($contrasena !== $confirmar) {
        $error = "❌ Las contraseñas no coinciden.";
    } else {

        // Encriptar contraseña
        $hash = password_hash($contrasena, PASSWORD_DEFAULT);

        // Verificar si el correo ya existe
        $verificar = $conexion->prepare("SELECT id FROM usuarios WHERE correo = ?");
        $verificar->bind_param("s", $correo);
        $verificar->execute();
        $resultado = $verificar->get_result();

        if ($resultado->num_rows > 0) {
            $error = "⚠️ El correo ya está registrado.";
        } else {

            // Insertar nuevo usuario
            $stmt = $conexion->prepare(
                "INSERT INTO usuarios (nombre_usuario, correo, contrasena) VALUES (?, ?, ?)"
            );
            $stmt->bind_param("sss", $nombre_usuario, $correo, $hash);

            if ($stmt->execute()) {
                header("Location: login.php?registro=ok");
                exit();
            } else {
                $error = "❌ Error al registrar usuario.";
            }
        }
    }
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registro de Usuario</title>
<link rel="stylesheet" href="estilos.css">
</head>
<body class="login-page">
  <div class="login-container">
    <h2>🧾 Crear Cuenta</h2>

    <?php if(isset($error)) echo "<p class='error'>$error</p>"; ?>

    <form method="POST" action="">
      <input type="text" name="nombre_usuario" placeholder="Nombre de usuario" required>
      <input type="email" name="correo" placeholder="Correo electrónico" required>
      <input type="password" name="contrasena" placeholder="Contraseña" required>
      <input type="password" name="confirmar" placeholder="Confirmar contraseña" required>
      <button type="submit">Registrar</button>
    </form>

    <p>¿Ya tienes una cuenta? <a href="login.php">Inicia sesión</a></p>
  </div>
</body>
</html>

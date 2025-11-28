<?php
session_start();

// Eliminar todas las variables de sesión
$_SESSION = array();

// Destruir la sesión completamente
session_destroy();

// Redirigir al formulario de inicio de sesión
header("Location: login.php");
exit();
?>

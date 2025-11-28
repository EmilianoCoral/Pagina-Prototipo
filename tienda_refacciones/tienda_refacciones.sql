-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2025 a las 04:35:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_refacciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_compra` datetime DEFAULT current_timestamp(),
  `cantidad` int(11) DEFAULT 1,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL CHECK (`porcentaje` >= 0 and `porcentaje` <= 100),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(169) DEFAULT NULL,
  `modelo` varchar(13) DEFAULT NULL,
  `marca` varchar(5) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `garantia` varchar(17) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `modelo`, `marca`, `cantidad`, `disponible`, `garantia`, `precio`, `descripcion`, `imagen`) VALUES
(1, 'Batería de Ni-MH - 2300mAh para radios PRO-3150/ CT150/ 250/ 450/ P040/ 080/ 885/ GP308, Clip incluido', 'TX-PMNN-4018H', 'TXPRO', 3, 1, '3 años con SYSCOM', 589.81, 'Batería Ni-HM con capacidad de 2300 mAh. Diseñada para ambientes extremos y uso rudo. Fabricada con policarbonato de alta resistencia. Celda de alta duración fabricada en Japón. Clip incluido para mayor conveniencia', 'https://bsai.com.mx/cdn/shop/files/GP308.-CLIP-INCLUIDO-TXPRO-33296073.jpg'),
(2, 'Batería de Li-Ion - 1800 mAh para radios EP-450/ DEP 450/CP200/CP250/PR400/GP3388/CP080/150/200 (incluye clip)', 'TX-NTN-4497', 'TXPRO', 3, 1, '3 años con SYSCOM', 542.63, 'Clip incluido. Capacidad: 1800 mAh. Química: Li-Ion. Utilizan celdas japonesas de alta duración.', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTrhMmfY3yKfHsblys2bOb4ansueJK1T6_DBuXcLAh79DbylQc7IKYgpYFn9mS4I55GJdJlkxuyLRx9Q5RIOHD5xl0ijKUHP0-tjpAxVCfrSV1IAKeTsV5n'),
(3, 'Batería Li-Ion - 1800 mAh para radios TK-2000 TK-3000, clip Incluido', 'TXKNB65', 'TXPRO', 6, 1, '3 años con SYSCOM', 392.82, 'Capacidad de carga de 1800 mAh. Fabricada con policarbonato resistente a golpes. Celdas japonesas de alta duración. Selladas con soldadora sónica. Cumple con estándares militares.', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRftXY34-F793_l0Zi8XTZz9JGTPzsDiNQ-pZIYq0GvRzP95po1H-Srq1eP5lvl6xrZ6xNzszJuvTBEDV3TFBqlD4Lr-q-4XqTSFaTr8cpSjV6rALb1ODZu'),
(4, 'Cargador rápido de escritorio para baterias KNB45L - KNB63L y KNB-65L para Radios NX240/ NX340/ TKD240/ TKD340', 'TX-KSC35', 'TXPRO', 6, 1, '3 años con SYSCOM', 392.03, 'Compatibilidad con modelos Kenwood variados. Carga rápida desde 1.6 hasta 2.8 horas. Función de recarga automática al apagar radio. Prevención de sobrecarga con tecnología inteligente.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSthXXo6QMd0Gi7nAiqU4iONKcbMIlMomPK8U0OOili5JDneVg5YEjD5EOxRT594gTFtDqsg90KrW9VP8J9ekwK-k0K0F59C2Mc4_x6T0wgmXJHCif3LYfw'),
(5, 'Cargador rápido de escritorio para Radios R2 - EP450 - DEP450 - CP080 - CP140 - CP150 - CP160 - CP180 - CP200 - CP250 - PR400 - GP3688', 'TX-CHEP450', 'TXPRO', 0, 0, '3 años con SYSCOM', 443.80, 'Evita sobrecarga, recarga automática al dejar encendido. Compatible con baterías originales y genéricas. Indicador LED para estado de carga de batería. Diseño compacto con fuente 120 VCA a VCC. Cargador confiable, popular entre profesionales.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQzVR9roBxSf5QR9amusN__VHDR4lu8PuaHCRYmIC66bEdjU_m484dOa17AbJ_ovQck4vfnsBXdtgCpkucT_2siFS3NGIUVcISrAH7OSPiSm80z7wiSmGgRaQ'),
(6, 'Cargador rápido de escritorio para radios PRO5150/ Elite/EX500/600 y batería TXJMNN4024', 'TX-HTN-300', 'TXPRO', 5, 1, '3 años con SYSCOM', 470.54, 'Corriente de carga: 800 mA eficiente. Compatible con varios modelos de radio. Funciona entre -20°C y +45°C. Conexión adaptable para vehículos. Interrumpe carga por condiciones extremas.', 'https://novusred.mx/98643-large_default/cargador-r%C3%A1pido-de-escritorio-para-radios-pro5150-eliteex500600-y-bateria-txjmnn4024-72550.jpg'),
(7, 'Carcasa de plástico para Radio Kenwood TK2202 - Incluye Accesorios', 'TXCTK2202', 'TXPRO', 10, 1, '3 años con SYSCOM', 273.48, 'Carcasa de plástico para radio Kenwood TK2202. Carcasa de repuesto de alta resistencia y calidad. Incluye accesorios, sin tornillos incluidos. Compatibilidad específica con radios Kenwood. Recomienda tornillos modelo N30-2604-48.', 'https://www.micom.mx/storage/productos/medium_23517.PNG'),
(8, 'Carcasa de plástico para Radio Kenwood TK2212/Incluye Accesorios', 'TXCTK2212', 'TXPRO', 4, 1, '3 años con SYSCOM', 402.14, 'Carcasa de plástico resistente y duradera. Diseño específico para Kenwood TK2212. Incluye accesorios de montaje completos. Alta calidad y precisión en el ajuste. Fácil instalación sin herramientas adicionales.', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQDYaqGTEY1db62FjhJQgAAO-ftxPVvMylXBQj8ZEiAT_cOYw4uOZ8oZfbjPodjJGBo7El25BlGUAJKg8SppE-ALiDy4W2_WgGw1LLanGRdld21IVj-jzLdwhk'),
(9, 'Carcasa de plástico para Radio DGP8550', 'TXCDGP8550', 'TXPRO', 0, 0, '3 años con SYSCOM', 946.50, 'Construcción robusta para mayor durabilidad. Diseño específico para radio DGP8550. Material plástico de alta resistencia. Compatibilidad con radios Motorola. Reemplazo fácil de instalar.', 'https://www.tecnodepot.mx/wp-content/uploads/2024/05/TXCDGP8550-h.png'),
(10, 'Carcasa de plástico para Radio DEP550', 'TXCDEP550', 'TXPRO', 1, 1, '3 años con SYSCOM', 740.30, 'Construcción plástica durable para radios DP550. Diseñada para alta resistencia y calidad. Compatible con modelos de radio específicos. Ideal para uso en entornos exigentes. Fácil instalación y reemplazo eficiente.', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSE7kVZ7YO5otLyS3iRSXsYBY77UIVZdQpfrwbb1R2j0TMBOXiGRXMcQP3bEMMmjYCjd6cEBu2fQ9q_ZfalTs1Bii1SSX9hGfeOZM0BRhHpr9DTLVNyL-HWhA'),
(11, 'Carcasa de plástico para Radio DEP450', 'TXCDEP450', 'TXPRO', 6, 1, '3 años con SYSCOM', 197.38, 'Alta resistencia para protección duradera. Plástico de calidad para radios DE450. Compatible con modelos de radio específicos. Diseño ergonómico para fácil manejo. Ligera pero robusta para uso intensivo.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS_Ru-gVpTul09xbJCtKIZdSgXRCJ1l2-XRdQhZU-tWev6gTGr-pJNZc7VBK5LafhJYeZccD7euE9d77OQBDpELGJvNpECtNDXPFWKeXezkDVWDuKOSpX7Pdg'),
(12, 'Carcasa de plástico para Radio DEP570E', 'TXDEP570E', 'TXPRO', 1, 1, '3 años con SYSCOM', 1061.20, 'Carcasa de plástico resistente alta calidad. Diseñada para radio DEP570e específica. Compatibilidad garantizada con radios Motorola. Fácil instalación en radios existentes. Protección ante impactos y desgaste.', 'https://www.tecnodepot.mx/wp-content/uploads/2024/05/TXDEP570E-h.png'),
(13, 'Antena UHF Helicoidal - 400-470 MHz - para Radios DEP570/DGP8050/DGP8550/DEP570E/DGP8550E', 'TX4079', 'TXPRO', 20, 1, '3 años con SYSCOM', 101.58, 'Antena helicoidal para radios portátiles. Rango de frecuencia: 400-470 MHz. Impedancia de 50 ohmios. Radiación omnidireccional y polarización vertical. Longitud total: 170.3 mm', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRKkBZ_lssW5KKuevRZKL1mi6d6Ux29h1NAwccMNeH0m48bo5rTlqXVg_ILsUKLYKLdB8blYhB5Un81foWBE50agKaBB20ZMa_2pegPqBQDB7DOjkJXPbHCE6Y'),
(14, 'Antena UHF Helicoidal Recortada - 400-470 MHz - para Radios DEP570/DGP8050/DGP8550/DEP550E/DEP507E/DGP8550E', 'TX4069', 'TXPRO', 20, 1, '3 años con SYSCOM', 73.71, 'Antena helicoidal para radios portátiles. Rango de frecuencia: 400-470 MHz. Impedancia de 50 ohmios. Radiación omnidireccional y polarización vertical. Conector tipo rosca monopolo.', 'https://www.tecnodepot.mx/wp-content/uploads/2024/05/TX4069-h.png'),
(15, 'Antena UHF Helicoidal Recortada - 400-470 MHz - para Radios Portátiles PRO5150/EP450/DEP450/CP200/GP300 de Conector Rosca tipo Monopolio', 'DEPR450', 'TXPRO', 20, 1, '3 años con SYSCOM', 37.97, 'Antena helicoidal recortada para radios portátiles. Rango de frecuencia: 400-470 MHz, central 460 MHz. Impedancia de 50 ohmios para mejor rendimiento. Radiación omnidireccional con polarización vertical. Fabricada en uretano y plástico ABS resistente.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRWuyMvlpc2JuVEEUurGwrlyC1CmLxG2JYwX_VJi6x_TwInaThckIJclFLuWUoUPJhPAhtmojstY1UBzWkJDmfGinqjWepExlXjffr9Rpx4EFKuZYUcieoRFLY'),
(16, 'Perillas de Canal y Volumen para Radios Portátiles EP450/ CP200/ PRO5150 - PRO3150', 'TXBEP450', 'TXPRO', 0, 0, '3 años con SYSCOM', 27.20, 'Perillas de canal y volumen ergonómicas. Compatibilidad con amplios modelos de radios portátiles. Fácil instalación en múltiples dispositivos. Materiales duraderos para uso intensivo. Diseño optimizado para radios EP450 y CP200.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTdV4-meDwJ_vqLafNJKy-X1EwYhb60z477gfNcmahwjXGmiQ4aTymTCujOBsLfdt9nOveRn14jtcHoJCfcY_Q_L_TZBI_HG22l9t6Cx6t0QQacX1ptv2puAw'),
(17, 'Clip de cinturón para Radios DP1400/DEP450/EP450/PR400/CP200/CP200D/CP200XLS/CP040/CP140/CP150/GP3688', 'TX8255CLIP', 'TXPRO', 5, 1, '3 años con SYSCOM', 54.13, 'Fijación segura para radios portátiles compatibles. Compatible con múltiples modelos de radios específicos. Diseño robusto para ambientes exigentes. Facilita el transporte y acceso rápido. Material duradero para prolongada durabilidad.', 'https://www.fiberplay.com.mx/wp-content/uploads/2025/09/TX8255CLIP-p.png'),
(18, 'Micrófono - Bocina para Intemperie. Para TC - 500/ 518/ 600/ 610/ 700 y para GP300/ SP-50/ P1225/ PRO3150/ MAG ONE/ EP450/ EP350', 'TX-308-M01', 'TXPRO', 6, 1, '3 años con SYSCOM', 303.04, 'Norma IP54 sellado contra polvo y líquidos. Botón PTT operable con guantes en frío. Cables reforzados con Keviar, mayor durabilidad.Clip giratorio 360 para máxima comodidad. Prueba de tensión del cable hasta 40 kg.', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTlj8U5ZNBW_JWCz3BBAQmAKXGE1OcFHHHOwCcq6k-x4S9rdRMUN2wCkma9dk_ppU25IwEQbn25iWgjvzEGfKd-RHCtH0ENVo5r-I0kAcqTuDGheynzgDp-'),
(19, 'Micrófono - audífono de solapa con tubo acústico transparente para KENWOOD TK3230/3000/3402/3312/3360/3170 - NX240/340/220/320/420 con tubo acústico de PU (grado médico)', 'TX-EHKAV2', 'TXPRO', 5, 1, '3 años con SYSCOM', 204.65, 'Tubo acústico de PU grado médico, flexible y terso. Kit de vigilancia con 2 cables, discreto y cómodo. Micrófono y bocina con audio nítido. Cable reforzado con Keviar para mayor durabilidad. Compatible con radios Kenwood en modo convencional.', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQF0Nh1-0RPzgCaD9bhNPvDUP4gBpg_OyYoY7wwfAguo_5MPNDBs-wFRNWGb2cLY7pGOieuU3xia8mw5jGrITnOGpbvLhOhJacp496U8KRwE9atAQwXAAGj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `contrasena`, `nombre_usuario`) VALUES
(1, 'emilianocoral2002@gmail.com', '$2y$10$z4wvP.0bLqsRg0WWv8au5OuP/aRfPQ0PnFwmysD5tOTqLblyZG6rm', 'Emiliano'),
(2, '2232018@uqroo.mx', '$2y$10$7FejEaD43PXUhthvYJPKsut/qMbXOGXpUz.GPdt7A3pj66490KRFm', 'Kevin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD CONSTRAINT `descuentos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

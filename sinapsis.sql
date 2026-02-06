-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2026 a las 00:49:52
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
-- Base de datos: `sinapsis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campania`
--

CREATE TABLE `campania` (
  `idCampania` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `fechaHoraProgramacion` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campania`
--

INSERT INTO `campania` (`idCampania`, `nombre`, `idUsuario`, `fechaHoraProgramacion`, `estado`) VALUES
(1001, 'Promoción Tarjetas de Crédito', 101, '2024-01-15 09:00:00', 1),
(1002, 'Recordatorio Pago Facturas', 102, '2024-01-10 14:30:00', 1),
(1003, 'Oferta Semanal Supermercado', 103, '2024-01-12 10:00:00', 1),
(1004, 'Citas Médicas Enero', 105, '2024-01-05 08:00:00', 0),
(1005, 'Inscripciones Semestre 2024-1', 107, '2024-01-20 09:00:00', 1),
(1006, 'Menú Especial Fin de Semana', 108, '2024-01-13 18:00:00', 1),
(1007, 'PRUEBAS UNITARIAS', 101, '2024-01-10 19:36:00', 1),
(1008, 'PRUEBAS UNITARIAS', 101, '2024-01-10 19:36:00', 1),
(1009, 'PRUEBAS UNITARIAS', 101, '2024-01-10 19:36:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `estado`) VALUES
(1, 'Banco Nacional', 1),
(2, 'Tiendas Supermax', 1),
(3, 'Clínica Salud Total', 1),
(4, 'Universidad Tecnológica', 1),
(5, 'Restaurante El Sabor', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `idMensaje` int(11) NOT NULL,
  `estadoEnvio` int(11) DEFAULT NULL,
  `fechaHoraEnvio` datetime DEFAULT NULL,
  `mensaje` varchar(160) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`idMensaje`, `estadoEnvio`, `fechaHoraEnvio`, `mensaje`, `estado`) VALUES
(5001, 1, '2024-01-15 09:05:00', 'Aprovecha nuestra promoción de tarjetas con 0% de interés por 6 meses. Más info en www.bancanacional.com', 1),
(5002, 1, '2024-01-15 09:06:00', 'Tu tarjeta de crédito tiene beneficios exclusivos. Descúbrelos en nuestra app móvil.', 1),
(5003, 2, '2024-01-10 14:35:00', 'Recordatorio: Tu factura vence el 20/01/2024. Paga a tiempo y evita recargos.', 1),
(5004, 3, '2024-01-10 14:36:00', 'Gracias por ser cliente preferencial. Tu pago ha sido procesado exitosamente.', 1),
(5005, 0, '2024-01-12 10:05:00', '¡Esta semana en Supermax! Arroz, azúcar y aceite con 20% de descuento. Solo hasta el domingo.', 1),
(5006, 1, '2024-01-12 10:07:00', 'Frutas y verduras frescas llegaron hoy. Ven por tus manzanas y lechugas favoritas.', 1),
(5007, 2, '2024-01-05 08:05:00', 'Dr. Rodríguez tiene disponibilidad para controles este viernes. Agenda tu cita al 555-1234.', 0),
(5008, 1, '2024-01-20 09:10:00', '¡Últimos días para inscripciones! No pierdas tu cupo para el semestre 2024-1. Inscríbete en línea.', 1),
(5009, 1, '2024-01-20 09:15:00', 'Clases inician el 5 de febrero. Consulta tu horario en el portal estudiantil.', 1),
(5010, 1, '2024-01-13 18:05:00', 'Este fin de semana: Paella marinera especial. Reserva al 555-9876. Cupos limitados.', 1),
(5011, 2, '2024-01-13 18:10:00', 'Postre del día: Tiramisú casero. Perfecto para terminar tu comida especial.', 1),
(5012, 1, '2024-01-16 11:00:00', 'Nuevo: App Banco Nacional. Descárgala y realiza transferencias sin costo.', 1),
(5013, 0, '2024-01-17 16:00:00', 'Mantenimiento programado: Nuestra app no estará disponible hoy de 2am a 4am.', 1),
(5014, 3, '2024-01-18 12:00:00', 'Encuesta de satisfacción: Ayúdanos a mejorar. Responde 3 preguntas aquí: [link]', 1),
(5015, 1, '2024-01-19 15:00:00', '¡Feliz viernes! Disfruta del 15% de descuento en licores con tu tarjeta Supermax.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idCliente`, `usuario`, `estado`) VALUES
(101, 1, 'ana.banco', 1),
(102, 1, 'carlos.finanzas', 1),
(103, 2, 'maria.supermax', 1),
(104, 2, 'luis.inventario', 0),
(105, 3, 'dr.rodriguez', 1),
(106, 3, 'enfermera.laura', 1),
(107, 4, 'admin.utec', 1),
(108, 5, 'chef.juan', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campania`
--
ALTER TABLE `campania`
  ADD PRIMARY KEY (`idCampania`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`idMensaje`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campania`
--
ALTER TABLE `campania`
  ADD CONSTRAINT `campania_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`IdCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

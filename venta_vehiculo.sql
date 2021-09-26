-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2021 a las 06:20:10
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `venta_vehiculo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `RUTa` varchar(13) NOT NULL,
  `contrasena` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`RUTa`, `contrasena`) VALUES
('11.111.111-1', '111'),
('22.222.222-1', '222\r\n'),
('33.333.333-3', '333'),
('44.444.444-4', '444'),
('55.555.555-5', '555'),
('66.666.666-6', '666');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `tipob` enum('Auto','SUV','Pick-up','Van','Deportivo','Camion') NOT NULL,
  `RUTa.Administrador` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`tipob`, `RUTa.Administrador`) VALUES
('Auto', '11.111.111-1'),
('SUV', '22.222.222-1'),
('Pick-up', '33.333.333-3'),
('Van', '44.444.444-4'),
('Deportivo', '55.555.555-5'),
('Camion', '66.666.666-6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `ID` int(3) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `RUTu.Usuario` varchar(12) NOT NULL,
  `IDv.Vehiculo` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `RUTp` varchar(12) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `RUTa.Administrador` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`RUTp`, `nombre`, `RUTa.Administrador`) VALUES
('12138038-2', 'Honda', '55.555.555-5'),
('12476673-7', 'Subaru', '66.666.666-6'),
('13141984-8', 'Pagani', '44.444.444-4'),
('14731403-5', 'Hyundai', '22.222.222-1'),
('15515347-4', 'Cadillac', '11.111.111-1'),
('20979048-3', 'Koenigsegg', '11.111.111-1'),
('21295577-9', 'Chrysler', '22.222.222-1'),
('21429132-0', 'Kia', '55.555.555-5'),
('22322170-k', 'Nissan', '44.444.444-4'),
('24136513-1', 'Fiat', '66.666.666-6'),
('7921841-3', 'Mazda', '33.333.333-3'),
('9424297-5', 'Subaru', '33.333.333-3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `RUTu` varchar(12) NOT NULL COMMENT 'RUT del usuario',
  `password` varchar(100) NOT NULL COMMENT 'Contraseña del usuario',
  `correo` varchar(40) NOT NULL COMMENT 'Correo de contacto del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`RUTu`, `password`, `correo`) VALUES
('16.251.076-2', '123qweasd', 'persona@gmail.com'),
('19.447.752-k', '2222', 'ariel@gmail.com'),
('19.776.936-k', '1111', 'javier@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `IDv` int(3) NOT NULL COMMENT 'digito verificador de cada vehiculo',
  `tipo` enum('Auto','SUV','Pick-up','Van','Deportivo','Camion') NOT NULL COMMENT 'tipo de vehiculo',
  `modelo` varchar(100) NOT NULL COMMENT 'nombre del vehiculo',
  `marca` varchar(20) NOT NULL COMMENT 'quien fabrico el vehiculo',
  `ano` int(4) NOT NULL COMMENT 'cuando se ensamblo el vehiculo',
  `km` int(7) NOT NULL COMMENT 'cuantos kilometros tiene recorrido el vehiculo',
  `transmicion` enum('Manula','Automatico','','') NOT NULL COMMENT 'de que tipo es la caja de cambios del vehiculo',
  `precio` int(10) NOT NULL COMMENT 'cuanto cuesta el vehiculo',
  `tipob.Bodega` enum('Auto','SUV','Pick-up','Van','Deportivo','Camion') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`IDv`, `tipo`, `modelo`, `marca`, `ano`, `km`, `transmicion`, `precio`, `tipob.Bodega`) VALUES
(40, 'Auto', 'Sail', 'Chevrolet', 2021, 0, 'Manula', 6690000, 'Auto'),
(49, 'Auto', 'I20', 'HYUNDAI', 2021, 0, 'Manula', 6690000, 'Auto'),
(50, 'Auto', 'STONIC', 'KIA', 2017, 200000, 'Manula', 14000000, 'Auto'),
(51, 'Auto', 'MAZDA3', 'MAZDA', 2019, 1278935, 'Automatico', 1236867, 'Auto'),
(52, 'Deportivo', 'Series Convertible', 'BMW', 2020, 34567, 'Automatico', 25000000, 'Deportivo'),
(53, 'Deportivo', 'veloster', 'HYUNDAI', 2021, 0, 'Automatico', 10000000, 'Deportivo'),
(54, 'Camion', 'NKR 612', 'chevrolet', 2021, 0, 'Manula', 14000000, 'Camion'),
(55, 'Van', 'H-1', 'Hyundai', 2016, 108, 'Manula', 18990000, 'Van'),
(56, 'Deportivo', 'TT RS Roadster', 'Audi', 2019, 6523721, 'Automatico', 40000000, 'Deportivo'),
(57, 'Deportivo', 'NSX', 'Honda', 2017, 53721, 'Automatico', 15000000, 'Deportivo'),
(58, 'Pick-up', 'Ridgeline', 'Honda', 2016, 51234, 'Manula', 21472369, 'Pick-up'),
(59, 'Auto', 'Civic', 'Honda', 2021, 0, 'Automatico', 20000000, 'Auto'),
(60, 'Camion', 'NKR 612', 'chevrolet', 2020, 76632, 'Manula', 24948350, 'Camion'),
(61, 'Pick-up', 'Amarok', 'Volkswagen', 2016, 99, 'Manula', 18200000, 'Pick-up');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`RUTa`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`tipob`),
  ADD KEY `RUTa.Administrador` (`RUTa.Administrador`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RUTu.Usuario` (`RUTu.Usuario`),
  ADD KEY `IDv.Vehiculo` (`IDv.Vehiculo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`RUTp`),
  ADD KEY `RUTa.Administrador` (`RUTa.Administrador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`RUTu`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`IDv`) USING BTREE,
  ADD KEY `tipob.Bodega` (`tipob.Bodega`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `IDv` int(3) NOT NULL AUTO_INCREMENT COMMENT 'digito verificador de cada vehiculo', AUTO_INCREMENT=62;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`RUTa.Administrador`) REFERENCES `administrador` (`RUTa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`RUTu.Usuario`) REFERENCES `usuario` (`RUTu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`IDv.Vehiculo`) REFERENCES `vehiculo` (`IDv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`RUTa.Administrador`) REFERENCES `administrador` (`RUTa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_2` FOREIGN KEY (`tipob.Bodega`) REFERENCES `bodega` (`tipob`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

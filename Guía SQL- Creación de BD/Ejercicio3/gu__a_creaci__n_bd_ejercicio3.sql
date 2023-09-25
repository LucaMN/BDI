-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2023 a las 15:41:05
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guía_creación_bd_ejercicio3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fechaDeNac` date NOT NULL,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `legajo` int(11) NOT NULL,
  `numTelefono` varchar(100) NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleadosucursal`
--

CREATE TABLE `empleadosucursal` (
  `idEmpleado` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `dia` date NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabrica`
--

CREATE TABLE `fabrica` (
  `idFabrica` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `paisDeOrigen` varchar(100) NOT NULL,
  `cantEmpleados` int(11) NOT NULL,
  `nombGerente` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `color` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `costoFijoUnit` int(11) NOT NULL,
  `idFabrica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosucursal`
--

CREATE TABLE `productosucursal` (
  `idProducto` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `precioDeVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucaursal`
--

CREATE TABLE `sucaursal` (
  `idSucursal` int(11) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `descuentoGenerado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetadecredito`
--

CREATE TABLE `tarjetadecredito` (
  `idTarjeta` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigoDeSeg` int(11) NOT NULL,
  `fechaDeVen` date NOT NULL,
  `idCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `empleadosucursal`
--
ALTER TABLE `empleadosucursal`
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD PRIMARY KEY (`idFabrica`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idFabrica` (`idFabrica`);

--
-- Indices de la tabla `productosucursal`
--
ALTER TABLE `productosucursal`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `sucaursal`
--
ALTER TABLE `sucaursal`
  ADD PRIMARY KEY (`idSucursal`);

--
-- Indices de la tabla `tarjetadecredito`
--
ALTER TABLE `tarjetadecredito`
  ADD PRIMARY KEY (`idTarjeta`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  MODIFY `idFabrica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucaursal`
--
ALTER TABLE `sucaursal`
  MODIFY `idSucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjetadecredito`
--
ALTER TABLE `tarjetadecredito`
  MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucaursal` (`idSucursal`);

--
-- Filtros para la tabla `empleadosucursal`
--
ALTER TABLE `empleadosucursal`
  ADD CONSTRAINT `empleadosucursal_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `empleadosucursal_ibfk_2` FOREIGN KEY (`idSucursal`) REFERENCES `sucaursal` (`idSucursal`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idFabrica`) REFERENCES `fabrica` (`idFabrica`);

--
-- Filtros para la tabla `productosucursal`
--
ALTER TABLE `productosucursal`
  ADD CONSTRAINT `productosucursal_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `productosucursal_ibfk_2` FOREIGN KEY (`idSucursal`) REFERENCES `sucaursal` (`idSucursal`);

--
-- Filtros para la tabla `tarjetadecredito`
--
ALTER TABLE `tarjetadecredito`
  ADD CONSTRAINT `tarjetadecredito_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

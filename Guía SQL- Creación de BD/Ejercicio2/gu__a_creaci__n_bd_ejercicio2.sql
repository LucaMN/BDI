-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2023 a las 23:51:22
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
-- Base de datos: `guía_creación_bd_ejercicio2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientecomida`
--

CREATE TABLE `clientecomida` (
  `idCliente` int(11) DEFAULT NULL,
  `idComida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clienterestaurante`
--

CREATE TABLE `clienterestaurante` (
  `idCliente` int(11) DEFAULT NULL,
  `idRestaurante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellio` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

CREATE TABLE `comida` (
  `idComida` int(11) NOT NULL,
  `idRestaurante` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `tiempoDePreparacion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidarestaurante`
--

CREATE TABLE `comidarestaurante` (
  `idComida` int(11) DEFAULT NULL,
  `IdIngrediente` int(11) DEFAULT NULL,
  `cantidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `idIngrediente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idTipoIngrediente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `idRestaurante` int(11) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoingrediente`
--

CREATE TABLE `tipoingrediente` (
  `idTipoIngrediente` int(11) NOT NULL,
  `grupoAlimentos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientecomida`
--
ALTER TABLE `clientecomida`
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idComida` (`idComida`);

--
-- Indices de la tabla `clienterestaurante`
--
ALTER TABLE `clienterestaurante`
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idRestaurante` (`idRestaurante`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`idComida`),
  ADD KEY `idRestaurante` (`idRestaurante`);

--
-- Indices de la tabla `comidarestaurante`
--
ALTER TABLE `comidarestaurante`
  ADD KEY `idComida` (`idComida`),
  ADD KEY `IdIngrediente` (`IdIngrediente`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`idIngrediente`),
  ADD KEY `idTipoIngrediente` (`idTipoIngrediente`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`idRestaurante`);

--
-- Indices de la tabla `tipoingrediente`
--
ALTER TABLE `tipoingrediente`
  ADD PRIMARY KEY (`idTipoIngrediente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comida`
--
ALTER TABLE `comida`
  MODIFY `idComida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `idRestaurante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoingrediente`
--
ALTER TABLE `tipoingrediente`
  MODIFY `idTipoIngrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientecomida`
--
ALTER TABLE `clientecomida`
  ADD CONSTRAINT `clientecomida_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `clientecomida_ibfk_2` FOREIGN KEY (`idComida`) REFERENCES `comida` (`idComida`);

--
-- Filtros para la tabla `clienterestaurante`
--
ALTER TABLE `clienterestaurante`
  ADD CONSTRAINT `clienterestaurante_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `clienterestaurante_ibfk_2` FOREIGN KEY (`idRestaurante`) REFERENCES `restaurante` (`idRestaurante`);

--
-- Filtros para la tabla `comida`
--
ALTER TABLE `comida`
  ADD CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`idRestaurante`) REFERENCES `restaurante` (`idRestaurante`);

--
-- Filtros para la tabla `comidarestaurante`
--
ALTER TABLE `comidarestaurante`
  ADD CONSTRAINT `comidarestaurante_ibfk_1` FOREIGN KEY (`idComida`) REFERENCES `comida` (`idComida`),
  ADD CONSTRAINT `comidarestaurante_ibfk_2` FOREIGN KEY (`IdIngrediente`) REFERENCES `ingrediente` (`idIngrediente`);

--
-- Filtros para la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`idTipoIngrediente`) REFERENCES `tipoingrediente` (`idTipoIngrediente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

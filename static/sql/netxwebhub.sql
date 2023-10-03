-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-10-2023 a las 15:59:20
-- Versión del servidor: 5.7.41-log
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `netxwebhub`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferenciasu`
--

CREATE TABLE `preferenciasu` (
  `id` int(11) NOT NULL,
  `categorias` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `nombre img` json NOT NULL,
  `fechareg` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nameu` varchar(50) NOT NULL,
  `emailu` varchar(50) NOT NULL,
  `passwordu` varchar(105) NOT NULL,
  `perfilu` char(1) NOT NULL DEFAULT 'C'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nameu`, `emailu`, `passwordu`, `perfilu`) VALUES
(1, 'santiago', 'santiago', 'pbkdf2:sha256:600000$3u8cq5HbNpahni3E$7355de0eb6b826e499e620759d06f840ad82f7a88a807a5dfd9341f188ce1a6f', 'C'),
(15, 'pepe', 'pepe', 'pbkdf2:sha256:600000$arcDiwhepVWim5H2$a7beb5f5633dec3888ec1e87ff3e13e84efb8a2ae47809452001a416221071a0', 'A'),
(16, 'santi', 'santi', 'pbkdf2:sha256:600000$0HGtbFzV8VWzBaxE$25deb314454223830f98b533a6ad111ff2353814c37a4672b6c5bf15470fd430', 'C');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `preferenciasu`
--
ALTER TABLE `preferenciasu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `preferenciasu`
--
ALTER TABLE `preferenciasu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preferenciasu`
--
ALTER TABLE `preferenciasu`
  ADD CONSTRAINT `preferenciasu_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

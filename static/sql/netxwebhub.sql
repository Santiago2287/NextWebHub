-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-11-2023 a las 13:52:37
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
(1, 'santiago Tadeo', 'santiago@gmail.com', 'pbkdf2:sha256:600000$WvoltvoDF3MRUmxX$b4b375bd36c5944fcc188c8dfa5fe715af5430027af69f055bc0815fc2dbcb5a', 'C'),
(15, 'pepe y adrian', 'pepe', 'pbkdf2:sha256:600000$sVR9cNF0CNiohLTx$b0cce1460b58667f349bb31b8c4456a5d552c80954396be7ba3dd5d8aae1f2f8', 'A'),
(16, 'santi', 'santi', 'pbkdf2:sha256:600000$0HGtbFzV8VWzBaxE$25deb314454223830f98b533a6ad111ff2353814c37a4672b6c5bf15470fd430', 'A'),
(19, 'asdfghj', 'dfgh', 'pbkdf2:sha256:600000$5hx16srljz5zWLuA$75360ea7d79822bf389e5a5397441be3006d32990ed55ff86b226da8f85f36d8', 'A'),
(20, 'santiago', 'santiago.robles1665@alumnos.udg.mx', 'pbkdf2:sha256:600000$jmsMeeINOx5dhHeq$e34489b61084883dddac75aa1d584973193ab852f4fa0e1c9c62235d3b3d6606', 'C'),
(21, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$aExjFQuBvmtXVzZh$b186a84f2bef89783d76c3a75619c02f9534405530503448bd138fa202e166a2', 'C'),
(22, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$wkih6CVtJQIaFdOA$568ef11fcdc3ec5a7dbf1f4e0c63fd4b712baf614a127b187e7ff72aed356273', 'C'),
(23, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$xDEB78BE5x7BYduV$15e362ee4f6da5aefc05a350396966046c4f660b22a014a6198bb58eec3f2ea7', 'C'),
(24, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$rM1PhxKdjURCX3ns$b1fe89a84ecf94cf5ffa00fb009b19d05e305974332d7f71c8e2a9876b8785ea', 'C'),
(25, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$VG7eaH4In7i34nSy$c6a0ab47418f4667c8188a045afe9056dcab22fdf11d68a9bd263c21eb90431a', 'C'),
(26, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$rEe6UQaA388VYryF$dfd9397aa61df529ffd5fbe59b992d49426bf6a2e743e3c23e5a4cc9998fecb0', 'C'),
(27, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$ZVWHbiWffQxweFHm$b141f290df7d3960fa040eb0740d82583a42b6da8f340fd6a8029491385687c8', 'C'),
(28, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$3wYhOoAcFWIqZWKD$8a1c8baf5ea31670aed3d8a6a426c5ecd72d822a7010719800f02e4ac9764eca', 'C'),
(29, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$yMgWeLrFKvlVfZsf$088c83df50a8fa9b97060f85a2c59063a7fa5fde430e469b71df1aa2c374601d', 'C'),
(30, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$CAg2fXSkIwWfGAEo$591f34dac84468089d667f116c61ddf81dca64cd2a280c76837e900d688136a8', 'C'),
(31, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$RfWhz4RerN6rJgE0$f4154520fd6c12664bfa432c2fb460efc674d2056f8dde1e5bb9229b62aacbe1', 'C'),
(32, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$U1j5pjkpx3zkMgdk$085e59b4925dfa9382cd0e51941f528e70ebd1a4ac815c2430e6ce1ec76055ec', 'C'),
(33, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$Ot8e1Vk8eSM7XRYR$a59c1573bbfafefb33c4f496dc9941cc75621d2f121f4936e7d35b312493fc99', 'C'),
(34, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$hue8spusFQAnzpnh$8fea79978e0c18051bb3fff56705a3a588fe597a1045ab78518e1772bddc4180', 'C'),
(35, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$boQPnvrMqxGtFTFO$00ecc5014a9f2fe190331aafa95308b8963b0cf7493d9c98b69ecd293104bca9', 'C'),
(36, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$0xgfMwxTZGHn0MdK$8211c63f01cdcc13c394ae940f8178c3c5fac1887a70ebe23b373fbb0a6df3e3', 'C'),
(37, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$fNRGwoYdf0Y9dYk8$22eb94ee1d8c09df25875ea4d0d871fb07c60256715da3f61478e16c7f9c1660', 'C'),
(38, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$OOrxfofX4sktoAKR$ddbe1b512b7b2b5a8a851ba107050d3698d5360ef9388e4bc1e55472d4f42e66', 'C'),
(39, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$83k98nAdZprOCgvm$097a43947096f07f6f075e7039c923123d8cb7a1b5261f5335b40ac2097b5ae8', 'C'),
(40, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$nokBOnKIVhdPIO3x$cd3bcd230f47e67470b1852ea0a0f80ecfc3d3b4b1f1b99cdd039728cb47ba3b', 'C'),
(41, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$pNCuDSdEouWTHiKh$34d53b34593458711573d680d238b391a9603c1c7a9af486b18c59be60ab4ef2', 'C'),
(42, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$8NsXjSscYcKPRt7z$82413f1fbcdd3cfeb3adcbcb2e58ea047729801ba500799a125b3440609d209f', 'C'),
(43, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$NBgzhZR06lOz6ROI$a1d2a22269f7e9381452487eba631874c84f34bae1f735ff52d41964ef06ac42', 'C'),
(44, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$Zf602bxVk1Adfj4p$3afaa485fb87e62c0f97afda499d789ceaf6871048591d73de3d64f1e59952b4', 'C'),
(45, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$BZW5Dw4vZirm5t7O$3bbfa63c5df1c8ab4ae6301c37700c95614ad556330dce6c8e7e2d276497958d', 'C'),
(46, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$OSPb8aXv64treTYP$79bef4976d7735b1719a572d5df1a93d4b0eeeeeb33f4714343467714435788a', 'C'),
(47, 'pepe', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$hanSB8Fvy6mvQQ8v$0eccd40d377a56999e19f252119f8bb87eb8a4a981df971defdd85b4187ec513', 'C'),
(48, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$2CapcuTv2AFW6mBv$0a6aff4ad3605696b7fe92a63c188fb5d1dd1b9f9c99a05eed4718cb8e4a422a', 'C'),
(49, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$XVh7usXSwReUn4R8$35a1cad45529a40c1cc6dc6e98f27cbc9260b9d7ed93b554053c641eed85e341', 'C'),
(50, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$TuaBlpKfY9IxkqpT$472181188a5d5c9b6105955597ff3c9c7050fc4fdb1112a0a0092fb73fb44af0', 'C'),
(51, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$s20s12aWE8zWL1wJ$66c0e83fccd75fb97540b49da977e94c667d049cf3e8b1aa7a2d8af3d688e44d', 'C'),
(52, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$y8n8lCYr9jMbpXjR$60c00241707b323924f36062d1bed92be26a7eb85cd12d9af59a778ce402895d', 'C'),
(53, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$T33ZDEnlcpFvu8uF$484f0f67c75fe21149959da5d225a901f8261fc1dc4efc08b83a0575b93482d2', 'C'),
(54, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$iGYB6S0637OKyKMC$3cd94196af1af8d6cae3c3a77879d21b60abe3dbffefd52a119d87b6e719876e', 'C'),
(55, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$OYCOiUoOjUJxn9lu$9d4e02d7221c83b9d74f6b9d15e7a3efc466213bcb7b27ba5101c7c27bf93072', 'C'),
(56, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$3oS8Iq44y32eAWxC$a1aca1c7ed161902c8521f96c87782880c5c8cb9cc71ebe67b2451f96ed7f785', 'C'),
(57, 'pepe', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$LGJ6x9HJZJ6iwL4m$ac9699f4b20dc416b836fb06789a95d1f83c30f085e9ad4a7d32d17302fc138f', 'C'),
(58, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$gd1m16mVn8IAHr0J$761b34c25adc5458bb80301493f8c144c0c6786a0c50170f417163d4f31c2d3c', 'C'),
(59, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$77YZekbDx9ytA2QW$0126ce343b68fb377a7c970f19edf49389cbd613d2d1aeb7a0c853548b2bcfda', 'C'),
(60, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$fydslabqzyjPeZ2F$2ae2b61ace5d0f81c9863b7baa5f074e7758f9e7e6c21259a3fe06c684d8f1a9', 'C'),
(61, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$3kFGWt9TBFyBlk1A$b383cd8c0cd59d09a706b94674757012e5f9b5f7b1cc4f380935d31dc55622ba', 'C'),
(62, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$0n4QIf3sPa1mZFXe$c66650ef1ce36ec19f37c7c8413afd7fe76ea3cd311972e666ccec6846b0c83d', 'C'),
(63, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$bEOGY39jWCiruczE$8b7de4196821f5ad3e0313797705a548ad0c8f28e202aa43d7dfe9d775d9ba5c', 'C'),
(64, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$akBoWsBqNsKNRd3C$33991bff4298feba417d691cc3204dbda0169354e02adde93b356e3dbbf4e566', 'C'),
(65, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$aQWGRnM2DEvGNnA9$ca587eac17adcac4f725559e20351d345f30a9263766578f843f33c74382431b', 'C'),
(66, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$BeIfvKYDd51kUA7Z$5a34493e35765dd67e4dd7f2f557e4630a57e21df420f5a49cfdfeb5f33fdc1b', 'C'),
(67, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$COXbCdlQLxjsQEmv$e93bed27b6b377491df2d63a256eb7743cd569197cee13dfa20b56e77171f64b', 'C'),
(68, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$BzbAGvo2L9LuFKtF$fabff38cc10772e11d0fac178cea096492590e8cbb73eb28d241708937c79ebf', 'C'),
(69, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$CXNS5eSHZDQ3WYVz$eaff2a38425a6d428af0481093b09dba3bdd8642757a0a762dff9fb53bc63d11', 'C'),
(70, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$E9QTPhmZ7o693c2j$1fccea9f183ca72912c55eaf09b53b7cde5d956c2f92be39bd2deeff4c4fa9da', 'C'),
(71, 'pepe', 'santiago.robles1665@alumnos.udg.mx', 'pbkdf2:sha256:600000$9UyiMsrGqIT3ZaHf$1b0431d0d3accacc4b50ac7bac27e8f089744b7a366db351c6ade8820ee25ae1', 'C'),
(72, 'pepe', 'santiago.robles1665@alumnos.udg.mx', 'pbkdf2:sha256:600000$8qHxrWe6IuuC2M3I$cae63f6c540c4597ce29cb45e7a18fae7d8b78f120462952380b685ff4eabd8c', 'C'),
(73, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$JYDVBXHT0FeSENyf$8f74fa2ce8b85807125f6301b98910a56bc59e23d3cee44a72072c08eae9dae4', 'C'),
(74, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$UuNkJyUDTONZxVg1$18586c9f674bd5f4571b5534a4e450a5edb8f550c18a4e60ede9b5c60bd4b682', 'C'),
(75, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$tFqiJHBK83VwkPfW$cfdd133aac4b933c225280a85c103bcaa1c4f294c95691a9b235c18ef44737be', 'C'),
(76, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$uauhgEeih5QAnroX$729b4effb6e07eb3fe32abcfe0df5ab56e80dfdc92afe12becef49c4235c645e', 'C'),
(77, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$ZeE0GR7aiPjwf7qA$f8b1dfb37ae13f386c98d8cf8792761a6b95c1e8fe541af7a58e3f1590427da4', 'C'),
(78, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$iTJ2xLklEoc7U8Ce$ad6575e6c087d9c6d77acf02f7b72067d3c4ea4474f6d0e75077f0b8cbf5fea1', 'C'),
(79, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$dlQdlCY8yNtutSPh$793ba9fcd026ff4abadacda40b2c3a4bed8caa5cd92b1b19593debde71cc2cb9', 'C'),
(80, 'santiago', 'ciberautronauta22@gmail.com', 'pbkdf2:sha256:600000$WlE1HpiT3mOQVpRp$171c05852a5d89342e104739b05942257fef5919b66f42c75a90a7dc67cc8387', 'C'),
(81, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$lX2rLzLDrFi1XYCQ$8250b0ccb9bdada21571a32a01f8073c4074bdb6caaf574fb10b1240a493736d', 'C'),
(82, 'santiago', 'santiagonano13@gmail.com', 'pbkdf2:sha256:600000$LJQmUfRk0QfS0SCa$514892479a17104f3639567bb7331a191438892dbc7b220fb0bcec426c5b02e1', 'C');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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

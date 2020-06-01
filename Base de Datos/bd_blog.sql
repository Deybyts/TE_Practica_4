-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2020 a las 23:24:26
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` int(11) UNSIGNED NOT NULL,
  `fecha` varchar(12) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id`, `fecha`, `titulo`, `contenido`) VALUES
(10, '25-05-2020', 'La tecnologÃ­a ante el COVID-19', 'Como si de un episodio de la distÃ³pica serie Black Mirror se tratara, el coronavirus sigue entre nosotros y, a diferencia del perverso uso de la tecnologÃ­a visto en la exitosa producciÃ³n de Netflix, en nuestro caso parece que esta servirÃ¡ para ayudarnos a sobrellevar mejor la pandemia desde un punto de vista sanitario. El distanciamiento social es la mÃ¡xima recomendada a toda la ciudadanÃ­a y ya estÃ¡n surgiendo propuestas de empresas tecnolÃ³gicas que pretenden evitar contagios en espacios donde se suelen producir aglomeraciones, ya sean supermercados, campos de futbol, transportesâ?¦'),
(11, '26-05-2020', 'Los beneficios de la impresiÃ³n 3D y la â??blockchainâ??', 'HabrÃ¡s podido ver en los informativos o la prensa cÃ³mo las impresoras 3D estÃ¡n ayudando a prevenir contagios de COVID-19, produciendo con esta tecnologÃ­a, tanto a pequeÃ±a como a gran escala, el material sanitario necesario para la labor de los profesionales.  Estas impresoras cuentan con ventajas como: permitir a las fÃ¡bricas personalizar el diseÃ±o del producto, agilizar la producciÃ³n o adaptarse con rapidez a las necesidades cambiantes del mercado. AdemÃ¡s, evita dependencias de agentes externos y deslocalizaciones, ya que todo el proceso productivo se lleva a cabo dentro de la misma empresas En cuanto a la blockchain o cadena de bloques, se trata de una estructura de datos en la que la informaciÃ³n contenida se agrupa en conjuntos (bloques) a los que se le aÃ±aden metainformaciones relativas a otro bloque de la cadena anterior en una lÃ­nea temporal, de manera que, gracias a tÃ©cnicas criptogrÃ¡ficas, la informaciÃ³n contenida en un bloque solo puede ser repudiada o editada modificando todos los bloques posteriores. Esto ayudarÃ­a a gestionar tramites digitales con la administraciÃ³n, para particulares o empresas, evitando tanto el riesgo de falsificaciones como el contacto fÃ­sico.'),
(12, '27-05-2020', 'La robÃ³tica en medicina facilita un mundo mÃ¡s humano', 'Desde la mÃ¡s remota antigÃ¼edad, el ser humano ha querido recrear su propia naturaleza de manera artificial. La creaciÃ³n de mÃ¡quinas con forma humana ha sido una constante en muchas civilizaciones con la finalidad de probar ingenio o diversiÃ³n, pero, bÃ¡sicamente, las mentes inteligentes de los hombres del pasado buscaban ayuda en la mejora de los trabajos mecÃ¡nicos que comportaran fuerza y repeticiÃ³n.\r\n\r\nLa creaciÃ³n de una similitud humana en una mÃ¡quina, o un autÃ³mata, comporta la reproducciÃ³n de movimientos y habilidades humanas con exactitud. Prueba de ello es el autÃ³mata creado en Londres, aproximadamente en el aÃ±o 1900, por Henri Maillardet, un suizo fabricante de relojes y otros mecanismos que â??dio vidaâ?? a una mÃ¡quina, un dibujante que era capaz de reproducir dibujos y escritura en forma de versos.'),
(13, '28-05-2020', 'TecnologÃ­a responsable: las mejores apps para cuidar del medio ambiente', 'El cuidado del medio ambiente se ha convertido en una de las preocupaciones mÃ¡s extendidas en la actualidad. El ser humano lleva aÃ±os utilizando los recursos naturales que nos brinda la naturaleza y, por contra, proyectando sobre ella las consecuencias, tanto positivas como negativas, de su actividad y su progreso en diferentes Ã¡mbitos.\r\n\r\nUno de los sectores que ha experimentado un mayor desarrollo en las Ãºltimas dÃ©cadas ha sido el tecnolÃ³gico. Cada dÃ­a se producen miles de dispositivos como electrodomÃ©sticos, televisores, ordenadores, tabletasâ?¦ y, sobre todo, telÃ©fonos mÃ³viles, con los efectos negativos que ello conlleva. Lo que muchos no tenemos en cuenta es que la tecnologÃ­a, bien utilizada, tambiÃ©n puede servir para ayudar al cuidado del medio ambiente.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`) VALUES
('david', 'user');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

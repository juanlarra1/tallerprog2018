-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 04, 2018 at 10:04 AM
-- Server version: 5.5.43
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Obligatorio`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `eliminado` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre`, `eliminado`) VALUES
(1, 'General', 0),
(2, 'Postres', 0),
(3, 'Entradas', 0),
(4, 'Celiacos', 1),
(5, 'Vegetariano', 0),
(6, 'Carnes', 0),
(7, 'Comidas Tipicas', 0),
(8, 'Pruebita', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `detalle` longtext NOT NULL,
  `respuesta` longtext NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  PRIMARY KEY (`comentario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`comentario_id`, `fecha`, `detalle`, `respuesta`, `usuario_id`, `publicacion_id`) VALUES
(1, '2018-07-23 00:47:29', 'Es realmente la receta de tu abuela?', 'Sí así es :)', 2, 2),
(2, '0000-00-00 00:00:00', 'ASDAS', 'ASSSSS', 1, 1),
(3, '0000-00-00 00:00:00', 'ASDASD', 'GGGGG', 1, 1),
(4, '0000-00-00 00:00:00', 'Excelente receta! la probe y sabe riquisima', 'De nada Luis! un gran saludo', 4, 1),
(5, '0000-00-00 00:00:00', 'El almidon hay que tamizarlo?', '', 4, 1),
(6, '0000-00-00 00:00:00', 'El almidon hay que tamizarlo?', '', 4, 1),
(7, '0000-00-00 00:00:00', 'El almidon hay que tamizarlo?', '', 4, 1),
(8, '0000-00-00 00:00:00', 'El almidon hay que tamizarlo?', '', 4, 1),
(9, '0000-00-00 00:00:00', 'Prueba prueba', '', 4, 1),
(10, '2018-08-04 09:11:49', 'Prueba prueba', '', 4, 1),
(11, '2018-08-04 09:11:54', 'ASDASDASD', '', 4, 1),
(12, '2018-08-04 09:13:18', 'ASDASDASD', '', 4, 1),
(13, '2018-08-04 09:13:44', 'ASDASDASD', '', 4, 1),
(14, '2018-08-04 09:14:11', 'ASDASDASD', '', 4, 1),
(15, '2018-08-04 09:14:22', 'ASDASDASD', '', 4, 1),
(16, '2018-08-04 09:14:30', 'ASDASDASD', '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

CREATE TABLE IF NOT EXISTS `favoritos` (
  `favorito_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  PRIMARY KEY (`favorito_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `favoritos`
--

INSERT INTO `favoritos` (`favorito_id`, `usuario_id`, `publicacion_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 0, 1),
(4, 1, 1),
(5, 1, 5),
(6, 1, 5),
(7, 1, 5),
(8, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `publicaciones`
--

CREATE TABLE IF NOT EXISTS `publicaciones` (
  `publicacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `texto` longtext NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`publicacion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `publicaciones`
--

INSERT INTO `publicaciones` (`publicacion_id`, `titulo`, `texto`, `fecha`, `imagen`, `categoria_id`, `tipo_id`, `usuario_id`, `eliminado`) VALUES
(1, 'GALLETITAS CON HARINA DE ALMENDRAS Y COCO SIN AZÚCAR NI TACC', 'Desde que me diagnosticaron diabetes los hidratos de carbono dentro mi alimentación se resignificaron. Si bien puedo comerlos, no tengo la misma libertad que antes para comer la cantidad que yo quiera, cuando quiera. A poco de cumplirse un año de mi DBT tipo 1, sigo investigando cuáles son las mejores opciones para no comer tantos hidratos, y por ende, para no usar tanta insulina. Pero no quiero aburrir, más allá de mi condición hoy les quiero proponer una receta que surge de esta pequeña investigación que estoy haciendo, el reemplazo de las harinas más tradicionales, por otras más saludables. Lamentablemente muchas veces lo saludable va de la mano de lo caro, y en Argentina no hay tantas opciones accesibles para quienes tenemos diabetes, así que por el momento hay que rebuscárselas. Les cuento que estas galletitas también las pueden comer los celíacos, ya que no tiene TACC. Además son ideales para que les preparen a los más peques (y con su ayuda), ya que son una alternativa rica y casera, que siempre es una mejor opción. A Ela le encantaron, y además de comerlas me ayudó a sacar las fotos!\nLes comparto la receta, me encantaría que me cuenten qué les parecieron!\n\n\n\n\n\n\n\n\n\nSobre la harina de almendras: \nHay muchas dietéticas y negocios que venden harina de almendras, que suele ser bastante cara. Les recomiendo que busquen precios. También pueden hacerla en casa. Yo en mi experimentación quise probar las dos alernativas, compré un paquete de 1/2 kilo a $210 en el mayorista El Portugués (recomiendo fuerte), pero también compré almendras para hacer la harina desde cero. Las puse en agua hirviendo para aflojar la cáscara, las tosté un poco en el horno para que se sequen bien, y una vez frías las pasé por un picador de alimentos. Si bien la textura no quedó tan fina como quería, me sirvió para hacer estas galles. Pero para hacer los budines que tengo pensado voy a usar la comprada, que es bastante más finita. \n\nSobre la harina de coco: \nOtra alternativa interesante a las harinas tradicionales es la harina de coco, que hice desde coco rallado, lo tosté en el horno a fuego suave, y lo pasé por el picador de alimentos. Quedó muy rica, y le dio un buen sabor a las galletitas, aunque no es para usar siempre ya que el coco suele invadir bastante. \n\nEstas galletitas son bien básicas, pero me pareció que por ser la primera vez que las hacía, no hacía falta incorporarle demasiados ingredientes extra. Ustedes si quieren le pueden agregar alguna ralladura, chips de chocolate, cacao, canela, etc. \n\nAhora si, la receta!\n\nIngredientes: \n\n		Harina de almendras: 150g\n		Harina de coco: 100g (opcional, si quieren pueden hacer todo con harina de almendras, o agregarle un poco de harina integral, si pueden comerla)\n		Manteca a temperatura ambiente: 50g (pueden reemplazarla por ghee)\n		Edulcorante tipo sucralosa o stevia: 4 sobres (0,8g cada sobre)\n		Esencia de vainilla: 1 cucharadita\n		Huevos: 1\n\n\nPaso 1: \nEn un bowl colocar las harinas y agregar la manteca o ghee a temperatura ambiente cortada en cubos, aplastar con un tenedor. \n\n\nPaso 2: Agregar el huevo, el endulzante y la esencia de vainilla. Integrar todo hasta formar una masa. \n\nPaso 3: Envolver la masa en film, dándole una forma alargada para poder cortar después las galletitas. Llevar a la heladera por 1 hora. \n\nPaso 4: Cortar las galletitas y colocar sobre una placa con un poco de manteca y almidón de maíz o harina (si la toleran). Llevar a horno precalentado a temperatura suave y cocinar por, aproximadamente, 12/14 minutos. Dejar enfriar sobre una rejilla. \n', '2018-07-23', 'IMG_1.jpg', 2, 1, 1, b'0'),
(2, 'TIMBAL DE ARROZ O EL "ARROZ BELGA" DE MI ABUELA MAMAMA', 'Hola! Hoy es el último día del año, y para despedirlo quiero recordar a mi abuela Mamama, tan central en este blog, que cumplía años cada 31 de diciembre. \nEn época de fiestas, mi abuela se pasaba todo el día en la cocina, y a pesar de ser su cumpleaños no dejaba de agasajarnos ni un poco. Entre sus tradiciones para estas fechas, no faltaba el timbal de arroz, al que ella llamaba "arroz belga", nunca sabré por qué, ya que por lo que estuve investigando el arroz belga es bastante distinto al que ella preparaba. \nLa cuestión es que el arroz no podía faltar en año nuevo porque significa "abundancia" para el año que comienza, y en mi familia la abundancia era muy preciada ya que, si bien nunca nos faltó nada, tampoco "nadábamos en la abudancia", como solía decir la otra Martita de la familia, mi mamá (Mamama también se llamaba Marta). Así que acá aprovecho para homenajear a estas dos Martas que tanto extraño, y que en estas fechas me tocan la fibra de la sensibilidad. \nDeseo un año de felicidad, de proyectos cumplidos, de nuevos sueños, y también de la mencionada "abundancia", en estos días de tanta carencia. Abundancia de amor, abundancia de solidaridad, abundancia de abrazos, abundancia de acuerdos, abundancia de consensos, abundancia de trabajo, abundancia de salud y abundancia de proyectos realizados. Feliz año!!', '2018-07-12', 'IMG_2.jpg', 1, 2, 1, b'0'),
(3, 'Pasta con vegetales al horno', 'Mezclar la pasta cocida con el choclo, morrón, zanahoria, queso dambo y jamón. Colocar la mezcla en 6 moldes individuales previamente aceitados. Aparte mezclar los huevos con la leche y agregar a cada molde. Hornear hasta dorar. \n \n\r\nSe puede preparar en un molde de aro y cortar en porciones. \n * El queso danbo se puede sustituir por otro tipo de queso gustoso y que funda bien. \n * El jamón se puede sustituir por panceta previamente salteada o por un fiambre gustoso (bondiola o salame). m * Se congela en porciones. \n * Se descongela en microondas al 40%.', '2018-05-05', 'pastaConVegetales.jpg', 1, 1, 1, b'0'),
(4, 'Copa de queso batido con cerezas y almendras tostadas', 'Echar en el vaso de la batidora el queso mascarpone con el azúcar y batir a baja velocidad hasta obtener una crema.\n \n\r\nAñadir la leche y batir a velocidad media procurando que no queden grumos. \n\r\nReservarlo en la nevera.\n\r\nTostar las almendras en una sartén antiadherente hasta que comiencen a dorarse.\n Lavar y secar las cerezas.', '2018-08-12', 'copa-cerezas.jpg', 2, 2, 1, b'0'),
(5, 'Canapé de Mozzarella', 'Para los canapés de mozzarella. Primero partimos por la mitad una granada y sacamos los granos del interior, golpeando con una cuchara. Visita nuestra entrada sobre como desgranar una granada fácilmente y verás qué fácil es. Reservamos.\n\r\nCortamos la mozzarella en rodajas gruesas, ponemos un poco de aceite en cada tosta y encima colocamos la rodaja de mozarrella.\n\r\nCuando vayamos a servir esparcimos algunos granos de granada por encima y decoramos con una hoja de menta. Es mejor hacerlo en ese momento porque la granada puede deteriorarse.\n', '2018-05-05', 'canape-mozzarella-granada.jpg', 3, 1, 1, b'0'),
(6, 'Carne marinada y bombas de papa', 'Pele y corte la cebolla en rodajas.\nCorte el apio en tiras.\nPique el perejil.\nCorte el limón en rodajas.\nEn una fuente disponga una bolsa de polietileno, coloque dentro el peceto, unte con mostaza, salpimiente, agregue la cebolla, el perejil, el apio, el limón y el laurel.\nAgregue el vino blanco y el aceite.\nCierre la bolsa, presione con las manos para retirar el aire.\nLleve a la heladera, para marinar durante tres días.\nRetire de la bolsa y lleve al horno a cocinar durante una hora y media. Retire.\n\n\nBombas de papa\nPele y corte las papas en trozos.\nEn una olla con agua salada hirviendo coloque las papas y cocine. Retire.\nReduzca a puré con ayuda de un pisapapas.\nEn un bowl bata los huevos.\nEn una olla coloque la manteca, el agua y la sal. Cuando hierva, baje el fuego y agregue la harina mezclando con una cuchara de madera, hasta lograr que la masa se desprenda de los bordes.\nRetire del fuego, espere que la masa entibie.\nIncorpore de a poco los huevos batidos, mezclando hasta integrar.\nAgregue el puré de papa y mezcle bien.\nAñada el queso rallado y la pimienta.\nEn una placa para horno coloque, con ayuda de una cuchara, porciones del puré de papas y pinte con huevo.\nPrecaliente el horno a 200°.Lleve al horno y cocine durante veinticinco minutos.\nRetire.\n\n\nPresentación\n\nEn una fuente coloque la carne marinada, alrededor acomode las bombas de papas.Decore con gajos de tomate. --> Esta receta de la hermana Bernarda<--', '2018-08-12', 'carnemarinada.jpg', 2, 2, 1, b'0'),
(7, 'Receta de Pollo relleno al horno con puré de patata', 'Limpia el pollo.\r\n\r\nPrepara un sofrito con la cebolleta picada y los champiñones, con aceite y sal.\r\n\r\nMezcla en un bol la carne picada, el sofrito, los orejones, las pasas y los pistachos picados con sal y pimienta.\r\n\r\nRellena el pollo, colócalo en una bandeja de horno, salpimiéntalo, rocía con el vino y hornea con una rama de romero a 230ºC, 45 minutos.\r\n\r\nPela las patatas y cuécelas con agua. Pásalas por el pasapurés y adereza con leche, mantequilla, nuez moscada y sal.', '0000-00-00', 'pollo-relleno-xl-848x477x80xX.jpg', 6, 1, 1, b'1'),
(8, 'ASDASD', 'ASDASD', '2018-08-04', '20180804082102_titulo.png', 1, 1, 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tipos`
--

INSERT INTO `tipos` (`tipo_id`, `nombre`) VALUES
(1, 'Receta'),
(2, 'Nota');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `administrador` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `email`, `password`, `administrador`) VALUES
(1, 'Carlos Gomez', 'admin@prueba.com', '32250170a0dca92d53ec9624f336ca24', 1),
(2, 'Peter Lanzani', 'usuario@prueba.com', '32250170a0dca92d53ec9624f336ca24', 1),
(3, 'Juan Carlos Montes', 'juan@montes.com', 'e9cfab489552f2a5c0b6bc7fd2ae7283', 0),
(4, 'Luis Rodriguez', 'luis@gob.com', '823da4223e46ec671a10ea13d7823534', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
 Navicat Premium Data Transfer

 Source Server         : MAC
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : 172.16.1.3
 Source Database       : blogdecocina

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : utf-8

 Date: 07/23/2018 00:52:54 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `categorias`
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `eliminado` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `tipos`
-- ----------------------------
DROP TABLE IF EXISTS `tipos`;
CREATE TABLE `tipos` (
  `tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `administrador` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `publicaciones`
-- ----------------------------
DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `comentarios`
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `detalle` longtext NOT NULL,
  `respuesta` longtext NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  PRIMARY KEY (`comentario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `favoritos`
-- ----------------------------
DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE `favoritos` (
  `favorito_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  PRIMARY KEY (`favorito_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Inserts `categorias`
-- ----------------------------
BEGIN;
INSERT INTO `categorias` VALUES ('1', 'General', b'0'), ('2', 'Postres', b'0');
INSERT INTO `categorias` VALUES ('3', 'Entradas', b'0'), ('4', 'Celiacos', b'1');
INSERT INTO `categorias` VALUES ('5', 'Vegetariano', b'0'), ('6', 'Carnes', b'0');

COMMIT;


-- ----------------------------
--  Records of `usuarios`
-- ----------------------------
BEGIN;
INSERT INTO `usuarios` VALUES ('1', 'admin@prueba.com', '32250170a0dca92d53ec9624f336ca24', b'1'), ('2', 'usuario@prueba.com', '32250170a0dca92d53ec9624f336ca24', b'0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
--  Records of `comentarios`
-- ----------------------------
BEGIN;
INSERT INTO `comentarios` VALUES ('1', '2018-07-23 00:47:29', 'Es realmente la receta de tu abuela?', 'Sí así es :)', '2', '2');
COMMIT;

-- ----------------------------
--  Records of `favoritos`
-- ----------------------------
BEGIN;
INSERT INTO `favoritos` VALUES ('1', '2', '1');
INSERT INTO `favoritos` VALUES ('2', '2', '2');
COMMIT;

-- ----------------------------
--  Records of `publicaciones`
-- ----------------------------
BEGIN;
INSERT INTO `publicaciones` VALUES ('1', 'GALLETITAS CON HARINA DE ALMENDRAS Y COCO SIN AZÚCAR NI TACC', 'Desde que me diagnosticaron diabetes los hidratos de carbono dentro mi alimentación se resignificaron. Si bien puedo comerlos, no tengo la misma libertad que antes para comer la cantidad que yo quiera, cuando quiera. A poco de cumplirse un año de mi DBT tipo 1, sigo investigando cuáles son las mejores opciones para no comer tantos hidratos, y por ende, para no usar tanta insulina. Pero no quiero aburrir, más allá de mi condición hoy les quiero proponer una receta que surge de esta pequeña investigación que estoy haciendo, el reemplazo de las harinas más tradicionales, por otras más saludables. Lamentablemente muchas veces lo saludable va de la mano de lo caro, y en Argentina no hay tantas opciones accesibles para quienes tenemos diabetes, así que por el momento hay que rebuscárselas. Les cuento que estas galletitas también las pueden comer los celíacos, ya que no tiene TACC. Además son ideales para que les preparen a los más peques (y con su ayuda), ya que son una alternativa rica y casera, que siempre es una mejor opción. A Ela le encantaron, y además de comerlas me ayudó a sacar las fotos!\nLes comparto la receta, me encantaría que me cuenten qué les parecieron!\n\n\n\n\n\n\n\n\n\nSobre la harina de almendras: \nHay muchas dietéticas y negocios que venden harina de almendras, que suele ser bastante cara. Les recomiendo que busquen precios. También pueden hacerla en casa. Yo en mi experimentación quise probar las dos alernativas, compré un paquete de 1/2 kilo a $210 en el mayorista El Portugués (recomiendo fuerte), pero también compré almendras para hacer la harina desde cero. Las puse en agua hirviendo para aflojar la cáscara, las tosté un poco en el horno para que se sequen bien, y una vez frías las pasé por un picador de alimentos. Si bien la textura no quedó tan fina como quería, me sirvió para hacer estas galles. Pero para hacer los budines que tengo pensado voy a usar la comprada, que es bastante más finita. \n\nSobre la harina de coco: \nOtra alternativa interesante a las harinas tradicionales es la harina de coco, que hice desde coco rallado, lo tosté en el horno a fuego suave, y lo pasé por el picador de alimentos. Quedó muy rica, y le dio un buen sabor a las galletitas, aunque no es para usar siempre ya que el coco suele invadir bastante. \n\nEstas galletitas son bien básicas, pero me pareció que por ser la primera vez que las hacía, no hacía falta incorporarle demasiados ingredientes extra. Ustedes si quieren le pueden agregar alguna ralladura, chips de chocolate, cacao, canela, etc. \n\nAhora si, la receta!\n\nIngredientes: \n\n		Harina de almendras: 150g\n		Harina de coco: 100g (opcional, si quieren pueden hacer todo con harina de almendras, o agregarle un poco de harina integral, si pueden comerla)\n		Manteca a temperatura ambiente: 50g (pueden reemplazarla por ghee)\n		Edulcorante tipo sucralosa o stevia: 4 sobres (0,8g cada sobre)\n		Esencia de vainilla: 1 cucharadita\n		Huevos: 1\n\n\nPaso 1: \nEn un bowl colocar las harinas y agregar la manteca o ghee a temperatura ambiente cortada en cubos, aplastar con un tenedor. \n\n\nPaso 2: Agregar el huevo, el endulzante y la esencia de vainilla. Integrar todo hasta formar una masa. \n\nPaso 3: Envolver la masa en film, dándole una forma alargada para poder cortar después las galletitas. Llevar a la heladera por 1 hora. \n\nPaso 4: Cortar las galletitas y colocar sobre una placa con un poco de manteca y almidón de maíz o harina (si la toleran). Llevar a horno precalentado a temperatura suave y cocinar por, aproximadamente, 12/14 minutos. Dejar enfriar sobre una rejilla. \n', '2018-07-23', 'IMG_1.jpg', '2', '1', '1', b'0'), ('2', 'TIMBAL DE ARROZ O EL \"ARROZ BELGA\" DE MI ABUELA MAMAMA', 'Hola! Hoy es el último día del año, y para despedirlo quiero recordar a mi abuela Mamama, tan central en este blog, que cumplía años cada 31 de diciembre. \nEn época de fiestas, mi abuela se pasaba todo el día en la cocina, y a pesar de ser su cumpleaños no dejaba de agasajarnos ni un poco. Entre sus tradiciones para estas fechas, no faltaba el timbal de arroz, al que ella llamaba \"arroz belga\", nunca sabré por qué, ya que por lo que estuve investigando el arroz belga es bastante distinto al que ella preparaba. \nLa cuestión es que el arroz no podía faltar en año nuevo porque significa \"abundancia\" para el año que comienza, y en mi familia la abundancia era muy preciada ya que, si bien nunca nos faltó nada, tampoco \"nadábamos en la abudancia\", como solía decir la otra Martita de la familia, mi mamá (Mamama también se llamaba Marta). Así que acá aprovecho para homenajear a estas dos Martas que tanto extraño, y que en estas fechas me tocan la fibra de la sensibilidad. \nDeseo un año de felicidad, de proyectos cumplidos, de nuevos sueños, y también de la mencionada \"abundancia\", en estos días de tanta carencia. Abundancia de amor, abundancia de solidaridad, abundancia de abrazos, abundancia de acuerdos, abundancia de consensos, abundancia de trabajo, abundancia de salud y abundancia de proyectos realizados. Feliz año!!', '2018-07-12', 'IMG_2.jpg', '1', '2', '1', b'0');
INSERT INTO `publicaciones` VALUES ('3', 'Pasta con vegetales al horno', 'Mezclar la pasta cocida con el choclo, morrón, zanahoria, queso dambo y jamón. Colocar la mezcla en 6 moldes individuales previamente aceitados. Aparte mezclar los huevos con la leche y agregar a cada molde. Hornear hasta dorar. \n \n
Se puede preparar en un molde de aro y cortar en porciones. \n * El queso danbo se puede sustituir por otro tipo de queso gustoso y que funda bien. \n * El jamón se puede sustituir por panceta previamente salteada o por un fiambre gustoso (bondiola o salame). \m * Se congela en porciones. \n * Se descongela en microondas al 40%.', '2018-05-05', 'pastaConVegetales.jpg', '1', '1', '1', b'0'), ('4', 'Copa de queso batido con cerezas y almendras tostadas', 'Echar en el vaso de la batidora el queso mascarpone con el azúcar y batir a baja velocidad hasta obtener una crema.\n \n
Añadir la leche y batir a velocidad media procurando que no queden grumos. \n
Reservarlo en la nevera.\n
Tostar las almendras en una sartén antiadherente hasta que comiencen a dorarse.\n Lavar y secar las cerezas.', '2018-08-12', 'copa-cerezas.jpg', '2', '2', '1', b'0');


INSERT INTO `publicaciones` VALUES ('5', 'Canapé de Mozzarella', 'Para los canapés de mozzarella. Primero partimos por la mitad una granada y sacamos los granos del interior, golpeando con una cuchara. Visita nuestra entrada sobre como desgranar una granada fácilmente y verás qué fácil es. Reservamos.\n
Cortamos la mozzarella en rodajas gruesas, ponemos un poco de aceite en cada tosta y encima colocamos la rodaja de mozarrella.\n
Cuando vayamos a servir esparcimos algunos granos de granada por encima y decoramos con una hoja de menta. Es mejor hacerlo en ese momento porque la granada puede deteriorarse.\n', '2018-05-05', 'canape-mozzarella-granada.jpg', '3', '1', '1', b'0'), ('6', 'Carne marinada y bombas de papa', 'Pele y corte la cebolla en rodajas.\nCorte el apio en tiras.\nPique el perejil.\nCorte el limón en rodajas.\nEn una fuente disponga una bolsa de polietileno, coloque dentro el peceto, unte con mostaza, salpimiente, agregue la cebolla, el perejil, el apio, el limón y el laurel.\nAgregue el vino blanco y el aceite.\nCierre la bolsa, presione con las manos para retirar el aire.\nLleve a la heladera, para marinar durante tres días.\nRetire de la bolsa y lleve al horno a cocinar durante una hora y media. Retire.\n\n\nBombas de papa\nPele y corte las papas en trozos.\nEn una olla con agua salada hirviendo coloque las papas y cocine. Retire.\nReduzca a puré con ayuda de un pisapapas.\nEn un bowl bata los huevos.\nEn una olla coloque la manteca, el agua y la sal. Cuando hierva, baje el fuego y agregue la harina mezclando con una cuchara de madera, hasta lograr que la masa se desprenda de los bordes.\nRetire del fuego, espere que la masa entibie.\nIncorpore de a poco los huevos batidos, mezclando hasta integrar.\nAgregue el puré de papa y mezcle bien.\nAñada el queso rallado y la pimienta.\nEn una placa para horno coloque, con ayuda de una cuchara, porciones del puré de papas y pinte con huevo.\nPrecaliente el horno a 200°.Lleve al horno y cocine durante veinticinco minutos.\nRetire.\n\n\nPresentación\n\nEn una fuente coloque la carne marinada, alrededor acomode las bombas de papas.Decore con gajos de tomate. --> Esta receta de la hermana Bernarda<--', '2018-08-12', 'carnemarinada.jpg', '2', '2', '1', b'0');


COMMIT;


-- ----------------------------
--  Records of `tipos`
-- ----------------------------
BEGIN;
INSERT INTO `tipos` VALUES ('1', 'Receta'), ('2', 'Nota');
COMMIT;

-- ----------------------------
--  Records of `usuarios`
-- ----------------------------
BEGIN;
INSERT INTO `usuarios` VALUES ('1', 'admin@prueba.com', '32250170a0dca92d53ec9624f336ca24', b'1'), ('2', 'usuario@prueba.com', '32250170a0dca92d53ec9624f336ca24', b'0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
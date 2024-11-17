-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 23:00:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(17, 1, 28, 8.5, 1, '2024-11-17 13:09:00'),
(18, 1, 12, 36, 1, '2024-11-17 13:09:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Comida', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accesorios', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23'),
(2, 'Marlow', 'Alexis', 'Hombre', '0985476571', 'marlowarmijolopez@gmail.com', '0bd0100dad9680c46110d17a2a49c6a8', 'loreto', '2024-11-13 23:09:49'),
(3, 'alexis', 'armijo', 'Hombre', '0985476571', 'marlowalexisarmijo@gmail.com', '0d211c0af59a92b63cc09d40e4708b24', '', '2024-11-16 13:13:57'),
(4, 'Alexis', 'Armijo', 'Hombre', '0985476571', 'marlow.armijo@epn.edu.ec', '0bd0100dad9680c46110d17a2a49c6a8', '', '2024-11-17 15:49:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(10, 11, 10, '20', 28, '2 KG', '2024-11-17 12:05:36', NULL),
(11, 12, 10, '20', 33.5, '1 KG', '2024-11-17 12:08:36', NULL),
(12, 13, 8, '20', 36, '2 KG', '2024-11-17 12:09:39', '2024-11-17 13:37:31'),
(13, 14, 10, '20', 9, 'GRANDE', '2024-11-17 12:10:35', NULL),
(14, 15, 10, '20', 1.25, 'PEQUENIO', '2024-11-17 12:11:38', NULL),
(15, 15, 10, '20', 3.5, 'MEDIANO', '2024-11-17 12:11:58', NULL),
(16, 15, 10, '20', 5.2, 'GRANDE', '2024-11-17 12:12:08', NULL),
(17, 16, 9, '20', 1.25, 'PEQUENIO', '2024-11-17 12:16:22', '2024-11-17 16:13:25'),
(18, 17, 10, '20', 29.5, '2 KG', '2024-11-17 12:18:24', NULL),
(19, 18, 8, '20', 25.65, 'GRANDE', '2024-11-17 12:20:54', '2024-11-17 15:51:59'),
(20, 19, 10, '20', 9, 'MEDIANO', '2024-11-17 12:22:50', NULL),
(21, 20, 10, '20', 9, 'GRANDE', '2024-11-17 12:23:46', NULL),
(22, 21, 10, '20', 17.25, '1 KG', '2024-11-17 12:24:41', NULL),
(23, 22, 10, '20', 30.5, '2 KG', '2024-11-17 12:26:43', NULL),
(24, 23, 10, '20', 12.5, '1 KG', '2024-11-17 12:28:00', NULL),
(25, 24, 10, '20', 35, '2 KG', '2024-11-17 12:29:56', NULL),
(26, 25, 10, '20', 2, 'TALLA STANDARD', '2024-11-17 12:31:25', '2024-11-17 12:33:31'),
(27, 26, 10, '20', 4, 'TALLA STANDARD', '2024-11-17 12:35:02', NULL),
(28, 27, 10, '20', 8.5, 'TALLA STANDARD', '2024-11-17 12:36:32', NULL),
(29, 28, 10, '20', 8.5, 'TALLA STANDARD', '2024-11-17 12:37:01', NULL),
(30, 29, 10, '20', 9.5, 'TALLA STANDARD', '2024-11-17 12:38:27', NULL),
(31, 30, 10, '20', 2.5, 'TALLA STANDARD', '2024-11-17 12:39:49', NULL),
(32, 31, 10, '20', 3.99, 'TALLA STANDARD', '2024-11-17 12:41:06', NULL),
(33, 32, 10, '20', 4, 'TALLA STANDARD', '2024-11-17 12:42:31', NULL),
(34, 33, 10, '20', 2.9, 'TALLA STANDARD', '2024-11-17 12:44:03', NULL),
(35, 34, 10, '20', 3.4, '2 KG', '2024-11-17 12:45:29', NULL),
(36, 35, 10, '20', 7.5, '2 KG', '2024-11-17 12:46:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55'),
(4, 2, 'loreto', 'cod', 4.8, 3, 1, '2024-11-13 23:10:01', '2024-11-13 23:11:50'),
(5, 3, 'Coca', 'cod', 586.5, 0, 0, '2024-11-17 11:44:47', NULL),
(6, 3, 'Miami Florida', 'cod', 575, 0, 0, '2024-11-17 11:53:28', NULL),
(7, 3, 'FLORIDA', 'cod', 345, 0, 0, '2024-11-17 11:55:00', NULL),
(8, 3, 'Orellna', 'cod', 632.5, 0, 0, '2024-11-17 11:56:31', NULL),
(9, 3, 'Pedro', 'cod', 4.14, 0, 1, '2024-11-17 11:58:53', '2024-11-17 13:05:33'),
(10, 3, 'Loreto', 'cod', 575, 0, 1, '2024-11-17 12:00:42', '2024-11-17 13:05:24'),
(11, 3, 'Loreto, calle 10 de agosto', 'cod', 43.7, 3, 1, '2024-11-17 13:10:05', '2024-11-17 13:11:04'),
(12, 3, 'asdasd', 'cod', 41.4, 0, 1, '2024-11-17 13:19:23', '2024-11-17 13:21:26'),
(13, 3, 'sadasd', 'cod', 41.4, 0, 1, '2024-11-17 13:21:13', '2024-11-17 13:21:24'),
(14, 3, 'asdsasdsdasd', 'cod', 82.8, 3, 1, '2024-11-17 13:27:29', '2024-11-17 13:27:49'),
(15, 3, 'adasdsa', 'cod', 82.8, 0, 0, '2024-11-17 13:37:31', NULL),
(16, 4, 'Miami ', 'cod', 29.4975, 0, 0, '2024-11-17 15:50:03', NULL),
(17, 4, 'Miami', 'cod', 29.4975, 0, 0, '2024-11-17 15:51:59', NULL),
(18, 4, '', 'cod', 1.44, 0, 0, '2024-11-17 16:13:25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750),
(5, 4, 10, '1 KG', '4', 4, 1.2, 4.8),
(6, 5, 6, 'S', 'pcs', 1, 150, 150),
(7, 5, 6, 'M', 'pcs', 2, 180, 360),
(8, 6, 1, 'M', 'pcs', 2, 250, 500),
(9, 7, 1, 'L', 'Sample', 1, 300, 300),
(10, 8, 4, 'L', 'pcs', 1, 550, 550),
(11, 9, 10, 'PEQUENIO', '4', 3, 1.2, 3.6),
(12, 10, 4, 'M', 'pcs', 1, 500, 500),
(13, 11, 25, 'TALLA STANDARD', '20', 1, 2, 2),
(14, 11, 13, '2 KG', '20', 1, 36, 36),
(15, 12, 13, '2 KG', '20', 1, 36, 36),
(16, 13, 13, '2 KG', '20', 1, 36, 36),
(17, 14, 13, '2 KG', '20', 2, 36, 72),
(18, 15, 13, '2 KG', '20', 2, 36, 72),
(19, 16, 18, 'GRANDE', '20', 1, 25.65, 25.65),
(20, 17, 18, 'GRANDE', '20', 1, 25.65, 25.65),
(21, 18, 16, 'PEQUENIO', '20', 1, 1.25, 1.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(11, 1, 1, 'Nutrapro Adulto Raza mediana y grande Comida de Perro premium', 'Es un alimento balanceado de alta calidad, formulado para cubrir todas las necesidades nutricionales de los perros adultos. Esta comida es de calidad premium perfecto para perros mestizos, Pastor Alem&aacute;n, Golden Retriever, Labrador, entre otros de m&aacute;s de 10kg. Adqui&eacute;relo en nuestra tienda online Con Patitas.', 1, '2024-11-17 12:04:44'),
(12, 1, 1, 'Dog Chow adulto raza mediana a grandes', '&lt;div&gt;El alimento Dog Chow para perros adultos est&aacute; especialmente formulado para satisfacer los requerimientos nutricionales de las razas medianas y grandes durante su etapa de madurez. Esta f&oacute;rmula s&uacute;per premium contiene un &oacute;ptimo balance de prote&iacute;nas de alta calidad, grasas y carbohidratos para mantener a tu compa&ntilde;ero canino activo y lleno de energ&iacute;a.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Uno de los beneficios clave de este alimento es su contenido de nutrientes esenciales para la salud de las articulaciones, como glucosamina y condroitina, que ayudan a prevenir el desgaste y dolor articular, un problema com&uacute;n en perros de mayor tama&ntilde;o.&lt;/div&gt;', 1, '2024-11-17 12:08:11'),
(13, 1, 1, 'Happy Dog Naturcroq cordero y arroz', 'El alimento Happy Dog NarutCroq de cordero y arroz ha demostrado ser muy eficaz para perros sensibles. NaturCroq cordero y arroz es una comida seca y equilibrada que es suave para el est&oacute;mago con cordero nutritivo, arroz de f&aacute;cil digesti&oacute;n y un bajo contenido en grasa. Por tanto, es especialmente adecuado para todos los perros sensibles con necesidades normales de energ&iacute;a y prote&iacute;nas y para todos los perros con un pelaje de color claro.&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 1, '2024-11-17 12:09:18'),
(14, 1, 1, 'Nutra Pro Senior', 'Nutra Pro Senior esta desarrollada para la etapa de madurez de tu perro. Una vez finalizada la adultez debe ingerir comida que tenga m&aacute;s facilidad en la digesti&oacute;n. Bajo la formula age repair y agility mantiene los musculos y articulaciones fuertes durante esta importante etapa de tu perro.', 1, '2024-11-17 12:10:22'),
(15, 1, 1, 'Pro Can Adulto Razas medianas a grandes carne', 'Pro Can Adultos razas medianas a grandes receta carne para tu perro. Golden Retriever, Pastor Aleman Balanceado buen precio, A domicilio Quito, Guayaquil', 1, '2024-11-17 12:11:23'),
(16, 1, 1, 'Pro Can cachorro raza mediana a grande original', '&lt;p&gt;Pro Can cachorros razas medianas a grandes para tu perro. Golden Retriever, Pastor Aleman Balanceado a buen precio para perro domicilio Quito, Guayaquil&lt;/p&gt;', 1, '2024-11-17 12:16:01'),
(17, 1, 1, 'Taste of The Wild Adulto Sierra Mountain, Cordero', '&lt;p&gt;Taste of the Wild Sierra Mountain Grain-Free Dry Dog Food! Es una comida para perros formulada con prote&iacute;nas novedosas que incluyen cordero y cordero asado, esta receta sin granos incluye guisantes y batatas que brindan la energ&iacute;a altamente digerible que su cachorro necesita, junto con respaldo antioxidante natural de frutas y verduras reales y ra&iacute;z de achicoria seca para apoyo prebi&oacute;tico y saludable. digesti&oacute;n. &iexcl;Los minerales esenciales est&aacute;n quelados con amino&aacute;cidos para optimizar su absorci&oacute;n y garantizar el m&aacute;ximo beneficio, para una nutrici&oacute;n completa y equilibrada con un sabor salvaje que su amigo peludo ans&iacute;a constantemente!&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-11-17 12:18:06'),
(18, 1, 1, 'Pro Pac Mature Chiken & Brown Rice Whole Grain', '&lt;p&gt;Comida Pro Pac chicken adultos mayores super premium medianas a grandes para tu perro. Golden Retriever, Pastor Aleman Balanceado con nutrientes esenciales&lt;/p&gt;', 1, '2024-11-17 12:20:25'),
(19, 1, 3, 'Nutra Pro Gatos y Gatitos', '&lt;p&gt;Nutra Pro gatos y gatitos un alimento para gatos y gatitos hasta los 7 a&ntilde;os cient&iacute;ficamente formulado que contribuye al correcto funcionamiento del sistema de salud de su gato.Con prote&iacute;nas de or&iacute;gen animal en altas cantidades y adici&oacute;n de metionina y acidificantes urinarios para garantizar un rango de pH de 6,2 &ndash; 6,5 y minimizar la formaci&oacute;n de cristales urinarios.&lt;/p&gt;', 1, '2024-11-17 12:22:31'),
(20, 1, 3, 'Nutra Pro Gatos Esterilizado o Control Peso', '&lt;p&gt;Es un alimento para gatos alimento cient&iacute;ficamente formulado que contribuye al correcto funcionamiento del sistema de salud de su gato. Esta formulado para el control de peso de gatos que sufren de obesidad o sobre peso. Sus ingredientes contribuyen al desarrollo de gatitos esterilizadosCon prote&iacute;nas de origen animal en altas cantidades y adici&oacute;n de metionina y acidificantes urinarios para garantizar un rango de pH de 6,2 &ndash; 6,5 y minimizar la formaci&oacute;n de cristales urinarios.Con celulosa en polvo para evitar las bolas de pelo propias del lamido.&lt;/p&gt;', 1, '2024-11-17 12:23:35'),
(21, 1, 3, 'Happy Cat Gato adulto Perfect Mix', '&lt;p&gt;Happy Cat Minkas Perfect Mix es un alimento completo especialmente equilibrado gatos adultos, la sabrosa mezcla de galletas es bien aceptada y extremadamente bien tolerada. Esta receta proporciona valiosas prote&iacute;nas animales es 100% equilibrada y natural. Este alimento seco contiene muchas vitaminas y minerales para apoyar al sistema inmunol&oacute;gico.&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', 1, '2024-11-17 12:24:22'),
(22, 1, 3, 'Taste of the wild Gatos Venado Asado y Salmón', '&lt;p&gt;Alimento taste of the wild para gato proporciona una nutrici&oacute;n completa y equilibrada para gatos de todas las edades y etapas de la vida. Esta f&oacute;rmula sin granos es ideal para gatos con sensibilidad a los granos y est&aacute; hecha con ingredientes de alta calidad, incluyendo venado asado y salm&oacute;n saborizado con humo.&lt;/p&gt;', 1, '2024-11-17 12:26:24'),
(23, 1, 3, 'Pro Plan Gatos Adultos', '&lt;p&gt;Alimento completo y balanceado para gatos adultos de todas las razas.&lt;/p&gt;&lt;p&gt;Tecnolog&iacute;a OptiPrebio&reg;. Optimiza la absorci&oacute;n de nutrientes.&lt;/p&gt;&lt;p&gt;Incluye prebi&oacute;ticos naturales que estabilizan la flora intestinal ayudando a optimizar la digesti&oacute;n y la absorci&oacute;n de nutrientes clave para una mejor salud digestiva.&lt;/p&gt;&lt;p&gt;Tecnolog&iacute;a STONE NEUTRAL combinacion exclusiva de nutrientes que ayuda a prevenir la formaci&oacute;n de cristales de estruvita y oxalato, manteniendo y protegiendo la salud del tracto urinario inferior de los gatos adultos.&lt;/p&gt;&lt;p&gt;Tecnolog&iacute;a TARTAR CONTROL que ayuda a reducir el sarro dental en un 41% con respecto a f&oacute;rmula PRO PLAN&reg; Adult Cat sin pirofosfato tetras&oacute;dico, promoviendo dientes saludables y m&aacute;s fuertes.&lt;/p&gt;', 1, '2024-11-17 12:27:37'),
(24, 1, 3, 'Vital Can Renal Gato', '&lt;p&gt;VITALCAN THERAPY FELINE RENAL CARE es un alimento completo de prescripci&oacute;n para gatos con moderada cantidad de prote&iacute;nas y niveles adecuados de Omega 3, que proporciona un marcado efecto antiinflamatorio local, adem&aacute;s de niveles incrementados de vitamina B y potasio para reponer las p&eacute;rdidas por la diuresis asociada a la enfermedad renal cr&oacute;nica (ERC). El agregado de Yucca schidigera como secuestrante de amonio ayuda a bajar los niveles de nitr&oacute;geno en sangre, a la vez que disminuye el olor de las deposiciones.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-11-17 12:29:40'),
(25, 4, 4, 'Collar de Reata Ajustable', '&lt;p&gt;Collar de Reata Ajustable - Negro&lt;/p&gt;', 1, '2024-11-17 12:31:01'),
(26, 4, 4, 'Bebedero de agua portatil', '&lt;p&gt;Bebedero de agua portatil, facil de llevar y c&oacute;modo para paseos con tu peludo, apto para gatos y perros.&lt;/p&gt;', 1, '2024-11-17 12:34:37'),
(27, 4, 4, 'Cama Portatil Perro ', '&lt;p&gt;Cama para tu mascota de microfibra y afelpada portatil. Perfecta para paseos, para llevar a tu perro o gato en el carro y ponerla sobre cualquier cubierta para que este c&oacute;modo.&lt;/p&gt;', 1, '2024-11-17 12:36:15'),
(28, 4, 5, 'Cama Portatil Gato', '&lt;p&gt;Cama para tu mascota de microfibra y afelpada portatil. Perfecta para paseos, para llevar a tu perro o gato en el carro y ponerla sobre cualquier cubierta para que este c&oacute;modo.&lt;/p&gt;', 1, '2024-11-17 12:36:53'),
(29, 4, 4, 'Cobija esquimal para mascota', '&lt;p&gt;Cobija para perro y gato tipo esquimal perfecta para los mimados de la casa, abrigada y de la mejor textura.&lt;/p&gt;&lt;p&gt;&lt;b&gt;Mediana:&lt;/b&gt;&lt;/p&gt;&lt;p&gt;70cm x 80cm&lt;/p&gt;&lt;p&gt;Perfecta para perros de raza peque&ntilde;a, mediana y gatos.&lt;/p&gt;&lt;p&gt;&lt;b&gt;Grande:&lt;/b&gt;&lt;/p&gt;&lt;p&gt;108cm x 80cm&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-11-17 12:38:08'),
(30, 4, 4, 'Juguete de hueso suave para cachorros', '&lt;p&gt;Juguete de 8.5cm dise&ntilde;ado para cachorros peque&ntilde;os en etapa de dasorrollo, perfecto para estimular el crecimiento mientras busca qu&eacute; morder.&lt;/p&gt;', 1, '2024-11-17 12:39:26'),
(31, 4, 4, 'Juguete Perro Hueso Con Sonido', '&lt;p&gt;Hueso de Vynil no t&oacute;xico con sonido al morder.&lt;/p&gt;&lt;p&gt;21cm, para perros medianos y Grandes&lt;/p&gt;', 1, '2024-11-17 12:40:35'),
(32, 4, 4, 'Juguete Cuerda + pelota', '&lt;p&gt;Juguete perfecto para perros que buscan estar activos junto a sus due&ntilde;os. Se puede lanzar tipo frisbee y la cuerda de 15cm de di&aacute;metro ayuda tanto al perro como a la persona a tener un lugar de donde agarrar el juguete. La pelota es de alta duraci&oacute;n y apta para animales.&lt;/p&gt;', 1, '2024-11-17 12:42:08'),
(33, 4, 5, 'Comedero de Acero', '&lt;p&gt;Comedero de Acero - Gato o cachorro peque&ntilde;o est&aacute; en espera y se enviar&aacute; tan pronto como vuelva a estar en stock&lt;/p&gt;&lt;p&gt;Plato de acero con antideslizante para comedero tanto de perro como de gato.&lt;/p&gt;&lt;p&gt;&lt;b&gt;Gatos o cachorros raza peque&ntilde;a&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Di&aacute;metro 11cm&lt;/p&gt;', 1, '2024-11-17 12:43:48'),
(34, 4, 5, 'Nutra Pro Arena Sanitaria', '&lt;p&gt;Arena Premium para gatos y gatitos con aroma a lavanda. Compuesta de betonina natural, disminuye los olores y facilita la recolecci&oacute;n de los deshechos.&lt;/p&gt;', 1, '2024-11-17 12:44:53'),
(35, 4, 5, 'Arena de Gato Canada Litter', '&lt;p&gt;Hecho de bentonita de sodio puro. Con incre&iacute;ble capacidad de aglomeraci&oacute;n instant&aacute;nea y absorci&oacute;n inigualable de la arena Canad&aacute; Litter, es un producto con nuestro enfoque sin concesiones a la pureza, la funcionalidad y la calidad.&lt;/p&gt;', 1, '2024-11-17 12:46:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 4.8, '2024-11-13 23:10:01'),
(5, 5, 586.5, '2024-11-17 11:44:47'),
(6, 6, 575, '2024-11-17 11:53:28'),
(7, 7, 345, '2024-11-17 11:55:00'),
(8, 8, 632.5, '2024-11-17 11:56:31'),
(9, 9, 4.14, '2024-11-17 11:58:53'),
(10, 10, 575, '2024-11-17 12:00:42'),
(11, 11, 43.7, '2024-11-17 13:10:05'),
(12, 12, 41.4, '2024-11-17 13:19:23'),
(13, 13, 41.4, '2024-11-17 13:21:13'),
(14, 14, 82.8, '2024-11-17 13:27:29'),
(15, 15, 82.8, '2024-11-17 13:37:31'),
(16, 16, 29.4975, '2024-11-17 15:50:03'),
(17, 17, 29.4975, '2024-11-17 15:51:59'),
(18, 18, 1.44, '2024-11-17 16:13:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'Pequenio'),
(2, 'Mediano'),
(3, 'Grande'),
(4, '1 Kg'),
(5, '2 Kg'),
(6, 'talla standard');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Comida de Perro', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Comida de Gato', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Variedad Perros', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Variedad Gatos', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 5, 'Formulario de Contacto', '&lt;p&gt;Boarding services for cat ou dog&lt;/p&gt;', 1, '2022-09-21 17:05:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'PetShop'),
(6, 'short_name', 'PetShop'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para Numeros
CREATE DATABASE IF NOT EXISTS `numeros` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `Numeros`;

-- Volcando estructura para tabla Numeros.ahorro
CREATE TABLE IF NOT EXISTS `ahorro` (
  `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) DEFAULT 0,
  `Fecha` date DEFAULT curdate(),
  PRIMARY KEY (`IdMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Numeros.ahorro: ~37 rows (aproximadamente)
INSERT INTO `ahorro` (`IdMovimiento`, `Numero`, `Fecha`) VALUES
	(3, 67, '2023-02-13'),
	(4, 53, '2023-02-14'),
	(5, 133, '2023-02-16'),
	(6, 21, '2023-02-15'),
	(7, 62, '2023-02-17'),
	(8, 23, '2023-02-19'),
	(9, 101, '2023-02-18'),
	(10, 193, '2023-02-21'),
	(11, 49, '2023-02-20'),
	(12, 132, '2023-02-22'),
	(13, 155, '2023-02-25'),
	(14, 15, '2023-02-23'),
	(15, 39, '2023-02-24'),
	(16, 183, '2023-02-26'),
	(17, 99, '2023-03-01'),
	(18, 151, '2023-03-02'),
	(19, 95, '2023-03-03'),
	(20, 163, '2023-03-05'),
	(21, 5, '2023-03-04'),
	(22, 20, '2023-02-27'),
	(23, 41, '2023-02-28'),
	(24, 104, '2023-03-14'),
	(25, 1, '2023-03-16'),
	(26, 16, '2023-03-01'),
	(27, 91, '2023-03-02'),
	(28, 102, '2023-03-03'),
	(29, 111, '2023-03-04'),
	(30, 52, '2023-03-05'),
	(31, 9, '2023-03-06'),
	(32, 70, '2023-03-07'),
	(33, 153, '2023-03-08'),
	(34, 82, '2023-03-09'),
	(35, 128, '2023-03-10'),
	(36, 54, '2023-03-11'),
	(37, 178, '2023-03-12'),
	(38, 24, '2023-03-13'),
	(39, 10, '2023-03-15');

-- Volcando estructura para tabla Numeros.cat_clientes
CREATE TABLE IF NOT EXISTS `cat_clientes` (
  `id_cliente` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cliente&&&',
  `cliente` varchar(150) NOT NULL COMMENT 'Nombre del cliente&&&',
  `cli_representante` varchar(150) DEFAULT NULL COMMENT 'Nombre del Representante&&&',
  `cli_telefono1` varchar(25) DEFAULT NULL COMMENT 'Primer teléfono del cliente&&&',
  `cli_telefono2` varchar(25) DEFAULT NULL COMMENT 'Segundo teléfono del cliente&&&',
  `cli_callenum` varchar(150) DEFAULT NULL COMMENT 'Domicilio (Calle y número)&&&',
  `cli_cp` varchar(5) DEFAULT NULL COMMENT 'Domicilio (Código Postal)&&&',
  `colonia` varchar(100) DEFAULT NULL COMMENT 'Domicilio (Colonia)&&&',
  `delegacion` varchar(100) DEFAULT NULL COMMENT 'Domicilio (Municipio)&&&',
  `estado` varchar(100) DEFAULT NULL COMMENT 'Domicilio (Estado)&&&',
  `cli_correoe` varchar(50) DEFAULT NULL COMMENT 'Correo electrónico&&&',
  `esTransfer` int(1) DEFAULT NULL,
  `porPieza` int(1) DEFAULT NULL,
  `articulosCliente` int(10) DEFAULT NULL COMMENT 'Id del cliente del cual puede ocupar su catálogo de artículos&&&',
  `destinosCliente` int(10) DEFAULT NULL,
  `colorHeader` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `clave` varchar(10) DEFAULT NULL,
  `Activo` int(1) DEFAULT NULL COMMENT 'Activo&&&',
  `UsuarioCreacion` varchar(50) NOT NULL COMMENT 'Usuario que genero el registro',
  `FechaCreacion` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `UsuarioUltimaModificacion` varchar(50) NOT NULL COMMENT 'Usuario que genero la ultima modificación del registro',
  `FechaUltimaModificacion` datetime NOT NULL COMMENT 'Fecha de la ultima modificación del registro',
  `Pantalla` varchar(256) NOT NULL COMMENT 'Es la pantalla desde donde se trabajo el registro',
  PRIMARY KEY (`id_cliente`) USING BTREE,
  UNIQUE KEY `IN_UNI_CLIENTE` (`cliente`) USING BTREE,
  KEY `articulosCliente` (`articulosCliente`) USING BTREE,
  KEY `destinosCliente` (`destinosCliente`) USING BTREE,
  CONSTRAINT `FK_usuarios` FOREIGN KEY (`id_cliente`) REFERENCES `c_usuario` (`IdUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='cliente';

-- Volcando datos para la tabla Numeros.cat_clientes: ~1 rows (aproximadamente)
INSERT INTO `cat_clientes` (`id_cliente`, `cliente`, `cli_representante`, `cli_telefono1`, `cli_telefono2`, `cli_callenum`, `cli_cp`, `colonia`, `delegacion`, `estado`, `cli_correoe`, `esTransfer`, `porPieza`, `articulosCliente`, `destinosCliente`, `colorHeader`, `logo`, `clave`, `Activo`, `UsuarioCreacion`, `FechaCreacion`, `UsuarioUltimaModificacion`, `FechaUltimaModificacion`, `Pantalla`) VALUES
	(1, 'Contabilidad', '', '', '', '', '', '', '', '', '', 0, NULL, NULL, NULL, NULL, 'resources/images/logos/1.png', 'CPP', 1, 'cbarron', '2022-03-08 00:00:00', 'cbarron', '2022-03-08 00:00:00', 'manual');

-- Volcando estructura para tabla Numeros.cat_log
CREATE TABLE IF NOT EXISTS `cat_log` (
  `IdQuery` int(10) NOT NULL AUTO_INCREMENT,
  `Consulta` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Seccion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `IdUsuario` int(5) NOT NULL,
  `Tipo` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Sesion` varchar(50) DEFAULT NULL,
  `DatosQuery` text DEFAULT NULL,
  PRIMARY KEY (`IdQuery`) USING BTREE,
  KEY `FK_USUARIO_LOG` (`IdUsuario`) USING BTREE,
  CONSTRAINT `FK_cat_log_cat_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `cat_usuario` (`id_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8702 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla Numeros.cat_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla Numeros.parametros
CREATE TABLE IF NOT EXISTS `parametros` (
  `IdParametro` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(250) DEFAULT NULL,
  `Identificador` varchar(250) DEFAULT NULL,
  `Valor` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IdParametro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla Numeros.parametros: ~2 rows (aproximadamente)
INSERT INTO `parametros` (`IdParametro`, `Descripcion`, `Identificador`, `Valor`) VALUES
	(1, 'Numero de dias del ahorro', 'dias', '200'),
	(2, 'Ahorro objetivo', 'ahorro', '20100');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

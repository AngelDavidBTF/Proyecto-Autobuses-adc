-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd-autobuses-adc
CREATE DATABASE IF NOT EXISTS `bd-autobuses-adc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd-autobuses-adc`;

-- Volcando estructura para tabla bd-autobuses-adc.backup_ocupacion
CREATE TABLE IF NOT EXISTS `backup_ocupacion` (
  `id_backup_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_backup_viajero` int(11) NOT NULL DEFAULT '0',
  `num_asiento` int(11) NOT NULL DEFAULT '0',
  `id_backup_reserva` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_backup_ocupacion`),
  KEY `FK_backup_ocupacion_backup_viajero` (`id_backup_viajero`),
  KEY `FK_backup_ocupacion_backup_reserva` (`id_backup_reserva`),
  CONSTRAINT `FK_backup_ocupacion_backup_reserva` FOREIGN KEY (`id_backup_reserva`) REFERENCES `backup_reserva` (`id_backup_reserva`),
  CONSTRAINT `FK_backup_ocupacion_backup_viajero` FOREIGN KEY (`id_backup_viajero`) REFERENCES `backup_viajero` (`id_backup_viajero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.backup_ocupacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `backup_ocupacion` DISABLE KEYS */;
INSERT INTO `backup_ocupacion` (`id_backup_ocupacion`, `id_backup_viajero`, `num_asiento`, `id_backup_reserva`) VALUES
	(1, 1, 6, 1);
/*!40000 ALTER TABLE `backup_ocupacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.backup_reserva
CREATE TABLE IF NOT EXISTS `backup_reserva` (
  `id_backup_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_backup_viaje` int(11) NOT NULL DEFAULT '0',
  `id_tarjeta` int(11) NOT NULL DEFAULT '0',
  `localizador` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_backup_reserva`),
  KEY `id_viaje_r` (`id_backup_viaje`),
  KEY `id_cliente_r` (`id_tarjeta`),
  CONSTRAINT `FK_backup_reserva_backup_viaje` FOREIGN KEY (`id_backup_viaje`) REFERENCES `backup_viaje` (`id_backup_viaje`),
  CONSTRAINT `backup_reserva_ibfk_1` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd-autobuses-adc.backup_reserva: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `backup_reserva` DISABLE KEYS */;
INSERT INTO `backup_reserva` (`id_backup_reserva`, `id_backup_viaje`, `id_tarjeta`, `localizador`) VALUES
	(1, 1, 1, 'FMYS');
/*!40000 ALTER TABLE `backup_reserva` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.backup_viaje
CREATE TABLE IF NOT EXISTS `backup_viaje` (
  `id_backup_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_horario` int(11) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `plazas_ocupadas` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_backup_viaje`),
  KEY `id_horario` (`id_horario`),
  CONSTRAINT `backup_viaje_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd-autobuses-adc.backup_viaje: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `backup_viaje` DISABLE KEYS */;
INSERT INTO `backup_viaje` (`id_backup_viaje`, `id_horario`, `fecha`, `plazas_ocupadas`) VALUES
	(1, 1, '2018-06-15', 1);
/*!40000 ALTER TABLE `backup_viaje` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.backup_viajero
CREATE TABLE IF NOT EXISTS `backup_viajero` (
  `id_backup_viajero` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  PRIMARY KEY (`id_backup_viajero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd-autobuses-adc.backup_viajero: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `backup_viajero` DISABLE KEYS */;
INSERT INTO `backup_viajero` (`id_backup_viajero`, `nif`, `nombre`, `apellidos`, `fecha_nac`) VALUES
	(1, '49314652F', 'ad', 'jkhfkq', '1998-04-20');
/*!40000 ALTER TABLE `backup_viajero` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) DEFAULT NULL,
  `pass` varbinary(100) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.cliente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`, `dni`, `pass`, `nombre`, `apellidos`, `direccion`, `email`, `telefono`, `fecha_nac`) VALUES
	(1, '49314652F', _binary 0x2F4831FA57D2229120D167B42D298A5F, 'akhgd', 'iluvg', 'ohvewÃ±@glkelv', 'ksldvlvh@ojbsl', '654654837', '1990-05-19'),
	(2, '03474198W', _binary 0x2F4831FA57D2229120D167B42D298A5F, 'PEPE', 'HABILLA', 'CALLEEKJVB', 'OEHOEWVH@GMAIL.COM', '689210816', '1998-12-12');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.datos_empresa
CREATE TABLE IF NOT EXISTS `datos_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `direccion` varchar(50) NOT NULL DEFAULT '0',
  `nif` varchar(9) NOT NULL DEFAULT '0',
  `web` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.datos_empresa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_empresa` DISABLE KEYS */;
INSERT INTO `datos_empresa` (`id_empresa`, `nombre`, `direccion`, `nif`, `web`, `email`) VALUES
	(1, 'FlixBus', 'C/ Lepanto n16', 'D7658768', 'http://www.flixbusr.com', 'contacto@flixbus.com');
/*!40000 ALTER TABLE `datos_empresa` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.estacion
CREATE TABLE IF NOT EXISTS `estacion` (
  `id_estacion` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(50) NOT NULL DEFAULT '0',
  `direccion` varchar(100) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.estacion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` (`id_estacion`, `localidad`, `direccion`, `nombre`) VALUES
	(1, 'La Roda', 'Calle Linares, 1', 'rodaAuto'),
	(2, 'Albacete', 'Parque Altozano', 'albabus'),
	(3, 'Munera', 'Plaza Mayor', 'ATOBUSMUNERA');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `id_ruta` int(11) DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `dia` enum('L','S') DEFAULT 'L',
  PRIMARY KEY (`id_horario`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `id_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.horario: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`id_horario`, `id_ruta`, `hora_salida`, `hora_llegada`, `dia`) VALUES
	(1, 1, '10:15:00', '11:55:00', 'L'),
	(2, 2, '18:30:00', '19:10:00', 'L'),
	(3, 3, '14:36:00', '18:36:00', 'L'),
	(4, 4, '08:00:00', '08:40:00', 'L'),
	(5, 5, '10:40:00', '11:41:00', 'L'),
	(6, 6, '16:42:00', '17:15:00', 'L'),
	(7, 1, '10:59:00', '11:16:00', 'S'),
	(8, 2, '10:30:02', '11:00:25', 'S'),
	(9, 3, '10:30:02', '11:10:25', 'S'),
	(10, 4, '10:59:00', '11:16:00', 'S'),
	(11, 5, '12:30:00', '13:10:00', 'S'),
	(12, 6, '17:27:31', '18:30:00', 'S');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.ocupacion
CREATE TABLE IF NOT EXISTS `ocupacion` (
  `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_viajero` int(11) NOT NULL DEFAULT '0',
  `num_asiento` int(11) NOT NULL DEFAULT '0',
  `id_reserva` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ocupacion`),
  UNIQUE KEY `id_viaje_num_asiento` (`id_reserva`,`num_asiento`),
  KEY `id_viajero` (`id_viajero`),
  CONSTRAINT `id_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `id_viajero` FOREIGN KEY (`id_viajero`) REFERENCES `viajero` (`id_viajero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.ocupacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` (`id_ocupacion`, `id_viajero`, `num_asiento`, `id_reserva`) VALUES
	(2, 1, 4, 2),
	(3, 1, 5, 3),
	(4, 1, 2, 4),
	(5, 1, 1, 5);
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL DEFAULT '0',
  `id_tarjeta` int(11) NOT NULL DEFAULT '0',
  `localizador` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reserva`),
  KEY `id_viaje_r` (`id_viaje`),
  KEY `id_cliente_r` (`id_tarjeta`),
  CONSTRAINT `FK_reserva_tarjeta` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id_tarjeta`),
  CONSTRAINT `id_viaje_r` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.reserva: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` (`id_reserva`, `id_viaje`, `id_tarjeta`, `localizador`) VALUES
	(2, 3, 2, 'ACUH'),
	(3, 3, 3, 'QIDP'),
	(4, 3, 3, 'EHJQ'),
	(5, 3, 3, 'EHJA');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.ruta
CREATE TABLE IF NOT EXISTS `ruta` (
  `id_ruta` int(11) NOT NULL AUTO_INCREMENT,
  `id_estacion_origen` int(11) NOT NULL DEFAULT '0',
  `id_estacion_destino` int(11) NOT NULL DEFAULT '0',
  `distancia` int(11) NOT NULL DEFAULT '0',
  `precio` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ruta`),
  KEY `id_estacion_origen` (`id_estacion_origen`),
  KEY `id_estacion_destino` (`id_estacion_destino`),
  CONSTRAINT `id_estacion_destino` FOREIGN KEY (`id_estacion_destino`) REFERENCES `estacion` (`id_estacion`),
  CONSTRAINT `id_estacion_origen` FOREIGN KEY (`id_estacion_origen`) REFERENCES `estacion` (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.ruta: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` (`id_ruta`, `id_estacion_origen`, `id_estacion_destino`, `distancia`, `precio`) VALUES
	(1, 1, 2, 47, 5.1),
	(2, 1, 3, 34, 4),
	(3, 2, 1, 34, 4),
	(4, 2, 3, 47, 5.1),
	(5, 3, 1, 34, 4),
	(6, 3, 2, 47, 5.1);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varbinary(100) NOT NULL DEFAULT '0',
  `fecha_cad` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `cvv` varchar(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tarjeta`),
  UNIQUE KEY `numero` (`numero`),
  KEY `id_cliente_c` (`id_cliente`),
  CONSTRAINT `id_cliente_c` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.tarjeta: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` (`id_tarjeta`, `numero`, `fecha_cad`, `id_cliente`, `cvv`) VALUES
	(1, _binary 0x73BC256DFA5F02FB60CAFA9C8D179A7B, '1999-05-05', 1, '111'),
	(2, _binary 0x7A1A4CCD6919C0C89BC7ED3022687BA7C9446884ED08497A3543FA76CADCFE4D, '2020-06-12', 1, '111'),
	(3, _binary 0x9BC855F4B01D171BA640CEF7CA20C51EC9446884ED08497A3543FA76CADCFE4D, '2020-10-12', 2, '111');
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.viaje
CREATE TABLE IF NOT EXISTS `viaje` (
  `id_viaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_horario` int(11) NOT NULL DEFAULT '0',
  `fecha` date DEFAULT NULL,
  `plazas_ocupadas` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_viaje`),
  KEY `id_horario` (`id_horario`),
  CONSTRAINT `id_horario` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.viaje: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` (`id_viaje`, `id_horario`, `fecha`, `plazas_ocupadas`) VALUES
	(2, 2, '2018-06-16', 0),
	(3, 3, '2018-06-15', 4),
	(9, 4, '2018-06-16', 0),
	(10, 5, '2018-06-15', 0),
	(11, 6, '2018-06-16', 0),
	(12, 1, '2018-06-16', 0),
	(13, 1, '2018-06-15', 0),
	(14, 2, '2018-06-15', 0),
	(15, 3, '2018-06-16', 0),
	(16, 4, '2018-06-15', 0),
	(17, 5, '2018-06-16', 0),
	(18, 6, '2018-06-15', 0),
	(19, 7, '2018-06-15', 0),
	(20, 7, '2018-06-16', 0),
	(21, 8, '2018-06-15', 0),
	(22, 8, '2018-06-16', 0);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;

-- Volcando estructura para tabla bd-autobuses-adc.viajero
CREATE TABLE IF NOT EXISTS `viajero` (
  `id_viajero` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  PRIMARY KEY (`id_viajero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd-autobuses-adc.viajero: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viajero` DISABLE KEYS */;
INSERT INTO `viajero` (`id_viajero`, `nif`, `nombre`, `apellidos`, `fecha_nac`) VALUES
	(1, '49314652F', 'ad', 'jkhfkq', '1998-04-20');
/*!40000 ALTER TABLE `viajero` ENABLE KEYS */;

-- Volcando estructura para disparador bd-autobuses-adc.disparador_backup_viaje
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `disparador_backup_viaje` BEFORE DELETE ON `viaje` FOR EACH ROW BEGIN

	INSERT INTO backup_viajero SELECT * FROM viajero WHERE id_viajero IN (SELECT id_viajero FROM ocupacion WHERE id_reserva IN (SELECT id_reserva FROM reserva WHERE id_viaje = OLD.id_viaje));
	
	INSERT INTO backup_viaje SELECT * FROM viaje WHERE id_viaje = OLD.id_viaje;
	
	INSERT INTO backup_reserva SELECT * FROM reserva WHERE id_viaje = OLD.id_viaje;
	
	INSERT INTO backup_ocupacion SELECT * FROM ocupacion WHERE id_reserva IN (SELECT id_reserva FROM reserva WHERE id_viaje = OLD.id_viaje);
	
	DELETE FROM ocupacion WHERE id_reserva IN (SELECT id_reserva FROM reserva WHERE id_viaje = OLD.id_viaje);
	
	DELETE FROM reserva WHERE id_viaje = OLD.id_viaje;
	
	DELETE FROM viajero WHERE id_viajero NOT IN (SELECT id_viajero FROM ocupacion);
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

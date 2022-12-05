CREATE DATABASE  IF NOT EXISTS `proyecto_coderhouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_coderhouse`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_coderhouse
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_viaje` int NOT NULL,
  `estado_de_asignacion` text NOT NULL,
  `id_chofer` int NOT NULL,
  `id_auto` int NOT NULL,
  `id_disponibilidad` int NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `km_de_recorrido` int DEFAULT NULL,
  `fecha_de_inicio` date DEFAULT NULL,
  `fecha_de_fin` date DEFAULT NULL,
  `fecha_de_cancelacion` date DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_viaje_idx` (`id_viaje`),
  KEY `id_chofer_idx` (`id_chofer`),
  KEY `id_auto_idx` (`id_auto`),
  KEY `id_disponibilidad_idx` (`id_disponibilidad`),
  CONSTRAINT `id_auto` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_autos`),
  CONSTRAINT `id_chofer` FOREIGN KEY (`id_chofer`) REFERENCES `chofer` (`id_chofer`),
  CONSTRAINT `id_disponibilidad` FOREIGN KEY (`id_disponibilidad`) REFERENCES `disponibilidad` (`id_disponibilidad`),
  CONSTRAINT `id_viaje` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos` (
  `id_autos` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `seguro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autos`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES (1,'aa111aa','fiesta','negro','ford','2614377906'),(2,'ab120aa','suran','roja','volkswagen','852153791'),(3,'aa195aa','sandero','gris','renault','6767787907'),(4,'aa253aa','gol','blanco','volkswagen','6381716843'),(5,'aa101aa','up','negro','volkswagen','9952160470'),(6,'123abc','c4','verde','citro‰n','4991467158'),(7,'750tas','civic','azul','honda','2214750916'),(8,'456asd','accord','rojo','honda','4470187672'),(9,'753tha','roadster','amarillo','nissan','8643729200'),(10,'138efg','alhambra','negro','seat','4479350883'),(11,'134fet','golf','blanco','volkswagen','2059114702'),(12,'964tad','t-cross','blanco','volkswagen','1140002436'),(13,'001asd','model x','gris','tesla','958035816'),(14,'468jgf','corolla','azul','toyota','2897903807'),(15,'756fea','focus','amarillo','ford','3473422575');
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_auto_log` AFTER INSERT ON `autos` FOR EACH ROW insert into autos_log (fecha,hora,usuario_id,patente,modelo,color,marca,seguro,tipo_operacion)
values
(curdate(),curtime(),session_user(),new.patente,new.modelo,new.color,new.marca,new.seguro,'se inserta dato') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `borrar_auto_log` BEFORE DELETE ON `autos` FOR EACH ROW begin
insert into autos_log (fecha,hora,usuario_id,patente,modelo,color,marca,seguro,tipo_operacion)
values
(curdate(),curtime(),session_user(),old.patente,old.modelo,old.color,old.marca,old.seguro,'se borra dato');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `autos_log`
--

DROP TABLE IF EXISTS `autos_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos_log` (
  `id_autos` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `seguro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos_log`
--

LOCK TABLES `autos_log` WRITE;
/*!40000 ALTER TABLE `autos_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `autos_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer` (
  `id_chofer` int NOT NULL AUTO_INCREMENT,
  `ranking` int DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `licencia_de_conducir` int DEFAULT NULL,
  `vigencia_de_licencia` date DEFAULT NULL,
  PRIMARY KEY (`id_chofer`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES (1,1,'Victor','Narvaez',21147518,'2025-06-07'),(2,2,'Jose ','Quevedo',29619789,'2023-12-27'),(3,5,'Ramiro ','Lara',39720635,'2024-04-09'),(4,4,'Bernardino','Xu',33956108,'2024-11-20'),(5,3,'Manel ','Reyes',37729983,'2023-05-22'),(6,1,'Benito','Portela',29321931,'2025-01-10'),(7,5,'Eugenio ','Beltran',27474253,'2024-03-17'),(8,2,'Sergi ','Quesada',32337321,'2023-11-04'),(9,4,'Jose ','Pareja',27607666,'2026-11-04'),(10,3,'Gerard ','Catalan',37596191,'2024-10-13'),(11,1,'Jairo ','Amor',33700826,'2025-07-08'),(12,5,'Luis ','Alegre',23393886,'2026-04-29'),(13,1,'Ramiro ','Rivera',29519328,'2024-01-31'),(14,2,'Faustino ','Cantos',37615991,'2023-09-22'),(15,3,'Esteban ','Marquez',38337866,'2023-12-16');
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comision de chofer`
--

DROP TABLE IF EXISTS `comision de chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comision de chofer` (
  `monto_viaje` decimal(10,0) DEFAULT NULL,
  `pago_chofer` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comision de chofer`
--

LOCK TABLES `comision de chofer` WRITE;
/*!40000 ALTER TABLE `comision de chofer` DISABLE KEYS */;
/*!40000 ALTER TABLE `comision de chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidad` (
  `id_disponibilidad` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `estado` text,
  `id_chofer` int NOT NULL,
  `id_auto` int NOT NULL,
  PRIMARY KEY (`id_disponibilidad`),
  KEY `id_chofer_idx` (`id_chofer`),
  KEY `id_auto_idx` (`id_auto`),
  CONSTRAINT `auto` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_autos`),
  CONSTRAINT `chofer` FOREIGN KEY (`id_chofer`) REFERENCES `chofer` (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios de pago`
--

DROP TABLE IF EXISTS `medios de pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios de pago` (
  `id_medios` int NOT NULL,
  `tarjeta_de_credito` varchar(45) DEFAULT NULL,
  `tarjeta_de_debito` varchar(45) DEFAULT NULL,
  `efectivo` varchar(45) DEFAULT NULL,
  `apple_pay` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_medios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios de pago`
--

LOCK TABLES `medios de pago` WRITE;
/*!40000 ALTER TABLE `medios de pago` DISABLE KEYS */;
INSERT INTO `medios de pago` VALUES (1,'4515 6661 0710 1741','','',''),(2,'','4709 7436 6196 4362','',''),(3,'','','',''),(4,'5347 6841 7751 6517','','',''),(5,'','5489 3673 2104 5488','',''),(6,'3459 4311 2471 227','','',''),(7,'5529 6306 7335 7120','5366 7292 4650 0103','',''),(8,'','3464 0425 0904 809','',''),(9,'','4779 5294 4506 5310','',''),(10,'3751 7090 1594 943','','',''),(11,'','4339 7625 9275 7842','',''),(12,'3491 7282 4781 436','','',''),(13,'5189 8484 0475 1111','','',''),(14,'3729 9097 9067 784','5295 9736 7934 8202','',''),(15,'','3740 6443 6405 892','','');
/*!40000 ALTER TABLE `medios de pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago de viaje`
--

DROP TABLE IF EXISTS `pago de viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago de viaje` (
  `monto_viaje` int NOT NULL,
  `num_tarjeta` int DEFAULT NULL,
  `nom_tarjeta` varchar(45) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`monto_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago de viaje`
--

LOCK TABLES `pago de viaje` WRITE;
/*!40000 ALTER TABLE `pago de viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago de viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `medios_de_pago` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'2020-03-24 00:00:00',1,'1','amelia','hurtado'),(2,'2016-05-06 00:00:00',5,'2','roberto','figueroa'),(3,'2020-01-04 00:00:00',4,'3','julian','acuÃ±a'),(4,'2018-10-14 00:00:00',3,'4','jose','uriarte'),(5,'2018-08-03 00:00:00',2,'5','maria','sandoval'),(6,'2017-04-30 00:00:00',5,'6','emilia','gonzalez'),(7,'2019-01-15 00:00:00',4,'7','emanuel','perales'),(8,'2021-07-28 00:00:00',3,'8','matias','santamaria'),(9,'2019-01-18 00:00:00',1,'9','patricio','alvarez'),(10,'2019-08-22 00:00:00',2,'10','david','espada'),(11,'2015-02-03 00:00:00',4,'11','mateo','marin'),(12,'2020-03-04 00:00:00',5,'12','santiago','ibaÃ±ez'),(13,'2016-11-25 00:00:00',2,'13','gabriel','arellano'),(14,'2016-03-24 00:00:00',4,'14','simon','prado'),(15,'2015-05-27 00:00:00',2,'15','enzo','benavente');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertar_usuarios_log` AFTER INSERT ON `usuarios` FOR EACH ROW insert into usuarios_log (fecha,hora,usuario_id,nombre,apellido,tipo_operacion)
values
(curdate(),curtime(),session_user(),new.nombre,new.apellido,'se inserta dato') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `borrar_usuario_log` BEFORE DELETE ON `usuarios` FOR EACH ROW begin
insert into usuarios_log (fecha,hora,usuario_id,nombre,apellido,tipo_operacion)
values
(curdate(),curtime(),session_user(),old.nombre,old.apellido,'se borra dato');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_log`
--

DROP TABLE IF EXISTS `usuarios_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_log` (
  `id_usuario` int NOT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `medios_de_pago` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_log`
--

LOCK TABLES `usuarios_log` WRITE;
/*!40000 ALTER TABLE `usuarios_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `id_viaje` int NOT NULL AUTO_INCREMENT,
  `estado` text,
  `id_usuario` int DEFAULT NULL,
  `origen` varchar(45) DEFAULT NULL,
  `destino` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `usuario_idx` (`id_usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,'Pendiente',1,'Santiado del Estero 25','Av Maipu 2060',4383),(2,'En proceso',2,'Av Cabildo 2450','Echeverria 1333',3457),(3,'Finalizado',3,'Av Cramer 2750','Av Olazabal 2129',1708),(4,'Finalizado',4,'Av Juramento 1250','Pinto 3640',2429),(5,'En proceso',5,'Uriarte 1969','Concepcion Arenal 2737',3623),(6,'Pendiente',6,'Av Monroe 4874','Holmberg 2030',2210),(7,'Pendiente',7,'Paraguay 5244','O\'Higgins 2363',2794),(8,'En proceso',8,'Echeverria 1450','Av Juramento 1406',3465),(9,'Finalizado',9,'Santiado del Estero 147','Uriarte 2546',2228),(10,'Finalizado',10,'Av Monroe 1776','Av Cramer 2698',3020),(11,'En proceso',11,'Uriarte 1969','Pinto 3640',2380),(12,'Pendiente',12,'Paraguay 5244','Holmberg 2030',4239),(13,'Pendiente',13,'Echeverria 1450','Concepcion Arenal 2737',2853),(14,'En proceso',14,'Av Juramento 1250','Av Cramer 2698',1934),(15,'Finalizado',15,'Av Cabildo 2450','Av Olazabal 2129',2661);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_autos`
--

DROP TABLE IF EXISTS `vista_autos`;
/*!50001 DROP VIEW IF EXISTS `vista_autos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_autos` AS SELECT 
 1 AS `id_autos`,
 1 AS `patente`,
 1 AS `modelo`,
 1 AS `color`,
 1 AS `marca`,
 1 AS `seguro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_chofer`
--

DROP TABLE IF EXISTS `vista_chofer`;
/*!50001 DROP VIEW IF EXISTS `vista_chofer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_chofer` AS SELECT 
 1 AS `id_chofer`,
 1 AS `ranking`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `licencia_de_conducir`,
 1 AS `vigencia_de_licencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_medios`
--

DROP TABLE IF EXISTS `vista_medios`;
/*!50001 DROP VIEW IF EXISTS `vista_medios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_medios` AS SELECT 
 1 AS `id_medios`,
 1 AS `tarjeta_de_credito`,
 1 AS `tarjeta_de_debito`,
 1 AS `efectivo`,
 1 AS `apple_pay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios`
--

DROP TABLE IF EXISTS `vista_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios` AS SELECT 
 1 AS `id_usuario`,
 1 AS `fecha_de_creacion`,
 1 AS `ranking`,
 1 AS `medios_de_pago`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_viaje`
--

DROP TABLE IF EXISTS `vista_viaje`;
/*!50001 DROP VIEW IF EXISTS `vista_viaje`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_viaje` AS SELECT 
 1 AS `id_viaje`,
 1 AS `estado`,
 1 AS `id_usuario`,
 1 AS `origen`,
 1 AS `destino`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'proyecto_coderhouse'
--
/*!50003 DROP FUNCTION IF EXISTS `comision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `comision`(monto_viaje decimal) RETURNS decimal(10,0)
    DETERMINISTIC
begin
return monto_viaje * 0.25;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `iva`(monto_viaje decimal) RETURNS decimal(10,0)
    DETERMINISTIC
begin 
return monto_viaje * 0.21;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `autos_ordenado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `autos_ordenado`(in columna varchar(200),in orden varchar(200))
BEGIN
set @columna=columna;
set @orden=orden;
set @q= 'SELECT * FROM autos ORDER BY ';
set @qfinal = concat(@q,' ',@columna,' ',@orden,';');
prepare ejecutar from @qfinal;
execute ejecutar;
deallocate prepare ejecutar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingreso_registro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingreso_registro`(in patente varchar(45), in modelo varchar(45), in color varchar(45),in marca varchar(45),in seguro varchar(45))
begin 
if (select count(patente) from autos where patente=patente)>0 then
	select 'Patente existente';
else insert into autos values(patente,modelo,color,marca,seguro);
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_autos`
--

/*!50001 DROP VIEW IF EXISTS `vista_autos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_autos` AS select `autos`.`id_autos` AS `id_autos`,`autos`.`patente` AS `patente`,`autos`.`modelo` AS `modelo`,`autos`.`color` AS `color`,`autos`.`marca` AS `marca`,`autos`.`seguro` AS `seguro` from `autos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_chofer`
--

/*!50001 DROP VIEW IF EXISTS `vista_chofer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_chofer` AS select `chofer`.`id_chofer` AS `id_chofer`,`chofer`.`ranking` AS `ranking`,`chofer`.`nombre` AS `nombre`,`chofer`.`apellido` AS `apellido`,`chofer`.`licencia_de_conducir` AS `licencia_de_conducir`,`chofer`.`vigencia_de_licencia` AS `vigencia_de_licencia` from `chofer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_medios`
--

/*!50001 DROP VIEW IF EXISTS `vista_medios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_medios` AS select `medios de pago`.`id_medios` AS `id_medios`,`medios de pago`.`tarjeta_de_credito` AS `tarjeta_de_credito`,`medios de pago`.`tarjeta_de_debito` AS `tarjeta_de_debito`,`medios de pago`.`efectivo` AS `efectivo`,`medios de pago`.`apple_pay` AS `apple_pay` from `medios de pago` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`fecha_de_creacion` AS `fecha_de_creacion`,`usuarios`.`ranking` AS `ranking`,`usuarios`.`medios_de_pago` AS `medios_de_pago`,`usuarios`.`nombre` AS `nombre`,`usuarios`.`apellido` AS `apellido` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_viaje`
--

/*!50001 DROP VIEW IF EXISTS `vista_viaje`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_viaje` AS select `viaje`.`id_viaje` AS `id_viaje`,`viaje`.`estado` AS `estado`,`viaje`.`id_usuario` AS `id_usuario`,`viaje`.`origen` AS `origen`,`viaje`.`destino` AS `destino`,`viaje`.`precio` AS `precio` from `viaje` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 14:22:26

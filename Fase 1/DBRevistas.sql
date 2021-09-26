CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin324';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
CREATE DATABASE  IF NOT EXISTS `dbrevistas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbrevistas`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dbrevistas
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `hdeusuarios`
--

DROP TABLE IF EXISTS `hdeusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hdeusuarios` (
  `IdDelUsuario` int NOT NULL,
  `Hobbie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hdeusuarios`
--

LOCK TABLES `hdeusuarios` WRITE;
/*!40000 ALTER TABLE `hdeusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `hdeusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicidad_base`
--

DROP TABLE IF EXISTS `publicidad_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicidad_base` (
  `idPublicidad` int NOT NULL AUTO_INCREMENT,
  `NombreAnunciante` varchar(80) NOT NULL,
  `TipoDePublicidad` int NOT NULL,
  `Activo` tinyint NOT NULL,
  `DiasActivo` int NOT NULL,
  `Pago` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPublicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicidad_base`
--

LOCK TABLES `publicidad_base` WRITE;
/*!40000 ALTER TABLE `publicidad_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicidad_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicidad_imagen`
--

DROP TABLE IF EXISTS `publicidad_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicidad_imagen` (
  `IdPubli` int NOT NULL,
  `Imagen` blob NOT NULL,
  `Texto` varchar(200) DEFAULT NULL,
  KEY `IdPublicidad_idx` (`IdPubli`),
  CONSTRAINT `IdPublicidad` FOREIGN KEY (`IdPubli`) REFERENCES `publicidad_base` (`idPublicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicidad_imagen`
--

LOCK TABLES `publicidad_imagen` WRITE;
/*!40000 ALTER TABLE `publicidad_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicidad_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicidad_texto`
--

DROP TABLE IF EXISTS `publicidad_texto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicidad_texto` (
  `IdPubli` int NOT NULL,
  `Texto` varchar(300) NOT NULL,
  KEY `Id_idx` (`IdPubli`),
  CONSTRAINT `IdDePublicidad` FOREIGN KEY (`IdPubli`) REFERENCES `publicidad_base` (`idPublicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicidad_texto`
--

LOCK TABLES `publicidad_texto` WRITE;
/*!40000 ALTER TABLE `publicidad_texto` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicidad_texto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicidad_video`
--

DROP TABLE IF EXISTS `publicidad_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicidad_video` (
  `IdPubli` int NOT NULL,
  `URL` varchar(500) NOT NULL,
  `Texto` varchar(200) DEFAULT NULL,
  KEY `IdPubli_idx` (`IdPubli`),
  CONSTRAINT `IdPubli` FOREIGN KEY (`IdPubli`) REFERENCES `publicidad_base` (`idPublicidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicidad_video`
--

LOCK TABLES `publicidad_video` WRITE;
/*!40000 ALTER TABLE `publicidad_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicidad_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revistas`
--

DROP TABLE IF EXISTS `revistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revistas` (
  `IdRevista` int NOT NULL AUTO_INCREMENT,
  `Revista` blob NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrecioSuscripcion` decimal(10,2) NOT NULL,
  `Likes` int NOT NULL DEFAULT '0',
  `Descripcion` varchar(200) NOT NULL,
  `Habilitada` tinyint NOT NULL,
  `HabilitadoMG` tinyint NOT NULL,
  `HabilitadoCM` tinyint NOT NULL,
  `HabilitadoSus` tinyint NOT NULL,
  PRIMARY KEY (`IdRevista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revistas`
--

LOCK TABLES `revistas` WRITE;
/*!40000 ALTER TABLE `revistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `revistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revistascategorias`
--

DROP TABLE IF EXISTS `revistascategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revistascategorias` (
  `idRevista` int NOT NULL,
  `Categoria` varchar(60) NOT NULL,
  KEY `Id_idx` (`idRevista`),
  CONSTRAINT `Id` FOREIGN KEY (`idRevista`) REFERENCES `revistas` (`IdRevista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revistascategorias`
--

LOCK TABLES `revistascategorias` WRITE;
/*!40000 ALTER TABLE `revistascategorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `revistascategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revistastags`
--

DROP TABLE IF EXISTS `revistastags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revistastags` (
  `IdRevista` int NOT NULL,
  `Tag` varchar(45) NOT NULL,
  KEY `IdRevista_idx` (`IdRevista`),
  CONSTRAINT `IdRevista` FOREIGN KEY (`IdRevista`) REFERENCES `revistas` (`IdRevista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revistastags`
--

LOCK TABLES `revistastags` WRITE;
/*!40000 ALTER TABLE `revistastags` DISABLE KEYS */;
/*!40000 ALTER TABLE `revistastags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `TipoDeUsuario` int NOT NULL,
  `Foto` mediumblob NOT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-26  2:58:04

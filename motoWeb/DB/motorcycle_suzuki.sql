-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: motorcycle
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `suzuki`
--

DROP TABLE IF EXISTS `suzuki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suzuki` (
  `suzuki_ID` int(11) NOT NULL,
  `motorcycleNAME` varchar(45) DEFAULT NULL,
  `evaluation` varchar(45) DEFAULT NULL,
  `CC` varchar(45) DEFAULT NULL,
  `engine` varchar(45) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `href` int(11) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`suzuki_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suzuki`
--

LOCK TABLES `suzuki` WRITE;
/*!40000 ALTER TABLE `suzuki` DISABLE KEYS */;
INSERT INTO `suzuki` VALUES (1,'Suzuki GSX150','5','149c.c','DOHC單缸水冷引擎',400,66,1,'/20% Off '),(2,'Suzuki GSX-R150','5','147c.c','DOHC 4V水冷引擎',300,13,2,'/20% Off'),(3,'Suzuki GSX-S750','5','749c.c','DOHC 4V水冷引擎',600,5,3,'/20% Off');
/*!40000 ALTER TABLE `suzuki` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-08 21:01:34

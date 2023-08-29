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
-- Table structure for table `buy2`
--

DROP TABLE IF EXISTS `buy2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy2` (
  `buyer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_Name` varchar(45) DEFAULT NULL,
  `buyer_sex` varchar(45) DEFAULT NULL,
  `buy_id` varchar(45) DEFAULT NULL,
  `pay_way` varchar(45) DEFAULT NULL,
  `rent_date` date DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `moto_name` varchar(45) DEFAULT NULL,
  `card` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `card2` varchar(45) DEFAULT NULL,
  `card3` varchar(45) DEFAULT NULL,
  `card4` varchar(45) DEFAULT NULL,
  `card5` varchar(45) DEFAULT NULL,
  `card6` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`buyer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy2`
--

LOCK TABLES `buy2` WRITE;
/*!40000 ALTER TABLE `buy2` DISABLE KEYS */;
INSERT INTO `buy2` VALUES (10,'123','man','123','bOne','2021-01-14',320,'2021-01-15','Yamaha YZF-R3','123','tt33252637@gmail.com','321','22','32','22','22'),(11,'阿明','man','123','bTwo','2021-01-15',320,'2021-01-09','Yamaha YZF-R3','','tt33252637@gmail.com','','','','',''),(12,'123','man','123','bTwo','2021-01-07',320,'2021-01-15','Yamaha YZF-R3','','123@gmail.com','','','','','');
/*!40000 ALTER TABLE `buy2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-08 21:01:35

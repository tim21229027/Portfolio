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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (43,'我','man','asd','bOne','2021-01-08',480,'2021-01-16','Honda CB650R','123','123@12312','1233','333','33','11','33');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `buy3`
--

DROP TABLE IF EXISTS `buy3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy3` (
  `buyer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_Name` varchar(45) DEFAULT NULL,
  `buyer_sex` varchar(45) DEFAULT NULL,
  `buy_id` varchar(45) DEFAULT NULL,
  `pay_way` varchar(45) DEFAULT NULL,
  `rent_date` varchar(45) DEFAULT NULL,
  `rent` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy3`
--

LOCK TABLES `buy3` WRITE;
/*!40000 ALTER TABLE `buy3` DISABLE KEYS */;
INSERT INTO `buy3` VALUES (7,'321','man','321','bOne','2021-01-14','240.0','2021-01-15','Suzuki GSX-R150','123','tt33252637@gmail.com','123','213','321','123','123');
/*!40000 ALTER TABLE `buy3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `email` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  `pwd` varchar(12) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `birth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('11@gmail.com','test','1111','',''),('123@12312','333','123','11111','2021-01-15'),('123@gmail.com','123','123','01945345','2021-01-20'),('44@g','sdsad','123',NULL,NULL),('aaaa33151637@gmail.com','123123','123','123123','2021-01-03'),('dfg@fgf0','66666','111',NULL,NULL),('sdf@a','666','123',NULL,NULL),('sdf@aa','33','123','',''),('tt33252637@gmail.com','test','456',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (2,'tt33252637@gmail.com','55555','2021-01-04'),(5,'tt33252637@gmail.com','我在哪','2021-01-04'),(6,'tt33252637@gmail.com','ㄅ','2021-01-04');
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook2`
--

DROP TABLE IF EXISTS `guestbook2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook2` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook2`
--

LOCK TABLES `guestbook2` WRITE;
/*!40000 ALTER TABLE `guestbook2` DISABLE KEYS */;
INSERT INTO `guestbook2` VALUES (1,'tt33252637@gmail.com','好帥','2021-01-04'),(2,'tt33252637@gmail.com','123','2021-01-04'),(3,'tt33252637@gmail.com','123','2021-01-04');
/*!40000 ALTER TABLE `guestbook2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook3`
--

DROP TABLE IF EXISTS `guestbook3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook3` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook3`
--

LOCK TABLES `guestbook3` WRITE;
/*!40000 ALTER TABLE `guestbook3` DISABLE KEYS */;
INSERT INTO `guestbook3` VALUES (1,'tt33252637@gmail.com','333','2021-01-04');
/*!40000 ALTER TABLE `guestbook3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook4`
--

DROP TABLE IF EXISTS `guestbook4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook4` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook4`
--

LOCK TABLES `guestbook4` WRITE;
/*!40000 ALTER TABLE `guestbook4` DISABLE KEYS */;
INSERT INTO `guestbook4` VALUES (1,'aaaa33151637@gmail.com','333','2021-01-04'),(2,'aaaa33151637@gmail.com','早上好','2021-01-06'),(3,'tt33252637@gmail.com','嗨','2021-01-08');
/*!40000 ALTER TABLE `guestbook4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook5`
--

DROP TABLE IF EXISTS `guestbook5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook5` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook5`
--

LOCK TABLES `guestbook5` WRITE;
/*!40000 ALTER TABLE `guestbook5` DISABLE KEYS */;
INSERT INTO `guestbook5` VALUES (1,'aaaa33151637@gmail.com','1','2021-01-05');
/*!40000 ALTER TABLE `guestbook5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook6`
--

DROP TABLE IF EXISTS `guestbook6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook6` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook6`
--

LOCK TABLES `guestbook6` WRITE;
/*!40000 ALTER TABLE `guestbook6` DISABLE KEYS */;
INSERT INTO `guestbook6` VALUES (1,'aaaa33151637@gmail.com','777','2021-01-05');
/*!40000 ALTER TABLE `guestbook6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook7`
--

DROP TABLE IF EXISTS `guestbook7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook7` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook7`
--

LOCK TABLES `guestbook7` WRITE;
/*!40000 ALTER TABLE `guestbook7` DISABLE KEYS */;
INSERT INTO `guestbook7` VALUES (1,'tt33252637@gmail.com','2','2021-01-05');
/*!40000 ALTER TABLE `guestbook7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook8`
--

DROP TABLE IF EXISTS `guestbook8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook8` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook8`
--

LOCK TABLES `guestbook8` WRITE;
/*!40000 ALTER TABLE `guestbook8` DISABLE KEYS */;
INSERT INTO `guestbook8` VALUES (1,'tt33252637@gmail.com','4','2021-01-05'),(2,'123@gmail.com','123','2021-01-07');
/*!40000 ALTER TABLE `guestbook8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook9`
--

DROP TABLE IF EXISTS `guestbook9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook9` (
  `GBNO` int(11) NOT NULL AUTO_INCREMENT,
  `GBName` varchar(45) DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook9`
--

LOCK TABLES `guestbook9` WRITE;
/*!40000 ALTER TABLE `guestbook9` DISABLE KEYS */;
INSERT INTO `guestbook9` VALUES (1,'tt33252637@gmail.com','66','2021-01-05');
/*!40000 ALTER TABLE `guestbook9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `honda`
--

DROP TABLE IF EXISTS `honda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `honda` (
  `honda_id` int(11) NOT NULL,
  `motorcycleNAME` varchar(45) DEFAULT NULL,
  `evaluation` varchar(45) DEFAULT NULL,
  `CC` varchar(45) DEFAULT NULL,
  `engine` varchar(45) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `href` int(11) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`honda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honda`
--

LOCK TABLES `honda` WRITE;
/*!40000 ALTER TABLE `honda` DISABLE KEYS */;
INSERT INTO `honda` VALUES (1,'Honda CB650R','3','649c.c','水冷並列4汽缸，16汽門，DOHC',600,44,4,'/20% Off '),(2,'Honda CBR650R','5','649c.c','引擎形式:水冷並列4汽缸，16汽門，DOHC',600,15,5,'/20% Off '),(3,'Honda CB300R','5','286c.c','引擎形式:水冷四行程單汽缸',300,58,6,'/20% Off');
/*!40000 ALTER TABLE `honda` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `yamaha`
--

DROP TABLE IF EXISTS `yamaha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yamaha` (
  `yamaha_ID` int(11) NOT NULL,
  `motorcycleNAME` varchar(45) DEFAULT NULL,
  `evaluation` varchar(45) DEFAULT NULL,
  `CC` varchar(45) DEFAULT NULL,
  `engine` varchar(45) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `href` int(11) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`yamaha_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yamaha`
--

LOCK TABLES `yamaha` WRITE;
/*!40000 ALTER TABLE `yamaha` DISABLE KEYS */;
INSERT INTO `yamaha` VALUES (1,'Yamaha YZF-R3','3','321c.c','水冷四行程並列雙缸 DOHC 4V',400,11,7,'/20% Off'),(2,'Yamaha MT03','5','321c.c','水冷四行程並列雙缸 DOHC 4V',300,0,8,'/20% Off'),(3,'Yamaha XSR 700','4','689c.c','水冷四行程單汽缸',300,5,9,'/20% Off ');
/*!40000 ALTER TABLE `yamaha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-08 20:55:23

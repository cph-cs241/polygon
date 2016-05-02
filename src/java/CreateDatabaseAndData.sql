CREATE DATABASE  IF NOT EXISTS `Polygon` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_danish_ci */;
USE `Polygon`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: it-vejlederen.dk    Database: Polygon
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `idbuilding` int(10) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(40) DEFAULT NULL,
  `building_m2` double NOT NULL,
  `building_adress` varchar(100) NOT NULL,
  `building_housenumber` varchar(10) NOT NULL,
  `building_buildyear` int(4) NOT NULL,
  `building_zip` int(11) NOT NULL,
  `building_use` varchar(100) DEFAULT NULL,
  `customer_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`idbuilding`),
  KEY `customer_id` (`customer_id`),
  KEY `building_ibfk_2_idx` (`building_zip`),
  CONSTRAINT `building_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `building_ibfk_2` FOREIGN KEY (`building_zip`) REFERENCES `zip_codes` (`zipcode`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (0,'Amalienborg',11,'Amalienborgs Slotsplads','1',1675,1877,'Residence of his Majesty King Henry of Denmark',1),(2,'Runde Tårn',142,'Kultovet','22',1990,201,'Nice building',1),(106,'McDonalds valby',8412.2,'Gammel Køge Landevej','103',1990,2500,'A Place where people eat.',3);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_documents`
--

DROP TABLE IF EXISTS `building_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `document_size` bigint(20) DEFAULT NULL,
  `documentname` varchar(45) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  KEY `building_documents_ibfk_1` (`building_id`),
  CONSTRAINT `building_documents_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`idbuilding`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_documents`
--

LOCK TABLES `building_documents` WRITE;
/*!40000 ALTER TABLE `building_documents` DISABLE KEYS */;
INSERT INTO `building_documents` VALUES (11,'4v8k3qugtfe2o717r9n74u32hb.html',0,'glassfish-web.xml.html',0),(12,'ilifj12vh5vspms4o1dl7jaceo.png',0,'userfiltering.png',0);
/*!40000 ALTER TABLE `building_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_floor`
--

DROP TABLE IF EXISTS `building_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_floor` (
  `floor_id` int(20) NOT NULL AUTO_INCREMENT,
  `floor_number` int(10) DEFAULT NULL,
  `floor_size` double NOT NULL,
  `total_rooms` int(100) DEFAULT NULL,
  `idbuilding` int(10) DEFAULT NULL,
  PRIMARY KEY (`floor_id`),
  KEY `building_floor_ibfk_1` (`idbuilding`),
  CONSTRAINT `building_floor_ibfk_1` FOREIGN KEY (`idbuilding`) REFERENCES `building` (`idbuilding`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_floor`
--

LOCK TABLES `building_floor` WRITE;
/*!40000 ALTER TABLE `building_floor` DISABLE KEYS */;
INSERT INTO `building_floor` VALUES (19,1,123,2,0),(20,2,23,0,0),(23,11,1900,0,2),(25,0,281.32,0,106);
/*!40000 ALTER TABLE `building_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_pic`
--

DROP TABLE IF EXISTS `building_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_pic` (
  `building_pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `building_id` int(10) DEFAULT NULL,
  `filename` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  PRIMARY KEY (`building_pic_id`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `building_pic_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`idbuilding`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_pic`
--

LOCK TABLES `building_pic` WRITE;
/*!40000 ALTER TABLE `building_pic` DISABLE KEYS */;
INSERT INTO `building_pic` VALUES (67,0,'a2n06r7nd7kf15r9d2gkb2crpp.jpg'),(70,2,'iaoaoaigg2cm6jlcvqouelf70r.jpg'),(80,106,'plecnal332vpl9pe5sp5qm42nl.jpg');
/*!40000 ALTER TABLE `building_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_room`
--

DROP TABLE IF EXISTS `building_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building_room` (
  `room_id` int(10) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(40) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `building_room_ibfk_1` (`floor_id`),
  CONSTRAINT `building_room_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `building_floor` (`floor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_room`
--

LOCK TABLES `building_room` WRITE;
/*!40000 ALTER TABLE `building_room` DISABLE KEYS */;
INSERT INTO `building_room` VALUES (31,'Dinning Room',25),(32,'Toilet',25),(33,'Dining Hall',19),(34,'BedRoom',20);
/*!40000 ALTER TABLE `building_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contactID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`contactID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `streetnumber` varchar(5) DEFAULT NULL,
  `zipcode` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cvr` varchar(15) DEFAULT NULL,
  `contactperson` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'MyOwnCompany','MyStreet12','213',1111,'21321311','dennis@schmock.eu',NULL,'Dennis Schmock'),(3,'Mc Donalds','MyStreet12','213',1111,'21321311','dennis@schmock.eu',NULL,'Ronald Mc Donald');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_user` (
  `username` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
INSERT INTO `customer_user` VALUES ('daeniz','123',1,'Dennis','Schmock','df@df.dk','2323223'),('mcd','123',3,'Ronald','Mc Donald','df@df.dk','2323223');
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floorplan`
--

DROP TABLE IF EXISTS `floorplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floorplan` (
  `floorplan_id` int(11) NOT NULL AUTO_INCREMENT,
  `floorplanpath` varchar(45) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `documentname` varchar(255) NOT NULL,
  `documentsize` int(15) DEFAULT NULL,
  PRIMARY KEY (`floorplan_id`),
  KEY `floorplan_ibfk_1_idx` (`floor_id`),
  CONSTRAINT `floorplan_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `building_floor` (`floor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floorplan`
--

LOCK TABLES `floorplan` WRITE;
/*!40000 ALTER TABLE `floorplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `floorplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `order_status` int(11) NOT NULL,
  `status_description` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  PRIMARY KEY (`order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Order has been placed'),(2,'Scheduled Request'),(3,'Building Site Visit'),(4,'Ongoing Request'),(5,'Finished');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_number` int(20) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `service_description` varchar(50) CHARACTER SET utf8 NOT NULL,
  `problem_statement` varchar(200) CHARACTER SET utf8 NOT NULL,
  `order_status` int(5) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `idbuilding` int(10) NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `customer_id` (`customer_id`),
  KEY `idbuilding` (`idbuilding`),
  KEY `order_status` (`order_status`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`idbuilding`) REFERENCES `building` (`idbuilding`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2016-04-19','Check-up Building','for annual inspection',2,1,0),(2,'2016-04-19','repaint walls','stains all over the wall',3,1,0),(3,'2016-04-19','broken railway','for urgent assistance',4,1,2),(4,'2016-04-20','change shape','this is urgent!',5,1,2),(5,'2016-04-20','Check-up Building','annual inspection',3,3,2),(6,'2016-04-20','Moisture Testing','for testing',1,1,0),(7,'2016-04-20','Fire Damage Restoration','everything was burned. This is so urgent!',1,1,2),(8,'2016-04-20','Moisture Testing','test',1,1,2),(9,'2016-04-21','Check-up Building','dfsaffdsfsdfa',1,1,0),(13,'2016-04-21','Check-up Building','for annual inspection',0,1,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polygon_user`
--

DROP TABLE IF EXISTS `polygon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polygon_user` (
  `username` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('employee','admin') DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polygon_user`
--

LOCK TABLES `polygon_user` WRITE;
/*!40000 ALTER TABLE `polygon_user` DISABLE KEYS */;
INSERT INTO `polygon_user` VALUES ('emp','123','Dennis','Esbensen','jfjf@fsadfd.dk','23232','employee');
/*!40000 ALTER TABLE `polygon_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_date` date DEFAULT NULL,
  `building_id` int(10) DEFAULT NULL,
  `polygonuser` varchar(30) DEFAULT NULL,
  `customer_user` varchar(30) DEFAULT NULL,
  `category_conclusion` int(1) DEFAULT NULL,
  `report_finished` tinyint(1) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_ibfk_1` (`building_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`idbuilding`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (79,'2016-04-29',106,'emp','Ronald',2,1),(80,'2016-04-29',0,'emp','The Queen of Denmark',0,1),(81,'2016-04-29',0,'emp','',0,1),(82,'2016-05-01',0,'emp','',0,1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_ext_pic`
--

DROP TABLE IF EXISTS `report_ext_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_ext_pic` (
  `report_pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_danish_ci DEFAULT NULL,
  `report_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_pic_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `report_ext_pic_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_ext_pic`
--

LOCK TABLES `report_ext_pic` WRITE;
/*!40000 ALTER TABLE `report_ext_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_ext_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_exterior`
--

DROP TABLE IF EXISTS `report_exterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_exterior` (
  `report_ext_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_ext_description` text COLLATE utf8_danish_ci,
  `report_ext_pic` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  `report` int(10) DEFAULT NULL,
  `rep_ext_inspected_area` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `rep_ext_pic_description` text COLLATE utf8_danish_ci,
  PRIMARY KEY (`report_ext_id`),
  KEY `report` (`report`),
  CONSTRAINT `report_exterior_ibfk_1` FOREIGN KEY (`report`) REFERENCES `report` (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_exterior`
--

LOCK TABLES `report_exterior` WRITE;
/*!40000 ALTER TABLE `report_exterior` DISABLE KEYS */;
INSERT INTO `report_exterior` VALUES (23,'Walls are Fine','3te1r07g66dahltd7lerdln446.jpg',79,'Wall','Nice Roof'),(24,'Roofs are in Good Shape','3te1r07g66dahltd7lerdln446.jpg',79,'Roof','Nice Roof'),(25,'No Remarks for the wall','kldrehi66lqcom9l13p1afhq6.jpg',80,'Wall',''),(26,'Pretty Roof','kldrehi66lqcom9l13p1afhq6.jpg',80,'Roof',''),(27,'Hhy',NULL,81,'Wall','Kjuu'),(28,'Hju',NULL,81,'Roof','Kjuu'),(29,'dsfsdf','8a7qol7834nj0cpq1c8l60uonb.png',82,'Wall','sdfsdf'),(30,'sdafsdaf','8a7qol7834nj0cpq1c8l60uonb.png',82,'Roof','sdfsdf');
/*!40000 ALTER TABLE `report_exterior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room`
--

DROP TABLE IF EXISTS `report_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room` (
  `report_room_id` int(10) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(30) DEFAULT NULL,
  `building_room` int(10) DEFAULT NULL,
  `report` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_room_id`),
  KEY `report` (`report`),
  KEY `report_room_ibfk_2` (`building_room`),
  CONSTRAINT `report_room_ibfk_1` FOREIGN KEY (`report`) REFERENCES `report` (`report_id`),
  CONSTRAINT `report_room_ibfk_2` FOREIGN KEY (`building_room`) REFERENCES `building_room` (`room_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room`
--

LOCK TABLES `report_room` WRITE;
/*!40000 ALTER TABLE `report_room` DISABLE KEYS */;
INSERT INTO `report_room` VALUES (68,'Dinning Room',31,79),(69,'Toilet',32,79),(70,'Dining Hall',33,80),(71,'BedRoom',34,80),(72,'Dining Hall',33,82);
/*!40000 ALTER TABLE `report_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_damage`
--

DROP TABLE IF EXISTS `report_room_damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_damage` (
  `report_room_damage_id` int(10) NOT NULL AUTO_INCREMENT,
  `damage_time` varchar(50) DEFAULT NULL,
  `place` varchar(250) DEFAULT NULL,
  `what_happened` text,
  `what_is_repaired` text,
  `damage_type` text,
  `report_room` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_room_damage_id`),
  KEY `report_room` (`report_room`),
  CONSTRAINT `report_room_damage_ibfk_1` FOREIGN KEY (`report_room`) REFERENCES `report_room` (`report_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_damage`
--

LOCK TABLES `report_room_damage` WRITE;
/*!40000 ALTER TABLE `report_room_damage` DISABLE KEYS */;
INSERT INTO `report_room_damage` VALUES (38,'9.2.2011','In the corner','The Window was Broken','Nothing Yet','Broken Glass',68),(39,'Two Weeks ago','In the left Corner','A small Fire','Nothing Yet','Fire Damage',70),(40,'Two Weeks ago','Under the bed','Weird Moist ','Cleaning some of it','Moist',71),(41,'dsf','sdaf','sdaf','sadf','dsf',72);
/*!40000 ALTER TABLE `report_room_damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_interior`
--

DROP TABLE IF EXISTS `report_room_interior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_interior` (
  `report_room_interior_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_room_interior_name` varchar(30) DEFAULT NULL,
  `remark` text,
  `report_room` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_room_interior_id`),
  KEY `report_room` (`report_room`),
  CONSTRAINT `report_room_interior_ibfk_1` FOREIGN KEY (`report_room`) REFERENCES `report_room` (`report_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_interior`
--

LOCK TABLES `report_room_interior` WRITE;
/*!40000 ALTER TABLE `report_room_interior` DISABLE KEYS */;
INSERT INTO `report_room_interior` VALUES (178,'Floor','Floor is clean',68),(179,'Window','Broken Windows in Left Corner',68),(180,'Celling','',68),(181,'Other','',68),(182,'Floor','Floor is dirty',69),(183,'Window','',69),(184,'Celling','',69),(185,'Other','',69),(186,'Floor','Nice Floors',70),(187,'Window','Pretty Windows',70),(188,'Celling','',70),(189,'Other','Weird Smell',70),(190,'Floor','fdssdaf',72),(191,'Window','sdf',72),(192,'Celling','dsfda',72),(193,'Other','sdaf',72);
/*!40000 ALTER TABLE `report_room_interior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_interior_pic`
--

DROP TABLE IF EXISTS `report_room_interior_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_interior_pic` (
  `report_room_interior_pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_room_interior` int(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`report_room_interior_pic_id`),
  KEY `report_room_interior` (`report_room_interior`),
  CONSTRAINT `report_room_interior_pic_ibfk_1` FOREIGN KEY (`report_room_interior`) REFERENCES `report_room_interior` (`report_room_interior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_interior_pic`
--

LOCK TABLES `report_room_interior_pic` WRITE;
/*!40000 ALTER TABLE `report_room_interior_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_room_interior_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_moist`
--

DROP TABLE IF EXISTS `report_room_moist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_moist` (
  `report_room_moist_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_room_moist_measured` varchar(100) DEFAULT NULL,
  `report_room_moist_place` varchar(250) DEFAULT NULL,
  `report_room_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_room_moist_id`),
  KEY `report_room_id` (`report_room_id`),
  CONSTRAINT `report_room_moist_ibfk_1` FOREIGN KEY (`report_room_id`) REFERENCES `report_room` (`report_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_moist`
--

LOCK TABLES `report_room_moist` WRITE;
/*!40000 ALTER TABLE `report_room_moist` DISABLE KEYS */;
INSERT INTO `report_room_moist` VALUES (31,'893. Moist','Floor',68),(32,'922 point moist','Whole ground Level',70),(33,'Still alot of moist','Whole Room',71),(34,'dsaf','sdaf',72);
/*!40000 ALTER TABLE `report_room_moist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_pic`
--

DROP TABLE IF EXISTS `report_room_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_pic` (
  `report_pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_danish_ci,
  `filename` varchar(30) COLLATE utf8_danish_ci DEFAULT NULL,
  `reportroom` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_pic_id`),
  KEY `reportroom` (`reportroom`),
  CONSTRAINT `report_room_pic_ibfk_1` FOREIGN KEY (`reportroom`) REFERENCES `report_room` (`report_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_pic`
--

LOCK TABLES `report_room_pic` WRITE;
/*!40000 ALTER TABLE `report_room_pic` DISABLE KEYS */;
INSERT INTO `report_room_pic` VALUES (17,'Broken Window','flpjenmm1et92fh8e98676bvs1.jpg',68),(18,'Toilet','d8ip8ommc5k1835stjrr10ijv5.jpg',69),(19,'Fire Damage','j4c6in88mnevq5tmd1o5uiosv3.jpg',70),(20,'Moist Damage','2hcq4pv9l9t86pn5rtq3rquhsd.jpg',71),(21,'','jnd4m7m25345611o935138nen3.png',72);
/*!40000 ALTER TABLE `report_room_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_room_recommendation`
--

DROP TABLE IF EXISTS `report_room_recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_room_recommendation` (
  `report_room_recommendation_id` int(10) NOT NULL AUTO_INCREMENT,
  `recommendation` text,
  `report_room` int(10) DEFAULT NULL,
  PRIMARY KEY (`report_room_recommendation_id`),
  KEY `report_room` (`report_room`),
  CONSTRAINT `report_room_recommendation_ibfk_1` FOREIGN KEY (`report_room`) REFERENCES `report_room` (`report_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_room_recommendation`
--

LOCK TABLES `report_room_recommendation` WRITE;
/*!40000 ALTER TABLE `report_room_recommendation` DISABLE KEYS */;
INSERT INTO `report_room_recommendation` VALUES (49,'The window needs replacement',68),(50,'Needs better Cleaning',69),(51,'Needs fire cleaning',70),(52,'A lot of fresh air',71),(53,'dsf',72);
/*!40000 ALTER TABLE `report_room_recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_codes`
--

DROP TABLE IF EXISTS `zip_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip_codes` (
  `zipcode` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_codes`
--

LOCK TABLES `zip_codes` WRITE;
/*!40000 ALTER TABLE `zip_codes` DISABLE KEYS */;
INSERT INTO `zip_codes` VALUES (100,'Tórshavn'),(110,'Tórshavn '),(160,'Argir'),(165,'Argir '),(175,'Kirkjubøur'),(176,'Velbastadur'),(177,'Sydradalur'),(178,'Nordradalur'),(180,'Kaldbak'),(185,'Kaldbaksbotnur'),(186,'Sund'),(187,'Hvitanes'),(188,'Hoyvík'),(210,'Sandur'),(215,'Sandur'),(220,'Skálavík'),(230,'Húsavík'),(235,'Dalur'),(236,'Skarvanes'),(240,'Skopun'),(260,'Skúvoy'),(270,'Nólsoy'),(280,'Hestur'),(285,'Koltur'),(286,'Stóra Dimun'),(330,'Stykkid'),(335,'Leynar'),(336,'Skællingur'),(340,'Kvívík'),(350,'Vestmanna'),(355,'Vestmanna'),(358,'Válur'),(360,'Sandavágur'),(370,'Midvágur'),(375,'Midvágur'),(380,'Sørvágur'),(385,'Vatnsoyrar'),(386,'Bøur'),(387,'Gásadalur'),(388,'Mykines'),(400,'Oyrarbakki'),(405,'Oyrarbakki'),(410,'Kollafjørdur'),(415,'Oyrareingir'),(416,'Signabøur'),(420,'Hósvík'),(430,'Hvalvík'),(435,'Streymnes'),(436,'Saksun'),(437,'Nesvík'),(438,'Langasandur'),(440,'Haldarsvík'),(445,'Tjørnuvík'),(450,'Oyri'),(460,'Nordskáli'),(465,'Svináir'),(466,'Ljósá'),(470,'Eidi'),(475,'Funningur'),(476,'Gjógv'),(477,'Funningsfjørdur'),(478,'Elduvík'),(480,'Skáli'),(485,'Skálafjørdur'),(490,'Strendur'),(494,'Innan Glyvur'),(495,'Kolbanargjógv'),(496,'Morskranes'),(497,'Selatrad'),(510,'Gøta'),(511,'Gøtugjógv'),(512,'Nordragøta'),(513,'Sydrugøta'),(515,'Gøta'),(520,'Leirvík'),(530,'Fuglafjørdur'),(535,'Fuglafjørdur'),(555,'Scanning'),(600,'Saltangará'),(610,'Saltangará'),(620,'Runavík'),(625,'Glyvrar'),(626,'Lambareidi'),(627,'Lambi'),(640,'Rituvík'),(645,'Æduvík'),(650,'Toftir'),(655,'Nes'),(656,'Saltnes'),(660,'Søldarfjørdur'),(665,'Skipanes'),(666,'Gøtueidi'),(690,'Oyndarfjørdur'),(695,'Hellur'),(700,'Klaksvík'),(710,'Klaksvík'),(725,'Nordoyri'),(726,'Ánir'),(727,'Árnafjørdur'),(730,'Norddepil'),(735,'Depil'),(736,'Nordtoftir'),(737,'Múli'),(740,'Hvannasund'),(750,'Vidareidi'),(765,'Svinoy'),(766,'Kirkja'),(767,'Hattarvík'),(780,'Kunoy'),(785,'Haraldssund'),(795,'Sydradalur'),(796,'Húsar'),(797,'Mikladalur'),(798,'Trøllanes'),(800,'Høje Taastrup'),(810,'Tvøroyri'),(825,'Frodba'),(826,'Trongisvágur'),(827,'Øravík'),(850,'Hvalba'),(860,'Sandvík'),(870,'Fámjin'),(877,'København C'),(892,'Sjælland USF P'),(893,'Sjælland USF B'),(894,'Udbetaling'),(899,'Kommuneservice'),(900,'København C'),(910,'København C'),(914,'Københavns Pakkecenter'),(917,'Københavns Pakkecenter'),(918,'Københavns Pakke BRC'),(919,'Returprint BRC'),(925,'Nes'),(926,'Lopra'),(927,'Akrar'),(928,'Vikarbyrgi'),(929,'København C'),(950,'Porkeri'),(960,'Internationalt Postcenter'),(970,'Sumba'),(999,'København C'),(1000,'København K'),(1001,'København K'),(1002,'København K'),(1003,'København K'),(1004,'København K'),(1005,'København K'),(1006,'København K'),(1007,'København K'),(1008,'København K'),(1009,'København K'),(1010,'København K'),(1011,'København K'),(1012,'København K'),(1013,'København K'),(1014,'København K'),(1015,'København K'),(1016,'København K'),(1017,'København K'),(1018,'København K'),(1019,'København K'),(1020,'København K'),(1021,'København K'),(1022,'København K'),(1023,'København K'),(1024,'København K'),(1025,'København K'),(1026,'København K'),(1045,'København K'),(1050,'København K'),(1051,'København K'),(1052,'København K'),(1053,'København K'),(1054,'København K'),(1055,'København K'),(1056,'København K'),(1057,'København K'),(1058,'København K'),(1059,'København K'),(1060,'København K'),(1061,'København K'),(1062,'København K'),(1063,'København K'),(1064,'København K'),(1065,'København K'),(1066,'København K'),(1067,'København K'),(1068,'København K'),(1069,'København K'),(1070,'København K'),(1071,'København K'),(1072,'København K'),(1073,'København K'),(1074,'København K'),(1092,'København K'),(1093,'København K'),(1095,'København K'),(1098,'København K'),(1100,'København K'),(1101,'København K'),(1102,'København K'),(1103,'København K'),(1104,'København K'),(1105,'København K'),(1106,'København K'),(1107,'København K'),(1110,'København K'),(1111,'København K'),(1112,'København K'),(1113,'København K'),(1114,'København K'),(1115,'København K'),(1116,'København K'),(1117,'København K'),(1118,'København K'),(1119,'København K'),(1120,'København K'),(1121,'København K'),(1122,'København K'),(1123,'København K'),(1124,'København K'),(1125,'København K'),(1126,'København K'),(1127,'København K'),(1128,'København K'),(1129,'København K'),(1130,'København K'),(1131,'København K'),(1140,'København K'),(1147,'København K'),(1148,'København K'),(1150,'København K'),(1151,'København K'),(1152,'København K'),(1153,'København K'),(1154,'København K'),(1155,'København K'),(1156,'København K'),(1157,'København K'),(1158,'København K'),(1159,'København K'),(1160,'København K'),(1161,'København K'),(1162,'København K'),(1163,'København K'),(1164,'København K'),(1165,'København K'),(1166,'København K'),(1167,'København K'),(1168,'København K'),(1169,'København K'),(1170,'København K'),(1171,'København K'),(1172,'København K'),(1173,'København K'),(1174,'København K'),(1175,'København K'),(1200,'København K'),(1201,'København K'),(1202,'København K'),(1203,'København K'),(1204,'København K'),(1205,'København K'),(1206,'København K'),(1207,'København K'),(1208,'København K'),(1209,'København K'),(1210,'København K'),(1211,'København K'),(1212,'København K'),(1213,'København K'),(1214,'København K'),(1215,'København K'),(1216,'København K'),(1217,'København K'),(1218,'København K'),(1219,'København K'),(1220,'København K'),(1221,'København K'),(1240,'København K'),(1250,'København K'),(1251,'København K'),(1253,'København K'),(1254,'København K'),(1255,'København K'),(1256,'København K'),(1257,'København K'),(1259,'København K'),(1260,'København K'),(1261,'København K'),(1263,'København K'),(1264,'København K'),(1265,'København K'),(1266,'København K'),(1267,'København K'),(1268,'København K'),(1270,'København K'),(1271,'København K'),(1291,'København K'),(1300,'København K'),(1301,'København K'),(1302,'København K'),(1303,'København K'),(1304,'København K'),(1306,'København K'),(1307,'København K'),(1308,'København K'),(1309,'København K'),(1310,'København K'),(1311,'København K'),(1312,'København K'),(1313,'København K'),(1314,'København K'),(1315,'København K'),(1316,'København K'),(1317,'København K'),(1318,'København K'),(1319,'København K'),(1320,'København K'),(1321,'København K'),(1322,'København K'),(1323,'København K'),(1324,'København K'),(1325,'København K'),(1326,'København K'),(1327,'København K'),(1328,'København K'),(1329,'København K'),(1350,'København K'),(1352,'København K'),(1353,'København K'),(1354,'København K'),(1355,'København K'),(1356,'København K'),(1357,'København K'),(1358,'København K'),(1359,'København K'),(1360,'København K'),(1361,'København K'),(1362,'København K'),(1363,'København K'),(1364,'København K'),(1365,'København K'),(1366,'København K'),(1367,'København K'),(1368,'København K'),(1369,'København K'),(1370,'København K'),(1371,'København K'),(1400,'København K'),(1401,'København K'),(1402,'København K'),(1403,'København K'),(1404,'København K'),(1406,'København K'),(1407,'København K'),(1408,'København K'),(1409,'København K'),(1410,'København K'),(1411,'København K'),(1412,'København K'),(1413,'København K'),(1414,'København K'),(1415,'København K'),(1416,'København K'),(1417,'København K'),(1418,'København K'),(1419,'København K'),(1420,'København K'),(1421,'København K'),(1422,'København K'),(1423,'København K'),(1424,'København K'),(1425,'København K'),(1426,'København K'),(1427,'København K'),(1428,'København K'),(1429,'København K'),(1430,'København K'),(1431,'København K'),(1432,'København K'),(1433,'København K'),(1434,'København K'),(1435,'København K'),(1436,'København K'),(1437,'København K'),(1438,'København K'),(1439,'København K'),(1440,'København K'),(1441,'København K'),(1448,'København K'),(1450,'København K'),(1451,'København K'),(1452,'København K'),(1453,'København K'),(1454,'København K'),(1455,'København K'),(1456,'København K'),(1457,'København K'),(1458,'København K'),(1459,'København K'),(1460,'København K'),(1461,'København K'),(1462,'København K'),(1463,'København K'),(1464,'København K'),(1465,'København K'),(1466,'København K'),(1467,'København K'),(1468,'København K'),(1470,'København K'),(1471,'København K'),(1472,'København K'),(1473,'København K'),(1500,'København V'),(1501,'København V'),(1502,'København V'),(1503,'København V'),(1504,'København V'),(1505,'København V'),(1506,'København V'),(1507,'København V'),(1508,'København V'),(1509,'København V'),(1510,'København V'),(1512,'Returpost'),(1513,'Centraltastning'),(1532,'København V'),(1533,'København V'),(1550,'København V'),(1551,'København V'),(1552,'København V'),(1553,'København V'),(1554,'København V'),(1555,'København V'),(1556,'København V'),(1557,'København V'),(1558,'København V'),(1559,'København V'),(1560,'København V'),(1561,'København V'),(1562,'København V'),(1563,'København V'),(1564,'København V'),(1566,'København V'),(1567,'København V'),(1568,'København V'),(1569,'København V'),(1570,'København V'),(1571,'København V'),(1572,'København V'),(1573,'København V'),(1574,'København V'),(1575,'København V'),(1576,'København V'),(1577,'København V'),(1592,'København V'),(1599,'København V'),(1600,'København V'),(1601,'København V'),(1602,'København V'),(1603,'København V'),(1604,'København V'),(1605,'København V'),(1606,'København V'),(1607,'København V'),(1608,'København V'),(1609,'København V'),(1610,'København V'),(1611,'København V'),(1612,'København V'),(1613,'København V'),(1614,'København V'),(1615,'København V'),(1616,'København V'),(1617,'København V'),(1618,'København V'),(1619,'København V'),(1620,'København V'),(1621,'København V'),(1622,'København V'),(1623,'København V'),(1624,'København V'),(1630,'København V'),(1631,'København V'),(1632,'København V'),(1633,'København V'),(1634,'København V'),(1635,'København V'),(1650,'København V'),(1651,'København V'),(1652,'København V'),(1653,'København V'),(1654,'København V'),(1655,'København V'),(1656,'København V'),(1657,'København V'),(1658,'København V'),(1659,'København V'),(1660,'København V'),(1661,'København V'),(1662,'København V'),(1663,'København V'),(1664,'København V'),(1665,'København V'),(1666,'København V'),(1667,'København V'),(1668,'København V'),(1669,'København V'),(1670,'København V'),(1671,'København V'),(1672,'København V'),(1673,'København V'),(1674,'København V'),(1675,'København V'),(1676,'København V'),(1677,'København V'),(1699,'København V'),(1700,'København V'),(1701,'København V'),(1702,'København V'),(1703,'København V'),(1704,'København V'),(1705,'København V'),(1706,'København V'),(1707,'København V'),(1708,'København V'),(1709,'København V'),(1710,'København V'),(1711,'København V'),(1712,'København V'),(1713,'København V'),(1714,'København V'),(1715,'København V'),(1716,'København V'),(1717,'København V'),(1718,'København V'),(1719,'København V'),(1720,'København V'),(1721,'København V'),(1722,'København V'),(1723,'København V'),(1724,'København V'),(1725,'København V'),(1726,'København V'),(1727,'København V'),(1728,'København V'),(1729,'København V'),(1730,'København V'),(1731,'København V'),(1732,'København V'),(1733,'København V'),(1734,'København V'),(1735,'København V'),(1736,'København V'),(1737,'København V'),(1738,'København V'),(1739,'København V'),(1749,'København V'),(1750,'København V'),(1751,'København V'),(1752,'København V'),(1753,'København V'),(1754,'København V'),(1755,'København V'),(1756,'København V'),(1757,'København V'),(1758,'København V'),(1759,'København V'),(1760,'København V'),(1761,'København V'),(1762,'København V'),(1763,'København V'),(1764,'København V'),(1765,'København V'),(1766,'København V'),(1770,'København V'),(1771,'København V'),(1772,'København V'),(1773,'København V'),(1774,'København V'),(1775,'København V'),(1777,'København V'),(1780,'København V'),(1782,'København V'),(1785,'København V'),(1786,'København V'),(1787,'København V'),(1790,'København V'),(1799,'København V'),(1800,'Frederiksberg C'),(1801,'Frederiksberg C'),(1802,'Frederiksberg C'),(1803,'Frederiksberg C'),(1804,'Frederiksberg C'),(1805,'Frederiksberg C'),(1806,'Frederiksberg C'),(1807,'Frederiksberg C'),(1808,'Frederiksberg C'),(1809,'Frederiksberg C'),(1810,'Frederiksberg C'),(1811,'Frederiksberg C'),(1812,'Frederiksberg C'),(1813,'Frederiksberg C'),(1814,'Frederiksberg C'),(1815,'Frederiksberg C'),(1816,'Frederiksberg C'),(1817,'Frederiksberg C'),(1818,'Frederiksberg C'),(1819,'Frederiksberg C'),(1820,'Frederiksberg C'),(1822,'Frederiksberg C'),(1823,'Frederiksberg C'),(1824,'Frederiksberg C'),(1825,'Frederiksberg C'),(1826,'Frederiksberg C'),(1827,'Frederiksberg C'),(1828,'Frederiksberg C'),(1829,'Frederiksberg C'),(1835,'Frederiksberg C'),(1850,'Frederiksberg C'),(1851,'Frederiksberg C'),(1852,'Frederiksberg C'),(1853,'Frederiksberg C'),(1854,'Frederiksberg C'),(1855,'Frederiksberg C'),(1856,'Frederiksberg C'),(1857,'Frederiksberg C'),(1860,'Frederiksberg C'),(1861,'Frederiksberg C'),(1862,'Frederiksberg C'),(1863,'Frederiksberg C'),(1864,'Frederiksberg C'),(1865,'Frederiksberg C'),(1866,'Frederiksberg C'),(1867,'Frederiksberg C'),(1868,'Frederiksberg C'),(1870,'Frederiksberg C'),(1871,'Frederiksberg C'),(1872,'Frederiksberg C'),(1873,'Frederiksberg C'),(1874,'Frederiksberg C'),(1875,'Frederiksberg C'),(1876,'Frederiksberg C'),(1877,'Frederiksberg C'),(1878,'Frederiksberg C'),(1879,'Frederiksberg C'),(1900,'Frederiksberg C'),(1901,'Frederiksberg C'),(1902,'Frederiksberg C'),(1903,'Frederiksberg C'),(1904,'Frederiksberg C'),(1905,'Frederiksberg C'),(1906,'Frederiksberg C'),(1908,'Frederiksberg C'),(1909,'Frederiksberg C'),(1910,'Frederiksberg C'),(1911,'Frederiksberg C'),(1912,'Frederiksberg C'),(1913,'Frederiksberg C'),(1914,'Frederiksberg C'),(1915,'Frederiksberg C'),(1916,'Frederiksberg C'),(1917,'Frederiksberg C'),(1920,'Frederiksberg C'),(1921,'Frederiksberg C'),(1922,'Frederiksberg C'),(1923,'Frederiksberg C'),(1924,'Frederiksberg C'),(1925,'Frederiksberg C'),(1926,'Frederiksberg C'),(1927,'Frederiksberg C'),(1928,'Frederiksberg C'),(1931,'Frederiksberg C'),(1950,'Frederiksberg C'),(1951,'Frederiksberg C'),(1952,'Frederiksberg C'),(1953,'Frederiksberg C'),(1954,'Frederiksberg C'),(1955,'Frederiksberg C'),(1956,'Frederiksberg C'),(1957,'Frederiksberg C'),(1958,'Frederiksberg C'),(1959,'Frederiksberg C'),(1960,'Frederiksberg C'),(1961,'Frederiksberg C'),(1962,'Frederiksberg C'),(1963,'Frederiksberg C'),(1964,'Frederiksberg C'),(1965,'Frederiksberg C'),(1966,'Frederiksberg C'),(1967,'Frederiksberg C'),(1970,'Frederiksberg C'),(1971,'Frederiksberg C'),(1972,'Frederiksberg C'),(1973,'Frederiksberg C'),(1974,'Frederiksberg C'),(2000,'Frederiksberg'),(2100,'København Ø'),(2150,'Nordhavn'),(2200,'København N'),(2300,'København S'),(2400,'København NV'),(2412,'Santa Claus/Julemanden'),(2450,'København SV'),(2500,'Valby'),(2600,'Glostrup'),(2605,'Brøndby'),(2610,'Rødovre'),(2620,'Albertslund'),(2625,'Vallensbæk'),(2630,'Taastrup'),(2635,'Ishøj'),(2640,'Hedehusene'),(2650,'Hvidovre'),(2660,'Brøndby Strand'),(2665,'Vallensbæk Strand'),(2670,'Greve'),(2680,'Solrød Strand'),(2690,'Karlslunde'),(2700,'Brønshøj'),(2720,'Vanløse'),(2730,'Herlev'),(2740,'Skovlunde'),(2750,'Ballerup'),(2760,'Måløv'),(2765,'Smørum'),(2770,'Kastrup'),(2791,'Dragør'),(2800,'Kongens Lyngby'),(2820,'Gentofte'),(2830,'Virum'),(2840,'Holte'),(2850,'Nærum'),(2860,'Søborg'),(2870,'Dyssegård'),(2880,'Bagsværd'),(2900,'Hellerup'),(2920,'Charlottenlund'),(2930,'Klampenborg'),(2942,'Skodsborg'),(2950,'Vedbæk'),(2960,'Rungsted Kyst'),(2970,'Hørsholm'),(2980,'Kokkedal'),(2990,'Nivå'),(3000,'Helsingør'),(3050,'Humlebæk'),(3060,'Espergærde'),(3070,'Snekkersten'),(3080,'Tikøb'),(3100,'Hornbæk'),(3120,'Dronningmølle'),(3140,'Ålsgårde'),(3150,'Hellebæk'),(3200,'Helsinge'),(3210,'Vejby'),(3220,'Tisvildeleje'),(3230,'Græsted'),(3250,'Gilleleje'),(3300,'Frederiksværk'),(3310,'Ølsted'),(3320,'Skævinge'),(3330,'Gørløse'),(3360,'Liseleje'),(3370,'Melby'),(3390,'Hundested'),(3400,'Hillerød'),(3450,'Allerød'),(3460,'Birkerød'),(3480,'Fredensborg'),(3490,'Kvistgård'),(3500,'Værløse'),(3520,'Farum'),(3540,'Lynge'),(3550,'Slangerup'),(3600,'Frederikssund'),(3630,'Jægerspris'),(3650,'Ølstykke'),(3660,'Stenløse'),(3670,'Veksø Sjælland'),(3700,'Rønne'),(3720,'Aakirkeby'),(3730,'Nexø'),(3740,'Svaneke'),(3751,'Østermarie'),(3760,'Gudhjem'),(3770,'Allinge'),(3782,'Klemensker'),(3790,'Hasle'),(3900,'Nuuk'),(3905,'Nuussuaq'),(3910,'Kangerlussuaq'),(3911,'Sisimiut'),(3912,'Maniitsoq'),(3913,'Tasiilaq'),(3915,'Kulusuk'),(3919,'Alluitsup Paa'),(3920,'Qaqortoq'),(3921,'Narsaq'),(3922,'Nanortalik'),(3923,'Narsarsuaq'),(3924,'Ikerasassuaq'),(3930,'Kangilinnguit'),(3932,'Arsuk'),(3940,'Paamiut'),(3950,'Aasiaat'),(3951,'Qasigiannguit'),(3952,'Ilulissat'),(3953,'Qeqertarsuaq'),(3955,'Kangaatsiaq'),(3961,'Uummannaq'),(3962,'Upernavik'),(3964,'Qaarsut'),(3970,'Pituffik'),(3971,'Qaanaaq'),(3972,'Station Nord'),(3980,'Ittoqqortoormiit'),(3982,'Mestersvig'),(3984,'Danmarkshavn'),(3985,'Constable Pynt'),(3992,'Slædepatrulje Sirius'),(4000,'Roskilde'),(4030,'Tune'),(4040,'Jyllinge'),(4050,'Skibby'),(4060,'Kirke Såby'),(4070,'Kirke Hyllinge'),(4100,'Ringsted'),(4129,'Ringsted'),(4130,'Viby Sjælland'),(4140,'Borup'),(4160,'Herlufmagle'),(4171,'Glumsø'),(4173,'Fjenneslev'),(4174,'Jystrup Midtsj'),(4180,'Sorø'),(4190,'Munke Bjergby'),(4200,'Slagelse'),(4220,'Korsør'),(4230,'Skælskør'),(4241,'Vemmelev'),(4242,'Boeslunde'),(4243,'Rude'),(4250,'Fuglebjerg'),(4261,'Dalmose'),(4262,'Sandved'),(4270,'Høng'),(4281,'Gørlev'),(4291,'Ruds Vedby'),(4293,'Dianalund'),(4295,'Stenlille'),(4296,'Nyrup'),(4300,'Holbæk'),(4320,'Lejre'),(4330,'Hvalsø'),(4340,'Tølløse'),(4350,'Ugerløse'),(4360,'Kirke Eskilstrup'),(4370,'Store Merløse'),(4390,'Vipperød'),(4400,'Kalundborg'),(4420,'Regstrup'),(4440,'Mørkøv'),(4450,'Jyderup'),(4460,'Snertinge'),(4470,'Svebølle'),(4480,'Store Fuglede'),(4490,'Jerslev Sjælland'),(4500,'Nykøbing Sj'),(4520,'Svinninge'),(4532,'Gislinge'),(4534,'Hørve'),(4540,'Fårevejle'),(4550,'Asnæs'),(4560,'Vig'),(4571,'Grevinge'),(4572,'Nørre Asmindrup'),(4573,'Højby'),(4581,'Rørvig'),(4583,'Sjællands Odde'),(4591,'Føllenslev'),(4592,'Sejerø'),(4593,'Eskebjerg'),(4600,'Køge'),(4621,'Gadstrup'),(4622,'Havdrup'),(4623,'Lille Skensved'),(4632,'Bjæverskov'),(4640,'Faxe'),(4652,'Hårlev'),(4653,'Karise'),(4654,'Faxe Ladeplads'),(4660,'Store Heddinge'),(4671,'Strøby'),(4672,'Klippinge'),(4673,'Rødvig Stevns'),(4681,'Herfølge'),(4682,'Tureby'),(4683,'Rønnede'),(4684,'Holmegaard'),(4690,'Haslev'),(4700,'Næstved'),(4720,'Præstø'),(4733,'Tappernøje'),(4735,'Mern'),(4736,'Karrebæksminde'),(4750,'Lundby'),(4760,'Vordingborg'),(4771,'Kalvehave'),(4772,'Langebæk'),(4773,'Stensved'),(4780,'Stege'),(4791,'Borre'),(4792,'Askeby'),(4793,'Bogø By'),(4800,'Nykøbing F'),(4840,'Nørre Alslev'),(4850,'Stubbekøbing'),(4862,'Guldborg'),(4863,'Eskilstrup'),(4871,'Horbelev'),(4872,'Idestrup'),(4873,'Væggerløse'),(4874,'Gedser'),(4880,'Nysted'),(4891,'Toreby L'),(4892,'Kettinge'),(4894,'Øster Ulslev'),(4895,'Errindlev'),(4900,'Nakskov'),(4912,'Harpelunde'),(4913,'Horslunde'),(4920,'Søllested'),(4930,'Maribo'),(4941,'Bandholm'),(4943,'Torrig L'),(4944,'Fejø'),(4951,'Nørreballe'),(4952,'Stokkemarke'),(4953,'Vesterborg'),(4960,'Holeby'),(4970,'Rødby'),(4983,'Dannemare'),(4990,'Sakskøbing'),(4992,'Midtsjælland USF P'),(5000,'Odense C'),(5029,'Odense C'),(5100,'Odense C'),(5200,'Odense V'),(5210,'Odense NV'),(5220,'Odense SØ'),(5230,'Odense M'),(5240,'Odense NØ'),(5250,'Odense SV'),(5260,'Odense S'),(5270,'Odense N'),(5290,'Marslev'),(5300,'Kerteminde'),(5320,'Agedrup'),(5330,'Munkebo'),(5350,'Rynkeby'),(5370,'Mesinge'),(5380,'Dalby'),(5390,'Martofte'),(5400,'Bogense'),(5450,'Otterup'),(5462,'Morud'),(5463,'Harndrup'),(5464,'Brenderup Fyn'),(5466,'Asperup'),(5471,'Søndersø'),(5474,'Veflinge'),(5485,'Skamby'),(5491,'Blommenslyst'),(5492,'Vissenbjerg'),(5500,'Middelfart'),(5540,'Ullerslev'),(5550,'Langeskov'),(5560,'Aarup'),(5580,'Nørre Aaby'),(5591,'Gelsted'),(5592,'Ejby'),(5600,'Faaborg'),(5610,'Assens'),(5620,'Glamsbjerg'),(5631,'Ebberup'),(5642,'Millinge'),(5672,'Broby'),(5683,'Haarby'),(5690,'Tommerup'),(5700,'Svendborg'),(5750,'Ringe'),(5762,'Vester Skerninge'),(5771,'Stenstrup'),(5772,'Kværndrup'),(5792,'Årslev'),(5800,'Nyborg'),(5853,'Ørbæk'),(5854,'Gislev'),(5856,'Ryslinge'),(5863,'Ferritslev Fyn'),(5871,'Frørup'),(5874,'Hesselager'),(5881,'Skårup Fyn'),(5882,'Vejstrup'),(5883,'Oure'),(5884,'Gudme'),(5892,'Gudbjerg Sydfyn'),(5900,'Rudkøbing'),(5932,'Humble'),(5935,'Bagenkop'),(5953,'Tranekær'),(5960,'Marstal'),(5970,'Ærøskøbing'),(5985,'Søby Ærø'),(6000,'Kolding'),(6040,'Egtved'),(6051,'Almind'),(6052,'Viuf'),(6064,'Jordrup'),(6070,'Christiansfeld'),(6091,'Bjert'),(6092,'Sønder Stenderup'),(6093,'Sjølund'),(6094,'Hejls'),(6100,'Haderslev'),(6200,'Aabenraa'),(6230,'Rødekro'),(6240,'Løgumkloster'),(6261,'Bredebro'),(6270,'Tønder'),(6280,'Højer'),(6300,'Gråsten'),(6310,'Broager'),(6320,'Egernsund'),(6330,'Padborg'),(6340,'Kruså'),(6360,'Tinglev'),(6372,'Bylderup-Bov'),(6392,'Bolderslev'),(6400,'Sønderborg'),(6430,'Nordborg'),(6440,'Augustenborg'),(6470,'Sydals'),(6500,'Vojens'),(6510,'Gram'),(6520,'Toftlund'),(6534,'Agerskov'),(6535,'Branderup J'),(6541,'Bevtoft'),(6560,'Sommersted'),(6580,'Vamdrup'),(6600,'Vejen'),(6621,'Gesten'),(6622,'Bække'),(6623,'Vorbasse'),(6630,'Rødding'),(6640,'Lunderskov'),(6650,'Brørup'),(6660,'Lintrup'),(6670,'Holsted'),(6682,'Hovborg'),(6683,'Føvling'),(6690,'Gørding'),(6700,'Esbjerg'),(6701,'Esbjerg'),(6705,'Esbjerg Ø'),(6710,'Esbjerg V'),(6715,'Esbjerg N'),(6720,'Fanø'),(6731,'Tjæreborg'),(6740,'Bramming'),(6752,'Glejbjerg'),(6753,'Agerbæk'),(6760,'Ribe'),(6771,'Gredstedbro'),(6780,'Skærbæk'),(6792,'Rømø'),(6800,'Varde'),(6818,'Årre'),(6823,'Ansager'),(6830,'Nørre Nebel'),(6840,'Oksbøl'),(6851,'Janderup Vestj'),(6852,'Billum'),(6853,'Vejers Strand'),(6854,'Henne'),(6855,'Outrup'),(6857,'Blåvand'),(6862,'Tistrup'),(6870,'Ølgod'),(6880,'Tarm'),(6893,'Hemmet'),(6900,'Skjern'),(6920,'Videbæk'),(6933,'Kibæk'),(6940,'Lem St'),(6950,'Ringkøbing'),(6960,'Hvide Sande'),(6971,'Spjald'),(6973,'Ørnhøj'),(6980,'Tim'),(6990,'Ulfborg'),(7000,'Fredericia'),(7007,'Fredericia'),(7017,'Taulov Pakkecenter'),(7018,'Pakker TLP'),(7029,'Fredericia'),(7080,'Børkop'),(7100,'Vejle'),(7120,'Vejle Øst'),(7130,'Juelsminde'),(7140,'Stouby'),(7150,'Barrit'),(7160,'Tørring'),(7171,'Uldum'),(7173,'Vonge'),(7182,'Bredsten'),(7183,'Randbøl'),(7184,'Vandel'),(7190,'Billund'),(7200,'Grindsted'),(7250,'Hejnsvig'),(7260,'Sønder Omme'),(7270,'Stakroge'),(7280,'Sønder Felding'),(7300,'Jelling'),(7321,'Gadbjerg'),(7323,'Give'),(7330,'Brande'),(7361,'Ejstrupholm'),(7362,'Hampen'),(7400,'Herning'),(7429,'Herning'),(7430,'Ikast'),(7441,'Bording'),(7442,'Engesvang'),(7451,'Sunds'),(7470,'Karup J'),(7480,'Vildbjerg'),(7490,'Aulum'),(7500,'Holstebro'),(7540,'Haderup'),(7550,'Sørvad'),(7560,'Hjerm'),(7570,'Vemb'),(7600,'Struer'),(7620,'Lemvig'),(7650,'Bøvlingbjerg'),(7660,'Bækmarksbro'),(7673,'Harboøre'),(7680,'Thyborøn'),(7700,'Thisted'),(7730,'Hanstholm'),(7741,'Frøstrup'),(7742,'Vesløs'),(7752,'Snedsted'),(7755,'Bedsted Thy'),(7760,'Hurup Thy'),(7770,'Vestervig'),(7790,'Thyholm'),(7800,'Skive'),(7830,'Vinderup'),(7840,'Højslev'),(7850,'Stoholm Jyll'),(7860,'Spøttrup'),(7870,'Roslev'),(7884,'Fur'),(7900,'Nykøbing M'),(7950,'Erslev'),(7960,'Karby'),(7970,'Redsted M'),(7980,'Vils'),(7990,'Øster Assels'),(7992,'Sydjylland/Fyn USF P'),(7993,'Sydjylland/Fyn USF B'),(7996,'Fakturaservice'),(7997,'Fakturascanning'),(7998,'Statsservice'),(7999,'Kommunepost'),(8000,'Aarhus C'),(8100,'Aarhus C'),(8200,'Aarhus N'),(8210,'Aarhus V'),(8220,'Brabrand'),(8229,'Risskov Ø'),(8230,'Åbyhøj'),(8240,'Risskov'),(8245,'Risskov Ø'),(8250,'Egå'),(8260,'Viby J'),(8270,'Højbjerg'),(8300,'Odder'),(8305,'Samsø'),(8310,'Tranbjerg J'),(8320,'Mårslet'),(8330,'Beder'),(8340,'Malling'),(8350,'Hundslund'),(8355,'Solbjerg'),(8361,'Hasselager'),(8362,'Hørning'),(8370,'Hadsten'),(8380,'Trige'),(8381,'Tilst'),(8382,'Hinnerup'),(8400,'Ebeltoft'),(8410,'Rønde'),(8420,'Knebel'),(8444,'Balle'),(8450,'Hammel'),(8462,'Harlev J'),(8464,'Galten'),(8471,'Sabro'),(8472,'Sporup'),(8500,'Grenaa'),(8520,'Lystrup'),(8530,'Hjortshøj'),(8541,'Skødstrup'),(8543,'Hornslet'),(8544,'Mørke'),(8550,'Ryomgård'),(8560,'Kolind'),(8570,'Trustrup'),(8581,'Nimtofte'),(8585,'Glesborg'),(8586,'Ørum Djurs'),(8592,'Anholt'),(8600,'Silkeborg'),(8620,'Kjellerup'),(8632,'Lemming'),(8641,'Sorring'),(8643,'Ans By'),(8653,'Them'),(8654,'Bryrup'),(8660,'Skanderborg'),(8670,'Låsby'),(8680,'Ry'),(8700,'Horsens'),(8721,'Daugård'),(8722,'Hedensted'),(8723,'Løsning'),(8732,'Hovedgård'),(8740,'Brædstrup'),(8751,'Gedved'),(8752,'Østbirk'),(8762,'Flemming'),(8763,'Rask Mølle'),(8765,'Klovborg'),(8766,'Nørre Snede'),(8781,'Stenderup'),(8783,'Hornsyld'),(8800,'Viborg'),(8830,'Tjele'),(8831,'Løgstrup'),(8832,'Skals'),(8840,'Rødkærsbro'),(8850,'Bjerringbro'),(8860,'Ulstrup'),(8870,'Langå'),(8881,'Thorsø'),(8882,'Fårvang'),(8883,'Gjern'),(8900,'Randers C'),(8920,'Randers NV'),(8930,'Randers NØ'),(8940,'Randers SV'),(8950,'Ørsted'),(8960,'Randers SØ'),(8961,'Allingåbro'),(8963,'Auning'),(8970,'Havndal'),(8981,'Spentrup'),(8983,'Gjerlev J'),(8990,'Fårup'),(9000,'Aalborg'),(9029,'Aalborg'),(9100,'Aalborg'),(9200,'Aalborg SV'),(9210,'Aalborg SØ'),(9220,'Aalborg Øst'),(9230,'Svenstrup J'),(9240,'Nibe'),(9260,'Gistrup'),(9270,'Klarup'),(9280,'Storvorde'),(9293,'Kongerslev'),(9300,'Sæby'),(9310,'Vodskov'),(9320,'Hjallerup'),(9330,'Dronninglund'),(9340,'Asaa'),(9352,'Dybvad'),(9362,'Gandrup'),(9370,'Hals'),(9380,'Vestbjerg'),(9381,'Sulsted'),(9382,'Tylstrup'),(9400,'Nørresundby'),(9430,'Vadum'),(9440,'Aabybro'),(9460,'Brovst'),(9480,'Løkken'),(9490,'Pandrup'),(9492,'Blokhus'),(9493,'Saltum'),(9500,'Hobro'),(9510,'Arden'),(9520,'Skørping'),(9530,'Støvring'),(9541,'Suldrup'),(9550,'Mariager'),(9560,'Hadsund'),(9574,'Bælum'),(9575,'Terndrup'),(9600,'Aars'),(9610,'Nørager'),(9620,'Aalestrup'),(9631,'Gedsted'),(9632,'Møldrup'),(9640,'Farsø'),(9670,'Løgstør'),(9681,'Ranum'),(9690,'Fjerritslev'),(9700,'Brønderslev'),(9740,'Jerslev J'),(9750,'Østervrå'),(9760,'Vrå'),(9800,'Hjørring'),(9830,'Tårs'),(9850,'Hirtshals'),(9870,'Sindal'),(9881,'Bindslev'),(9900,'Frederikshavn'),(9940,'Læsø'),(9970,'Strandby'),(9981,'Jerup'),(9982,'Ålbæk'),(9990,'Skagen'),(9992,'Jylland USF P'),(9993,'Jylland USF B'),(9996,'Fakturaservice'),(9997,'Fakturascanning'),(9998,'Borgerservice');
/*!40000 ALTER TABLE `zip_codes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-02 16:24:25

-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: epiddb
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `causes`
--

DROP TABLE IF EXISTS `causes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `causes` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `cause` varchar(1000) DEFAULT NULL,
  KEY `epidemy_name` (`epidemy_name`),
  CONSTRAINT `causes_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causes`
--

LOCK TABLES `causes` WRITE;
/*!40000 ALTER TABLE `causes` DISABLE KEYS */;
/*!40000 ALTER TABLE `causes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commom_names`
--

DROP TABLE IF EXISTS `commom_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commom_names` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `commom_name` varchar(200) DEFAULT NULL,
  KEY `epidemy_name` (`epidemy_name`),
  CONSTRAINT `commom_names_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commom_names`
--

LOCK TABLES `commom_names` WRITE;
/*!40000 ALTER TABLE `commom_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `commom_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `district_name` varchar(50) NOT NULL,
  `population` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`district_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `registration_no` int(11) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nic_no`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epidemy`
--

DROP TABLE IF EXISTS `epidemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epidemy` (
  `scientific_name` varchar(200) NOT NULL,
  `doctor_nic` varchar(10) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  PRIMARY KEY (`scientific_name`),
  KEY `doctor_nic` (`doctor_nic`),
  CONSTRAINT `epidemy_ibfk_1` FOREIGN KEY (`doctor_nic`) REFERENCES `doctor` (`nic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epidemy`
--

LOCK TABLES `epidemy` WRITE;
/*!40000 ALTER TABLE `epidemy` DISABLE KEYS */;
/*!40000 ALTER TABLE `epidemy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`),
  KEY `district` (`district`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`district`) REFERENCES `district` (`district_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_officer`
--

DROP TABLE IF EXISTS `medical_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_officer` (
  `registration_no` int(11) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nic_no`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `medical_officer_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_officer`
--

LOCK TABLES `medical_officer` WRITE;
/*!40000 ALTER TABLE `medical_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `epidemy_name` varchar(200) NOT NULL,
  `stat_year` int(11) NOT NULL,
  `stat_month` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `recorded_patients` int(11) DEFAULT NULL,
  `casualties` int(11) DEFAULT NULL,
  `medical_officer_nic` varchar(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`epidemy_name`,`stat_year`,`stat_month`,`hospital_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `medical_officer_nic` (`medical_officer_nic`),
  CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`),
  CONSTRAINT `statistics_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  CONSTRAINT `statistics_ibfk_3` FOREIGN KEY (`medical_officer_nic`) REFERENCES `medical_officer` (`nic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptoms` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `symptom` varchar(1000) DEFAULT NULL,
  KEY `epidemy_name` (`epidemy_name`),
  CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms`
--

LOCK TABLES `symptoms` WRITE;
/*!40000 ALTER TABLE `symptoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatments` (
  `epidemy_name` varchar(200) DEFAULT NULL,
  `treatment` varchar(1000) DEFAULT NULL,
  KEY `epidemy_name` (`epidemy_name`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`epidemy_name`) REFERENCES `epidemy` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-12 23:01:26

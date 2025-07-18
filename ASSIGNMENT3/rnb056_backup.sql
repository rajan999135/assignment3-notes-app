-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: rnb056
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `course_ID` int NOT NULL AUTO_INCREMENT,
  `course_Name` varchar(30) NOT NULL,
  `course_Description` varchar(255) NOT NULL,
  PRIMARY KEY (`course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'CS100','Introduction to Computers'),(2,'CS110','Programming and Problem Solving'),(3,'CS210','Data Structures and Abstractions'),(4,'CS215','Web and Database Programming'),(8,'Demo','demo of lab'),(9,'Demo','demo of lab'),(10,'Demo','demo of lab'),(11,'Demo','demo of lab'),(12,'Demo','demo of lab'),(13,'Demo','demo of lab');
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loggers`
--

DROP TABLE IF EXISTS `Loggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loggers` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loggers`
--

LOCK TABLES `Loggers` WRITE;
/*!40000 ALTER TABLE `Loggers` DISABLE KEYS */;
INSERT INTO `Loggers` VALUES (1,'Jane','Doe','jd@uregina.ca','abc12345','1990-08-15','abc.jpeg'),(2,'John','Doe','jd101','123abcd','1992-09-01','picture.jpeg');
/*!40000 ALTER TABLE `Loggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Logins`
--

DROP TABLE IF EXISTS `Logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Logins` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Loggers` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Logins`
--

LOCK TABLES `Logins` WRITE;
/*!40000 ALTER TABLE `Logins` DISABLE KEYS */;
INSERT INTO `Logins` VALUES (1,1,'2022-05-05 14:00:00','192.168.100.100'),(2,2,'2022-02-04 12:30:00','191.198.111.101'),(3,1,'2022-06-10 08:30:00','192.168.100.100'),(4,1,'2022-06-11 10:15:02','192.168.100.100'),(5,2,'2022-08-15 09:15:31','191.198.111.101'),(6,2,'2022-08-16 21:00:00','191.198.111.101'),(7,1,'2022-08-16 21:01:00','191.198.111.101');
/*!40000 ALTER TABLE `Logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marks`
--

DROP TABLE IF EXISTS `Marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marks` (
  `marks_ID` int NOT NULL AUTO_INCREMENT,
  `student_ID` int NOT NULL,
  `course_ID` int NOT NULL,
  `marks` double NOT NULL,
  PRIMARY KEY (`marks_ID`),
  KEY `student_ID` (`student_ID`),
  KEY `course_ID` (`course_ID`),
  CONSTRAINT `Marks_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `Student_Info` (`student_ID`),
  CONSTRAINT `Marks_ibfk_2` FOREIGN KEY (`course_ID`) REFERENCES `Courses` (`course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marks`
--

LOCK TABLES `Marks` WRITE;
/*!40000 ALTER TABLE `Marks` DISABLE KEYS */;
INSERT INTO `Marks` VALUES (1,200266200,1,90.5),(2,200266200,2,85),(3,200266200,3,90),(4,200266202,1,72.5),(5,200266202,2,59.2),(6,200266202,4,82.6),(7,200266203,1,100),(8,200266203,4,100),(9,200266204,1,65),(10,200266204,3,92.5),(11,200266205,2,92.5),(12,200266205,3,70.2),(13,200266206,1,86),(14,200266206,2,87),(15,200266206,3,81),(16,200266206,4,83),(17,200266207,1,59),(18,200266207,2,50.2),(19,200266207,3,67),(20,200266207,4,85.6),(21,200266208,1,70),(22,200266208,2,80),(23,200266208,3,88.5),(24,200266209,2,66.5),(25,200266209,3,77.5),(26,200266209,4,86.5),(27,200266210,1,89),(28,200266210,3,92),(29,200266211,1,99),(30,200266212,4,98);
/*!40000 ALTER TABLE `Marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Info`
--

DROP TABLE IF EXISTS `Student_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student_Info` (
  `student_ID` int NOT NULL,
  `first_Name` varchar(30) NOT NULL,
  `middle_Name` varchar(30) DEFAULT NULL,
  `last_Name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Info`
--

LOCK TABLES `Student_Info` WRITE;
/*!40000 ALTER TABLE `Student_Info` DISABLE KEYS */;
INSERT INTO `Student_Info` VALUES (200266200,'Ahmed','Al','Abbad','alabba200@cs.uregina.ca'),(200266202,'Qaswar','','Rai','ali202@cs.uregina.ca'),(200266203,'Nicholas','','Phongsavath','phosan203@cs.uregina.ca'),(200266204,'Nikki','','Pawlowski','pawlow204@cs.uregina.ca'),(200266205,'Nathan','','Ellis','elli205@cs.uregina.ca'),(200266206,'John','','Erick','eric20j206@cs.uregina.ca'),(200266207,'Jody-Lee','Van','DerVelden','vanervj207@cs.uregina.ca'),(200266208,'Sabrina ','','Tram','tra200s208@cs.uregina.ca'),(200266209,'Ke','','Tao','taoke209@cs.uregina.ca'),(200266210,'Yupeng','','Xu','x210@cs.uregina.ca'),(200266211,'Chidinma','','Ukabam','ukaba211@cs.uregina.ca'),(200266212,'Mandeep','','Ghotra','gho212@cs.uregina.ca');
/*!40000 ALTER TABLE `Student_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_control`
--

DROP TABLE IF EXISTS `access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_control` (
  `owner_id` int NOT NULL,
  `topic_id` int NOT NULL,
  `viewer_id` int NOT NULL,
  `access_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`owner_id`,`viewer_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_control`
--

LOCK TABLES `access_control` WRITE;
/*!40000 ALTER TABLE `access_control` DISABLE KEYS */;
INSERT INTO `access_control` VALUES (36,20,35,1);
/*!40000 ALTER TABLE `access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demotable`
--

DROP TABLE IF EXISTS `demotable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demotable` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demotable`
--

LOCK TABLES `demotable` WRITE;
/*!40000 ALTER TABLE `demotable` DISABLE KEYS */;
INSERT INTO `demotable` VALUES (1,'rajan@ehncanada.com','@Sonia7860','2001-02-02'),(2,'fdknfsdn@gmail.com','dfsdfd','1969-12-31'),(3,'rajannanda@gmail.com','@rajan','1969-12-31'),(4,'rajannanda@gmail.com','@rajan786','2005-01-01'),(5,'rajannanda@gmail.com','rajan786','2005-01-01'),(6,'sajannanda@gmail.com','rajan786','2005-01-01'),(7,'sajannanda@gmail.com','rajan786','2005-01-01'),(8,'sajannanda@gmail.com','rajan786','2005-01-01'),(9,'sajannanda@gmail.com','rajan786','2005-01-01'),(10,'sajannanda@gmail.com','rajan786','2005-01-01'),(11,'pajannanda@gmail.com','rajan786','2005-01-01'),(12,'jajannanda@gmail.com','rajan786','2005-01-01'),(13,'sanjeev@gmail.com','sanjeev786','2005-01-01'),(14,'sanjeev@gmail.com','Sanjeev7860','2005-01-01'),(15,'sanjeev@gmail.com','Sanjeev7860','2005-01-01'),(16,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(17,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(18,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(19,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(20,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(21,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(22,'sanjeev@gmail.com','@Sanjeev7860','2005-01-01'),(23,'sanjeev@gmail.com','sanjeev','2005-01-01'),(24,'sanjeev@gmail.com','sanjeev','2005-01-01'),(25,'sanjeev@gmail.com','sanjeev','2005-01-01'),(26,'sanjeev@gmail.com','sanjeev','2005-01-01'),(27,'sanjeev@gmail.com','sanjeevfdsklfd','2005-01-01'),(28,'sanjeev@gmail.com','sanjeevfdsklfd','2005-01-01'),(29,'sanjeev@gmail.com','sanjeevfdsklfd','2005-01-01'),(30,'sanjeev@gmail.com','sanjeevfdsklfd','2005-01-01'),(31,'sanjeev@gmail.com','rajan@34','2005-01-01');
/*!40000 ALTER TABLE `demotable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `notes_id` int NOT NULL AUTO_INCREMENT,
  `note_decription` text NOT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  `word_count` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notes_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `last_updation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`topic_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (19,'Introduction of Games importance in daily life','2025-07-04 23:14:07',35,'2025-07-04 23:14:07'),(20,'Introduction to programming language Concept.','2025-07-04 23:15:08',36,'2025-07-04 23:15:08');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_access`
--

DROP TABLE IF EXISTS `users_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_access` (
  `access_id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `users_access_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_info` (`user_id`),
  CONSTRAINT `users_access_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `notes` (`topic_id`),
  CONSTRAINT `users_access_chk_1` CHECK ((`status` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_access`
--

LOCK TABLES `users_access` WRITE;
/*!40000 ALTER TABLE `users_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_info` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `screen_name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_image` varchar(255) DEFAULT NULL,
  `access_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `screen_name` (`screen_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES (35,'rajannanda786@gmail.com','rajan786','$2y$10$SilfXA0Wl8iTq7GMXe58teZs1mbGr4rh4qvk8qNWqNa.Iioy/tC8C','6868602ec4547.jpg',1),(36,'rajannanda1@gmail.com','rajan777','$2y$10$gnpAv4/vmmv56IFuhEwzde2Fc/m/J2ufSEY32uCtztEn19yyyxSEW','686860709a0c6.jpg',1);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17 13:05:51

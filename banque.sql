-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: banque
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `banque`
--

DROP TABLE IF EXISTS `banque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banque` (
  `Code_Banque` int NOT NULL,
  `Nom_Banque` varchar(50) DEFAULT NULL,
  `Login` varchar(50) NOT NULL,
  PRIMARY KEY (`Code_Banque`),
  KEY `Login` (`Login`),
  CONSTRAINT `banque_ibfk_1` FOREIGN KEY (`Login`) REFERENCES `peronnelle` (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banque`
--

LOCK TABLES `banque` WRITE;
/*!40000 ALTER TABLE `banque` DISABLE KEYS */;
/*!40000 ALTER TABLE `banque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID_Client` int NOT NULL,
  `Nom_Client` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compte` (
  `ID_Compte` varchar(50) NOT NULL,
  `Solde` varchar(50) DEFAULT NULL,
  `Code_Banque` int NOT NULL,
  `ID_Type` int NOT NULL,
  PRIMARY KEY (`ID_Compte`),
  KEY `Code_Banque` (`Code_Banque`),
  KEY `ID_Type` (`ID_Type`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`Code_Banque`) REFERENCES `banque` (`Code_Banque`),
  CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`ID_Type`) REFERENCES `type` (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peronnelle`
--

DROP TABLE IF EXISTS `peronnelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peronnelle` (
  `Login` varchar(50) NOT NULL,
  `Mot_de_passe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peronnelle`
--

LOCK TABLES `peronnelle` WRITE;
/*!40000 ALTER TABLE `peronnelle` DISABLE KEYS */;
/*!40000 ALTER TABLE `peronnelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirer`
--

DROP TABLE IF EXISTS `retirer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retirer` (
  `ID_Compte` varchar(50) NOT NULL,
  `ID_Client` int NOT NULL,
  `Montant_retrait` varchar(50) DEFAULT NULL,
  `Date_retrait` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Compte`,`ID_Client`),
  KEY `ID_Client` (`ID_Client`),
  CONSTRAINT `retirer_ibfk_1` FOREIGN KEY (`ID_Compte`) REFERENCES `compte` (`ID_Compte`),
  CONSTRAINT `retirer_ibfk_2` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirer`
--

LOCK TABLES `retirer` WRITE;
/*!40000 ALTER TABLE `retirer` DISABLE KEYS */;
/*!40000 ALTER TABLE `retirer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfert`
--

DROP TABLE IF EXISTS `transfert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfert` (
  `ID_Compte` varchar(50) NOT NULL,
  `ID_Compte_1` varchar(50) NOT NULL,
  `Montant_tranfert` decimal(15,2) DEFAULT NULL,
  `Date_Transfert` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Compte`,`ID_Compte_1`),
  KEY `ID_Compte_1` (`ID_Compte_1`),
  CONSTRAINT `transfert_ibfk_1` FOREIGN KEY (`ID_Compte`) REFERENCES `compte` (`ID_Compte`),
  CONSTRAINT `transfert_ibfk_2` FOREIGN KEY (`ID_Compte_1`) REFERENCES `compte` (`ID_Compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfert`
--

LOCK TABLES `transfert` WRITE;
/*!40000 ALTER TABLE `transfert` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `ID_Type` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verser`
--

DROP TABLE IF EXISTS `verser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verser` (
  `ID_Compte` varchar(50) NOT NULL,
  `ID_Client` int NOT NULL,
  `Montant_verser` decimal(15,2) DEFAULT NULL,
  `Date_versement` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Compte`,`ID_Client`),
  KEY `ID_Client` (`ID_Client`),
  CONSTRAINT `verser_ibfk_1` FOREIGN KEY (`ID_Compte`) REFERENCES `compte` (`ID_Compte`),
  CONSTRAINT `verser_ibfk_2` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verser`
--

LOCK TABLES `verser` WRITE;
/*!40000 ALTER TABLE `verser` DISABLE KEYS */;
/*!40000 ALTER TABLE `verser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26  8:33:07

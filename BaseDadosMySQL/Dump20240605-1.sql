--
-- Current Database: `banco_prova`
--

/*
CREATE DATABASE banco_prova
    CHARACTER SET 'latin1'
    COLLATE 'latin1_general_ci';
*/

USE `banco_prova`;

-- MySQL dump 10.13  Distrib 5.7.30, for Win32 (AMD64)
--
-- Host: localhost    Database: banco_prova
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `clientes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(30) default NULL,
  `uf` varchar(2) default NULL,
  PRIMARY KEY  (`codigo`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ALVARO','FLORIANOPOLIS','SC'),(2,'MARCOS ROBERVAL','ITAJAI','SC'),(3,'JOAO MARTINS','FORTALEZA','CE'),(4,'MARIA APARECIDA','BELO HORIZONTE','MG'),(5,'JESSICA MARIA','FLORIANOPOLIS','SC'),(6,'JULIA ','FLORIANOPOLIS','SC'),(7,'NINA RAISA','FLORIANOPOLIS','SC'),(8,'SILVIA TAVARES','SAO PAULO','SP'),(9,'JAIR APOLINARIO ','SAO PAULO','SP'),(10,'JORGE LIMA','RIO DE JANEIRO','RJ'),(11,'JOAO SANTOS','BRASILIA','DF'),(12,'ARMANDO TAVARES','BELEM','PA'),(13,'JOAO SILVA','SAO LUIS','MA'),(14,'MARIA DOS SANTOS','CAMPINAS','SP'),(15,'PAULO ','PORTO ALEGRE','SC'),(16,'AUXILIADORA','BELEM','PA'),(17,'FELIPE DOS SANTOS','SAO PAULO','SP'),(18,'MIRIAM LIMA','BRASILIA','DF'),(19,'JORGE MELO','BRASILIA','DF'),(20,'PABLO SILVA SILVA','SAO PAULO','SP');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `numero_pedido` int(11) NOT NULL,
  `data_emissao` datetime default NULL,
  `codigo_cliente` int(11) default NULL,
  `valor_total` decimal(11,2) default NULL,
  PRIMARY KEY  (`numero_pedido`),
  UNIQUE KEY `numero_pedido` (`numero_pedido`),
  KEY `codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `pedidos_fk` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (6,'2024-06-05 08:53:15',9,6.50),(7,'2024-06-05 08:53:41',4,22.00),(8,'2024-06-05 08:55:03',5,75.50),(9,'2024-06-05 09:05:20',2,31.00),(10,'2024-06-05 10:02:58',5,28.00),(12,'2024-06-05 14:23:44',13,33.50),(13,'2024-06-05 14:31:06',6,44.00),(14,'2024-06-05 14:50:12',3,1.99),(15,'2024-06-05 15:07:20',19,10.00),(16,'2024-06-05 15:13:55',5,3.50);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_produtos` (
  `autoincrem` int(11) NOT NULL auto_increment,
  `numero_pedido` int(11) NOT NULL,
  `codigo_produto` int(11) NOT NULL,
  `quantidade` decimal(11,0) default NULL,
  `valor_unitario` decimal(11,2) default NULL,
  `valor_total` decimal(11,2) default NULL,
  PRIMARY KEY  (`autoincrem`),
  UNIQUE KEY `autoincrem` (`autoincrem`),
  KEY `numero_pedidio` (`numero_pedido`),
  KEY `codigo_produto` (`codigo_produto`),
  CONSTRAINT `pedidos_produtos_fk` FOREIGN KEY (`numero_pedido`) REFERENCES `pedidos` (`numero_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedidos_produtos_fk1` FOREIGN KEY (`codigo_produto`) REFERENCES `produtos` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
INSERT INTO `pedidos_produtos` VALUES (10,6,5,1,3.50,3.50),(11,6,4,1,3.00,3.00),(12,7,4,1,3.00,3.00),(13,7,8,1,8.50,8.50),(14,7,3,1,2.00,2.00),(15,7,8,1,8.50,8.50),(16,8,1,1,2.00,2.00),(17,8,2,5,5.00,25.00),(18,8,6,1,6.00,6.00),(19,8,8,5,8.50,42.50),(20,9,2,2,5.00,10.00),(21,9,5,6,3.50,21.00),(22,10,4,1,3.00,3.00),(23,10,5,1,3.50,3.50),(24,10,8,1,8.50,8.50),(25,10,9,1,13.00,13.00),(30,12,7,1,5.50,5.50),(31,12,2,5,5.00,25.00),(32,12,4,1,3.00,3.00),(33,13,7,1,5.50,5.50),(34,13,5,1,3.50,3.50),(35,13,7,4,5.50,22.00),(36,13,9,1,13.00,13.00),(37,14,23,1,1.99,1.99),(38,15,13,1,3.50,3.50),(39,15,5,1,3.50,3.50),(40,15,4,1,3.00,3.00),(41,16,5,1,3.50,3.50);
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL auto_increment,
  `descricao` varchar(50) NOT NULL,
  `preco_venda` decimal(11,2) default NULL,
  PRIMARY KEY  (`codigo`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'BANANA',2.00),(2,'ABACATE',5.00),(3,'ALFACE',2.00),(4,'ABACAXI',3.00),(5,'PAO FRANCES',3.50),(6,'PAO FATIADO',6.00),(7,'MAÇA',5.50),(8,'LIXIA',8.50),(9,'UVA',13.00),(10,'MORANGO',8.00),(11,'RUCULA',3.99),(12,'TANGERINA',5.00),(13,'MAMAO',3.50),(14,'CAQUI',4.00),(15,'TOMATE',3.00),(16,'ACELGA',1.99),(17,'QUEIJO PRATO',3.20),(18,'QUEIJO MUSSARELA',4.50),(19,'PRESUNTO FATIADO',4.00),(20,'PAO INTEGRAL FATIADO',6.99),(21,'BANANA CATURRA',5.00),(22,'BANANA BRANCA',5.50),(23,'BROCOLIS',1.99);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `id` int(11) NOT NULL,
  `numero_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES (16,0);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05 16:36:57

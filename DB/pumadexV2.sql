-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: pumadex
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `id_competidor` int NOT NULL,
  `calificacion` int NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `id_juez` int NOT NULL,
  PRIMARY KEY (`id_competidor`,`id_juez`),
  KEY `id_juez` (`id_juez`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_competidor`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_juez`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (44,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac.',5),(44,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac.',7);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id_disciplina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (14,'Alterofilia'),(13,'Box'),(10,'Ciclismo'),(9,'Esgrima'),(3,'Fútbol Americano'),(7,'Fútbol Soccer'),(15,'Gimnasia Rítmica'),(11,'Golf'),(4,'Natación'),(1,'Quidditch'),(8,'Sumo'),(2,'Tenis'),(12,'Tenis de Mesa'),(6,'Tiro con Arco'),(5,'Triatlón');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ap_paterno` varchar(100) NOT NULL,
  `ap_materno` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` tinyint NOT NULL,
  `disciplina` varchar(100) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `id_entrenador` int DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `rfc` (`rfc`),
  UNIQUE KEY `curp` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Enrique','Altamirano','Niño','5524363706','quiquealtni@ciencias.unam.mx','$2a$12$0DXXqwK6C2vAT4eUkiNTf.nKisrF5zB.i9U.TegMnOAGHmxejCZU.',1,NULL,'AANL9906027L6',NULL,NULL,'ROLE_ADMIN'),(2,'Jazmin','García','Gómez','5512345678','miinjeje@gmail.com','$2a$12$YQrirekcT36u/U2cR5Arv.Zq7RQp6uGohJUdobKA1Mmk0F.wgJDgW',1,NULL,'GAGJ990807DI3',NULL,NULL,'ROLE_ADMIN'),(3,'Erick Eduardo','Luna','Piña','5512345678','gutierritos69kakaroto@skynet.hotmail.yahoo.com','$2a$12$svyJhU7ggYAOr..8vQ75Kut.lLwqZGrXNEnJgU1YapS//E6oIXzHm',1,NULL,'LUPE98050254A',NULL,NULL,'ROLE_ADMIN'),(4,'Enrique Eduardo','Alcántara','Arce','5512345678','e@gmail.com','$2a$12$4/ZNaaYu1QCwpWEMWQJuS.z1zIrriIlLnRs88gP0f9K7LfrTNV.FG',1,NULL,'AAAE990610IM0',NULL,NULL,'ROLE_ADMIN'),(5,'Oralia','Fausto','Rosas','3014765219','ckaroly0@youtu.be','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','TNLP58121064M',NULL,NULL,'ROLE_JUEZ'),(6,'Alan','Luna','Martinez','8777939472','mfishleigh1@tinyurl.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','PUJW1211259I0',NULL,NULL,'ROLE_JUEZ'),(7,'Efrain','Torres','Cruz','3083966247','livins2@businessweek.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','QUOC8011193NC',NULL,NULL,'ROLE_JUEZ'),(8,'Elvira','Gutierrez','Correa','9109668871','gliddiatt3@stanford.edu','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','GZQF931216SRJ',NULL,NULL,'ROLE_JUEZ'),(9,'Evangelina','Montiel','Montiel','8837029781','thold4@scientificamerican.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','NADG481221N4K',NULL,NULL,'ROLE_JUEZ'),(10,'Reyes','Martinez','Gutierrez','5081496187','mdood5@icq.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','JFZT3812192HH',NULL,NULL,'ROLE_JUEZ'),(11,'Catalina','Arriola','Montes','1527890584','plavers6@nsw.gov.au','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','OGXI271218VT4',NULL,NULL,'ROLE_JUEZ'),(12,'Jazmin','Ortiz','Rosas','8079574197','mfrayne7@woothemes.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','INGR090327NW5',NULL,NULL,'ROLE_JUEZ'),(13,'Brenda','Montes','Cruz','4837104294','blearmonth8@scribd.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','RPGM241015466',NULL,NULL,'ROLE_JUEZ'),(14,'Guadalupe','Dominguez','Bautista','3852150755','lbresman9@cocolog-nifty.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','CTRZ6509230S0',NULL,NULL,'ROLE_JUEZ'),(15,'Griselda','Gutierrez','Becerril','9672307892','hstallibrass0@nsw.gov.au','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','KUMY931225993',NULL,NULL,'ROLE_JUEZ'),(16,'Porfirio','Lopez','Granados','8855536233','lmacvey1@addtoany.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','TXBN6910120HV',NULL,NULL,'ROLE_JUEZ'),(17,'Esteban','Altamirano','Sanchez','7907354672','jyurukhin2@adobe.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','FADQ971225524',NULL,NULL,'ROLE_JUEZ'),(18,'Yolanda','Arriola','Barocio','9519535222','bdaniaud3@businesswire.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','BCIW6612167S4',NULL,NULL,'ROLE_JUEZ'),(19,'Ismael','Bautista','Benitez','5434596847','kdiament4@dagondesign.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','UEDT151226B91',NULL,NULL,'ROLE_JUEZ'),(20,'Ernestina','Arriola','Luna','4035035367','cdominighi5@imgur.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','FPRJ9612113PA',NULL,NULL,'ROLE_JUEZ'),(21,'Cristobal','Martinez','Diaz','9994808355','fcornehl6@twitpic.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','HTEU781222ON3',NULL,NULL,'ROLE_JUEZ'),(22,'Jose','Rosas','Galaviz','8567540714','ndelaeglise7@clickbank.net','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','FGSZ6110200AS',NULL,NULL,'ROLE_JUEZ'),(23,'Oswaldo','Rosas','Galaviz','3887530168','sbeynke8@mozilla.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','CNJG06121081P',NULL,NULL,'ROLE_JUEZ'),(24,'Angeles','Juarez','Juarez','4721755337','nbarnhill9@va.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','AFWN7712233X1',NULL,NULL,'ROLE_JUEZ'),(25,'Rita','Becerril','Gutierrez','1828734036','jciabatteri0@netlog.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','SHCZ761228401',NULL,NULL,'ROLE_JUEZ'),(26,'Fortino','Benitez','Castro','3369935928','smuckersie1@vimeo.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','TDJR851224517',NULL,NULL,'ROLE_JUEZ'),(27,'Marta','Altamirano','Castro','7807777457','rgallihawk2@sogou.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','YPGI2212229Y7',NULL,NULL,'ROLE_JUEZ'),(28,'Cruz','Arriola','Fuentes','4681332368','ieakly3@odnoklassniki.ru','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','FYNP670122J94',NULL,NULL,'ROLE_JUEZ'),(29,'Silvestre','Sanchez','Castro','8813899403','dhubbard4@irs.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','GLMV231222278',NULL,NULL,'ROLE_JUEZ'),(30,'Karen','Torres','Montiel','5801733419','ptattersdill5@bizjournals.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','PLQH3711229D0',NULL,NULL,'ROLE_JUEZ'),(31,'Feliciano','Sanchez','Becerril','8367646828','eteal6@webmd.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','GHBV641223J48',NULL,NULL,'ROLE_JUEZ'),(32,'Abelardo','Cruz','Galaviz','1324899399','dwellan7@ftc.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','WEUD991224G97',NULL,NULL,'ROLE_JUEZ'),(33,'Raul','Casas','Ortiz','3518657429','cshulver8@flavors.me','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','YIAK841119G4J',NULL,NULL,'ROLE_JUEZ'),(34,'Teresa De Jesus','Castro','Cruz','3308788590','krosenberg9@joomla.org','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','SKNX381220070',NULL,NULL,'ROLE_JUEZ'),(35,'Itzel','Hernandez','Galaviz','8212081095','croseburgh0@vkontakte.ru','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','DTGK911223OR5',NULL,NULL,'ROLE_ENTRENADOR'),(36,'Paula','Diaz','Juarez','8775997861','pspaven1@dmoz.org','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','AZTM371029098',NULL,NULL,'ROLE_ENTRENADOR'),(37,'Marina','Ortiz','Rosas','4588169208','amuggleton2@cnet.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1','DPLE551225UN6',NULL,NULL,'ROLE_ENTRENADOR'),(38,'Delia','Altamirano','Cruz','2101369788','athackwray0@ca.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','TNER8212130HT',NULL,NULL,'ROLE_ENTRENADOR'),(39,'Emma','Montiel','Dominguez','2166120430','mick1@typepad.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','DLJT921220SIH',NULL,NULL,'ROLE_ENTRENADOR'),(40,'Christian','Benitez','Montiel','3624707126','ahuitt2@amazonaws.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9','QLIY911121AQU',NULL,NULL,'ROLE_ENTRENADOR'),(41,'Nicolas','Montes','Gomez','8544074739','adudden0@unc.edu','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','FODC981212UB8',NULL,NULL,'ROLE_ENTRENADOR'),(42,'Gabriel','Ortiz','Sanchez','7108901940','ekmieciak1@ning.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','XHOA320310E16',NULL,NULL,'ROLE_ENTRENADOR'),(43,'Edith','Torres','Torres','3626181468','bcoultish2@tmall.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12','HNAX1512166CN',NULL,NULL,'ROLE_ENTRENADOR'),(44,'Griselda','Juarez','Bautista','8734085980','mrivenzon0@usda.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'ZBYH281216HMCQEU90',35,'ROLE_COMPETIDOR'),(45,'Adrian','Montiel','Martinez','9697186230','acrippen1@globo.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'AQHM691011HMCEQO71',36,'ROLE_COMPETIDOR'),(46,'Trinidad','Castro','Dominguez','6358250931','hcoulson2@cnet.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'DWOC711115HDFNVA93',37,'ROLE_COMPETIDOR'),(47,'Julio','Montiel','Juarez','8647663525','cpulteneye3@163.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'WKCG411212MDFKXV37',35,'ROLE_COMPETIDOR'),(48,'Candelaria','Altamirano','Perez','6826663221','dousley4@furl.net','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'ASTB041111MDFKOC04',36,'ROLE_COMPETIDOR'),(49,'Aurelio','Becerril','Martinez','1171602685','alonglands5@walmart.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'YTPC801118MMCGHL14',37,'ROLE_COMPETIDOR'),(50,'Ricardo','Arroyo','Castro','2326659269','dsherington6@ted.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'FSQK781026MDFMYF43',35,'ROLE_COMPETIDOR'),(51,'Rafael','Arroyo','Arriola','4599636459','gsongist7@sciencedaily.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'GJLZ901128HDFUSJ15',36,'ROLE_COMPETIDOR'),(52,'Dulce','Luna','Diaz','4452904870','kroots8@fda.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'YBNA911118HDFNSV81',37,'ROLE_COMPETIDOR'),(53,'Gisela','Arriola','Torres','6448497052','tcappel9@sfgate.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'FNCB791227HMCRNF55',35,'ROLE_COMPETIDOR'),(54,'Domingo','Casas','Sanchez','5385076413','bsummersbya@people.com.cn','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'VXEH201120MDFCGX94',36,'ROLE_COMPETIDOR'),(55,'Mariana','Gutierrez','Arroyo','3695082279','tdorganb@mapquest.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'HSWE880623MDFCMS62',37,'ROLE_COMPETIDOR'),(56,'Ignacio','Juarez','Martinez','1655940023','ikeetleyc@fema.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'ORVE521025HMCGKL79',35,'ROLE_COMPETIDOR'),(57,'Maritza','Fausto','Casas','6565833133','alawlessd@phoca.cz','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'ATYF820014HDFITA53',36,'ROLE_COMPETIDOR'),(58,'Rolando','Sanchez','Montiel','9659920108','asheildse@technorati.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'1',NULL,'VZDN451127MDFHJE62',37,'ROLE_COMPETIDOR'),(59,'Leonardo','Garcia','Becerril','9281691804','nhuebner0@is.gd','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'NIZQ961212HMCEQN56',38,'ROLE_COMPETIDOR'),(60,'Noemi','Barocio','Montiel','6078517050','jguerola1@jiathis.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'BCMW550024MDFUFN38',39,'ROLE_COMPETIDOR'),(61,'Silvia','Ortiz','Cruz','7217616927','nlonsbrough2@weebly.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'GZUS341228MDFFEQ29',40,'ROLE_COMPETIDOR'),(62,'Tomas','Bautista','Altamirano','6594050818','soulet3@gov.uk','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'VQMI951111MMCYPM86',38,'ROLE_COMPETIDOR'),(63,'Mariela','Perez','Ortiz','7258503056','tgunny4@netvibes.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'EPAF240916HMCDJU72',39,'ROLE_COMPETIDOR'),(64,'Arnulfo','Arroyo','Hernandez','9722548397','jcrebo5@sun.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'IVXT311012HDFJLZ58',40,'ROLE_COMPETIDOR'),(65,'Mauricio','Castro','Castro','4234685428','gbromet6@rambler.ru','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'ZWDM711219MDFPCY58',38,'ROLE_COMPETIDOR'),(66,'Pilar','Bautista','Altamirano','5058256564','bsirl7@rambler.ru','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'LBJD901213MDFDUH29',39,'ROLE_COMPETIDOR'),(67,'Mario','Martinez','Sanchez','9532725035','charmon8@parallels.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'ONXG501216HDFFZH86',40,'ROLE_COMPETIDOR'),(68,'Ezequiel','Perez','Montes','4942345423','dhardingham9@soundcloud.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'GIFX201213MDFFZB45',38,'ROLE_COMPETIDOR'),(69,'Lorenzo','Cruz','Castro','8474450974','lhambribea@nhs.uk','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'EMZK301020MMCAHT68',39,'ROLE_COMPETIDOR'),(70,'Rebeca','Acosta','Altamirano','1337312272','phousenb@smugmug.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'CLNS140415HDFOUI97',40,'ROLE_COMPETIDOR'),(71,'Amparo','Montes','Gomez','4913821609','jslowanc@theatlantic.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'WKGN521221HMCPHT96',38,'ROLE_COMPETIDOR'),(72,'Erasmo','Gomez','Perez','7816338158','acotterrilld@rakuten.co.jp','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'PWRU921219MMCOIC41',39,'ROLE_COMPETIDOR'),(73,'Modesto','Arroyo','Cruz','3962974866','fclynmanse@mozilla.org','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'9',NULL,'OJIV011014HDFNGS85',40,'ROLE_COMPETIDOR'),(74,'Heriberto','Fausto','Hernandez','9473659269','oferagh0@usnews.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'UGXF611222HDFSVJ39',41,'ROLE_COMPETIDOR'),(75,'Osvaldo','Altamirano','Sanchez','8758017341','ljoron1@com.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'CBXO141024HDFHJU26',42,'ROLE_COMPETIDOR'),(76,'Humberto','Cruz','Gomez','8225566090','binchbald2@seattletimes.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'TJNI161220HDFTRD50',43,'ROLE_COMPETIDOR'),(77,'Aaron','Casas','Sanchez','9457465599','grameaux3@ca.gov','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'XNEI081226HMCMFW91',41,'ROLE_COMPETIDOR'),(78,'Gabriela','Perez','Martinez','7267096545','emarking4@cnbc.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'HWAI881226MMCMJI72',42,'ROLE_COMPETIDOR'),(79,'Violeta','Sanchez','Arriola','3489613295','scarah5@unicef.org','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'UQXC361128MDFXEH23',43,'ROLE_COMPETIDOR'),(80,'Emmanuel','Arriola','Castro','4218887545','otenaunt6@acquirethisname.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'PFWQ521225MDFZSE54',41,'ROLE_COMPETIDOR'),(81,'Martha','Gomez','Altamirano','8505859835','cearwicker7@oaic.gov.au','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'BPWO501213HDFAJW11',42,'ROLE_COMPETIDOR'),(82,'Maria Del Socorro','Diaz','Altamirano','1923592498','bmingus8@jalbum.net','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'MEHK950225HMCFVX75',43,'ROLE_COMPETIDOR'),(83,'Edna','Casas','Altamirano','1967353188','pwarbeys9@vinaora.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'HWGQ301222HMCOAD43',41,'ROLE_COMPETIDOR'),(84,'Marisol','Becerril','Gutierrez','8184307177','dhaddena@comsenz.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'EVGW001224HDFZFK87',42,'ROLE_COMPETIDOR'),(85,'Marisol','Arriola','Garcia','8241335445','aocriganeb@netvibes.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'KVXG230129MMCEMH49',43,'ROLE_COMPETIDOR'),(86,'Eduardo','Correa','Granados','7141302299','pallinc@cbsnews.com','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'HRYL711018HMCVLG50',41,'ROLE_COMPETIDOR'),(87,'Ruth','Gomez','Torres','6661826780','vovend@telegraph.co.uk','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'GLMT041014HDFZRU22',42,'ROLE_COMPETIDOR'),(88,'Perla','Gutierrez','Cruz','8141800575','bplye@si.edu','$2a$12$Prw0AB/krSQ65K56pUcHI..ZIGq5fGTlcG6BweLnuH.4ceX0ELFE2',1,'12',NULL,'CHJB711114HMCBVX70',43,'ROLE_COMPETIDOR');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 21:29:27

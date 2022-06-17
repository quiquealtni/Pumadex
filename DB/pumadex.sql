-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: pumadex
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
INSERT INTO `calificaciones` VALUES (22,8,'Muy bien',4),(36,4,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, aut dolores neque assumenda aspernatur, provident aperiam sunt repudiandae iusto deleniti obcaecati rerum magni explicabo eum tempora! Similique maxime iure quidem?          ',3),(37,8,'Fui calificado por el juez con id 3.',3),(38,6,'Fui calificado por el juez con id 3.',3),(39,4,'Fui calificado por el juez con id 3.',3),(42,10,'10 de 10 perfectisimo, xdxdxdxdxd.',4),(43,8,'que paso master? F, hahahahahahaha.',4),(43,7,'Esto es una prueba, a ver si ya funciona el JOIN.',40),(44,6,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, aut dolores neque assumenda aspernatur, provident aperiam sunt repudiandae iusto deleniti obcaecati rerum magni explicabo eum tempora! Similique maxime iure quidem?',4),(46,9,'Fui calificado por el juez con id 3.',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (4,'Ajedrez'),(5,'Arquería'),(10,'Ciclismo'),(20,'Clavados'),(6,'Escalada'),(9,'Esgrima'),(27,'Francisco'),(3,'Fútbol Americano'),(7,'Fútbol Soccer'),(11,'Golf'),(13,'Natación'),(12,'Ping-pong'),(1,'Quidditch'),(8,'Sumo'),(2,'Tenis');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luis Enrique','Altamirano','Niño','5524363706','quiquealtni@ciencias.unam.mx','$2a$12$0DXXqwK6C2vAT4eUkiNTf.nKisrF5zB.i9U.TegMnOAGHmxejCZU.',1,NULL,'AANL9906027L6',NULL,NULL,'ROLE_ADMIN'),(2,'Raul','García','Piña','5544332211','coach@pumadex.unam.mx','$2a$10$kn8uuShrQN/5k1Vnm2doUO/2whVc/a2ZZcp6mFtNbJgtP0Kk7D462',1,'Fútbol Soccer','GAPR8509192V6',NULL,NULL,'ROLE_ENTRENADOR'),(3,'Miguel','Gonzalez','Tapia','5511223366','juez@gmail.com','$2a$10$kJ1wIzT2UsAd.W3bIJ/E9uy3KfhJWORDpVjj.hFiPKV9hQC7kHG6a',1,'Fútbol Soccer','GOTR850205KT4',NULL,NULL,'ROLE_JUEZ'),(4,'Pedro','Ramírez','Vázquez','5511223344','juezgolf@gmail.com','$2a$10$PrP3lth6MZLV30iwOBe2FOzCgVyAJj0zgCYsBxQCE7borLgKPcCqa',1,'Golf','GOTR860205KT4',NULL,NULL,'ROLE_JUEZ'),(6,'Uwu','Parker','Stark','5544332211','uwu@gmail.com','$2a$10$Uoe1d1fYo.LM8u8FFy9Q5.slNO9ucnRwEex3cUyEayrKspc2.aqOW',1,'Fútbol Americano','GOTR880205KT4',NULL,NULL,'ROLE_JUEZ'),(22,'Juan','Colosio','Simi','5511223344','juan-simi@gmail.com','$2a$10$GWg3IhKMvrUgW.deSouAOOT6nAhM5QjQwYks/44uVdxMrPBbdFuW2',1,'Golf',NULL,'AANL990602HMCLXS00',NULL,'ROLE_COMPETIDOR'),(23,'Sol','Chávez','Xing','5565432272','xing@gmail.com','$2a$10$4UGtk8xRD3suvUAebCRKUe84IcEV699s5slt7n3e19rcY7pmXrmcm',1,'Esgrima','XITR850205KT4',NULL,NULL,'ROLE_JUEZ'),(24,'Pumita','Hersheys','Patrencio','5518179873','hersheys@gmail.com','$2a$10$4Tzy1UWsAycqvRRRlBNv/O8LT64D/UUocS1KM1gXYCtyQhyEHPRe6',1,'Golf','PATR890205KT4',NULL,NULL,'ROLE_ENTRENADOR'),(25,'Saul','Godinez','Valdes','5567462476','godin@gmail.com','$2a$10$BzN.jtJxl.HUY6i0wXmVF.mwZWyDlPJgDgQpqTIvHOOIUt2kOlLDy',1,'Arquería','GOVS820206KT4',NULL,NULL,'ROLE_ENTRENADOR'),(26,'Ximena','Rivera','Aldama','5546756327','ximal@gmail.com','$2a$10$tmtQMAxnQ8uO0bYKxqCvS.wVgW6/dzwHyMMmb5.IbemeBHn2JsGlW',1,'Esgrima','RIAX890205KT4',NULL,NULL,'ROLE_ENTRENADOR'),(28,'Santiago','Rivera','Perez','5511223344','riv@gmail.com','$2a$10$9kVoYnK.rMb7DzK7fAwwluH5I8SZ7LPKQkrj.H/CJa6L7.7uYSFaK',1,'Ciclismo','GOTR600205KT4',NULL,NULL,'ROLE_JUEZ'),(36,'Ajedrez','Souto','Tapia','5511223344','asedeje@gmail.com','$2a$10$z9SHE/AtUxiOAOknHVOMf.p2pZBVGtw..s0t.re2V1O3KUOWur0ia',1,'Fútbol Soccer',NULL,'AANL790602HMCLXS00',2,'ROLE_COMPETIDOR'),(37,'Francisco','Gonzalez','Perez','5511223344','fco1@gmail.com','$2a$10$RfSAzZ1K25gJnCrx/CAQxery5DmPSQMg68P3uWyUEeUYlvsOb4nF6',1,'Fútbol Soccer',NULL,'AANL690602HMCLXS00',2,'ROLE_COMPETIDOR'),(38,'Francisco','Gonzalez','Tapias','5511223344','fco2@gmail.com','$2a$10$o5Er2JzV6.PP6LhQm3l4wu6aMMhLfvxypvQ35eRfgVpAuJmf4dXmC',1,'Fútbol Soccer',NULL,'AANL590602HMCLXS00',2,'ROLE_COMPETIDOR'),(39,'Francisco','Gonzalez','MartinezModificado','5511223377','fco6@gmail.com','$2a$10$yWLHwbdSX2OIP.tMqrZCgeNGYMmQcjWIYVkrH3w1PoyjmY6Al08P6',1,'Fútbol Soccer',NULL,'AANL490602HMCLXS00',2,'ROLE_COMPETIDOR'),(40,'Juez','de','Ejemplo1','5511223344','juezgolf2@gmail.com','$2a$10$G.WgGaUnItgQiZAy3aoWSOvAMZiyFyT10rkNvO7hlyjpOk3Wp7kru',1,'Golf','GOTR260205KT4',NULL,NULL,'ROLE_JUEZ'),(41,'Nazario','Pérez','López','5511223344','naz@gmail.com','$2a$10$a4RNSQwKrlGvAzTYzdvOwuUUiIWO4p.BrfxD5YHcjgdeOrdyKSuai',1,'Fútbol Soccer','NATR860205KT4',NULL,NULL,'ROLE_ENTRENADOR'),(42,'Saúl','White','Pinkman','5511223344','compgolf1@gmail.com','$2a$10$3CCuYkzwVssI8dMv5LpmcO0AKKR1w/W0ubbSOSkxTYLHwIRC9G7N2',1,'Golf',NULL,'AANL200602HMCLXS00',24,'ROLE_COMPETIDOR'),(43,'Carlos','Estrada','Méndez','5511223344','compgolf2@gmail.com','$2a$10$tQiGssigWk9w.FkBrLYiZ./Kt7aJLU49LzlRTgFGQbpb0DBNUsflq',1,'Golf',NULL,'AANL210602HMCLXS00',24,'ROLE_COMPETIDOR'),(44,'Antonio','Iriarte','Toledo','5511223344','compgolf3@gmail.com','$2a$10$J.qZnfit70pyIdJcVNcqA..hmcodncDUozMLr5Sqy2Oe4sRdD7XX6',1,'Golf',NULL,'AANL220602HMCLXS00',24,'ROLE_COMPETIDOR'),(45,'Carmen','Montes','Tapia','5511223344','compgolf4@gmail.com','$2a$10$nl3xZZbeqObScchDHJhSLOZQcx9fgS8bdavYecqRvO9CIHvcYvzta',1,'Golf',NULL,'AANL230602HMCLXS00',24,'ROLE_COMPETIDOR'),(46,'Demo','Paraprobar','leftouterjoin','5511223366','compsoc5@gmail.com','$2a$10$x9NzygLbmaNrMagzNOhgO.9Cf1hNYwU.aYr/NIswAUy17Rit35rPS',1,'Fútbol Soccer',NULL,'AANL390602HMCLXS00',2,'ROLE_COMPETIDOR'),(47,'Jazmin','García','Gómez','5512345678','miinjeje@gmail.com','$2a$12$YQrirekcT36u/U2cR5Arv.Zq7RQp6uGohJUdobKA1Mmk0F.wgJDgW',1,NULL,'GAGJ990807DI3',NULL,NULL,'ROLE_ADMIN'),(48,'Erick Eduardo','Luna','Piña','5512345678','gutierritos69kakaroto@skynet.hotmail.yahoo.com','$2a$12$svyJhU7ggYAOr..8vQ75Kut.lLwqZGrXNEnJgU1YapS//E6oIXzHm',1,NULL,'LUPE98050254A',NULL,NULL,'ROLE_ADMIN'),(49,'Enrique Eduardo','Alcántara','Arce','5512345678','e@gmail.com','$2a$12$4/ZNaaYu1QCwpWEMWQJuS.z1zIrriIlLnRs88gP0f9K7LfrTNV.FG',1,NULL,'AAAE990610IM0',NULL,NULL,'ROLE_ADMIN');
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

-- Dump completed on 2022-05-19 20:27:20

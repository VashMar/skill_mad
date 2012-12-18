-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: skillmad_development
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120725221109'),('20120726010438'),('20120726154323'),('20120812225056'),('20120816194433'),('20120830040200'),('20120927095542'),('20120930100056'),('20120930102856'),('20121004180936'),('20121016003425'),('20121016023355'),('20121104034658'),('20121129024142');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) DEFAULT '0',
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `hasVideo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  KEY `index_users_on_remember_token` (`remember_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Max','testtom@wisc.edu','2012-11-06 02:47:11','2012-11-29 03:59:32','$2a$10$3tk4SnRuqNOzcDjk3EHR5uxTXlGSoxMmY3xl4e8sdK5Blpw1oeg.K','2601e916865febe7820104da9fba34e2',1,'kenny.gif','image/gif',17750,'2012-11-27 01:55:24',30,'Skills','Junior','Majors',NULL,1),(2,'Kyle','testkyle@wisc.edu','2012-11-06 02:57:48','2012-11-17 19:19:26','$2a$10$w820jMLckzqzxFAa4eH90edQf1JzfjqheI7Vm.tGLWfk1dGwO4AB2','6171aae0b0f686a4bc34a9bfaeb8d5f9',1,'kyle.gif','image/gif',19737,'2012-11-17 19:19:25',1,'Journalism',NULL,NULL,NULL,0),(3,'Stan','teststan@wisc.edu','2012-11-06 03:11:16','2012-11-17 19:22:44','$2a$10$DjwyNaZGtZ2.InPTvwUM6unLEqSBA9qT1zhtVdR4y2A6Mjo4aPlvS','1e07fc2811cc5aec9555c264daba619a',1,'stan.gif','image/gif',9555,'2012-11-17 19:22:42',2,'Engineering',NULL,NULL,NULL,0),(4,'Cartman','testcartman@wisc.edu','2012-11-06 03:23:18','2012-11-30 17:31:38','$2a$10$MquRV1BPOqXV0j.xak6.cOWLfmh/4drF71YqrVyHrRS6fKrZpNRhm','b94601834d6cf692a2358b74c94936bd',1,'cartman.gif','image/gif',16760,'2012-11-30 17:29:25',1,'Criminal Justice','Senior ','Shitting  more ',NULL,1),(5,'Kenny','testkenny@wisc.edu','2012-11-06 03:23:46','2012-11-17 19:07:31','$2a$10$oY3AofYln9y9v1EhkplKz.f1zjLtBvPKWXo.eiWOOvgLawbVq7iOq','21fc08df5546b43488a757fa66950a1c',1,'kenny.gif','image/gif',17750,'2012-11-17 19:07:30',0,'Biochemistry',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yt_video_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (3,'Tom''s Video ','','g0nPotkvnwo',1,'2012-11-06 02:51:40','2012-11-07 00:59:20',37,1),(5,'Kyle''s Video','','e3eh9jPKfgc',1,'2012-11-06 03:01:06','2012-11-09 21:39:38',1,2),(6,'Stan''s Video','','dz9gAHBJUBQ',1,'2012-11-06 03:14:26','2012-11-06 05:14:22',2,3),(7,'Cartman''s Video','This is simply a test. ','IASpW5SutZw',1,'2012-11-06 03:26:43','2012-11-09 21:39:42',1,4),(8,'Kenny''s Video','More and more tests. ','fI4mkwApgD4',1,'2012-11-06 03:32:51','2012-11-06 05:14:28',0,5),(9,'das','',NULL,0,'2012-11-06 05:28:18','2012-11-06 05:28:18',0,NULL),(10,NULL,NULL,NULL,0,'2012-11-10 22:39:13','2012-11-10 22:39:13',0,NULL);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `voted_up` tinyint(1) DEFAULT '0',
  `voted_down` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_votes_on_user_id_and_video_id` (`user_id`,`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,5,3,1,0),(2,5,6,1,0),(3,5,8,1,0),(4,1,6,1,0),(5,1,8,0,1),(6,1,3,1,0),(7,1,5,1,0),(8,1,7,1,0);
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-30 21:11:59

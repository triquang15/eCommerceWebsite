-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_website
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `default_address` bit(1) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn3sth7s3kur1rafwbbrqqnswt` (`country_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKn3sth7s3kur1rafwbbrqqnswt` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(500) NOT NULL,
  `content` tinytext NOT NULL,
  `published` bit(1) NOT NULL,
  `title` varchar(256) NOT NULL,
  `type` tinyint DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlc3sm3utetrj1sx4v9ahwopnr` (`user_id`),
  CONSTRAINT `FKlc3sm3utetrj1sx4v9ahwopnr` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9mhkwvnfaarcalo4noabrin5j` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (2,'1.jpg','Meghan Quinn'),(3,'2.jpg','Lucy Score'),(4,'3.jpg','Victoria Aveyard'),(5,'4.jpg','Traci Chee'),(6,'5.jpg','Lee Child'),(7,'6.jpg','A. J. Finn');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors_categories`
--

DROP TABLE IF EXISTS `authors_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors_categories` (
  `author_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`category_id`),
  KEY `FKoriih6xeta33ndctam2reqk1i` (`category_id`),
  CONSTRAINT `FKio9gmg1roeunv5m0tn4tpy5qy` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `FKoriih6xeta33ndctam2reqk1i` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors_categories`
--

LOCK TABLES `authors_categories` WRITE;
/*!40000 ALTER TABLE `authors_categories` DISABLE KEYS */;
INSERT INTO `authors_categories` VALUES (4,11),(5,11),(6,11),(2,12),(3,13),(4,13),(5,13),(6,13),(7,13),(3,14),(4,14),(6,14),(7,14),(3,15),(4,15),(7,15),(2,16),(5,16),(2,17),(5,17),(6,17);
/*!40000 ALTER TABLE `authors_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdagcsk6v6x4n1kxw3rkp57921` (`customer_id`),
  KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKdagcsk6v6x4n1kxw3rkp57921` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `all_parent_ids` varchar(256) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  UNIQUE KEY `UK_2n3awjv8ah4gl5ca1bq26sori` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (11,'Biographies & Memoirs',NULL,_binary '','51K4wGJKUEL.jpg','Biographies & Memoirs',NULL),(12,'Arts & Photography',NULL,_binary '','61l1xEAMcbL._SY522_.jpg','Arts & Photography',NULL),(13,'Business & Money',NULL,_binary '','41opPGffYbL.jpg','Business & Money',NULL),(14,'Calendars',NULL,_binary '','51q3kJow4TL.jpg','Calendars',NULL),(15,'Children\'s Books',NULL,_binary '','91q6YJUqiAL._AC._SR360,460.jpg','Children\'s Books',NULL),(16,'Graphic Design','-12-',_binary '','81PWaEj0eXL._AC._SR360,460.jpg','Graphic Design',12),(17,'Book Design','-12-16-',_binary '','71QtncO0IFL._AC._SR360,460.jpg','Book Design',16);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Andorra','AD'),(2,'United Arab Emirates','AE'),(3,'Afghanistan','AF'),(4,'Antigua and Barbuda','AG'),(5,'Anguilla','AI'),(6,'Albania','AL'),(7,'Armenia','AM'),(8,'Netherlands Antilles','AN'),(9,'Angola','AO'),(10,'Antarctica','AQ'),(11,'Argentina','AR'),(12,'American Samoa','AS'),(13,'Austria','AT'),(14,'Australia','AU'),(15,'Aruba','AW'),(16,'Åland Islands','AX'),(17,'Azerbaijan','AZ'),(18,'Bosnia and Herzegovina','BA'),(19,'Barbados','BB'),(20,'Bangladesh','BD'),(21,'Belgium','BE'),(22,'Burkina Faso','BF'),(23,'Bulgaria','BG'),(24,'Bahrain','BH'),(25,'Burundi','BI'),(26,'Benin','BJ'),(27,'Saint Barthélemy','BL'),(28,'Bermuda','BM'),(29,'Brunei','BN'),(30,'Bolivia','BO'),(31,'Bonaire, Sint Eustatius and Saba','BQ'),(32,'Brazil','BR'),(33,'Bahamas','BS'),(34,'Bhutan','BT'),(35,'Bouvet Island','BV'),(36,'Botswana','BW'),(37,'Belarus','BY'),(38,'Belize','BZ'),(39,'Canada','CA'),(40,'Cocos Islands','CC'),(41,'The Democratic Republic Of Congo','CD'),(42,'Central African Republic','CF'),(43,'Congo','CG'),(44,'Switzerland','CH'),(45,'Côte d\'Ivoire','CI'),(46,'Cook Islands','CK'),(47,'Chile','CL'),(48,'Cameroon','CM'),(49,'China','CN'),(50,'Colombia','CO'),(51,'Costa Rica','CR'),(52,'Cuba','CU'),(53,'Cape Verde','CV'),(54,'Curaçao','CW'),(55,'Christmas Island','CX'),(56,'Cyprus','CY'),(57,'Czech Republic','CZ'),(58,'Germany','DE'),(59,'Djibouti','DJ'),(60,'Denmark','DK'),(61,'Dominica','DM'),(62,'Dominican Republic','DO'),(63,'Algeria','DZ'),(64,'Ecuador','EC'),(65,'Estonia','EE'),(66,'Egypt','EG'),(67,'Western Sahara','EH'),(68,'Eritrea','ER'),(69,'Spain','ES'),(70,'Ethiopia','ET'),(71,'Finland','FI'),(72,'Fiji','FJ'),(73,'Falkland Islands','FK'),(74,'Micronesia','FM'),(75,'Faroe Islands','FO'),(76,'France','FR'),(77,'Gabon','GA'),(78,'United Kingdom','GB'),(79,'Grenada','GD'),(80,'Georgia','GE'),(81,'French Guiana','GF'),(82,'Guernsey','GG'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greenland','GL'),(86,'Gambia','GM'),(87,'Guinea','GN'),(88,'Guadeloupe','GP'),(89,'Equatorial Guinea','GQ'),(90,'Greece','GR'),(91,'South Georgia And The South Sandwich Islands','GS'),(92,'Guatemala','GT'),(93,'Guam','GU'),(94,'Guinea-Bissau','GW'),(95,'Guyana','GY'),(96,'Hong Kong','HK'),(97,'Heard Island And McDonald Islands','HM'),(98,'Honduras','HN'),(99,'Croatia','HR'),(100,'Haiti','HT'),(101,'Hungary','HU'),(102,'Indonesia','ID'),(103,'Ireland','IE'),(104,'Israel','IL'),(105,'Isle Of Man','IM'),(106,'India','IN'),(107,'British Indian Ocean Territory','IO'),(108,'Iraq','IQ'),(109,'Iran','IR'),(110,'Iceland','IS'),(111,'Italy','IT'),(112,'Jersey','JE'),(113,'Jamaica','JM'),(114,'Jordan','JO'),(115,'Japan','JP'),(116,'Kenya','KE'),(117,'Kyrgyzstan','KG'),(118,'Cambodia','KH'),(119,'Kiribati','KI'),(120,'Comoros','KM'),(121,'Saint Kitts And Nevis','KN'),(122,'North Korea','KP'),(123,'South Korea','KR'),(124,'Kuwait','KW'),(125,'Cayman Islands','KY'),(126,'Kazakhstan','KZ'),(127,'Laos','LA'),(128,'Lebanon','LB'),(129,'Saint Lucia','LC'),(130,'Liechtenstein','LI'),(131,'Sri Lanka','LK'),(132,'Liberia','LR'),(133,'Lesotho','LS'),(134,'Lithuania','LT'),(135,'Luxembourg','LU'),(136,'Latvia','LV'),(137,'Libya','LY'),(138,'Morocco','MA'),(139,'Monaco','MC'),(140,'Moldova','MD'),(141,'Montenegro','ME'),(142,'Saint Martin','MF'),(143,'Madagascar','MG'),(144,'Marshall Islands','MH'),(145,'Macedonia','MK'),(146,'Mali','ML'),(147,'Myanmar','MM'),(148,'Mongolia','MN'),(149,'Macao','MO'),(150,'Northern Mariana Islands','MP'),(151,'Martinique','MQ'),(152,'Mauritania','MR'),(153,'Montserrat','MS'),(154,'Malta','MT'),(155,'Mauritius','MU'),(156,'Maldives','MV'),(157,'Malawi','MW'),(158,'Mexico','MX'),(159,'Malaysia','MY'),(160,'Mozambique','MZ'),(161,'Namibia','NA'),(162,'New Caledonia','NC'),(163,'Niger','NE'),(164,'Norfolk Island','NF'),(165,'Nigeria','NG'),(166,'Nicaragua','NI'),(167,'Netherlands','NL'),(168,'Norway','NO'),(169,'Nepal','NP'),(170,'Nauru','NR'),(171,'Niue','NU'),(172,'New Zealand','NZ'),(173,'Oman','OM'),(174,'Panama','PA'),(175,'Peru','PE'),(176,'French Polynesia','PF'),(177,'Papua New Guinea','PG'),(178,'Philippines','PH'),(179,'Pakistan','PK'),(180,'Poland','PL'),(181,'Saint Pierre And Miquelon','PM'),(182,'Pitcairn','PN'),(183,'Puerto Rico','PR'),(184,'Palestine','PS'),(185,'Portugal','PT'),(186,'Palau','PW'),(187,'Paraguay','PY'),(188,'Qatar','QA'),(189,'Reunion','RE'),(190,'Romania','RO'),(191,'Serbia','RS'),(192,'Russia','RU'),(193,'Rwanda','RW'),(194,'Saudi Arabia','SA'),(195,'Solomon Islands','SB'),(196,'Seychelles','SC'),(197,'Sudan','SD'),(198,'Sweden','SE'),(199,'Singapore','SG'),(200,'Saint Helena','SH'),(201,'Slovenia','SI'),(202,'Svalbard And Jan Mayen','SJ'),(203,'Slovakia','SK'),(204,'Sierra Leone','SL'),(205,'San Marino','SM'),(206,'Senegal','SN'),(207,'Somalia','SO'),(208,'Suriname','SR'),(209,'South Sudan','SS'),(210,'Sao Tome And Principe','ST'),(211,'El Salvador','SV'),(212,'Sint Maarten (Dutch part)','SX'),(213,'Syria','SY'),(214,'Swaziland','SZ'),(215,'Turks And Caicos Islands','TC'),(216,'Chad','TD'),(217,'French Southern Territories','TF'),(218,'Togo','TG'),(219,'Thailand','TH'),(220,'Tajikistan','TJ'),(221,'Tokelau','TK'),(222,'Timor-Leste','TL'),(223,'Turkmenistan','TM'),(224,'Tunisia','TN'),(225,'Tonga','TO'),(226,'Turkey','TR'),(227,'Trinidad and Tobago','TT'),(228,'Tuvalu','TV'),(229,'Taiwan','TW'),(230,'Tanzania','TZ'),(231,'Ukraine','UA'),(232,'Uganda','UG'),(233,'United States Minor Outlying Islands','UM'),(234,'United States','US'),(235,'Uruguay','UY'),(236,'Uzbekistan','UZ'),(237,'Vatican','VA'),(238,'Saint Vincent And The Grenadines','VC'),(239,'Venezuela','VE'),(240,'British Virgin Islands','VG'),(241,'U.S. Virgin Islands','VI'),(242,'Vietnam','VN'),(243,'Vanuatu','VU'),(244,'Wallis And Futuna','WF'),(245,'Samoa','WS'),(246,'Yemen','YE'),(247,'Mayotte','YT'),(248,'South Africa','ZA'),(249,'Zambia','ZM'),(250,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'United States Dollar','$','USD'),(2,'British Pound','£','GPB'),(3,'Japanese Yen','¥','JPY'),(4,'Euro','€','EUR'),(5,'Russian Ruble','₽','RUB'),(6,'South Korean Won','₩','KRW'),(7,'Chinese Yuan','¥','CNY'),(8,'Brazilian Real','R$','BRL'),(9,'Australian Dollar','$','AUD'),(10,'Canadian Dollar','$','CAD'),(11,'Vietnamese đồng ','₫','VND'),(12,'Indian Rupee','₹','INR');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `authentication_type` enum('DATABASE','GOOGLE','FACEBOOK') DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(64) NOT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(256) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `position` int NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` tinyint DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7fcv9rm1ecfeumh1lo4tuntgm` (`alias`),
  UNIQUE KEY `UK_752mo4d1g26knhksum5pek87` (`title`),
  KEY `FKa5eajuapjflm0jk7xh5mangy5` (`article_id`),
  CONSTRAINT `FKa5eajuapjflm0jk7xh5mangy5` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_cost` float NOT NULL,
  `quantity` int NOT NULL,
  `shipping_cost` float NOT NULL,
  `subtotal` float NOT NULL,
  `unit_price` float NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_track` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notes` varchar(256) DEFAULT NULL,
  `status` enum('NEW','CANCELLED','PROCESSING','PACKAGED','PICKED','SHIPPING','DELIVERED','RETURN_REQUESTED','RETURNED','PAID','REFUNDED') NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31jv1s212kajfn3kk1ksmnyfl` (`order_id`),
  CONSTRAINT `FK31jv1s212kajfn3kk1ksmnyfl` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `deliver_date` datetime(6) DEFAULT NULL,
  `deliver_days` int NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `payment_method` enum('COD','CREDIT_CARD','PAYPAL') DEFAULT NULL,
  `product_cost` float NOT NULL,
  `shipping_cost` float NOT NULL,
  `status` enum('NEW','CANCELLED','PROCESSING','PACKAGED','PICKED','SHIPPING','DELIVERED','RETURN_REQUESTED','RETURNED','PAID','REFUNDED') DEFAULT NULL,
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (3,'Print length','640 pages',2),(4,'Dimensions','6.44 x 1.94 x 9.31 inches',2),(5,'Language','English',2),(6,'ISBN-10','1649374178',2),(7,'ISBN-13','978-1649374172',2),(8,'Print length','816 pages',3),(9,'Language','English',3),(10,'Publisher','Bloomsbury Publishing',3),(11,'ISBN-13','978-1639731756',3),(12,'Print length','235',4),(13,'Language','English',4),(14,'Publisher','Northfield Publishing',4),(15,'Dimensions','5.5 x 0.39 x 8.5 inches',4),(16,'ISBN-13','978-0802412706',4);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`),
  CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (4,'7f653614-fb50-4b71-84e2-655c4d74c9b1.__CR0,0,150,300_PT0_SX150_V1___.jpg',2),(5,'a135eed1-fb41-430f-b8b7-77050ba22c65.__CR0,0,150,300_PT0_SX150_V1___.jpg',2),(6,'69ce7b94-9953-47c9-a766-3c0aa73e8440.__CR0,0,150,300_PT0_SX150_V1___.jpg',2),(7,'91jbHTNpy6L._AC_UL320_SR320,320_.jpg',3),(8,'919YkFdlilL._AC_UL320_SR320,320_.jpg',3),(9,'81sVibOq5OL._AC_UL320_SR320,320_.jpg',3),(10,'4.jpg',4),(11,'3.png',4),(12,'2.png',4);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `average_rating` float NOT NULL,
  `cost` float NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `discount_percent` float DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `full_description` varchar(4096) NOT NULL,
  `height` float NOT NULL,
  `in_stock` bit(1) DEFAULT NULL,
  `length` float NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `review_count` int NOT NULL,
  `short_description` varchar(512) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8qwq8q3hk7cxkp9gruxupnif5` (`alias`),
  UNIQUE KEY `UK_o61fmio5yukmmiqgnxf8pnavn` (`name`),
  KEY `FKy2kver9ldog29n3mi9b12w64` (`author_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKy2kver9ldog29n3mi9b12w64` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'The-Empyrean',0,10,'2024-01-23 13:47:13.800000',18.66,_binary '','<span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">Now the&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400; font-style: italic !important;\">real</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">&nbsp;training begins, and Violet’s already wondering how she’ll get through. It’s not just that it’s grueling and maliciously brutal, or even that it’s designed to stretch the riders’ capacity for pain beyond endurance. It’s the new vice commandant, who’s made it his personal mission to teach Violet&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400; font-style: italic !important;\">exactly</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">&nbsp;how powerless she is–unless she betrays the man she loves.<br><br>Although Violet’s body might be weaker and frailer than everyone else’s, she still has her wits―and a will of iron. And leadership is forgetting the most important lesson Basgiath has taught her:&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400; font-style: italic !important;\">Dragon riders make their own rules</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">.<br><br>But a determination to survive won’t be enough this year.<br><br>Because Violet knows the real secret hidden for centuries at Basgiath War College―and nothing, not even dragon fire, may be enough to save them in the end.</span><br>',4,_binary '',2,'917Bc9C1MlL._SY522_.jpg','Iron Flame',29.99,0,'“The first year is when some of us lose our lives. The second year is when the rest of us lose our humanity.” ―Xaden Riorson','2024-01-24 09:37:02.936000',5,12,2,17),(3,'Crescent-City,-2',0,5,'2024-01-24 09:43:01.549000',10,_binary '','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">Bryce Quinlan and Hunt Athalar are trying to get back to normal-they may have saved Crescent City, but with so much upheaval in their lives lately, they mostly want a chance to relax. Slow down. Figure out what the future holds.</span><br style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\"><br style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\"><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 400;\">The Asteri have kept their word so far, leaving Bryce and Hunt alone. But with the rebels chipping away at the Asteri\'s power, the threat the rulers pose is growing. As Bryce, Hunt, and their friends get pulled into the rebels\' plans, the choice becomes clear: stay silent while others are oppressed, or fight for what\'s right. And they\'ve never been very good at staying silent.</span><br></div>',6,_binary '',5,'81CMSHsRAvL._SY522_.jpg','House of Sky and Breath',55.6,0,'The second book in Sarah J. Maas\'s sexy, groundbreaking, #1 New York Times bestselling Crescent City series!\r\n','2024-01-24 09:43:01.549000',3,3,3,13),(4,'The-Secret-to-Love-that-Lasts',0,12,'2024-01-24 09:49:06.509000',45,_binary '','<div><div>In the #1&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">New York Times&nbsp;</span>international bestseller&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">The 5 Love Languages</span><span class=\"a-text-italic\" style=\"font-style: italic !important;\">®</span>, you’ll discover the secret that has transformed millions of relationships worldwide. Whether your relationship is flourishing or failing, Dr. Gary Chapman’s proven approach to showing and receiving love will help you experience deeper and richer levels of intimacy with your partner—starting today.</div><div><span class=\"a-text-italic\" style=\"font-style: italic !important;\">The 5 Love Languages</span><span class=\"a-text-italic\" style=\"font-style: italic !important;\">®</span>&nbsp;is as practical as it is insightful. Updated to reflect the complexities of relationships today, this new edition reveals intrinsic truths and applies relevant, actionable wisdom in ways that work.</div><div><span class=\"a-text-italic\" style=\"font-style: italic !important;\">Includes the Love Language assessment so you can discover your love language and that of your loved one.</span></div></div>',2,_binary '',4,'1.jpg','The 5 Love Languages',76,0,'A perennial New York Times bestseller for over a decade!\r\n\r\nFalling in love is easy. Staying in love—that’s the challenge. How can you keep your relationship fresh and growing amid the demands, conflicts, and just plain boredom of everyday life?','2024-01-24 09:49:06.509000',6,6,4,13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `answer_time` datetime(6) DEFAULT NULL,
  `approved` bit(1) NOT NULL,
  `ask_time` datetime(6) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `votes` int NOT NULL,
  `answerer_id` int DEFAULT NULL,
  `asker_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm993xs48yltdhr0qws3s1mpdn` (`answerer_id`),
  KEY `FKfujdy3kc9esehjrifstaahivi` (`asker_id`),
  KEY `FKdnt39hlm1bcye9ivenccipd5s` (`product_id`),
  CONSTRAINT `FKdnt39hlm1bcye9ivenccipd5s` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKfujdy3kc9esehjrifstaahivi` FOREIGN KEY (`asker_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKm993xs48yltdhr0qws3s1mpdn` FOREIGN KEY (`answerer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_votes`
--

DROP TABLE IF EXISTS `questions_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2er6vquw4ya7cl6ovtcx9vvm9` (`customer_id`),
  KEY `FKehqtpwaad8w20qfxc8aqj0uiy` (`question_id`),
  CONSTRAINT `FK2er6vquw4ya7cl6ovtcx9vvm9` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKehqtpwaad8w20qfxc8aqj0uiy` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_votes`
--

LOCK TABLES `questions_votes` WRITE;
/*!40000 ALTER TABLE `questions_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `rating` int NOT NULL,
  `review_time` datetime(6) NOT NULL,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4sm0k8kw740iyuex3vwwv1etu` (`customer_id`),
  KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  CONSTRAINT `FK4sm0k8kw740iyuex3vwwv1etu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_votes`
--

DROP TABLE IF EXISTS `reviews_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `votes` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKckuygkph4k9llo624gn30lxvy` (`customer_id`),
  KEY `FKosupda11xqkvo80r77evmwrey` (`review_id`),
  CONSTRAINT `FKckuygkph4k9llo624gn30lxvy` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKosupda11xqkvo80r77evmwrey` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_votes`
--

LOCK TABLES `reviews_votes` WRITE;
/*!40000 ALTER TABLE `reviews_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(150) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Manage everything','Admin'),(2,'Manage product price, customers, shipping...','Salesperson'),(3,'Manage categories, brands, products...','Editor'),(4,'View products, view orders and update...','Shipper'),(5,'Manage questions and reviews','Assistant');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(2048) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `heading` varchar(256) NOT NULL,
  `section_order` int DEFAULT NULL,
  `type` enum('PRODUCT','CATEGORY','BRAND','ARTICLE','TEXT','ALL_CATEGORIES') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i816mxaoddmtveofp1qjbnngf` (`heading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_articles`
--

DROP TABLE IF EXISTS `sections_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_order` int DEFAULT NULL,
  `article_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKguoivqg4rnmm8nilb12x40ygh` (`article_id`),
  KEY `FKnbym8cke5rnxjm8bdi70dapl` (`section_id`),
  CONSTRAINT `FKguoivqg4rnmm8nilb12x40ygh` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `FKnbym8cke5rnxjm8bdi70dapl` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_articles`
--

LOCK TABLES `sections_articles` WRITE;
/*!40000 ALTER TABLE `sections_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_authors`
--

DROP TABLE IF EXISTS `sections_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_order` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl1m55to2rw4fdie4js5ofnryp` (`author_id`),
  KEY `FK9x11fojtld4bwh309y78yeviy` (`section_id`),
  CONSTRAINT `FK9x11fojtld4bwh309y78yeviy` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `FKl1m55to2rw4fdie4js5ofnryp` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_authors`
--

LOCK TABLES `sections_authors` WRITE;
/*!40000 ALTER TABLE `sections_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_categories`
--

DROP TABLE IF EXISTS `sections_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_order` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4oqn5st47mm34yvnt3criccsh` (`category_id`),
  KEY `FK7ivge0x7bydfh10vw3d0n837j` (`section_id`),
  CONSTRAINT `FK4oqn5st47mm34yvnt3criccsh` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK7ivge0x7bydfh10vw3d0n837j` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_categories`
--

LOCK TABLES `sections_categories` WRITE;
/*!40000 ALTER TABLE `sections_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_products`
--

DROP TABLE IF EXISTS `sections_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_order` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5lf8i896cqdnc9shitywps2l` (`product_id`),
  KEY `FKjmh450o9k6x0hrmrumemucg1b` (`section_id`),
  CONSTRAINT `FKjmh450o9k6x0hrmrumemucg1b` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `FKl5lf8i896cqdnc9shitywps2l` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_products`
--

LOCK TABLES `sections_products` WRITE;
/*!40000 ALTER TABLE `sections_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `category` enum('GENERAL','MAIL_SERVER','MAIL_TEMPLATES','CURRENCY','PAYMENT') NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('COPYRIGHT','eCommerce','GENERAL'),('CURRENCY_ID','1','CURRENCY'),('CURRENCY_SYMBOL','$','CURRENCY'),('CURRENCY_SYMBOL_POSITION','Before price','CURRENCY'),('CUSTOMER_VERIFY_CONTENT','<span style=\"font-size:18px;\">Dear [[name]],<br><br>\r\n</span><div><span style=\"font-size:18px;\">Click the link below to verify your registration:</span></div><h2><br></h2><h2>\r\n\r\n<a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h2><div><span style=\"font-size: 18px;\"><br></span><div><span style=\"font-size:18px;\">\r\n<br>\r\nThank you,<br>\r\nThe Revel Team.</span><span style=\"font-size:16px;\"></span><span style=\"font-size:16px;\"></span></div></div>','MAIL_TEMPLATES'),('CUSTOMER_VERIFY_SUBJECT','Please verify your registration to continue shopping','MAIL_TEMPLATES'),('DECIMAL_DIGITS','2','CURRENCY'),('DECIMAL_POINT_TYPE','POINT','CURRENCY'),('MAIL_FROM','triquang.15qt@gmail.com','MAIL_SERVER'),('MAIL_HOST','smtp.gmail.com','MAIL_SERVER'),('MAIL_PASSWORD','jmvb vexx ktsx mpom','MAIL_SERVER'),('MAIL_PORT','587','MAIL_SERVER'),('MAIL_SENDER_NAME','Online Revel Store','MAIL_SERVER'),('MAIL_USERNAME','triquang.15qt@gmail.com','MAIL_SERVER'),('ORDER_CONFIRMATION_CONTENT','Dear [[name]],&nbsp;<div>This email is to confirm that you have successfully placed an order through our website. Please review the following order summary:<div><br></div></div><div>- Order ID: [[orderId]]</div><div>- Order time: [[orderTime]]</div><div>- Ship to: [[shippingAddress]]</div><div>- Total: [[total]]</div><div>- Payment method: [[paymentMethod]]</div><div><br></div><div>We\'re currently processing your order. Click here to view full details of your order on our website (login required).</div><div><br></div><div>Thanks for purchasing products at Shopme.</div><div>The Revel Team.</div>','MAIL_TEMPLATES'),('ORDER_CONFIRMATION_SUBJECT','Confirmation of your order ID #[[orderId]]','MAIL_TEMPLATES'),('PAYPAL_API_BASE_URL','https://api-m.sandbox.paypal.com','PAYMENT'),('PAYPAL_API_CLIENT_ID','AfDgai4kOB-komrgjZ5Im7H0kohy_k-a5DT8occMa00803M_lmi_EZAdY0ZZf3fiH9B6NOwpD3LSo8WZ','PAYMENT'),('PAYPAL_API_CLIENT_SECRET','EO4gQuwAEHG9ZWIQ8DYFnk3sXGH1rPgGJeoovuGInVOTjgu6yN84NLnCQrtLdFUgyD76QTpuNj3Nx3j7','PAYMENT'),('SITE_LOGO','/site-logo/logo-black.png','GENERAL'),('SITE_NAME','Online Book Store','GENERAL'),('SMTP_AUTH','true','MAIL_SERVER'),('SMTP_SECURED','true','MAIL_SERVER'),('THOUSANDS_POINT_TYPE','COMMA','CURRENCY');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rates`
--

DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `state` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `days` int NOT NULL,
  `cod_supported` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKef7sfgeybt3xn13nlt2j6sljw` (`country_id`),
  CONSTRAINT `FKef7sfgeybt3xn13nlt2j6sljw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (2,234,'New York',10,7,_binary ''),(3,234,'Florida',12,6,_binary '\0'),(5,242,'Hanoi',3.98,2,_binary ''),(6,234,'California',11.56,6,_binary '\0'),(7,242,'Hai Phong',3.93,2,_binary '\0'),(8,242,'Bac Giang',4.12,2,_binary '\0'),(9,242,'Phu Tho',4.21,3,_binary '\0'),(10,242,'Thanh Hoa',3.52,1,_binary ''),(11,106,'Karnataka',8.22,5,_binary '\0'),(12,106,'Maharashtra',8.69,5,_binary ''),(13,106,'Meghalaya',8.1,4,_binary '\0'),(14,106,'Punjab',7.89,3,_binary '\0'),(15,106,'Tamil Nadu',8.25,4,_binary '\0'),(16,106,'Telangana',7.72,4,_binary '\0'),(17,242,'Da Nang',0.5,1,_binary ''),(18,234,'Ohio',11.5,8,_binary ''),(19,78,'London',9.88,6,_binary '\0'),(20,106,'Delhi',8.45,5,_binary ''),(21,106,'West Bengal',8.88,5,_binary ''),(22,78,'Barton',7.78,6,_binary ''),(23,106,'Andhra Pradesh',8.12,6,_binary ''),(24,234,'Tennessee',12,8,_binary '\0'),(25,234,'Massachusetts',11.85,7,_binary ''),(26,14,'Queensland',4.99,5,_binary ''),(27,199,'Singapore',3.33,3,_binary ''),(28,39,'British Columbia',9.88,7,_binary ''),(29,14,'New South Wales',4.57,6,_binary ''),(30,234,'Illinois',13,9,_binary '');
/*!40000 ALTER TABLE `shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKskkdphjml9vjlrqn4m5hi251y` (`country_id`),
  CONSTRAINT `FKskkdphjml9vjlrqn4m5hi251y` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Ha Noi',242),(2,'Da Nang',242),(3,'New York',234),(4,'California',234),(5,'Ho Chi Minh City',242),(6,'Hai Phong',242),(7,'Bac Giang',242),(8,'Son La',242),(9,'Quang Ninh',242),(10,'Nghe An',242),(12,'Utah',234),(13,'Washington',234),(14,'Florida',234),(15,'Illinois',234),(16,'Texas',234),(18,'Colorado',234),(19,'Alaska',234),(20,'Can Tho',242),(22,'Binh Duong',242),(23,'Thanh Hoa',242),(24,'Andhra Pradesh',106),(25,'Arunachal Pradesh',106),(26,'Assam',106),(27,'Bihar',106),(28,'Haryana',106),(29,'Himacha Pradesh',106),(30,'Karnataka',106),(31,'Maharashtra',106),(32,'Meghalaya',106),(33,'Punjab',106),(34,'Tamil Nadu',106),(35,'Telangana',106),(36,'Uttar Pradesh',106),(37,'West Bengal',106),(38,'Bac Ninh',242),(40,'Ha Tinh',242),(41,'Hue',242),(42,'Binh Dinh',242),(43,'An Giang',242),(44,'Blackpool',78),(45,'London',78),(46,'Liverpool',78),(47,'Manchester',78),(48,'Newcastle',78),(49,'Bristol',78),(50,'Cambridge',78),(51,'Lang Son',242),(52,'Delhi',106),(53,'Hawaii',234),(54,'Georgia',234),(55,'Pennsylvania',234),(56,'Virginia',234),(57,'Arizona',234),(59,'Kerala',106),(60,'Rajasthan',106),(61,'Odisha',106),(62,'Mizoram',106),(63,'Sikkim',106),(64,'Manipur',106),(65,'Nagaland',106),(66,'Tripura',106),(67,'Jharkhand',106),(68,'Uttarakhand',106),(69,'Goa',106),(70,'Madhya Pradesh',106),(71,'Gujarat',106),(72,'Massachusetts',234),(73,'Indiana',234),(74,'Michigan',234),(75,'Ohio',234),(76,'New Jersey',234),(77,'Minnesota',234),(78,'North Carolina',234),(79,'Oregon',234),(80,'Maryland',234),(81,'Tennessee',234),(82,'Montana',234),(83,'Maine',234),(84,'Alabama',234),(85,'Wisconsin',234),(86,'Louisiana',234),(87,'Connecticut',234),(88,'Missouri',234),(89,'South Carolina',234),(90,'Mississippi',234),(91,'New Mexico',234),(92,'Nevada',234),(93,'Kentucky',234),(94,'Arkansas',234),(95,'Wyoming',234),(96,'Kansas',234),(97,'Delaware',234),(98,'Iowa',234),(99,'Idaho',234),(100,'Nebraska',234),(101,'Rhode Island',234),(102,'Vermont',234),(103,'South Dakota',234),(104,'New Hamsphire',234),(105,'West Virginia',234),(106,'North Dakota',234),(107,'Oklahoma',234),(109,'Nam Dinh',242),(110,'Khanh Hoa',242),(112,'Tay Ninh',242),(113,'Kien Giang',242),(114,'Lai Chau',242),(115,'Lao Cai',242),(116,'Ha Giang',242),(117,'Hoa Binh',242),(118,'Thai Binh',242),(119,'Dong Nai',242),(120,'Soc Trang',242),(121,'Bac Lieu',242),(123,'Ca Mau',242),(124,'Quang Binh',242),(125,'Quang Tri',242),(126,'Quang Nam',242),(127,'Quang Ngai',242),(128,'Gia Lai',242),(129,'Vinh Phuc',242),(130,'Lam Dong',242),(131,'Dak Lak',242),(132,'Phu Yen',242),(133,'Binh Phuoc',242),(134,'Dak Nong',242),(135,'Dong Thap',242),(136,'Hau Giang',242),(137,'Ba Ria Vung Tau',242),(138,'Binh Thuan',242),(139,'Hai Duong',242),(140,'Hung Yen',242),(141,'Thai Nguyen',242),(142,'Long An',242),(143,'Ben Tre',242),(144,'Bac Kan',242),(145,'Ninh Binh',242),(146,'Kon Tum',242),(147,'Tra Vinh',242),(148,'Yen Bai',242),(149,'Tuyen Quang',242),(150,'Phu Tho',242),(151,'Vinh Long',242),(152,'New South Wales',14),(153,'Queensland',14),(154,'Tasmania',14),(155,'Western Australia',14),(156,'Victoria',14),(157,'South Australia',14),(158,'Ontario',39),(159,'Quebec',39),(160,'Nova Scotia',39),(161,'New Brunswick',39),(162,'Manitoba',39),(163,'British Columbia',39),(164,'Prince Edward Island',39),(165,'Saskatchewan',39),(166,'Alberta',39),(167,'Newfoundland and Labrador',39),(168,'Grand Est',76),(169,'Hauts-de-France',76),(170,'Normandy',76),(171,'Nouvelle-Aquitaine',76),(172,'Occitanie',76),(173,'Brittany',76),(174,'Centre-Val de Loire',76),(175,'Corsica',76),(176,'French Guiana',76),(177,'Guadeloupe',76),(178,'Île-de-France',76),(179,'Martinique',76),(180,'Mayotte',76),(181,'Pays de la Loire',76),(182,'Provence-Alpes-Côte d\'Azur',76),(183,'Réunion',76),(184,'Aichi',115),(185,'Akita',115),(186,'Chiba',115),(187,'Ehime',115),(188,'Fukui',115),(189,'Fukuoka',115),(190,'Fukushima',115),(191,'Gunma',115),(192,'Kobe',115),(193,'Hiroshima',115),(194,'Hokkaido',115),(195,'Ishikawa',115),(196,'Kagawa',115),(197,'Kochi',115),(198,'Kyoto',115),(199,'Nagasaki',115),(200,'Okinawa',115),(201,'Osaka',115),(202,'Saga',115),(203,'Tokushima',115),(204,'Tokyo',115),(205,'Yamagata',115),(206,'Yamaguchi',115),(207,'Yamanashi',115),(208,'Greater Poland',180),(209,'Kuyavia-Pomerania',180),(210,'Lesser Poland',180),(211,'Łódź',180),(212,'Lower Silesia',180),(213,'Lublin',180),(214,'Lubusz',180),(215,'Masovia',180),(216,'Opole',180),(217,'Podlaskie',180),(218,'Pomerania',180),(219,'Silesia',180),(220,'Subcarpathia',180),(221,'Holy Cross Province',180),(222,'Warmia-Masuria',180),(223,'West Pomerania',180),(224,'Baden-Württemberg',58),(225,'Bavaria',58),(226,'Berlin',58),(227,'Brandenburg',58),(228,'Bremen',58),(229,'Hamburg',58),(230,'Hesse',58),(231,'Lower Saxony',58),(232,'Mecklenburg-Vorpommern',58),(233,'North Rhine- Westphalia',58),(234,'Rhineland-Palatinate',58),(235,'Saarland',58),(236,'Saxony',58),(237,'Saxony-Anhalt',58),(238,'Schleswig-Holstein',58),(239,'Thuringia',58),(240,'Acre',32),(241,'Alagoas',32),(242,'Amapá',32),(243,'Amazonas',32),(244,'Bahia',32),(245,'Ceará',32),(246,'Distrito Federal',32),(247,'Espírito Santo',32),(248,'Goiás',32),(249,'Maranhão',32),(250,'Mato Grosso',32),(251,'Minas Gerais',32),(252,'Pará',32),(253,'Paraíba',32),(254,'Paraná',32),(255,'Pernambuco',32),(256,'Piauí',32),(257,'Rio de Janeiro',32),(258,'Rio Grande do Norte',32),(259,'Rio Grande do Sul',32),(260,'Rondônia',32),(261,'Roraima',32),(262,'Santa Catarina',32),(263,'São Paulo',32),(264,'Sergipe',32),(265,'Tocantins',32),(266,'Adana',226),(267,'Adıyaman',226),(268,'Ankara',226),(269,'Balıkesir',226),(270,'Bilecik',226),(271,'Bingöl',226),(272,'Bursa',226),(273,'Çanakkale',226),(274,'Çankırı',226),(275,'Çorum',226),(276,'Denizli',226),(277,'Diyarbakır',226),(278,'Edirne',226),(279,'Erzurum',226),(280,'Gaziantep',226),(281,'Giresun',226),(282,'Hakkâri',226),(283,'Hatay',226),(284,'Isparta',226),(285,'Istanbul',226),(286,'Konya',226),(287,'Malatya',226),(288,'Manisa',226),(289,'Iğdır',226),(290,'Karaman',226),(291,'Osmaniye',226),(292,'Tokat',226),(293,'Sivas',226),(294,'Sinop',226),(295,'Siirt',226),(296,'Batman',226),(297,'Kilis',226),(298,'Rize',226),(299,'Ordu',226),(300,'Tunceli',226),(301,'Yozgat',226),(302,'Van',226),(303,'Bayburt',226),(304,'Yalova',226),(305,'Samsun',226),(306,'Sakarya',226);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `photos` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'triquang.15qt@gmail.com',_binary '','Tri','Quang','$2a$10$DIEedlP939znOLUqvEDsOuYs5FCyybdiDC6pO5JA0WWlMeuf3HaDa','channels4_profile.jpg'),(4,'muhammad.evran13@gmail.com',_binary '','Muhammad','Evran','$2a$10$.mdKrWwHQI23QECbOhQPsuuZMqbuxDnJPACc7J5BEZzXaAGDSvdwC','ai-generated-8458048_1280.jpg'),(5,'kent.hervey8@gmail.com',_binary '','Kent','Hervey','$2a$10$YHXRsZ07/Btv.qCgGht.7u2PW.GLWzpVB7eabfgH1mhTVVXffDT6K',NULL),(7,'nathihsa@gmail.com',_binary '','Nathi','Sangweni','$2a$10$WyHmQiXCSYuHcGeg8eFWvOScqzSgg88MmqpajPdzSkLsvZjT3tKC.',NULL),(8,'ammanollashirisha2020@gmail.com',_binary '','Ammanolla','Shirisha','$2a$10$KMIGHYs3Z9bCvdvpx60Xse4Da35g5RjgY5d3HMTN9i8ZEssOPBMDK','girl-8136222_1280.jpg'),(10,'redsantosph@gmail.com',_binary '','Frederick','delos Santos','$2a$10$2UX8HbF3b1pRxNNM8GANzeF.AIQJXoGguAfZxdepvAxrL8TUeJ0dO','avatar-1495036_1280.jpg'),(12,'maytassatya@hotmail.com',_binary '\0','Satya','Narayana','$2a$10$R7EJcaYijjJo/IVk6c1CieBML2uP3RAKMVlCxylPAePlCfJsX7OOy',NULL),(13,'matthewefoli@gmail.com',_binary '\0','Matthew','Efoli','$2a$10$clNXcpozocz3H4bmzPaWu.QHz85IIv2JeLzca./JXr8u6rCF04OC.',NULL),(14,'davekumara2@gmail.com',_binary '\0','Dave','Kumar Singh','$2a$10$GrFj2WZGIOgSjLnzs81TFOQZEmvRrcMdeS/fsO3dzmDf6LU5j1UWC','istockphoto-1485350578-1024x1024.jpg'),(15,'jackkbruce@yahoo.com',_binary '','Jack','Bruce','$2a$10$3q1uOMgb74y4FJrMp4GPiestkBtPAMJUxe1H2wDOrU0EmZof73rS.','extraterrestrial-7004802_1280.jpg'),(16,'zirri.mohamed@gmail.com',_binary '\0','Mohamed','Zirri','$2a$10$TmvyH1AoyDqRmQ4uC8NAZOOV29CPEDGuxVsHLP1cJoHQGr78L4kjW',NULL),(17,'mk.majumdar009@hotmail.com',_binary '','Mithun','Kumar Majumdar','$2a$10$Q7SKtSujMf5yXBHE90otzulHDQRUGdBJBP0YRvZItpT3Xsfaxs/Me','skull-151181_1280.png'),(20,'s.stasovska82@hotmail.com',_binary '','Svetlana','Stasovska','$2a$10$fUK.hkaoHbh.i2n0bHAi2OqPJaKodjdEHb.iuvwc4L.hYz0kcJiRS','extraterrestrial-7004805_1280.png'),(21,'mikegates2012@gmail.com',_binary '','Mike','Gates','$2a$10$zIO1tygsw6cB2ymiR.WX0ulr9NKdTlZHqu7w/W/LLwk8HhK7nVnH.',NULL),(22,'pedro.quintero.2000@gmail.com',_binary '','Pedro','Quintero','$2a$10$oNgxpslGQmgZewkxe0k36Oo4DcfHycUBdK5C5XS7YDw2qDQevzIMa','second-life-1625903_1280.jpg'),(23,'amina.elshal2@yahoo.com',_binary '','Amina','Elshal Ahi','$2a$10$DwTOZ4o/zCyU4M4R6ihMeui1y4KVERxjuzFAtRLCsuBTatu6N74Bm','avatar-1606916_1280.png'),(33,'Hana@gmail.com',_binary '','Hana','Mir','$2a$10$wgbdQHHrOXFSDQPuJnRbmOmOEM.Xrg9q4oV33TFfwI/nESILoaPNy','female-296990_1280.png'),(34,'Kravi@gmail.com',_binary '','Kravi','Bia','$2a$10$AIquENd1Lamk1AIoZrwp5.y0IzcauGgYLrlbbBEJSgqxKuUH8LiJW','avatar-1687700_1280.jpg'),(36,'admin@gmail.com',_binary '','Super','Admin','$2a$10$ppEl8SuHk5Hq0a11Jq.ptOtuyQwo8n7onDuHHRKijpKVe2G0AxdYC','person-304893_1280.png'),(37,'iftikarahmed@gmail.com',_binary '','Iftikar ','Ammed','$2a$10$qwPTYO0vXUc5HmL8OuwKjeIAbq1MbceHKSYaecteSyuKrEzOP/oeq',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(36,1),(10,2),(12,2),(13,2),(20,2),(23,2),(33,2),(37,2),(4,3),(5,3),(7,3),(8,3),(15,3),(20,3),(14,4),(16,4),(17,4),(23,4),(33,4),(34,4),(37,4),(5,5),(8,5),(14,5),(15,5),(20,5),(21,5),(22,5),(34,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-27 16:32:35

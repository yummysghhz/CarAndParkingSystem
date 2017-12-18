-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: car2
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `car_order`
--

DROP TABLE IF EXISTS `car_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_order` (
  `id` varchar(50) NOT NULL,
  `license_plate` varchar(12) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `subscription_price` int(11) NOT NULL,
  `oil_price` int(11) NOT NULL,
  `state` varchar(15) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `tenant_id` (`tenant_id`),
  CONSTRAINT `car_order_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `car_order_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_order`
--

LOCK TABLES `car_order` WRITE;
/*!40000 ALTER TABLE `car_order` DISABLE KEYS */;
INSERT INTO `car_order` VALUES ('060e20b3-1a18-43a1-8fbc-69d19512173a','license54',5,21,50,10,'待确认','2017-12-18 13:22:19'),('0e80582f-b292-4836-b828-1400f09a88b8','hnbgfc',21,1,50,10,'审核通过','2017-12-18 12:19:20'),('0f5042f6-b607-43d1-90dc-13b922b19599','license51',5,21,50,10,'待付款','2017-12-17 21:59:51'),('1697ffa3-1ca4-4cb5-84f4-767b53804a92','heheda',21,1,50,10,'待审核','2017-12-18 11:56:56'),('1f0f3473-db93-4e49-a9b1-ca0da773b9be','license64',5,21,50,10,'待付款','2017-12-17 21:59:51'),('25dbf1d5-5cc6-4c07-818a-15d427f8f5f8','hello23',21,21,50,10,'待确认','2017-12-18 12:50:24'),('2b3b5c88-2456-42a9-a3f3-08d7a7a339ab','license59',5,21,50,10,'待付款','2017-12-17 21:59:51'),('305428b0-349a-4542-b082-f5b5bc7dee90','license69',5,21,50,10,'完成','2017-12-18 13:22:11'),('483507c7-e6a2-43e3-ace4-554093d2a331','license66',5,21,50,10,'待确认','2017-12-18 13:22:30'),('576924c8-ab89-4347-8777-95d063e7947f','license60',5,21,50,10,'待付款','2017-12-17 21:59:51'),('602a6663-d7da-4aec-9e94-59ee4454e52e','heh456',21,21,50,10,'完成','2017-12-18 13:22:09'),('7a383010-1b29-4d88-8ca2-6f3bd46db434','license57',5,21,50,10,'待付款','2017-12-17 21:59:51'),('7b22f356-2634-4b3b-b8ef-bc3077100078','hukh8',21,1,50,10,'审核通过','2017-12-18 13:07:43'),('7d6deb3e-f77a-4399-a0e7-fe2d8c83c5be','license68',5,21,50,10,'待付款','2017-12-17 21:59:51'),('7e84253d-0495-4c60-a97b-66c70ee0e21c','license53',5,21,50,10,'待确认','2017-12-18 13:22:28'),('8249f3d7-b726-4910-af08-61f0229d3627','license61',5,21,50,10,'待确认','2017-12-18 13:07:25'),('9e9a2d5e-b6c2-4c90-b6cb-72c1cc6c4274','license65',5,21,50,10,'待付款','2017-12-17 21:59:51'),('ad51df32-ee82-420b-9c47-a68a5ea0166b','plate99',21,1,50,10,'审核通过','2017-12-18 12:19:24'),('b158c05d-7bf4-4e23-9a8c-efe3f07c675f','hhh789',21,21,50,10,'完成','2017-12-18 13:22:12'),('b772ba04-211d-406c-8f08-1e1692f079cb','license50',5,21,50,10,'待确认','2017-12-18 13:22:23'),('bc0ffccf-ecd2-409e-9120-aac2fbf8e23f','license56',5,21,50,10,'待付款','2017-12-17 21:59:51'),('c49792fa-5bd5-4e3d-aea9-a4cd94418074','license67',5,21,50,10,'待付款','2017-12-17 21:59:51'),('cb4c62a0-13c3-4fa6-84c6-e1e5216b0c42','license63',5,21,50,10,'待确认','2017-12-18 13:22:26'),('cf0d8183-4bc0-418c-a314-cd25e49f6d06','license55',5,21,50,10,'待付款','2017-12-17 21:59:51'),('d74a151f-2c19-41f7-abc5-831b57745e3c','license50',5,21,50,10,'待付款','2017-12-17 21:58:09'),('d74a151f-2c19-41f7-abc5-831b5774edft','license50',14,18,50,10,'待确认','2017-12-18 12:50:18'),('d74a151f-2c19-41f7-abc5-831b57nju64t','license47',14,1,50,10,'待付款','2017-12-17 23:47:02'),('d74a151f-678i-sfg6-abc5-831b5774edft','license70',11,14,50,10,'待付款','2017-12-17 22:17:50'),('e927013f-a6dc-47c6-b12e-a6ab3aca7c11','license58',5,21,50,10,'待付款','2017-12-17 21:59:51'),('fba5acf5-f610-4db0-b7b6-35efcb22c149','license52',5,21,50,10,'待付款','2017-12-17 21:59:51'),('fdba2beb-7d08-4902-a254-7436d9fe7f6a','license62',5,21,50,10,'待付款','2017-12-17 21:59:51');
/*!40000 ALTER TABLE `car_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_price`
--

DROP TABLE IF EXISTS `car_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_price` (
  `oil_price` int(11) NOT NULL,
  `subscription_price` int(11) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_price`
--

LOCK TABLES `car_price` WRITE;
/*!40000 ALTER TABLE `car_price` DISABLE KEYS */;
INSERT INTO `car_price` VALUES (10,50,'2017-12-17 21:41:02');
/*!40000 ALTER TABLE `car_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demand_list`
--

DROP TABLE IF EXISTS `demand_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demand_list` (
  `id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `state` varchar(15) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `demand_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand_list`
--

LOCK TABLES `demand_list` WRITE;
/*!40000 ALTER TABLE `demand_list` DISABLE KEYS */;
INSERT INTO `demand_list` VALUES ('24046c671b764094b3dcf255153e3821',9,'My description is c18a94d0-7b51-474c-aa5e-9aecddd8ea9b','待审核','2017-12-16 20:42:43'),('3a0506a1-fd3f-4e14-890c-11dfbaecfce3',21,'hhhdnncnbckwlqbc','待审核','2017-12-18 12:19:49'),('4c27d29e-a11b-4535-811d-a242e2035884',21,'哈哈哈','需求已解决','2017-12-17 20:31:33'),('52361c5c3f8b4f76a0d1e80ceb0d4888',4,'My description is 99470f17-a717-4f0b-949a-5e2f69515884','已取消','2017-12-17 20:16:20'),('557a1c6f-8c41-4fcc-ad1e-bad9d393ef29',21,'车要新一点','需求已解决','2017-12-17 21:11:43'),('5babc76e11d0417dbb11eb408d82153f',3,'My description is 2c76d31d-dbd2-4a42-8de7-129652f14ef9','审核通过','2017-12-17 20:16:10'),('5c434c50-0a7e-4ebc-bc26-ab06c32d5245',21,'gahaha','审核通过','2017-12-18 12:04:28'),('6721d640-5c2d-4c3d-99b1-7e7f75770c05',21,'hehehehehehehehe','审核通过','2017-12-18 12:04:29'),('6c0fdeb6-52a8-44f9-9ea2-833eeac84e77',21,'车要好看一点','需求已解决','2017-12-17 21:09:09'),('743acb99-5668-4ac4-b6d5-651faa857e5c',21,'hhhhhhhhhhhh','需求已解决','2017-12-17 21:13:38'),('79e58c12e24e44c192868c929cbdaf3b',6,'My description is 62e5aa65-bbde-4451-91f6-9cb19251f8c6','已取消','2017-12-17 20:16:18'),('80ef7bb2-9d57-46f2-b33d-9a92e9b22eea',21,'miao','已取消','2017-12-17 21:01:12'),('930e0f1ccd614b19bac6da6e6257e0bc',5,'My description is 30a0461b-85a1-4630-a95c-72391a9331da','已取消','2017-12-17 20:16:15'),('940ea10703644421b26ed574deec9dfb',8,'My description is 079ca668-606b-47c0-8fd6-d492b4932b40','审核通过','2017-12-17 20:16:11'),('a05c337b-b0e7-44d2-bd59-77840250c159',21,'让我这条消息发出去吧qaq','需求已解决','2017-12-17 20:32:24'),('bd5f0e79-50ad-4139-8692-b9ee620e6283',21,'hahaha','需求已解决','2017-12-18 13:03:23'),('bd6d9cbb-f504-4b87-a776-0b9233f8c877',21,'vbfjkvfs','需求已解决','2017-12-18 13:03:56'),('c710b219746e4678a08c08188b432f99',10,'My description is 982c06ef-fbe1-495a-b248-a67ca9f9f47a','审核通过','2017-12-18 12:04:09'),('d142a242fe194b15a67574eef974b735',2,'My description is 00a8ed4c-c2f1-4d13-847d-36363b3062c4','待审核','2017-12-16 20:42:43');
/*!40000 ALTER TABLE `demand_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_space`
--

DROP TABLE IF EXISTS `parking_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_space` (
  `id` int(11) NOT NULL,
  `state` varchar(10) NOT NULL,
  `location` varchar(20) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_space`
--

LOCK TABLES `parking_space` WRITE;
/*!40000 ALTER TABLE `parking_space` DISABLE KEYS */;
INSERT INTO `parking_space` VALUES (1,'空闲','zone1','2017-12-18 13:04:45'),(2,'已被预定','zone2','2017-12-17 16:24:49'),(3,'已被预订','zone3','2017-12-16 19:29:48'),(4,'空闲','zone4','2017-12-17 18:07:33'),(5,'空闲','zone5','2017-12-17 12:14:56'),(6,'空闲','zone6','2017-12-17 18:06:17'),(7,'空闲','zone7','2017-12-16 22:31:41'),(8,'空闲','zone8','2017-12-18 11:59:22'),(9,'空闲','zone9','2017-12-17 18:14:40'),(10,'使用中','zone10','2017-12-16 19:29:48'),(11,'已被预订','zone11','2017-12-16 19:29:48'),(12,'已被预订','zone12','2017-12-16 19:29:48'),(13,'已被预订','zone13','2017-12-16 19:29:48'),(14,'已被预订','zone14','2017-12-16 19:29:48'),(15,'已被预订','zone15','2017-12-16 19:29:48'),(16,'已被预订','zone16','2017-12-16 19:29:48'),(17,'已被预订','zone17','2017-12-16 19:29:48'),(18,'已被预订','zone18','2017-12-16 19:29:48'),(19,'已被预订','zone19','2017-12-16 19:29:48'),(20,'已被预订','zone20','2017-12-16 19:29:48');
/*!40000 ALTER TABLE `parking_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_space_order`
--

DROP TABLE IF EXISTS `parking_space_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_space_order` (
  `id` varchar(50) NOT NULL,
  `space_id` int(11) NOT NULL,
  `license_plate` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` varchar(15) NOT NULL,
  `update_time` datetime NOT NULL,
  `duration` varchar(20) NOT NULL,
  `price_in_all` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plate` (`license_plate`),
  KEY `space_id` (`space_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `parking_space_order_ibfk_1` FOREIGN KEY (`space_id`) REFERENCES `parking_space` (`id`),
  CONSTRAINT `parking_space_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_space_order`
--

LOCK TABLES `parking_space_order` WRITE;
/*!40000 ALTER TABLE `parking_space_order` DISABLE KEYS */;
INSERT INTO `parking_space_order` VALUES ('03af37fd-7198-4c0c-a237-fcd00dd4983a',8,'hnui87',21,'已取消','2017-12-18 11:59:22','2个月0天',2000),('040f734719944012b54f828c829635e5',9,'plate29',9,'申请取消','2017-12-17 14:49:13','1个月12天',1720),('177c4b0a-b1d8-476b-966b-a92d17562b20',1,'qwe123',21,'已取消','2017-12-17 18:52:56','0个月2天',120),('18f81cb6-502e-45a2-b7bb-5c609bcb5398',8,'dghgf9',23,'完成','2017-12-17 18:15:46','1个月0天',1000),('220e5290-03cb-4c96-beaa-28c00f36fc22',8,'ghj890',21,'完成','2017-12-17 17:59:57','2个月8天',2480),('2997a13764a64853ac1a20762f13d731',6,'plate26',6,'待付款','2017-12-17 14:46:13','5个月12天',5720),('2e0baa759e984b99806c022277504a26',7,'plate27',7,'待付款','2017-12-17 14:46:13','1个月21天',2260),('2e748c87527c439b9a99242a0260c46e',3,'plate23',3,'申请取消','2017-12-17 14:49:14','1个月3天',1180),('3282daa2b0f74c0fad0698245d3a6f4e',8,'plate28',8,'待付款','2017-12-17 14:46:13','3个月14天',3840),('3f5e8e23a8e64b9abf1621b69bdeb13e',4,'plate24',4,'已取消','2017-12-17 14:49:20','5个月25天',6500),('6ce3d11c-3cc7-4e51-bdfb-ff8306cb2a99',6,'der6hg',21,'已取消','2017-12-17 18:06:17','0个月5天',300),('7bd1fd21-7391-4c2e-9360-49f445f44b8f',6,'tyu456',21,'完成','2017-12-17 17:56:47','5个月0天',5000),('841d9ff89854426790cf031d3d1f1604',10,'plate30',10,'待付款','2017-12-17 14:46:13','3个月5天',3300),('8671ec00-faa2-466c-b219-55c337fc6319',1,'hjklop0',21,'已取消','2017-12-17 18:55:37','0个月7天',420),('9e8666ca80bb4432b3d43ce7dbdd81aa',2,'plate22',2,'待付款','2017-12-17 14:46:13','1个月11天',1660),('a379f741-8a0e-4b94-9e69-dcb9efe922dc',9,'hjkl90',23,'完成','2017-12-17 18:14:40','0个月7天',420),('a7d7830c-ad6a-4eb1-882a-3d9e4363fe2c',8,'hbmnv6',21,'已取消','2017-12-17 19:05:59','0个月9天',540),('a936f948-d91d-44ed-ae56-add23f525d22',6,'qwe23',21,'完成','2017-12-17 17:52:56','4个月8天',4480),('b16f6dda-1615-4271-a84d-8b35a347c51e',1,'ertgcc6',21,'已取消','2017-12-18 13:04:45','0个月6天',360),('bc1a84cc-b289-4d27-b3d4-df9b0f6d861b',8,'hjkmn7',21,'已取消','2017-12-17 19:02:21','0个月6天',360),('c1abff52-cf70-49dd-8a3a-1ab8558351ba',2,'yui567',21,'申请取消','2017-12-17 16:24:55','1个月5天',1300),('d6cf76dec51b4b13bb7f27efc993d9f7',5,'plate25',5,'待付款','2017-12-17 14:46:13','4个月9天',4540),('d6e82df5-cfd6-4319-84a3-094be03ff77b',4,'sdfr56',21,'完成','2017-12-17 18:07:33','0个月5天',300),('fd9a66bea1b84905a4fe37c77c6ca9a3',1,'plate21',1,'待付款','2017-12-17 14:46:13','5个月24天',6440);
/*!40000 ALTER TABLE `parking_space_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_space_price`
--

DROP TABLE IF EXISTS `parking_space_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking_space_price` (
  `daily_price` int(11) NOT NULL,
  `monthly_price` int(11) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_space_price`
--

LOCK TABLES `parking_space_price` WRITE;
/*!40000 ALTER TABLE `parking_space_price` DISABLE KEYS */;
INSERT INTO `parking_space_price` VALUES (60,1000,'2017-12-17 13:07:51');
/*!40000 ALTER TABLE `parking_space_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL,
  `license_id` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `license_id` (`license_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'无','pswd1','user','license1'),(2,'name2','pswd2','user','license2'),(3,'name3','pswd3','user','license3'),(4,'name4','pswd4','user','license4'),(5,'name5','pswd5','user','license5'),(6,'name6','pswd6','user','license6'),(7,'name7','pswd7','user','license7'),(8,'name8','pswd8','user','license8'),(9,'name9','pswd9','user','license9'),(10,'name10','pswd10','user','license10'),(11,'name11','pswd11','user','license11'),(12,'name12','pswd12','user','license12'),(13,'name13','pswd13','user','license13'),(14,'name14','pswd14','user','license14'),(15,'name15','pswd15','user','license15'),(16,'name16','pswd16','user','license16'),(17,'name17','pswd17','user','license17'),(18,'name18','pswd18','user','license18'),(19,'name19','pswd19','user','license19'),(20,'name20','pswd20','user','license20'),(21,'aaa','aaa','user','license21'),(22,'qqq','qqq','admin','license22'),(23,'admin','admin','admin','license23'),(24,'ppp','ppp','user','license24');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-18 13:29:31

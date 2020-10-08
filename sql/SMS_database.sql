-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: sms_dev
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品编号id',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `qrCode` varchar(40) DEFAULT NULL COMMENT '二维码编号（货物类型-所在货架-行列编号）',
  `num` int DEFAULT '0' COMMENT '货物数量',
  `description` mediumtext COMMENT '货物描述',
  `type` varchar(5) NOT NULL COMMENT '货物类型，对应货物类型表（commodity_type）',
  `price` double NOT NULL COMMENT '货物价格',
  PRIMARY KEY (`id`),
  KEY `commodity_type_idx` (`type`),
  CONSTRAINT `commodity_type` FOREIGN KEY (`type`) REFERENCES `commodity_type` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (2,'牙刷','DL-A-1101',200,'很柔软的牙刷','DL',10),(3,'脸盆','DL-A-0210',50,'很实用的脸盆','DL',30),(4,'小熊饼干','FD-B-1020',300,'很好吃的小熊饼干','FD',5),(5,'小熊饼干1','FD-B-1021',300,'很好吃的小熊饼干1','FD',5),(6,'小熊饼干2','FD-B-1022',300,'很好吃的小熊饼干2','FD',5),(9,'香蕉','FD-C-0101',1000,'很甜很糯的香蕉真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的真的','FD',9.9),(10,'螺丝刀A','TL-D-0101',100,'螺丝刀模型A','TL',10),(11,'螺丝刀B','TL-D-0102',100,'螺丝刀模型B','TL',10),(12,'螺丝刀C','TL-D-0103',100,'螺丝刀模型C','TL',10),(13,'螺丝刀D','TL-D-0104',100,'螺丝刀模型D','TL',11.99),(14,'螺丝刀E','TL-D-0105',100,'螺丝刀模型E','TL',15),(15,'螺丝刀F','TL-D-0106',100,'螺丝刀模型F','TL',12),(16,'螺丝刀G','TL-D-0107',100,'螺丝刀模型G','TL',10),(17,'扳手','TL-D-0309',10,'很结实的扳手','TL',30),(18,'饼干','FD-C-0304',10000,'很不好吃的饼干','DL',1),(19,'饼干','FD-C-0304',10000,'很不好吃的饼干','FD',1),(20,'饼干','FD-C-0304',10000,'很不好吃的饼干','FD',1),(21,'饼干','FD-C-0304',10000,'很不好吃的饼干','FD',1),(22,'牙刷','DL-A-1101',200,'很柔软的牙刷','DL',10),(23,'牙刷','DL-A-1101',200,'很柔软的牙刷','DL',10);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_log`
--

DROP TABLE IF EXISTS `commodity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '交易历史id编号',
  `operator_id` int NOT NULL COMMENT '操作者id',
  `commodity_id` int NOT NULL COMMENT '交易货物的id',
  `date` datetime NOT NULL COMMENT '日志时间',
  `operate` varchar(5) NOT NULL COMMENT '操作类型，对应字典表（sms_dic）中IN（入库），OUT（出库）',
  `num` int NOT NULL COMMENT '交易数量',
  PRIMARY KEY (`id`),
  KEY `commodity_log_dic` (`operate`),
  KEY `commodity_log_user` (`operator_id`),
  CONSTRAINT `commodity_log_dic` FOREIGN KEY (`operate`) REFERENCES `sms_dic` (`code`),
  CONSTRAINT `commodity_log_user` FOREIGN KEY (`operator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_log`
--

LOCK TABLES `commodity_log` WRITE;
/*!40000 ALTER TABLE `commodity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_type`
--

DROP TABLE IF EXISTS `commodity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_type` (
  `code` varchar(5) NOT NULL COMMENT '货物类型编号（预留货物类型管理）',
  `type` varchar(20) NOT NULL COMMENT '货物实际类型名',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_type`
--

LOCK TABLES `commodity_type` WRITE;
/*!40000 ALTER TABLE `commodity_type` DISABLE KEYS */;
INSERT INTO `commodity_type` VALUES ('DL','日用品'),('FD','食物'),('TL','工具');
/*!40000 ALTER TABLE `commodity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_dic`
--

DROP TABLE IF EXISTS `sms_dic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_dic` (
  `code` varchar(5) NOT NULL COMMENT '字典编号',
  `name` varchar(20) NOT NULL COMMENT '编号代表实际内容',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_dic`
--

LOCK TABLES `sms_dic` WRITE;
/*!40000 ALTER TABLE `sms_dic` DISABLE KEYS */;
INSERT INTO `sms_dic` VALUES ('IN','货物入库'),('NEW','新建用户'),('OUT','货物出库');
/*!40000 ALTER TABLE `sms_dic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '账户名（6-20位限制），字母数字组成',
  `password` varchar(20) NOT NULL COMMENT '密码（6-20位限制），字母数字组成',
  `authority` varchar(2) DEFAULT '1' COMMENT '权限\n1普通用户（可查看数据）\n2高级用户（可修改数据）\n3管理员用户（预留用户管理权限角色）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','3'),(2,'cct001','123456','2'),(3,'','','2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operate_log`
--

DROP TABLE IF EXISTS `user_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_operate_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户操作记录id编号',
  `operator_id` int NOT NULL COMMENT '操作者的id',
  `date` datetime NOT NULL COMMENT '记录时间',
  `operate` varchar(5) NOT NULL COMMENT '操作类型，对应字典表（sms_dic）中NEW（创建）',
  PRIMARY KEY (`id`),
  KEY `user_log_dic` (`operate`),
  KEY `user_log_user` (`operator_id`),
  CONSTRAINT `user_log_dic` FOREIGN KEY (`operate`) REFERENCES `sms_dic` (`code`),
  CONSTRAINT `user_log_user` FOREIGN KEY (`operator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operate_log`
--

LOCK TABLES `user_operate_log` WRITE;
/*!40000 ALTER TABLE `user_operate_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sms_dev'
--

--
-- Dumping routines for database 'sms_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 16:51:50

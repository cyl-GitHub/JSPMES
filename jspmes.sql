CREATE DATABASE  IF NOT EXISTS `jspmes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jspmes`;
-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jspmes
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(45) NOT NULL COMMENT '管理员用户名',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'陈玉龙','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `u_id` int(11) NOT NULL COMMENT '用户编号',
  `perm` varchar(45) NOT NULL DEFAULT '默认' COMMENT '权限',
  PRIMARY KEY (`id`),
  KEY `user_authority_idx` (`u_id`),
  CONSTRAINT `user_authority` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (3,1,'默认'),(11,12,'默认'),(13,14,'默认'),(14,15,'默认');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `d_name` varchar(45) NOT NULL COMMENT '部门名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'销售');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jop`
--

DROP TABLE IF EXISTS `jop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业id',
  `t_id` int(11) NOT NULL COMMENT '工作id',
  `process_num` int(11) NOT NULL DEFAULT '0' COMMENT '工序数',
  `ranking` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `jt_idx` (`t_id`),
  CONSTRAINT `jt` FOREIGN KEY (`t_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='作业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jop`
--

LOCK TABLES `jop` WRITE;
/*!40000 ALTER TABLE `jop` DISABLE KEYS */;
INSERT INTO `jop` VALUES (9,28,3,1),(10,28,3,2),(11,28,2,3),(12,28,2,4);
/*!40000 ALTER TABLE `jop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物料id',
  `m_name` varchar(45) NOT NULL COMMENT '物料名',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (2,'物料A',70),(3,'物料B',80);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_mat`
--

DROP TABLE IF EXISTS `pro_mat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_mat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消耗物料编号',
  `p_id` int(11) NOT NULL COMMENT '工序序号',
  `m_id` int(11) NOT NULL COMMENT '物料id',
  `count` int(11) NOT NULL COMMENT '消耗数量',
  PRIMARY KEY (`id`),
  KEY `pmp_idx` (`p_id`),
  KEY `pmm_idx` (`m_id`),
  CONSTRAINT `pmm` FOREIGN KEY (`m_id`) REFERENCES `material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pmp` FOREIGN KEY (`p_id`) REFERENCES `process` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='物料消耗表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_mat`
--

LOCK TABLES `pro_mat` WRITE;
/*!40000 ALTER TABLE `pro_mat` DISABLE KEYS */;
INSERT INTO `pro_mat` VALUES (4,3,2,10),(5,3,3,15),(6,4,2,20),(7,4,3,5);
/*!40000 ALTER TABLE `pro_mat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工序id',
  `j_id` int(11) NOT NULL COMMENT '作业id',
  `m_id` int(11) NOT NULL COMMENT '机器编号',
  `time` int(11) NOT NULL COMMENT '加工时间',
  `starttime` int(11) DEFAULT NULL COMMENT '工序开始时间',
  `endtime` int(11) DEFAULT NULL COMMENT '工序结束时间',
  `ranking` int(11) NOT NULL COMMENT '工序排序',
  PRIMARY KEY (`id`),
  KEY `pj_idx` (`j_id`),
  CONSTRAINT `pj` FOREIGN KEY (`j_id`) REFERENCES `jop` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='工序';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (3,9,0,3,0,3,1),(4,9,1,2,4,6,2),(5,9,2,2,9,11,3),(6,10,0,2,3,5,1),(7,10,2,1,5,6,2),(8,10,1,4,6,10,3),(9,11,1,4,0,4,1),(10,11,2,3,6,9,2),(11,12,0,4,5,9,1),(12,12,1,3,10,13,2);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作序号',
  `t_name` varchar(45) NOT NULL COMMENT '工作名',
  `u_id` int(11) NOT NULL COMMENT '负责人id',
  `createtime` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `starttime` int(11) DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '结束时间',
  `machine_num` int(11) NOT NULL COMMENT '机器数量',
  `jop_num` int(11) NOT NULL DEFAULT '0' COMMENT '作业数量',
  `over` int(11) NOT NULL DEFAULT '0' COMMENT '是否运行过',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_name_UNIQUE` (`t_name`),
  KEY `task_user_idx` (`u_id`),
  CONSTRAINT `task_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='工作';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (28,'测试一',1,'2020-07-14 03:36:41.944',0,13,4,4,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `position` varchar(45) DEFAULT NULL COMMENT '职位',
  `salary` int(11) DEFAULT NULL COMMENT '薪资',
  `d_id` int(11) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `user_department_idx` (`d_id`),
  CONSTRAINT `user_department` FOREIGN KEY (`d_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'陈玉龙','E10ADC3949BA59ABBE56E057F20F883E','员工',10000,1),(12,'小雷','E10ADC3949BA59ABBE56E057F20F883E','员工',2222,1),(14,'小风','E10ADC3949BA59ABBE56E057F20F883E','员工',12345,1),(15,'小青','E10ADC3949BA59ABBE56E057F20F883E','员工',13131,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jspmes'
--

--
-- Dumping routines for database 'jspmes'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16 12:04:31

-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (arm64)
--
-- Host: 127.0.0.1    Database: geek-temp
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `sys_manager`
--

DROP TABLE IF EXISTS `sys_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_manager` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(60) NOT NULL COMMENT '账号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `super_admin` tinyint NOT NULL DEFAULT '1' COMMENT '超级管理员(0：否，1：是)',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态(0：停用，1：正常)',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_manager`
--

/*!40000 ALTER TABLE `sys_manager` DISABLE KEYS */;
INSERT INTO `sys_manager` VALUES (1,'admin','{bcrypt}$2a$10$mW/yJPHjyueQ1g26WNBz0uxVPa0GQdJO1fFZmqdkqgMTGnyszlXxu','Admin','https://cdn.jsdelivr.net/gh/wardendon/wiki-image@main/img/xinyeai.jpg',1,1,0,'2023-07-11 07:45:40','2024-02-27 08:39:23'),(2,'dong','{bcrypt}$2a$10$.NFEonCfLx8aLY9dJ.FMduvDmZjnCh0R/vK.zab288q88DDIx5NNm','王东','https://tainuanxin.oss-cn-hangzhou.aliyuncs.com/2023/10/30/8360bc71-9c7a-41f6-8fed-deb41e925392.png',0,1,0,'2023-07-11 07:45:40','2024-02-27 06:54:12');
/*!40000 ALTER TABLE `sys_manager` ENABLE KEYS */;

--
-- Table structure for table `sys_manager_role`
--

DROP TABLE IF EXISTS `sys_manager_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_manager_role` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `manager_id` int NOT NULL COMMENT '管理员id',
  `role_id` int NOT NULL COMMENT '角色id',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除（0-未删除，1-删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_manager_role`
--

/*!40000 ALTER TABLE `sys_manager_role` DISABLE KEYS */;
INSERT INTO `sys_manager_role` VALUES (1,1,1,0,'2023-07-11 07:47:03','2023-07-11 08:05:15'),(2,2,6,0,'2023-07-12 02:57:04','2023-08-09 16:09:23');
/*!40000 ALTER TABLE `sys_manager_role` ENABLE KEYS */;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '路径',
  `component` varchar(200) NOT NULL DEFAULT '' COMMENT '组件路径',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单类型 menu: 菜单 button: 按钮',
  `open_type` varchar(50) NOT NULL DEFAULT '' COMMENT '打开类型 tab: 选项卡 url: 外链',
  `url` varchar(500) NOT NULL DEFAULT '' COMMENT '外链地址',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `auth` varchar(500) NOT NULL DEFAULT '' COMMENT '授权标识(多个用逗号分隔，如：sys:menu:list,sys:menu:save)',
  `keepalive` tinyint NOT NULL DEFAULT '0' COMMENT '是否缓存 0:true 1:false',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `hide` tinyint NOT NULL DEFAULT '1' COMMENT '是否隐藏（0:true,1fasle）',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'system','系统管理','/system','','MENU_DIR','','','HomeFilled','',0,1,0,'2023-07-11 07:36:12','2023-11-01 03:24:33',1),(2,1,'Manager','管理员管理','/system/manager','/System/Manager','MENU','TAB','','HomeFilled','sys:manager:list',0,1,0,'2023-07-11 07:37:01','2023-07-27 01:23:53',1),(3,1,'Role','角色管理','/system/role','/System/Role','MENU','TAB','','BellFilled','sys:role:list',0,2,0,'2023-07-11 07:37:01','2023-07-27 01:35:51',1),(4,1,'Menu','菜单管理','/system/menu','/System/Menu','MENU','TAB','','HomeFilled','sys:menu:list',0,3,0,'2023-07-11 07:37:01','2024-02-27 08:19:24',1),(8,4,'view','查看','','','BUTTON','','','','sys:menu:view',1,0,0,'2023-07-11 07:37:19','2023-07-26 07:29:58',1),(9,4,'add','新增','','','BUTTON','','','','sys:menu:add',1,1,0,'2023-07-11 07:37:19','2023-07-26 07:29:59',1),(10,4,'edit','编辑','','','BUTTON','','','','sys:menu:edit',1,2,0,'2023-07-11 07:37:19','2023-07-26 07:29:59',1),(11,4,'remove','删除','','','BUTTON','','','','sys:menu:remove',1,3,0,'2023-07-11 07:37:19','2023-07-26 07:30:00',1),(12,3,'view','查看','','','BUTTON','','','','sys:role:view',1,0,0,'2023-07-11 07:37:19','2023-07-26 07:30:00',1),(13,3,'add','新增','','','BUTTON','','','','sys:role:add',1,1,0,'2023-07-11 07:37:19','2023-07-26 07:30:01',1),(14,3,'edit','编辑','','','BUTTON','','','','sys:role:edit',1,2,0,'2023-07-11 07:37:19','2023-07-26 07:30:01',1),(15,3,'remove','删除','','','BUTTON','','','','sys:role:remove',1,3,0,'2023-07-11 07:37:19','2023-07-26 07:30:02',1),(38,0,'platform','平台管理','/platform','','MENU_DIR','','','Operation','',0,2,0,'2023-07-11 07:37:19','2023-11-01 03:24:38',1),(39,38,'ProtocolView','协议管理','/platform/protocol','/Platform/ProtocolView','MENU','TAB','','DocumentCopy','sys:protocol:list',1,1,0,'2023-07-11 07:37:19','2023-12-02 02:28:57',1),(42,0,'user','用户管理','/user','','MENU_DIR','','','UserFilled','',1,3,0,'2023-07-11 07:37:19','2023-11-01 03:24:43',1),(43,42,'UserManage','用户管理','/user/user_manage','/User/UserManage','MENU','TAB','','User','sys:user:list',1,1,0,'2023-07-11 07:37:19','2023-12-02 02:27:34',1),(49,38,'Version','版本管理','/platform/version','/Platform/Version','MENU','TAB','','Flag','platform:version:list',0,4,0,'2023-07-15 06:13:02','2023-07-27 01:06:29',1),(67,43,'export','导出','','','BUTTON','','','','sys:user:export',1,0,0,'2023-07-26 08:55:32','2023-07-26 08:55:32',1),(68,2,'add','新增','','','BUTTON','','','','sys:manager:add',1,0,0,'2023-07-26 09:01:40','2023-07-26 09:01:40',1),(69,2,'view','查看','','','BUTTON','','','','sys:manager:view',1,1,0,'2023-07-26 09:02:05','2023-07-26 09:02:05',1),(70,2,'edit','编辑','','','BUTTON','','','','sys:manager:edit',1,2,1,'2023-07-26 09:02:21','2023-12-02 01:54:57',1),(71,2,'reset-psw','重置密码','','','BUTTON','','','','sys:manager:reset-psw',1,3,0,'2023-07-26 09:03:16','2023-07-26 09:03:16',1),(72,2,'remove','删除','','','BUTTON','','','','sys:manager:remove',1,4,0,'2023-07-26 09:03:33','2023-07-26 09:03:33',1),(78,49,'add','新增','','','BUTTON','','','','platform:version:add',1,0,0,'2023-07-26 09:11:31','2023-07-26 09:11:31',1),(79,49,'view','查看','','','BUTTON','','','','platform:version:view',1,1,0,'2023-07-26 09:11:49','2023-07-26 09:11:49',1),(80,49,'edit','编辑','','','BUTTON','','','','platform:version:edit',1,2,0,'2023-07-26 09:12:24','2023-07-26 09:12:24',1),(81,49,'remove','删除','','','BUTTON','','','','platform:version:remove',1,3,0,'2023-07-26 09:12:48','2023-07-26 09:12:48',1),(107,39,'save','保存','','','BUTTON','','','','sys:protocol:edit',1,1,0,'2023-10-30 09:03:09','2023-10-30 09:03:09',1),(108,0,'home','首页','/home','/Home/Home','MENU','TAB','','Menu','none',1,0,1,'2023-11-01 03:24:13','2023-11-01 03:26:53',0),(109,0,'home','首页','/home','/Home/Home','MENU','TAB','','HomeFilled','none',1,0,0,'2023-11-01 03:38:01','2023-11-01 03:38:36',1),(110,43,'edit','用户编辑','','','BUTTON','','','','sys:user:edit',1,2,0,'2023-12-02 00:39:40','2023-12-02 00:39:40',1),(111,2,'edit','编辑','','','BUTTON','','','','sys:manager:edit',1,0,0,'2023-12-02 01:56:23','2023-12-02 01:56:23',1),(112,1,'Dict','字典管理','/system/dict','/System/Dict/index','MENU','TAB','','Memo','sys:dict:list',1,4,0,'2024-02-27 08:16:57','2024-02-27 08:23:23',1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(16) NOT NULL COMMENT '角色名称',
  `remark` varchar(30) NOT NULL COMMENT '角色描述',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0：正常 1：已删除'')',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','超级管理员',0,'2023-07-11 07:26:00','2023-12-02 01:56:42'),(6,'测试角色','测试角色',0,'2023-07-12 02:53:23','2024-02-27 08:42:19');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色id',
  `menu_id` int NOT NULL DEFAULT '0' COMMENT '菜单id',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (177,1,1,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(178,1,2,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(179,1,68,1,'2023-08-09 16:29:30','2023-10-30 10:06:02'),(180,1,69,1,'2023-08-09 16:29:30','2023-10-30 07:32:16'),(181,1,70,1,'2023-08-09 16:29:30','2023-12-02 01:54:57'),(182,1,71,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(183,1,72,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(184,1,3,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(185,1,12,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(186,1,13,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(187,1,14,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(188,1,15,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(189,1,38,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(190,1,39,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(191,1,49,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(192,1,78,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(193,1,79,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(194,1,80,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(195,1,81,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(196,1,42,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(197,1,43,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(198,1,67,0,'2023-08-09 16:29:30','2023-08-09 16:29:30'),(199,6,38,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(200,6,39,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(201,6,49,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(202,6,78,1,'2023-08-09 16:29:37','2024-02-27 07:08:04'),(203,6,79,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(204,6,80,1,'2023-08-09 16:29:37','2024-02-27 07:08:04'),(205,6,81,1,'2023-08-09 16:29:37','2024-02-27 07:08:04'),(206,6,42,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(207,6,43,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(208,6,67,0,'2023-08-09 16:29:37','2023-08-09 16:29:37'),(209,6,69,1,'2023-10-30 07:32:23','2024-02-27 08:42:18'),(210,6,1,1,'2023-10-30 07:32:23','2024-02-27 08:42:18'),(211,6,2,1,'2023-10-30 07:32:23','2024-02-27 08:42:18'),(212,6,68,1,'2023-10-30 09:03:56','2024-02-27 07:07:46'),(213,6,70,1,'2023-10-30 09:03:56','2023-12-02 01:54:57'),(214,6,71,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(215,6,72,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(216,6,3,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(217,6,12,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(218,6,13,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(219,6,14,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(220,6,15,1,'2023-10-30 09:03:56','2024-02-27 08:42:18'),(221,6,107,0,'2023-10-30 09:03:56','2023-10-30 09:03:56'),(222,1,69,1,'2023-10-30 09:03:58','2023-10-30 10:06:02'),(223,1,107,0,'2023-10-30 09:03:58','2023-10-30 09:03:58'),(224,1,68,0,'2023-10-30 10:06:08','2023-10-30 10:06:08'),(225,1,69,0,'2023-10-30 10:06:08','2023-10-30 10:06:08'),(226,1,109,0,'2023-12-02 00:32:42','2023-12-02 00:32:42'),(227,1,110,0,'2023-12-02 00:40:00','2023-12-02 00:40:00'),(228,1,111,0,'2023-12-02 01:56:42','2023-12-02 01:56:42'),(229,6,78,0,'2024-02-27 07:08:09','2024-02-27 07:08:09'),(230,6,80,0,'2024-02-27 07:08:09','2024-02-27 07:08:09'),(231,6,81,0,'2024-02-27 07:08:09','2024-02-27 07:08:09'),(232,6,109,0,'2024-02-27 08:42:19','2024-02-27 08:42:19');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

--
-- Table structure for table `t_app_version`
--

DROP TABLE IF EXISTS `t_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_app_version` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `platform` varchar(255) NOT NULL COMMENT '平台',
  `summary` varchar(255) NOT NULL COMMENT '描述',
  `min_version` varchar(255) NOT NULL DEFAULT '0' COMMENT '最小版本',
  `max_version` varchar(255) NOT NULL DEFAULT '0' COMMENT '最大版本',
  `url` varchar(255) NOT NULL COMMENT '更新地址',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app_version`
--

/*!40000 ALTER TABLE `t_app_version` DISABLE KEYS */;
INSERT INTO `t_app_version` VALUES (1,'ios','新测试','1.0.2','1.0.4','https://www.baidu.com',0,'2023-07-12 07:49:51','2023-07-16 02:16:26'),(2,'安卓','新增','1.1','1.2','https://www.baidu.com',1,'2023-07-13 09:26:33','2023-07-19 05:50:41'),(3,'ios','新增','1.0.0','1.1.1','w2gd.top',1,'2023-07-15 07:25:53','2023-07-15 07:26:01');
/*!40000 ALTER TABLE `t_app_version` ENABLE KEYS */;

--
-- Table structure for table `t_privacy`
--

DROP TABLE IF EXISTS `t_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_privacy` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '隐私类型(0：隐私协议，1：用户协议，2：关于我们)',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '隐私内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_privacy`
--

/*!40000 ALTER TABLE `t_privacy` DISABLE KEYS */;
INSERT INTO `t_privacy` VALUES (1,0,'<p>隐私协议-2</p>','2023-07-11 03:11:34','2023-07-11 03:11:34'),(2,1,'<p>用户-协议</p>','2023-07-11 03:11:45','2023-07-11 03:11:45'),(3,2,'<p>关于我们-协议</p>','2023-07-11 03:11:51','2023-07-11 03:11:51');
/*!40000 ALTER TABLE `t_privacy` ENABLE KEYS */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(60) NOT NULL COMMENT '账号',
  `nickname` varchar(60) DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐值',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `company` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `gender` tinyint DEFAULT '0' COMMENT '性别(0：男，1：女，2：保密)',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '会员结束时间',
  `delete_flag` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除(0-未删除，1-删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'17314433312','王東','a7ba89d5e5761b8ca07fcfb0c70a97f6547f12c1cff9694679bc2ce7293cb6886a73821798b5b75bcd2a4f05a70326f506b70d8bba42b11b2323158a98c609d0','c68252efe28a09a4fffa60e00cff29ea','https://ycshang123.oss-cn-hangzhou.aliyuncs.com/2023/07/13/fa272d53-42c5-4eaf-8503-ac624d865005.gif','17314433312','南京XXX',1,'2024-02-27 08:36:42',0,'2023-07-11 10:55:29','2024-02-27 08:36:42'),(2,'15195757885','15195757885','d125de646b8c317cf5f9f2878cf95bdde5df213ec15308c400272ec47bae24acc4948004cccc1250011e971e41a839cad0153fc551adf19612792563d31d09fc','5e8815d4da6bf327f3c1790524276427','https://cdn.jsdelivr.net/gh/wardendon/wiki-image@main/img/xinyeai.jpg','15195757885','南京XXX',0,'2024-02-27 08:36:42',0,'2023-07-14 02:18:22','2024-02-27 08:36:42'),(3,'18761663770','Ertiao','44dba0ce957dbd0b48aafaf378239d2ae3d42544e0ea0b1c433d5c9efcc2f4711c0f48cebb6bd9b31eaab15f2b12fe364455eeddc02ab52cc529b45fd840b47f','7c2f8c4980b959b57bb7d57692317976','https://cdn.jsdelivr.net/gh/wardendon/wiki-image@main/img/xinyeai.jpg','15252984005','南京XXX',0,'2024-02-27 08:36:42',0,'2023-07-14 02:19:30','2024-02-27 08:36:42'),(4,'18761663770','Baidawei ','e7a26d01de243542b0f9f3545c2dc6baab3542b30ab86d45cea5a4f47947465c3036f8098890bb36f24e22afd9a3fe727a638fd0c46dca1615e4cfef1e707541','8fdb5ad118211448a169efc9abc21017','https://cdn.jsdelivr.net/gh/wardendon/wiki-image@main/img/xinyeai.jpg','18761663770','南京XXX',0,'2024-02-27 08:36:42',0,'2023-07-14 03:47:51','2024-02-27 08:36:42');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

--
-- Dumping routines for database 'geek-temp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27 16:52:03

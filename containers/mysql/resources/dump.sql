-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 204.48.17.240    Database: kamailio
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.27-MariaDB-0+deb10u1

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
-- Table structure for table `acc`
--

DROP TABLE IF EXISTS `acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(64) NOT NULL DEFAULT '',
  `to_tag` varchar(64) NOT NULL DEFAULT '',
  `callid` varchar(128) NOT NULL DEFAULT '',
  `sip_code` char(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(32) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `src_ip` varchar(64) NOT NULL DEFAULT '',
  `dst_ouser` varchar(64) NOT NULL DEFAULT '',
  `dst_user` varchar(64) NOT NULL DEFAULT '',
  `dst_domain` varchar(128) NOT NULL DEFAULT '',
  `src_user` varchar(64) NOT NULL DEFAULT '',
  `src_domain` varchar(128) NOT NULL DEFAULT '',
  `cdr_id` int(10) unsigned NOT NULL DEFAULT 0,
  `calltype` varchar(20) DEFAULT NULL,
  `src_gwgroupid` int(10) unsigned NOT NULL DEFAULT 0,
  `dst_gwgroupid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `acc_callid` (`callid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc`
--

LOCK TABLES `acc` WRITE;
/*!40000 ALTER TABLE `acc` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cdrs`
--

DROP TABLE IF EXISTS `acc_cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_cdrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `duration` float(10,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`id`),
  KEY `start_time_idx` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cdrs`
--

LOCK TABLES `acc_cdrs` WRITE;
/*!40000 ALTER TABLE `acc_cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_watchers`
--

DROP TABLE IF EXISTS `active_watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` varchar(255) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `to_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `event_id` varchar(64) DEFAULT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `callid` varchar(255) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `record_route` text DEFAULT NULL,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `reason` varchar(64) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `socket_info` varchar(64) NOT NULL,
  `local_contact` varchar(255) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `from_domain` varchar(64) NOT NULL,
  `updated` int(11) NOT NULL,
  `updated_winfo` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `active_watchers_idx` (`callid`,`to_tag`,`from_tag`),
  KEY `active_watchers_expires` (`expires`),
  KEY `active_watchers_pres` (`presentity_uri`,`event`),
  KEY `updated_idx` (`updated`),
  KEY `updated_winfo_idx` (`updated_winfo`,`presentity_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_watchers`
--

LOCK TABLES `active_watchers` WRITE;
/*!40000 ALTER TABLE `active_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grp` int(11) unsigned NOT NULL DEFAULT 1,
  `ip_addr` varchar(50) NOT NULL,
  `mask` int(11) NOT NULL DEFAULT 32,
  `port` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
REPLACE INTO `address` (`id`, `grp`, `ip_addr`, `mask`, `port`, `tag`) VALUES (1,8,'54.172.60.0',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(2,8,'54.172.60.1',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(3,8,'54.172.60.2',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(4,8,'54.172.60.3',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(5,8,'54.244.51.0',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(6,8,'54.244.51.1',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(7,8,'54.244.51.2',32,0,'name:Twilio NA Inbound,gwgroup:1'),(8,8,'54.244.51.3',32,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(9,8,'54.244.60.0',23,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(10,8,'34.203.250.0',23,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(11,8,'54.244.51.0',24,0,'name:Twilio NA Inbound Carrier,gwgroup:1'),(12,8,'52.41.52.34',32,0,'name:Skyetel North West Inbound,gwgroup:2'),(13,8,'52.8.201.128',32,0,'name:Skyetel South West Inbound,gwgroup:2'),(14,8,'52.60.138.31',32,0,'name:Skyetel North East Inbound,gwgroup:2'),(15,8,'50.17.48.216',32,0,'name:Skyetel South East Inbound,gwgroup:2'),(16,8,'35.156.192.164',32,0,'name:Skyetel Europe Inbound,gwgroup:2'),(17,8,'term.skyetel.com',32,0,'name:Skyetel 1st Priority Outbound Call,gwgroup:2'),(18,8,'52.41.52.34',32,0,'name:Skyetel 2nd Priority Outbound Call,gwgroup:2'),(19,8,'52.8.201.128',32,0,'name:Skyetel 3rd Priority Outbound Call,gwgroup:2'),(20,8,'50.17.48.216',32,0,'name:Skyetel 4rd Priority Outbound Call,gwgroup:2'),(21,8,'52.32.223.28',32,0,'name:Skyetel North West High Cost Outbound Traffic,gwgroup:2'),(22,8,'52.4.178.107',32,0,'name:Skyetel South East High Cost Outbound Traffic,gwgroup:2'),(23,8,'147.75.60.160',32,0,'name:Flowroute US-West-WA,gwgroup:3'),(24,8,'34.210.91.112',32,0,'name:Flowroute US-West-OR,gwgroup:3'),(25,8,'147.75.65.192',32,0,'name:Flowroute US-East-NJ,gwgroup:3'),(26,8,'34.226.36.32',32,0,'name:Flowroute US-East-VA,gwgroup:3'),(27,8,'81.201.82.45',32,0,'name:Voxbone Belgium,gwgroup:4'),(28,8,'81.201.84.195',32,0,'name:Voxbone LA,gwgroup:4'),(29,8,'81.201.85.45',32,0,'name:Voxbone NYC,gwgroup:4'),(30,8,'81.201.83.45',32,0,'name:Voxbone Germany,gwgroup:4'),(31,8,'81.201.86.45',32,0,'name:Voxbone Hong Kong,gwgroup:4'),(32,8,'81.201.84.195',32,0,'name:Voxbone Australia,gwgroup:4'),(33,8,'64.136.174.30',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(34,8,'64.136.173.22',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(35,8,'209.166.128.200',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(36,8,'192.240.151.100',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(37,8,'64.136.173.31',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(38,8,'64.136.174.30',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(39,8,'64.136.174.20',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(40,8,'209.166.154.70',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(41,8,'64.136.174.65',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(42,8,'64.136.173.23',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(43,8,'209.166.128.201',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(44,8,'192.240.151.101',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(45,8,'64.136.173.65',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(46,8,'64.136.174.65',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(47,8,'64.136.174.21',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(48,8,'209.166.154.71',32,0,'name:VoIP Innovations Inbound Carrier,gwgroup:5'),(49,8,'64.136.174.30',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(50,8,'64.136.173.22',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(51,8,'209.166.128.200',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(52,8,'192.240.151.100',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(53,8,'72.15.219.140',32,0,'name:Thinq Carrier,gwgroup:6'),(54,8,'216.147.191.157',32,0,'name:Voxtelesys Carrier,gwgroup:7'),(55,8,'64.34.181.47',32,0,'name:Les.net Carrier,gwgroup:8'),(56,22,'52.114.132.46',32,0,'name:msteams-sbc,gwgroup:300'),(57,22,'52.114.14.70',32,0,'name:msteams-sbc,gwgroup:300'),(58,22,'52.114.148.0',32,0,'name:msteams-sbc,gwgroup:300'),(59,22,'52.114.16.74',32,0,'name:msteams-sbc,gwgroup:300'),(60,22,'52.114.20.29',32,0,'name:msteams-sbc,gwgroup:300'),(61,22,'52.114.7.24',32,0,'name:msteams-sbc,gwgroup:300'),(62,22,'52.114.75.24',32,0,'name:msteams-sbc,gwgroup:300'),(63,22,'52.114.76.76',32,0,'name:msteams-sbc,gwgroup:300'),(64,22,'52.127.64.33',32,0,'name:msteams-sbc,gwgroup:300'),(65,22,'52.127.64.34',32,0,'name:msteams-sbc,gwgroup:300'),(66,22,'52.127.88.59',32,0,'name:msteams-sbc,gwgroup:300'),(67,22,'52.127.92.64',32,0,'name:msteams-sbc,gwgroup:300'),(68,22,'sip.pstnhub.microsoft.com',32,0,'name:msteams-sbc,gwgroup:300'),(69,22,'sip2.pstnhub.microsoft.com',32,0,'name:msteams-sbc,gwgroup:300'),(70,22,'sip3.pstnhub.microsoft.com',32,0,'name:msteams-sbc,gwgroup:300'),(71,22,'sip.pstnhub.dod.teams.microsoft.us',32,0,'name:msteams-sbc,gwgroup:300'),(72,22,'sip.pstnhub.gov.teams.microsoft.us',32,0,'name:msteams-sbc,gwgroup:300'),(73,8,'206.80.250.100',32,0,'name:ThinkTel,gwgroup:41'),(74,8,'208.68.17.52',32,0,'name:ThinkTel,gwgroup:41'),(75,8,'209.197.130.80',32,0,'name:ThinkTel,gwgroup:41'),(76,8,'64.136.174.30',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(77,8,'64.136.173.22',32,0,'name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10'),(78,8,'209.166.128.200',0,0,''),(79,8,'192.240.151.100',0,0,'');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(255) NOT NULL DEFAULT '',
  `received` varchar(255) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT 1.00,
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT 1,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT 0,
  `cflags` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `connection_id` int(11) NOT NULL DEFAULT 0,
  `keepalive` int(11) NOT NULL DEFAULT 0,
  `partition` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `account_contact_idx` (`username`,`domain`,`contact`),
  KEY `expires_idx` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliases`
--

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrier_name`
--

DROP TABLE IF EXISTS `carrier_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrier_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrier_name`
--

LOCK TABLES `carrier_name` WRITE;
/*!40000 ALTER TABLE `carrier_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrier_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrierfailureroute`
--

DROP TABLE IF EXISTS `carrierfailureroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrierfailureroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT 0,
  `domain` int(10) unsigned NOT NULL DEFAULT 0,
  `scan_prefix` varchar(64) NOT NULL DEFAULT '',
  `host_name` varchar(255) NOT NULL DEFAULT '',
  `reply_code` varchar(3) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT 0,
  `mask` int(11) unsigned NOT NULL DEFAULT 0,
  `next_domain` int(10) unsigned NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrierfailureroute`
--

LOCK TABLES `carrierfailureroute` WRITE;
/*!40000 ALTER TABLE `carrierfailureroute` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrierfailureroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrierroute`
--

DROP TABLE IF EXISTS `carrierroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrierroute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` int(10) unsigned NOT NULL DEFAULT 0,
  `domain` int(10) unsigned NOT NULL DEFAULT 0,
  `scan_prefix` varchar(64) NOT NULL DEFAULT '',
  `flags` int(11) unsigned NOT NULL DEFAULT 0,
  `mask` int(11) unsigned NOT NULL DEFAULT 0,
  `prob` float NOT NULL DEFAULT 0,
  `strip` int(11) unsigned NOT NULL DEFAULT 0,
  `rewrite_host` varchar(255) NOT NULL DEFAULT '',
  `rewrite_prefix` varchar(64) NOT NULL DEFAULT '',
  `rewrite_suffix` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrierroute`
--

LOCK TABLES `carrierroute` WRITE;
/*!40000 ALTER TABLE `carrierroute` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrierroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdrs`
--

DROP TABLE IF EXISTS `cdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdrs` (
  `cdr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `src_username` varchar(64) NOT NULL DEFAULT '',
  `src_domain` varchar(128) NOT NULL DEFAULT '',
  `dst_username` varchar(64) NOT NULL DEFAULT '',
  `dst_domain` varchar(128) NOT NULL DEFAULT '',
  `dst_ousername` varchar(64) NOT NULL DEFAULT '',
  `call_start_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `duration` int(10) unsigned NOT NULL DEFAULT 0,
  `sip_call_id` varchar(128) NOT NULL DEFAULT '',
  `sip_from_tag` varchar(128) NOT NULL DEFAULT '',
  `sip_to_tag` varchar(128) NOT NULL DEFAULT '',
  `src_ip` varchar(64) NOT NULL DEFAULT '',
  `cost` int(11) NOT NULL DEFAULT 0,
  `rated` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `calltype` varchar(20) DEFAULT NULL,
  `fraud` tinyint(1) NOT NULL DEFAULT 0,
  `src_gwgroupid` int(10) unsigned NOT NULL DEFAULT 0,
  `dst_gwgroupid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`cdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdrs`
--

LOCK TABLES `cdrs` WRITE;
/*!40000 ALTER TABLE `cdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpl`
--

DROP TABLE IF EXISTS `cpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL DEFAULT '',
  `cpl_xml` text DEFAULT NULL,
  `cpl_bin` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpl`
--

LOCK TABLES `cpl` WRITE;
/*!40000 ALTER TABLE `cpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbaliases`
--

DROP TABLE IF EXISTS `dbaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbaliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_username` varchar(64) NOT NULL DEFAULT '',
  `alias_domain` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `alias_user_idx` (`alias_username`),
  KEY `alias_idx` (`alias_username`,`alias_domain`),
  KEY `target_idx` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbaliases`
--

LOCK TABLES `dbaliases` WRITE;
/*!40000 ALTER TABLE `dbaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog`
--

DROP TABLE IF EXISTS `dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `callid` varchar(255) NOT NULL,
  `from_uri` varchar(255) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `to_uri` varchar(255) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `caller_cseq` varchar(20) NOT NULL,
  `callee_cseq` varchar(20) NOT NULL,
  `caller_route_set` varchar(512) DEFAULT NULL,
  `callee_route_set` varchar(512) DEFAULT NULL,
  `caller_contact` varchar(255) NOT NULL,
  `callee_contact` varchar(255) NOT NULL,
  `caller_sock` varchar(64) NOT NULL,
  `callee_sock` varchar(64) NOT NULL,
  `state` int(10) unsigned NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `sflags` int(10) unsigned NOT NULL DEFAULT 0,
  `iflags` int(10) unsigned NOT NULL DEFAULT 0,
  `toroute_name` varchar(32) DEFAULT NULL,
  `req_uri` varchar(255) NOT NULL,
  `xdata` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog`
--

LOCK TABLES `dialog` WRITE;
/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog_vars`
--

DROP TABLE IF EXISTS `dialog_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialog_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash_entry` int(10) unsigned NOT NULL,
  `hash_id` int(10) unsigned NOT NULL,
  `dialog_key` varchar(128) NOT NULL,
  `dialog_value` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash_idx` (`hash_entry`,`hash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog_vars`
--

LOCK TABLES `dialog_vars` WRITE;
/*!40000 ALTER TABLE `dialog_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialplan`
--

DROP TABLE IF EXISTS `dialplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dpid` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `match_op` int(11) NOT NULL,
  `match_exp` varchar(64) NOT NULL,
  `match_len` int(11) NOT NULL,
  `subst_exp` varchar(64) NOT NULL,
  `repl_exp` varchar(256) NOT NULL,
  `attrs` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialplan`
--

LOCK TABLES `dialplan` WRITE;
/*!40000 ALTER TABLE `dialplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatcher`
--

DROP TABLE IF EXISTS `dispatcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatcher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` int(11) NOT NULL DEFAULT 0,
  `destination` varchar(192) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `attrs` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatcher`
--

LOCK TABLES `dispatcher` WRITE;
/*!40000 ALTER TABLE `dispatcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(64) NOT NULL,
  `did` varchar(64) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_idx` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_attrs`
--

DROP TABLE IF EXISTS `domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `domain_attrs_idx` (`did`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_attrs`
--

LOCK TABLES `domain_attrs` WRITE;
/*!40000 ALTER TABLE `domain_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_name`
--

DROP TABLE IF EXISTS `domain_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_name`
--

LOCK TABLES `domain_name` WRITE;
/*!40000 ALTER TABLE `domain_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainpolicy`
--

DROP TABLE IF EXISTS `domainpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domainpolicy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `att` varchar(255) DEFAULT NULL,
  `val` varchar(128) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rav_idx` (`rule`,`att`,`val`),
  KEY `rule_idx` (`rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domainpolicy`
--

LOCK TABLES `domainpolicy` WRITE;
/*!40000 ALTER TABLE `domainpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_custom_rules`
--

DROP TABLE IF EXISTS `dr_custom_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_custom_rules` (
  `dr_ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locality` varchar(64) NOT NULL DEFAULT '',
  `ppm` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`dr_ruleid`),
  CONSTRAINT `dr_custom_rules_ibfk_1` FOREIGN KEY (`dr_ruleid`) REFERENCES `dr_rules` (`ruleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_custom_rules`
--

LOCK TABLES `dr_custom_rules` WRITE;
/*!40000 ALTER TABLE `dr_custom_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_custom_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_gateways`
--

DROP TABLE IF EXISTS `dr_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_gateways` (
  `gwid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) unsigned NOT NULL DEFAULT 0,
  `address` varchar(128) NOT NULL,
  `strip` int(11) unsigned NOT NULL DEFAULT 0,
  `pri_prefix` varchar(64) NOT NULL DEFAULT '',
  `attrs` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gwid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_gateways`
--

LOCK TABLES `dr_gateways` WRITE;
/*!40000 ALTER TABLE `dr_gateways` DISABLE KEYS */;
REPLACE INTO `dr_gateways` (`gwid`, `type`, `address`, `strip`, `pri_prefix`, `attrs`, `description`) VALUES (1,8,'52.41.52.34',0,'','1,8','name:Skyetel North West Inbound,gwgroup:2,addr_id:18'),(2,8,'52.8.201.128',0,'','2,8','name:Skyetel South West Inbound,gwgroup:2,addr_id:19'),(3,8,'52.60.138.31',0,'','3,8','name:Skyetel North East Inbound,gwgroup:2,addr_id:20'),(4,8,'50.17.48.216',0,'','4,8','name:Skyetel South East Inbound,gwgroup:2,addr_id:21'),(5,8,'35.156.192.164',0,'','5,8','name:Skyetel Europe Inbound,gwgroup:2,addr_id:22'),(6,8,'term.skyetel.com',0,'','6,8','name:Skyetel 1st Priority Outbound Call,gwgroup:2,addr_id:23'),(7,8,'52.41.52.34',0,'','7,8','name:Skyetel 2nd Priority Outbound Call,gwgroup:2,addr_id:24'),(8,8,'52.8.201.128',0,'','8,8','name:Skyetel 3rd Priority Outbound Call,gwgroup:2,addr_id:25'),(9,8,'50.17.48.216',0,'','9,8','name:Skyetel 4rd Priority Outbound Call,gwgroup:2,addr_id:26'),(10,8,'52.32.223.28',0,'','10,8','name:Skyetel North West High Cost Outbound Traffic,gwgroup:2,addr_id:27'),(11,8,'52.4.178.107',0,'','11,8','name:Skyetel South East High Cost Outbound Traffic,gwgroup:2,addr_id:28'),(12,8,'147.75.60.160',0,'','12,8','name:Flowroute US-West-WA,gwgroup:3,addr_id:29'),(13,8,'34.210.91.112',0,'','13,8','name:Flowroute US-West-OR,gwgroup:3,addr_id:30'),(14,8,'147.75.65.192',0,'','14,8','name:Flowroute US-East-NJ,gwgroup:3,addr_id:31'),(15,8,'34.226.36.32',0,'','15,8','name:Flowroute US-East-VA,gwgroup:3,addr_id:32'),(16,8,'81.201.82.45',0,'','16,8','name:Voxbone Belgium,gwgroup:4,addr_id:33'),(17,8,'81.201.84.195',0,'','17,8','name:Voxbone LA,gwgroup:4,addr_id:34'),(18,8,'81.201.85.45',0,'','18,8','name:Voxbone NYC,gwgroup:4,addr_id:35'),(19,8,'81.201.83.45',0,'','19,8','name:Voxbone Germany,gwgroup:4,addr_id:36'),(20,8,'81.201.86.45',0,'','20,8','name:Voxbone Hong Kong,gwgroup:4,addr_id:37'),(21,8,'81.201.84.195',0,'','21,8','name:Voxbone Australia,gwgroup:4,addr_id:38'),(22,8,'64.136.174.30',0,'','22,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:39'),(23,8,'64.136.173.22',0,'','23,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:40'),(24,8,'209.166.128.200',0,'','24,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:41'),(25,8,'192.240.151.100',0,'','25,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:42'),(26,8,'64.136.173.31',0,'','26,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:43'),(27,8,'64.136.174.30',0,'','27,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:44'),(28,8,'64.136.174.20',0,'','28,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:45'),(29,8,'209.166.154.70',0,'','29,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:46'),(30,8,'64.136.174.65',0,'','30,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:47'),(31,8,'64.136.173.23',0,'','31,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:48'),(32,8,'209.166.128.201',0,'','32,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:49'),(33,8,'192.240.151.101',0,'','33,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:50'),(34,8,'64.136.173.65',0,'','34,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:51'),(35,8,'64.136.174.65',0,'','35,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:52'),(36,8,'64.136.174.21',0,'','36,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:53'),(37,8,'209.166.154.71',0,'','37,8','name:VoIP Innovations Inbound Carrier,gwgroup:5,addr_id:54'),(38,8,'64.136.174.30',0,'','38,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:55'),(39,8,'64.136.173.22',0,'','39,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:56'),(40,8,'209.166.128.200',0,'','40,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:57'),(41,8,'192.240.151.100',0,'','41,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_1d:58'),(42,8,'72.15.219.140',0,'','42,8','name:Thinq Carrier,gwgroup:6,addr_id:59'),(43,8,'216.147.191.157',0,'','43,8','name:Voxtelesys Carrier,gwgroup:7,addr_id:60'),(44,8,'64.34.181.47',0,'','44,8','name:Les.net Carrier,gwgroup:8,addr_id:61'),(45,8,'54.172.60.0',0,'','45,8','name:Twilio NA-Virginia Carrier,gwgroup:1,addr_id:1'),(46,8,'54.172.60.1',0,'','46,8','name:Twilio NA-Virginia  Carrier,gwgroup:1,addr_id:2'),(47,8,'54.172.60.2',0,'','47,8','name:Twilio NA-Virginia Carrier,gwgroup:1,addr_id:3'),(48,8,'54.172.60.3',0,'','48,8','name:Twilio NA-Virginia Carrier,gwgroup:1,addr_id:4'),(49,8,'54.244.51.0',0,'','49,8','name:Twilio NA-Oregon Carrier,gwgroup:1,addr_id:5'),(50,8,'54.244.51.1',0,'','50,8','name:Twilio NA-Oregon  Carrier,gwgroup:1,addr_id:6'),(51,8,'54.244.51.2',0,'','51,8','name:Twilio NA-Oregon Carrier,gwgroup:1,addr_id:7'),(52,8,'54.244.51.3',0,'','52,8','name:Twilio NA-Oregon Carrier,gwgroup:1,addr_id:8'),(53,8,'206.80.250.100',0,'','53,8','name:ThinkTel,gwgroup:9,addr_id:69'),(54,8,'208.68.17.52',0,'','54,8','name:ThinkTel,gwgroup:9,addr_id:70'),(55,8,'209.197.130.80',0,'','55,8','name:ThinkTel,gwgroup:9,addr_id:71'),(56,8,'64.136.174.30',0,'','56,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:72'),(57,8,'64.136.173.22',0,'','57,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:73'),(58,8,'209.166.128.200',0,'','58,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_id:74'),(59,8,'192.240.151.100',0,'','59,8','name:VoIP Innovations Outbound Conversational Carrier,gwgroup:10,addr_1d:75');
/*!40000 ALTER TABLE `dr_gateways` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS insert_dr_gateways */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_dr_gateways
  BEFORE INSERT
  ON dr_gateways
  FOR EACH ROW
BEGIN

  
  IF (NEW.gwid = 0) THEN
    SET NEW.gwid = NULL;
  END IF;
  IF (NEW.attrs IS NULL) THEN
    SET NEW.attrs = '';
  END IF;

  SET @new_gwid := COALESCE(NEW.gwid, @new_gwid, (
    SELECT auto_increment
    FROM information_schema.tables
    WHERE table_name = 'dr_gateways' AND table_schema = DATABASE()));

  
  SET NEW.attrs = CONCAT(CAST(@new_gwid AS char), ',', CAST(NEW.type AS char),
                         SUBSTRING(NEW.attrs, LENGTH(SUBSTRING_INDEX(NEW.attrs, ',', 2)) + 1));
  SET @new_gwid = @new_gwid + 1;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS update_dr_gateways */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_dr_gateways
  BEFORE UPDATE
  ON dr_gateways
  FOR EACH ROW
BEGIN

  
  SET NEW.attrs = CONCAT(CAST(NEW.gwid AS char), ',', CAST(NEW.type AS char),
                         SUBSTRING(NEW.attrs, LENGTH(SUBSTRING_INDEX(NEW.attrs, ',', 2)) + 1));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dr_groups`
--

DROP TABLE IF EXISTS `dr_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(128) NOT NULL DEFAULT '',
  `groupid` int(11) unsigned NOT NULL DEFAULT 0,
  `description` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_groups`
--

LOCK TABLES `dr_groups` WRITE;
/*!40000 ALTER TABLE `dr_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_gw_lists`
--

DROP TABLE IF EXISTS `dr_gw_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_gw_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gwlist` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_gw_lists`
--

LOCK TABLES `dr_gw_lists` WRITE;
/*!40000 ALTER TABLE `dr_gw_lists` DISABLE KEYS */;
REPLACE INTO `dr_gw_lists` (`id`, `gwlist`, `description`) VALUES (1,'41,42,43,44,45,46,47,48','name:Twilio NA Inbound CarrierGroup,type:8'),(2,'1,2,3,4,5,6,7,8,9,10,11','name:Skyetel CarrierGroup,type:8'),(3,'12,13,14,15','name:Flowroute CarrierGroup,type:8'),(4,'16,17,18,19,20,21','name:Voxbone CarrierGroup,type:8'),(5,'22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37','name:VoIP Innovations Inbound CarrierGroup,type:8'),(6,'38','name:Thinq CarrierGroup,type:8'),(7,'39','name:Voxtelesys CarrierGroup,type:8'),(8,'40','name:Les.net CarrierGroup,type:8'),(9,'49,50,51','name:ThinkTel CarrierGroup,type:8'),(10,'52,53,54,55','name:VoIP Innovations Outbound Conversational CarrierGroup,type:8');
/*!40000 ALTER TABLE `dr_gw_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS insert_gw2gwgroup */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_gw2gwgroup
  AFTER INSERT
  ON dr_gw_lists
  FOR EACH ROW
BEGIN

  DECLARE num_gws int DEFAULT 0;
  DECLARE gw_index int DEFAULT 1;

  IF CHAR_LENGTH(NEW.gwlist) > 0 THEN
    SET num_gws := (CHAR_LENGTH(NEW.gwlist) - CHAR_LENGTH(REPLACE(NEW.gwlist, ',', '')) + 1);

    
    WHILE gw_index <= num_gws
      DO
        INSERT IGNORE INTO dsip_gw2gwgroup
        VALUES (SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.gwlist, ',', gw_index), ',', -1), cast(NEW.id AS char(64)), DEFAULT,
                DEFAULT);
        SET gw_index := gw_index + 1;
      END WHILE;
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS update_gw2gwgroup */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_gw2gwgroup
  AFTER UPDATE
  ON dr_gw_lists
  FOR EACH ROW
BEGIN

  DECLARE num_gws int DEFAULT 0;
  DECLARE gw_index int DEFAULT 1;

  
  IF NOT (NEW.gwlist <=> OLD.gwlist) THEN
    DELETE FROM dsip_gw2gwgroup WHERE gwgroupid = cast(OLD.id AS char(64));

    IF CHAR_LENGTH(NEW.gwlist) > 0 THEN
      SET num_gws := (CHAR_LENGTH(NEW.gwlist) - CHAR_LENGTH(REPLACE(NEW.gwlist, ',', '')) + 1);

      
      WHILE gw_index <= num_gws
        DO
          INSERT IGNORE INTO dsip_gw2gwgroup
          VALUES (SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.gwlist, ',', gw_index), ',', -1), cast(NEW.id AS char(64)),
                  DEFAULT,
                  DEFAULT);
          SET gw_index := gw_index + 1;
        END WHILE;
    END IF;

    
  ELSEIF NOT (NEW.id <=> OLD.id) THEN
    UPDATE dsip_gw2gwgroup SET gwgroupid = cast(NEW.id AS char(64)) WHERE gwgroupid = cast(OLD.id AS char(64));
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS delete_gw2gwgroup */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER delete_gw2gwgroup
  AFTER DELETE
  ON dr_gw_lists
  FOR EACH ROW
BEGIN

  DELETE FROM dsip_gw2gwgroup WHERE gwgroupid = cast(OLD.id AS char(64));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dr_rules`
--

DROP TABLE IF EXISTS `dr_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_rules` (
  `ruleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` varchar(255) NOT NULL,
  `prefix` varchar(64) NOT NULL,
  `timerec` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `routeid` varchar(255) NOT NULL,
  `gwlist` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_rules`
--

LOCK TABLES `dr_rules` WRITE;
/*!40000 ALTER TABLE `dr_rules` DISABLE KEYS */;
REPLACE INTO `dr_rules` (`ruleid`, `groupid`, `prefix`, `timerec`, `priority`, `routeid`, `gwlist`, `description`) VALUES (1,'8000','','',0,'','#2','name:Default Outbound Route');
/*!40000 ALTER TABLE `dr_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_calllimit`
--

DROP TABLE IF EXISTS `dsip_calllimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_calllimit` (
  `gwgroupid` varchar(64) NOT NULL,
  `limit` varchar(64) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gwgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_calllimit`
--

LOCK TABLES `dsip_calllimit` WRITE;
/*!40000 ALTER TABLE `dsip_calllimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_calllimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_cdrinfo`
--

DROP TABLE IF EXISTS `dsip_cdrinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_cdrinfo` (
  `gwgroupid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `send_interval` varchar(255) NOT NULL DEFAULT '* * 1 * *',
  `last_sent` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`gwgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_cdrinfo`
--

LOCK TABLES `dsip_cdrinfo` WRITE;
/*!40000 ALTER TABLE `dsip_cdrinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_cdrinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_certificates`
--

DROP TABLE IF EXISTS `dsip_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(128) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `cert` blob DEFAULT NULL,
  `key` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_certificates`
--

LOCK TABLES `dsip_certificates` WRITE;
/*!40000 ALTER TABLE `dsip_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_dnid_enrich_lnp`
--

DROP TABLE IF EXISTS `dsip_dnid_enrich_lnp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_dnid_enrich_lnp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dnid` varchar(64) NOT NULL,
  `country_code` varchar(64) NOT NULL DEFAULT '',
  `routing_number` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_dnid_enrich_lnp`
--

LOCK TABLES `dsip_dnid_enrich_lnp` WRITE;
/*!40000 ALTER TABLE `dsip_dnid_enrich_lnp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_dnid_enrich_lnp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dsip_dnid_lnp_mapping`
--

DROP TABLE IF EXISTS `dsip_dnid_lnp_mapping`;
/*!50001 DROP VIEW IF EXISTS `dsip_dnid_lnp_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsip_dnid_lnp_mapping` AS SELECT 
 1 AS `dnid`,
 1 AS `prefix`,
 1 AS `key_type`,
 1 AS `value_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dsip_domain_mapping`
--

DROP TABLE IF EXISTS `dsip_domain_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_domain_mapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pbx_id` int(10) NOT NULL,
  `domain_id` int(10) NOT NULL,
  `attr_list` varchar(255) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_domain_mapping`
--

LOCK TABLES `dsip_domain_mapping` WRITE;
/*!40000 ALTER TABLE `dsip_domain_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_domain_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_endpoint_lease`
--

DROP TABLE IF EXISTS `dsip_endpoint_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_endpoint_lease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gwid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_endpoint_lease`
--

LOCK TABLES `dsip_endpoint_lease` WRITE;
/*!40000 ALTER TABLE `dsip_endpoint_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_endpoint_lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_failfwd`
--

DROP TABLE IF EXISTS `dsip_failfwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_failfwd` (
  `dr_ruleid` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `dr_groupid` varchar(64) NOT NULL,
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dr_ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_failfwd`
--

LOCK TABLES `dsip_failfwd` WRITE;
/*!40000 ALTER TABLE `dsip_failfwd` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_failfwd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_gw2gwgroup`
--

DROP TABLE IF EXISTS `dsip_gw2gwgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_gw2gwgroup` (
  `gwid` varchar(64) NOT NULL,
  `gwgroupid` varchar(64) NOT NULL,
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gwid`,`gwgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_gw2gwgroup`
--

LOCK TABLES `dsip_gw2gwgroup` WRITE;
/*!40000 ALTER TABLE `dsip_gw2gwgroup` DISABLE KEYS */;
REPLACE INTO `dsip_gw2gwgroup` (`gwid`, `gwgroupid`, `key_type`, `value_type`) VALUES ('1','2','0','0'),('10','2','0','0'),('11','2','0','0'),('12','3','0','0'),('13','3','0','0'),('14','3','0','0'),('15','3','0','0'),('16','4','0','0'),('17','4','0','0'),('18','4','0','0'),('19','4','0','0'),('2','2','0','0'),('20','4','0','0'),('21','4','0','0'),('22','5','0','0'),('23','5','0','0'),('24','5','0','0'),('25','5','0','0'),('26','5','0','0'),('27','5','0','0'),('28','5','0','0'),('29','5','0','0'),('3','2','0','0'),('30','5','0','0'),('31','5','0','0'),('32','5','0','0'),('33','5','0','0'),('34','5','0','0'),('35','5','0','0'),('36','5','0','0'),('37','5','0','0'),('38','6','0','0'),('39','7','0','0'),('4','2','0','0'),('40','8','0','0'),('41','1','0','0'),('42','1','0','0'),('43','1','0','0'),('44','1','0','0'),('45','1','0','0'),('46','1','0','0'),('47','1','0','0'),('48','1','0','0'),('49','9','0','0'),('5','2','0','0'),('50','9','0','0'),('51','9','0','0'),('52','10','0','0'),('53','10','0','0'),('54','10','0','0'),('55','10','0','0'),('6','2','0','0'),('7','2','0','0'),('8','2','0','0'),('9','2','0','0');
/*!40000 ALTER TABLE `dsip_gw2gwgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_hardfwd`
--

DROP TABLE IF EXISTS `dsip_hardfwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_hardfwd` (
  `dr_ruleid` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `dr_groupid` varchar(64) NOT NULL,
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dr_ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_hardfwd`
--

LOCK TABLES `dsip_hardfwd` WRITE;
/*!40000 ALTER TABLE `dsip_hardfwd` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_hardfwd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_lcr`
--

DROP TABLE IF EXISTS `dsip_lcr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_lcr` (
  `pattern` varchar(64) NOT NULL DEFAULT '',
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `dr_groupid` varchar(64) NOT NULL DEFAULT '',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  `cost` decimal(3,2) NOT NULL DEFAULT 0.00,
  `from_prefix` varchar(64) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_lcr`
--

LOCK TABLES `dsip_lcr` WRITE;
/*!40000 ALTER TABLE `dsip_lcr` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_lcr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_maintmode`
--

DROP TABLE IF EXISTS `dsip_maintmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_maintmode` (
  `ipaddr` varchar(64) NOT NULL DEFAULT '',
  `key_type` varchar(64) NOT NULL DEFAULT '0',
  `gwid` varchar(64) NOT NULL DEFAULT '',
  `value_type` varchar(64) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ipaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_maintmode`
--

LOCK TABLES `dsip_maintmode` WRITE;
/*!40000 ALTER TABLE `dsip_maintmode` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_maintmode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_multidomain_mapping`
--

DROP TABLE IF EXISTS `dsip_multidomain_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_multidomain_mapping` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pbx_id` int(10) NOT NULL,
  `db_host` varchar(255) NOT NULL,
  `db_username` varchar(255) NOT NULL,
  `db_password` varchar(255) NOT NULL,
  `domain_list` varchar(255) NOT NULL DEFAULT '',
  `domain_list_hash` varchar(255) NOT NULL DEFAULT '',
  `attr_list` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `lastsync` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `syncstatus` tinyint(1) NOT NULL DEFAULT 0,
  `syncerror` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_multidomain_mapping`
--

LOCK TABLES `dsip_multidomain_mapping` WRITE;
/*!40000 ALTER TABLE `dsip_multidomain_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_multidomain_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsip_notification`
--

DROP TABLE IF EXISTS `dsip_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_notification` (
  `gwgroupid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `method` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`gwgroupid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_notification`
--

LOCK TABLES `dsip_notification` WRITE;
/*!40000 ALTER TABLE `dsip_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsip_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dsip_prefix_mapping`
--

DROP TABLE IF EXISTS `dsip_prefix_mapping`;
/*!50001 DROP VIEW IF EXISTS `dsip_prefix_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dsip_prefix_mapping` AS SELECT 
 1 AS `prefix`,
 1 AS `ruleid`,
 1 AS `priority`,
 1 AS `key_type`,
 1 AS `value_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dsip_settings`
--

DROP TABLE IF EXISTS `dsip_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsip_settings` (
  `DSIP_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DSIP_CLUSTER_ID` int(10) unsigned NOT NULL DEFAULT 1,
  `DSIP_CLUSTER_SYNC` tinyint(1) NOT NULL DEFAULT 1,
  `DSIP_PROTO` varchar(16) NOT NULL DEFAULT 'http',
  `DSIP_PORT` int(11) NOT NULL DEFAULT 5000,
  `DSIP_USERNAME` varchar(255) NOT NULL DEFAULT 'admin',
  `DSIP_PASSWORD` varbinary(256) NOT NULL,
  `DSIP_IPC_PASS` varbinary(160) NOT NULL,
  `DSIP_API_PROTO` varchar(16) NOT NULL DEFAULT 'http',
  `DSIP_API_PORT` int(11) NOT NULL DEFAULT 5000,
  `DSIP_PRIV_KEY` varchar(255) NOT NULL DEFAULT '/etc/dsiprouter/privkey',
  `DSIP_PID_FILE` varchar(255) NOT NULL DEFAULT '/var/run/dsiprouter/dsiprouter.pid',
  `DSIP_UNIX_SOCK` varchar(255) NOT NULL DEFAULT '/var/run/dsiprouter/dsiprouter.sock',
  `DSIP_IPC_SOCK` varchar(255) NOT NULL DEFAULT '/var/run/dsiprouter/ipc.sock',
  `DSIP_API_TOKEN` varbinary(160) NOT NULL,
  `DSIP_LOG_LEVEL` int(11) NOT NULL DEFAULT 3,
  `DSIP_LOG_FACILITY` int(11) NOT NULL DEFAULT 18,
  `DSIP_SSL_KEY` varchar(255) NOT NULL DEFAULT '',
  `DSIP_SSL_CERT` varchar(255) NOT NULL DEFAULT '',
  `DSIP_SSL_CA` varchar(255) NOT NULL DEFAULT '/etc/dsiprouter/certs/cacert.pem',
  `DSIP_SSL_EMAIL` varchar(255) NOT NULL DEFAULT '',
  `DSIP_CERTS_DIR` varchar(255) NOT NULL DEFAULT '/etc/dsiprouter/certs',
  `VERSION` varchar(32) NOT NULL DEFAULT '0.61',
  `DEBUG` tinyint(1) NOT NULL DEFAULT 0,
  `ROLE` varchar(32) NOT NULL DEFAULT '',
  `GUI_INACTIVE_TIMEOUT` int(10) unsigned NOT NULL DEFAULT 20,
  `KAM_DB_HOST` varchar(255) NOT NULL DEFAULT 'localhost',
  `KAM_DB_DRIVER` varchar(255) NOT NULL DEFAULT '',
  `KAM_DB_TYPE` varchar(255) NOT NULL DEFAULT 'mysql',
  `KAM_DB_PORT` varchar(255) NOT NULL DEFAULT '3306',
  `KAM_DB_NAME` varchar(255) NOT NULL DEFAULT 'kamailio',
  `KAM_DB_USER` varchar(255) NOT NULL DEFAULT 'kamailio',
  `KAM_DB_PASS` varbinary(160) NOT NULL,
  `KAM_KAMCMD_PATH` varchar(255) NOT NULL DEFAULT '/usr/sbin/kamcmd',
  `KAM_CFG_PATH` varchar(255) NOT NULL DEFAULT '/etc/kamailio/kamailio.cfg',
  `KAM_TLSCFG_PATH` varchar(255) NOT NULL DEFAULT '/etc/kamailio/tls.cfg',
  `RTP_CFG_PATH` varchar(255) NOT NULL DEFAULT '/etc/kamailio/kamailio.cfg',
  `SQLALCHEMY_TRACK_MODIFICATIONS` tinyint(1) NOT NULL DEFAULT 0,
  `SQLALCHEMY_SQL_DEBUG` tinyint(1) NOT NULL DEFAULT 0,
  `FLT_CARRIER` int(11) NOT NULL DEFAULT 8,
  `FLT_PBX` int(11) NOT NULL DEFAULT 9,
  `FLT_MSTEAMS` int(11) NOT NULL DEFAULT 17,
  `FLT_OUTBOUND` int(11) NOT NULL DEFAULT 8000,
  `FLT_INBOUND` int(11) NOT NULL DEFAULT 9000,
  `FLT_LCR_MIN` int(11) NOT NULL DEFAULT 10000,
  `FLT_FWD_MIN` int(11) NOT NULL DEFAULT 20000,
  `DEFAULT_AUTH_DOMAIN` varchar(255) NOT NULL DEFAULT 'sip.dsiprouter.org',
  `TELEBLOCK_GW_ENABLED` tinyint(1) NOT NULL DEFAULT 0,
  `TELEBLOCK_GW_IP` varchar(255) NOT NULL DEFAULT '62.34.24.22',
  `TELEBLOCK_GW_PORT` varchar(255) NOT NULL DEFAULT '5066',
  `TELEBLOCK_MEDIA_IP` varchar(255) NOT NULL DEFAULT '',
  `TELEBLOCK_MEDIA_PORT` varchar(255) NOT NULL DEFAULT '',
  `FLOWROUTE_ACCESS_KEY` varchar(255) NOT NULL DEFAULT '',
  `FLOWROUTE_SECRET_KEY` varchar(255) NOT NULL DEFAULT '',
  `FLOWROUTE_API_ROOT_URL` varchar(255) NOT NULL DEFAULT 'https://api.flowroute.com/v2',
  `INTERNAL_IP_ADDR` varchar(255) NOT NULL DEFAULT '192.168.0.1',
  `INTERNAL_IP_NET` varchar(255) NOT NULL DEFAULT '192.168.0.*',
  `EXTERNAL_IP_ADDR` varchar(255) NOT NULL DEFAULT '1.1.1.1',
  `EXTERNAL_FQDN` varchar(255) NOT NULL DEFAULT 'sip.dsiprouter.org',
  `UPLOAD_FOLDER` varchar(255) NOT NULL DEFAULT '/tmp',
  `CLOUD_PLATFORM` varchar(16) NOT NULL DEFAULT '',
  `MAIL_SERVER` varchar(255) NOT NULL DEFAULT 'smtp.gmail.com',
  `MAIL_PORT` int(11) NOT NULL DEFAULT 587,
  `MAIL_USE_TLS` tinyint(1) NOT NULL DEFAULT 1,
  `MAIL_USERNAME` varchar(255) NOT NULL DEFAULT '',
  `MAIL_PASSWORD` varbinary(160) NOT NULL,
  `MAIL_ASCII_ATTACHMENTS` tinyint(1) NOT NULL DEFAULT 0,
  `MAIL_DEFAULT_SENDER` varchar(255) NOT NULL DEFAULT 'DoNotReply@smtp.gmail.com',
  `MAIL_DEFAULT_SUBJECT` varchar(255) NOT NULL DEFAULT 'dSIPRouter System Notification',
  PRIMARY KEY (`DSIP_ID`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`ROLE` in ('','outbound','inout')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`CLOUD_PLATFORM` in ('','AWS','GCP','AZURE','DO'))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 MIN_ROWS=1 MAX_ROWS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsip_settings`
--

LOCK TABLES `dsip_settings` WRITE;
/*!40000 ALTER TABLE `dsip_settings` DISABLE KEYS */;
REPLACE INTO `dsip_settings` (`DSIP_ID`, `DSIP_CLUSTER_ID`, `DSIP_CLUSTER_SYNC`, `DSIP_PROTO`, `DSIP_PORT`, `DSIP_USERNAME`, `DSIP_PASSWORD`, `DSIP_IPC_PASS`, `DSIP_API_PROTO`, `DSIP_API_PORT`, `DSIP_PRIV_KEY`, `DSIP_PID_FILE`, `DSIP_UNIX_SOCK`, `DSIP_IPC_SOCK`, `DSIP_API_TOKEN`, `DSIP_LOG_LEVEL`, `DSIP_LOG_FACILITY`, `DSIP_SSL_KEY`, `DSIP_SSL_CERT`, `DSIP_SSL_CA`, `DSIP_SSL_EMAIL`, `DSIP_CERTS_DIR`, `VERSION`, `DEBUG`, `ROLE`, `GUI_INACTIVE_TIMEOUT`, `KAM_DB_HOST`, `KAM_DB_DRIVER`, `KAM_DB_TYPE`, `KAM_DB_PORT`, `KAM_DB_NAME`, `KAM_DB_USER`, `KAM_DB_PASS`, `KAM_KAMCMD_PATH`, `KAM_CFG_PATH`, `KAM_TLSCFG_PATH`, `RTP_CFG_PATH`, `SQLALCHEMY_TRACK_MODIFICATIONS`, `SQLALCHEMY_SQL_DEBUG`, `FLT_CARRIER`, `FLT_PBX`, `FLT_MSTEAMS`, `FLT_OUTBOUND`, `FLT_INBOUND`, `FLT_LCR_MIN`, `FLT_FWD_MIN`, `DEFAULT_AUTH_DOMAIN`, `TELEBLOCK_GW_ENABLED`, `TELEBLOCK_GW_IP`, `TELEBLOCK_GW_PORT`, `TELEBLOCK_MEDIA_IP`, `TELEBLOCK_MEDIA_PORT`, `FLOWROUTE_ACCESS_KEY`, `FLOWROUTE_SECRET_KEY`, `FLOWROUTE_API_ROOT_URL`, `INTERNAL_IP_ADDR`, `INTERNAL_IP_NET`, `EXTERNAL_IP_ADDR`, `EXTERNAL_FQDN`, `UPLOAD_FOLDER`, `CLOUD_PLATFORM`, `MAIL_SERVER`, `MAIL_PORT`, `MAIL_USE_TLS`, `MAIL_USERNAME`, `MAIL_PASSWORD`, `MAIL_ASCII_ATTACHMENTS`, `MAIL_DEFAULT_SENDER`, `MAIL_DEFAULT_SUBJECT`) VALUES (1,1,0,'https',5000,'admin',0x37303365323635663763663231316265393330393062356339643366373232623866343138383430653238323366323163393166623232306539393161363665626561663834336633303131353165376236656162346439313834363338313166643839636664376562396436363733393232303137346434636665326163643661636331386334663731316231333130306464393933613234663166306365663335396434393931393334613361393933333933613338366333303931643433323932653563336431656335653161656561663030396630373862623435323662633366613536343666303933656637333962393838313366366366663763,0x33316639383063323231646531666431396338656661393832353538393839376438383339653234303032303835353564303839323935376336613233393039333839396334383162313966313664656535643938363330653035323364623430636138623965343334386236373063646233336630313636303364316638613663633732396630633037613162623562623661373164633532613932383532,'https',5000,'/etc/dsiprouter/privkey','/var/run/dsiprouter/dsiprouter.pid','/var/run/dsiprouter/ipc.sock','/var/run/dsiprouter/dsiprouter.sock',0x63346438363362653537393231373466643631643931333861343362323730636637373066396635363735383866373061646235663038383730393237316665626166346438303962616434613163313662653134616264343166316134633736383530366631366633373634383133616339336561353231346239373365646439303663393463323430653838326336323765343339376634303161663562,3,18,'/etc/dsiprouter/certs/dsiprouter-key.pem','/etc/dsiprouter/certs/dsiprouter-cert.pem','/etc/dsiprouter/certs/cacert.pem','admin@dsip-tmp','/etc/dsiprouter/certs','0.641',1,'',20,'localhost','','mysql','3306','kamailio','kamailio',0x65386430383633303464356635346238303036313565653535333561353663386330613434363564383437313066643565616463346665373661623731623737643362323334636535653262303465633465393939366261303962643633626634326639363932643764356662336566343161653761636637313766666330323364366661343965646430326234323834646431633137306339393461353131,'/usr/sbin/kamcmd','/etc/kamailio/kamailio.cfg','/etc/kamailio/tls.cfg','/etc/rtpengine/rtpengine.conf',0,1,8,9,17,8000,9000,10000,20000,'sip.dsiprouter.org',0,'62.34.24.22','5066','','','','','https://api.flowroute.com/v2','204.48.17.240','204.48.17.*','204.48.17.240','sip.dsiprouter.org','/tmp','DO','smtp.gmail.com',587,1,'','',0,'dSIPRouter 1-1 <>','dSIPRouter System Notification');
/*!40000 ALTER TABLE `dsip_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalblacklist`
--

DROP TABLE IF EXISTS `globalblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `globalblacklist_idx` (`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalblacklist`
--

LOCK TABLES `globalblacklist` WRITE;
/*!40000 ALTER TABLE `globalblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grp`
--

DROP TABLE IF EXISTS `grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `grp` varchar(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_group_idx` (`username`,`domain`,`grp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grp`
--

LOCK TABLES `grp` WRITE;
/*!40000 ALTER TABLE `grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htable`
--

DROP TABLE IF EXISTS `htable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key_name` varchar(64) NOT NULL DEFAULT '',
  `key_type` int(11) NOT NULL DEFAULT 0,
  `value_type` int(11) NOT NULL DEFAULT 0,
  `key_value` varchar(128) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htable`
--

LOCK TABLES `htable` WRITE;
/*!40000 ALTER TABLE `htable` DISABLE KEYS */;
/*!40000 ALTER TABLE `htable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imc_members`
--

DROP TABLE IF EXISTS `imc_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imc_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `room` varchar(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_room_idx` (`username`,`domain`,`room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imc_members`
--

LOCK TABLES `imc_members` WRITE;
/*!40000 ALTER TABLE `imc_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `imc_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imc_rooms`
--

DROP TABLE IF EXISTS `imc_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imc_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_domain_idx` (`name`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imc_rooms`
--

LOCK TABLES `imc_rooms` WRITE;
/*!40000 ALTER TABLE `imc_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imc_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcr_gw`
--

DROP TABLE IF EXISTS `lcr_gw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lcr_gw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` smallint(5) unsigned NOT NULL,
  `gw_name` varchar(128) DEFAULT NULL,
  `ip_addr` varchar(50) DEFAULT NULL,
  `hostname` varchar(64) DEFAULT NULL,
  `port` smallint(5) unsigned DEFAULT NULL,
  `params` varchar(64) DEFAULT NULL,
  `uri_scheme` tinyint(3) unsigned DEFAULT NULL,
  `transport` tinyint(3) unsigned DEFAULT NULL,
  `strip` tinyint(3) unsigned DEFAULT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  `defunct` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lcr_id_idx` (`lcr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcr_gw`
--

LOCK TABLES `lcr_gw` WRITE;
/*!40000 ALTER TABLE `lcr_gw` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcr_gw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcr_rule`
--

DROP TABLE IF EXISTS `lcr_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lcr_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` smallint(5) unsigned NOT NULL,
  `prefix` varchar(16) DEFAULT NULL,
  `from_uri` varchar(64) DEFAULT NULL,
  `request_uri` varchar(64) DEFAULT NULL,
  `mt_tvalue` varchar(128) DEFAULT NULL,
  `stopper` int(10) unsigned NOT NULL DEFAULT 0,
  `enabled` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lcr_id_prefix_from_uri_idx` (`lcr_id`,`prefix`,`from_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcr_rule`
--

LOCK TABLES `lcr_rule` WRITE;
/*!40000 ALTER TABLE `lcr_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcr_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcr_rule_target`
--

DROP TABLE IF EXISTS `lcr_rule_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lcr_rule_target` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lcr_id` smallint(5) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `gw_id` int(10) unsigned NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id_gw_id_idx` (`rule_id`,`gw_id`),
  KEY `lcr_id_idx` (`lcr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcr_rule_target`
--

LOCK TABLES `lcr_rule_target` WRITE;
/*!40000 ALTER TABLE `lcr_rule_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcr_rule_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locale_lookup`
--

DROP TABLE IF EXISTS `locale_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locale_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(64) NOT NULL DEFAULT '',
  `fprefix` varchar(64) NOT NULL DEFAULT '0',
  `tprefix` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locale_lookup`
--

LOCK TABLES `locale_lookup` WRITE;
/*!40000 ALTER TABLE `locale_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `locale_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `contact` varchar(512) NOT NULL DEFAULT '',
  `received` varchar(128) DEFAULT NULL,
  `path` varchar(512) DEFAULT NULL,
  `expires` datetime NOT NULL DEFAULT '2030-05-28 21:32:15',
  `q` float(10,2) NOT NULL DEFAULT 1.00,
  `callid` varchar(255) NOT NULL DEFAULT 'Default-Call-ID',
  `cseq` int(11) NOT NULL DEFAULT 1,
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `flags` int(11) NOT NULL DEFAULT 0,
  `cflags` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `socket` varchar(64) DEFAULT NULL,
  `methods` int(11) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `server_id` int(11) NOT NULL DEFAULT 0,
  `connection_id` int(11) NOT NULL DEFAULT 0,
  `keepalive` int(11) NOT NULL DEFAULT 0,
  `partition` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `account_contact_idx` (`username`,`domain`,`contact`),
  KEY `expires_idx` (`expires`),
  KEY `connection_idx` (`server_id`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_attrs`
--

DROP TABLE IF EXISTS `location_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) DEFAULT NULL,
  `aname` varchar(64) NOT NULL DEFAULT '',
  `atype` int(11) NOT NULL DEFAULT 0,
  `avalue` varchar(512) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `account_record_idx` (`username`,`domain`,`ruid`),
  KEY `last_modified_idx` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_attrs`
--

LOCK TABLES `location_attrs` WRITE;
/*!40000 ALTER TABLE `location_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missed_calls`
--

DROP TABLE IF EXISTS `missed_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missed_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(16) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `callid` varchar(255) NOT NULL DEFAULT '',
  `sip_code` varchar(3) NOT NULL DEFAULT '',
  `sip_reason` varchar(128) NOT NULL DEFAULT '',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missed_calls`
--

LOCK TABLES `missed_calls` WRITE;
/*!40000 ALTER TABLE `missed_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `missed_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mohqcalls`
--

DROP TABLE IF EXISTS `mohqcalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mohqcalls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mohq_id` int(10) unsigned NOT NULL,
  `call_id` varchar(100) NOT NULL,
  `call_status` int(10) unsigned NOT NULL,
  `call_from` varchar(100) NOT NULL,
  `call_contact` varchar(100) DEFAULT NULL,
  `call_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mohqcalls_idx` (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mohqcalls`
--

LOCK TABLES `mohqcalls` WRITE;
/*!40000 ALTER TABLE `mohqcalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `mohqcalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mohqueues`
--

DROP TABLE IF EXISTS `mohqueues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mohqueues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `mohdir` varchar(100) DEFAULT NULL,
  `mohfile` varchar(100) NOT NULL,
  `debug` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mohqueue_uri_idx` (`uri`),
  UNIQUE KEY `mohqueue_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mohqueues`
--

LOCK TABLES `mohqueues` WRITE;
/*!40000 ALTER TABLE `mohqueues` DISABLE KEYS */;
/*!40000 ALTER TABLE `mohqueues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtree`
--

DROP TABLE IF EXISTS `mtree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtree` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tprefix` varchar(32) NOT NULL DEFAULT '',
  `tvalue` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tprefix_idx` (`tprefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtree`
--

LOCK TABLES `mtree` WRITE;
/*!40000 ALTER TABLE `mtree` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtrees`
--

DROP TABLE IF EXISTS `mtrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtrees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tname` varchar(128) NOT NULL DEFAULT '',
  `tprefix` varchar(32) NOT NULL DEFAULT '',
  `tvalue` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tname_tprefix_tvalue_idx` (`tname`,`tprefix`,`tvalue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtrees`
--

LOCK TABLES `mtrees` WRITE;
/*!40000 ALTER TABLE `mtrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdt`
--

DROP TABLE IF EXISTS `pdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sdomain` varchar(255) NOT NULL,
  `prefix` varchar(32) NOT NULL,
  `domain` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sdomain_prefix_idx` (`sdomain`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdt`
--

LOCK TABLES `pdt` WRITE;
/*!40000 ALTER TABLE `pdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_pipes`
--

DROP TABLE IF EXISTS `pl_pipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pl_pipes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pipeid` varchar(64) NOT NULL DEFAULT '',
  `algorithm` varchar(32) NOT NULL DEFAULT '',
  `plimit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_pipes`
--

LOCK TABLES `pl_pipes` WRITE;
/*!40000 ALTER TABLE `pl_pipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pl_pipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentity`
--

DROP TABLE IF EXISTS `presentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `etag` varchar(128) NOT NULL,
  `expires` int(11) NOT NULL,
  `received_time` int(11) NOT NULL,
  `body` blob NOT NULL,
  `sender` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `ruid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentity_idx` (`username`,`domain`,`event`,`etag`),
  UNIQUE KEY `ruid_idx` (`ruid`),
  KEY `presentity_expires` (`expires`),
  KEY `account_idx` (`username`,`domain`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentity`
--

LOCK TABLES `presentity` WRITE;
/*!40000 ALTER TABLE `presentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pua`
--

DROP TABLE IF EXISTS `pua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pua` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pres_uri` varchar(255) NOT NULL,
  `pres_id` varchar(255) NOT NULL,
  `event` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `desired_expires` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  `etag` varchar(128) NOT NULL,
  `tuple_id` varchar(64) DEFAULT NULL,
  `watcher_uri` varchar(255) NOT NULL,
  `call_id` varchar(255) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `cseq` int(11) NOT NULL,
  `record_route` text DEFAULT NULL,
  `contact` varchar(255) NOT NULL,
  `remote_contact` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `extra_headers` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pua_idx` (`etag`,`tuple_id`,`call_id`,`from_tag`),
  KEY `expires_idx` (`expires`),
  KEY `dialog1_idx` (`pres_id`,`pres_uri`),
  KEY `dialog2_idx` (`call_id`,`from_tag`),
  KEY `record_idx` (`pres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pua`
--

LOCK TABLES `pua` WRITE;
/*!40000 ALTER TABLE `pua` DISABLE KEYS */;
/*!40000 ALTER TABLE `pua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purplemap`
--

DROP TABLE IF EXISTS `purplemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purplemap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sip_user` varchar(255) NOT NULL,
  `ext_user` varchar(255) NOT NULL,
  `ext_prot` varchar(16) NOT NULL,
  `ext_pass` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purplemap`
--

LOCK TABLES `purplemap` WRITE;
/*!40000 ALTER TABLE `purplemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `purplemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_grp`
--

DROP TABLE IF EXISTS `re_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reg_exp` varchar(128) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `group_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_grp`
--

LOCK TABLES `re_grp` WRITE;
/*!40000 ALTER TABLE `re_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rls_presentity`
--

DROP TABLE IF EXISTS `rls_presentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rls_presentity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rlsubs_did` varchar(255) NOT NULL,
  `resource_uri` varchar(255) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `presence_state` blob NOT NULL,
  `expires` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `auth_state` int(11) NOT NULL,
  `reason` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_presentity_idx` (`rlsubs_did`,`resource_uri`),
  KEY `rlsubs_idx` (`rlsubs_did`),
  KEY `updated_idx` (`updated`),
  KEY `expires_idx` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rls_presentity`
--

LOCK TABLES `rls_presentity` WRITE;
/*!40000 ALTER TABLE `rls_presentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `rls_presentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rls_watchers`
--

DROP TABLE IF EXISTS `rls_watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rls_watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` varchar(255) NOT NULL,
  `to_user` varchar(64) NOT NULL,
  `to_domain` varchar(64) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `event_id` varchar(64) DEFAULT NULL,
  `to_tag` varchar(128) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `callid` varchar(255) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `remote_cseq` int(11) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `record_route` text DEFAULT NULL,
  `expires` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `reason` varchar(64) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `socket_info` varchar(64) NOT NULL,
  `local_contact` varchar(255) NOT NULL,
  `from_user` varchar(64) NOT NULL,
  `from_domain` varchar(64) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rls_watcher_idx` (`callid`,`to_tag`,`from_tag`),
  KEY `rls_watchers_update` (`watcher_username`,`watcher_domain`,`event`),
  KEY `rls_watchers_expires` (`expires`),
  KEY `updated_idx` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rls_watchers`
--

LOCK TABLES `rls_watchers` WRITE;
/*!40000 ALTER TABLE `rls_watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rls_watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtpengine`
--

DROP TABLE IF EXISTS `rtpengine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rtpengine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` int(10) unsigned NOT NULL DEFAULT 0,
  `url` varchar(64) NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT 1,
  `disabled` int(1) NOT NULL DEFAULT 0,
  `stamp` datetime NOT NULL DEFAULT '1900-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtpengine_nodes` (`setid`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtpengine`
--

LOCK TABLES `rtpengine` WRITE;
/*!40000 ALTER TABLE `rtpengine` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtpengine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rtpproxy`
--

DROP TABLE IF EXISTS `rtpproxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rtpproxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setid` varchar(32) NOT NULL DEFAULT '0',
  `url` varchar(64) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT 0,
  `weight` int(11) NOT NULL DEFAULT 1,
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rtpproxy`
--

LOCK TABLES `rtpproxy` WRITE;
/*!40000 ALTER TABLE `rtpproxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `rtpproxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sca_subscriptions`
--

DROP TABLE IF EXISTS `sca_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sca_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscriber` varchar(255) NOT NULL,
  `aor` varchar(255) NOT NULL,
  `event` int(11) NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `app_idx` int(11) NOT NULL DEFAULT 0,
  `call_id` varchar(255) NOT NULL,
  `from_tag` varchar(128) NOT NULL,
  `to_tag` varchar(128) NOT NULL,
  `record_route` text DEFAULT NULL,
  `notify_cseq` int(11) NOT NULL,
  `subscribe_cseq` int(11) NOT NULL,
  `server_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sca_subscriptions_idx` (`subscriber`,`call_id`,`from_tag`,`to_tag`),
  KEY `sca_expires_idx` (`server_id`,`expires`),
  KEY `sca_subscribers_idx` (`subscriber`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sca_subscriptions`
--

LOCK TABLES `sca_subscriptions` WRITE;
/*!40000 ALTER TABLE `sca_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sca_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secfilter`
--

DROP TABLE IF EXISTS `secfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secfilter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` smallint(6) NOT NULL DEFAULT 0,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `data` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `secfilter_idx` (`action`,`type`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secfilter`
--

LOCK TABLES `secfilter` WRITE;
/*!40000 ALTER TABLE `secfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `secfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silo`
--

DROP TABLE IF EXISTS `silo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_addr` varchar(255) NOT NULL DEFAULT '',
  `dst_addr` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `inc_time` int(11) NOT NULL DEFAULT 0,
  `exp_time` int(11) NOT NULL DEFAULT 0,
  `snd_time` int(11) NOT NULL DEFAULT 0,
  `ctype` varchar(32) NOT NULL DEFAULT 'text/plain',
  `body` blob DEFAULT NULL,
  `extra_hdrs` text DEFAULT NULL,
  `callid` varchar(128) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `account_idx` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silo`
--

LOCK TABLES `silo` WRITE;
/*!40000 ALTER TABLE `silo` DISABLE KEYS */;
/*!40000 ALTER TABLE `silo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_trace`
--

DROP TABLE IF EXISTS `sip_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  `time_us` int(10) unsigned NOT NULL DEFAULT 0,
  `callid` varchar(255) NOT NULL DEFAULT '',
  `traced_user` varchar(255) NOT NULL DEFAULT '',
  `msg` mediumtext NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `fromip` varchar(50) NOT NULL DEFAULT '',
  `toip` varchar(50) NOT NULL DEFAULT '',
  `fromtag` varchar(128) NOT NULL DEFAULT '',
  `totag` varchar(128) NOT NULL DEFAULT '',
  `direction` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `traced_user_idx` (`traced_user`),
  KEY `date_idx` (`time_stamp`),
  KEY `fromip_idx` (`fromip`),
  KEY `callid_idx` (`callid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sip_trace`
--

LOCK TABLES `sip_trace` WRITE;
/*!40000 ALTER TABLE `sip_trace` DISABLE KEYS */;
/*!40000 ALTER TABLE `sip_trace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speed_dial`
--

DROP TABLE IF EXISTS `speed_dial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speed_dial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `sd_username` varchar(64) NOT NULL DEFAULT '',
  `sd_domain` varchar(64) NOT NULL DEFAULT '',
  `new_uri` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(64) NOT NULL DEFAULT '',
  `lname` varchar(64) NOT NULL DEFAULT '',
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `speed_dial_idx` (`username`,`domain`,`sd_domain`,`sd_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speed_dial`
--

LOCK TABLES `speed_dial` WRITE;
/*!40000 ALTER TABLE `speed_dial` DISABLE KEYS */;
/*!40000 ALTER TABLE `speed_dial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `ha1` varchar(128) NOT NULL DEFAULT '',
  `ha1b` varchar(128) NOT NULL DEFAULT '',
  `email_address` varchar(128) NOT NULL DEFAULT '',
  `rpid` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`),
  KEY `username_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topos_d`
--

DROP TABLE IF EXISTS `topos_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topos_d` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rectime` datetime NOT NULL,
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_rr` mediumtext DEFAULT NULL,
  `b_rr` mediumtext DEFAULT NULL,
  `s_rr` mediumtext DEFAULT NULL,
  `iflags` int(10) unsigned NOT NULL DEFAULT 0,
  `a_uri` varchar(255) NOT NULL DEFAULT '',
  `b_uri` varchar(255) NOT NULL DEFAULT '',
  `r_uri` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(128) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rectime_idx` (`rectime`),
  KEY `a_callid_idx` (`a_callid`),
  KEY `a_uuid_idx` (`a_uuid`),
  KEY `b_uuid_idx` (`b_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topos_d`
--

LOCK TABLES `topos_d` WRITE;
/*!40000 ALTER TABLE `topos_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `topos_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topos_t`
--

DROP TABLE IF EXISTS `topos_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topos_t` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rectime` datetime NOT NULL,
  `s_method` varchar(64) NOT NULL DEFAULT '',
  `s_cseq` varchar(64) NOT NULL DEFAULT '',
  `a_callid` varchar(255) NOT NULL DEFAULT '',
  `a_uuid` varchar(255) NOT NULL DEFAULT '',
  `b_uuid` varchar(255) NOT NULL DEFAULT '',
  `direction` int(11) NOT NULL DEFAULT 0,
  `x_via` mediumtext DEFAULT NULL,
  `x_vbranch` varchar(255) NOT NULL DEFAULT '',
  `x_rr` mediumtext DEFAULT NULL,
  `y_rr` mediumtext DEFAULT NULL,
  `s_rr` mediumtext DEFAULT NULL,
  `x_uri` varchar(255) NOT NULL DEFAULT '',
  `a_contact` varchar(512) NOT NULL DEFAULT '',
  `b_contact` varchar(512) NOT NULL DEFAULT '',
  `as_contact` varchar(512) NOT NULL DEFAULT '',
  `bs_contact` varchar(512) NOT NULL DEFAULT '',
  `x_tag` varchar(255) NOT NULL DEFAULT '',
  `a_tag` varchar(255) NOT NULL DEFAULT '',
  `b_tag` varchar(255) NOT NULL DEFAULT '',
  `a_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `b_srcaddr` varchar(255) NOT NULL DEFAULT '',
  `a_socket` varchar(128) NOT NULL DEFAULT '',
  `b_socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rectime_idx` (`rectime`),
  KEY `a_callid_idx` (`a_callid`),
  KEY `x_vbranch_idx` (`x_vbranch`),
  KEY `a_uuid_idx` (`a_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topos_t`
--

LOCK TABLES `topos_t` WRITE;
/*!40000 ALTER TABLE `topos_t` DISABLE KEYS */;
/*!40000 ALTER TABLE `topos_t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted`
--

DROP TABLE IF EXISTS `trusted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src_ip` varchar(50) NOT NULL,
  `proto` varchar(4) NOT NULL,
  `from_pattern` varchar(64) DEFAULT NULL,
  `ruri_pattern` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `peer_idx` (`src_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted`
--

LOCK TABLES `trusted` WRITE;
/*!40000 ALTER TABLE `trusted` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uacreg`
--

DROP TABLE IF EXISTS `uacreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uacreg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `l_uuid` varchar(64) NOT NULL DEFAULT '',
  `l_username` varchar(64) NOT NULL DEFAULT '',
  `l_domain` varchar(64) NOT NULL DEFAULT '',
  `r_username` varchar(64) NOT NULL DEFAULT '',
  `r_domain` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) NOT NULL DEFAULT '',
  `auth_username` varchar(64) NOT NULL DEFAULT '',
  `auth_password` varchar(64) NOT NULL DEFAULT '',
  `auth_ha1` varchar(128) NOT NULL DEFAULT '',
  `auth_proxy` varchar(255) NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `reg_delay` int(11) NOT NULL DEFAULT 0,
  `socket` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `l_uuid_idx` (`l_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uacreg`
--

LOCK TABLES `uacreg` WRITE;
/*!40000 ALTER TABLE `uacreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `uacreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_credentials`
--

DROP TABLE IF EXISTS `uid_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_credentials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_username` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL DEFAULT '_default',
  `realm` varchar(64) NOT NULL,
  `password` varchar(28) NOT NULL DEFAULT '',
  `flags` int(11) NOT NULL DEFAULT 0,
  `ha1` varchar(32) NOT NULL,
  `ha1b` varchar(32) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cred_idx` (`auth_username`,`did`),
  KEY `uid` (`uid`),
  KEY `did_idx` (`did`),
  KEY `realm_idx` (`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_credentials`
--

LOCK TABLES `uid_credentials` WRITE;
/*!40000 ALTER TABLE `uid_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_domain`
--

DROP TABLE IF EXISTS `uid_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_idx` (`domain`),
  KEY `did_idx` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_domain`
--

LOCK TABLES `uid_domain` WRITE;
/*!40000 ALTER TABLE `uid_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_domain_attrs`
--

DROP TABLE IF EXISTS `uid_domain_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_domain_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `did` varchar(64) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(128) DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_attr_idx` (`did`,`name`,`value`),
  KEY `domain_did` (`did`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_domain_attrs`
--

LOCK TABLES `uid_domain_attrs` WRITE;
/*!40000 ALTER TABLE `uid_domain_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_domain_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_global_attrs`
--

DROP TABLE IF EXISTS `uid_global_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_global_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(128) DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `global_attrs_idx` (`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_global_attrs`
--

LOCK TABLES `uid_global_attrs` WRITE;
/*!40000 ALTER TABLE `uid_global_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_global_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_uri`
--

DROP TABLE IF EXISTS `uid_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  `scheme` varchar(8) NOT NULL DEFAULT 'sip',
  PRIMARY KEY (`id`),
  KEY `uri_idx1` (`username`,`did`,`scheme`),
  KEY `uri_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_uri`
--

LOCK TABLES `uid_uri` WRITE;
/*!40000 ALTER TABLE `uid_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_uri_attrs`
--

DROP TABLE IF EXISTS `uid_uri_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_uri_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `did` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  `scheme` varchar(8) NOT NULL DEFAULT 'sip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uriattrs_idx` (`username`,`did`,`name`,`value`,`scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_uri_attrs`
--

LOCK TABLES `uid_uri_attrs` WRITE;
/*!40000 ALTER TABLE `uid_uri_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_uri_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uid_user_attrs`
--

DROP TABLE IF EXISTS `uid_user_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uid_user_attrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `flags` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userattrs_idx` (`uid`,`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uid_user_attrs`
--

LOCK TABLES `uid_user_attrs` WRITE;
/*!40000 ALTER TABLE `uid_user_attrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `uid_user_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `uri_user` varchar(64) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_idx` (`username`,`domain`,`uri_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uri`
--

LOCK TABLES `uri` WRITE;
/*!40000 ALTER TABLE `uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userblacklist`
--

DROP TABLE IF EXISTS `userblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userblacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `prefix` varchar(64) NOT NULL DEFAULT '',
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userblacklist_idx` (`username`,`domain`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userblacklist`
--

LOCK TABLES `userblacklist` WRITE;
/*!40000 ALTER TABLE `userblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `userblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_preferences`
--

DROP TABLE IF EXISTS `usr_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usr_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '0',
  `domain` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(32) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '2000-01-01 00:00:01',
  PRIMARY KEY (`id`),
  KEY `ua_idx` (`uuid`,`attribute`),
  KEY `uda_idx` (`username`,`domain`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_preferences`
--

LOCK TABLES `usr_preferences` WRITE;
/*!40000 ALTER TABLE `usr_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `usr_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `table_name` varchar(32) NOT NULL,
  `table_version` int(10) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `table_name_idx` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
REPLACE INTO `version` (`table_name`, `table_version`) VALUES ('acc',5),('acc_cdrs',2),('active_watchers',12),('address',6),('aliases',8),('carrierfailureroute',2),('carrierroute',3),('carrier_name',1),('cpl',1),('dbaliases',1),('dialog',7),('dialog_vars',1),('dialplan',2),('dispatcher',4),('domain',2),('domainpolicy',2),('domain_attrs',1),('domain_name',1),('dr_gateways',3),('dr_groups',2),('dr_gw_lists',1),('dr_rules',3),('globalblacklist',1),('grp',2),('htable',2),('imc_members',1),('imc_rooms',1),('lcr_gw',3),('lcr_rule',3),('lcr_rule_target',1),('location',9),('location_attrs',1),('missed_calls',4),('mohqcalls',1),('mohqueues',1),('mtree',1),('mtrees',2),('pdt',1),('pl_pipes',1),('presentity',5),('pua',7),('purplemap',1),('re_grp',1),('rls_presentity',1),('rls_watchers',3),('rtpengine',1),('rtpproxy',1),('sca_subscriptions',2),('secfilter',1),('silo',8),('sip_trace',4),('speed_dial',2),('subscriber',7),('topos_d',1),('topos_t',1),('trusted',6),('uacreg',4),('uid_credentials',7),('uid_domain',2),('uid_domain_attrs',1),('uid_global_attrs',1),('uid_uri',3),('uid_uri_attrs',2),('uid_user_attrs',3),('uri',1),('userblacklist',1),('usr_preferences',2),('version',1),('watchers',3),('xcap',4);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presentity_uri` varchar(255) NOT NULL,
  `watcher_username` varchar(64) NOT NULL,
  `watcher_domain` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL DEFAULT 'presence',
  `status` int(11) NOT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `inserted_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watcher_idx` (`presentity_uri`,`watcher_username`,`watcher_domain`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xcap`
--

DROP TABLE IF EXISTS `xcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xcap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `domain` varchar(64) NOT NULL,
  `doc` mediumblob NOT NULL,
  `doc_type` int(11) NOT NULL,
  `etag` varchar(128) NOT NULL,
  `source` int(11) NOT NULL,
  `doc_uri` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc_uri_idx` (`doc_uri`),
  KEY `account_doc_type_idx` (`username`,`domain`,`doc_type`),
  KEY `account_doc_type_uri_idx` (`username`,`domain`,`doc_type`,`doc_uri`),
  KEY `account_doc_uri_idx` (`username`,`domain`,`doc_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xcap`
--

LOCK TABLES `xcap` WRITE;
/*!40000 ALTER TABLE `xcap` DISABLE KEYS */;
/*!40000 ALTER TABLE `xcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kamailio'
--
/*!50003 DROP PROCEDURE IF EXISTS `kamailio_cdrs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kamailio_cdrs`()
BEGIN
  DECLARE done int DEFAULT 0;
  DECLARE bye_record int DEFAULT 0;
  DECLARE v_src_user,v_src_domain,v_dst_user,v_dst_domain,v_callid,v_from_tag,
    v_to_tag,v_src_ip,v_calltype varchar(64);
  DECLARE v_src_gwgroupid, v_dst_gwgroupid int(11);
  DECLARE v_inv_time, v_bye_time datetime;
  DECLARE inv_cursor CURSOR FOR
    SELECT src_user,
           src_domain,
           dst_user,
           dst_domain,
           time,
           callid,
           from_tag,
           to_tag,
           src_ip,
           calltype,
           src_gwgroupid,
           dst_gwgroupid
    FROM acc
    WHERE method = 'INVITE'
      AND cdr_id = '0';
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  OPEN inv_cursor;
  REPEAT
    FETCH inv_cursor INTO v_src_user, v_src_domain, v_dst_user, v_dst_domain,
      v_inv_time, v_callid, v_from_tag, v_to_tag, v_src_ip, v_calltype,
      v_src_gwgroupid, v_dst_gwgroupid;
    IF NOT done THEN
      SET bye_record = 0;
      SELECT 1, time
      INTO bye_record, v_bye_time
      FROM acc
      WHERE method = 'BYE'
        AND callid = v_callid
        AND ((from_tag = v_from_tag
        AND to_tag = v_to_tag)
        OR (from_tag = v_to_tag AND to_tag = v_from_tag))
      ORDER BY time ASC
      LIMIT 1;
      IF bye_record = 1 THEN
        INSERT INTO cdrs (src_username, src_domain, dst_username, dst_domain,
                          call_start_time, duration, sip_call_id, sip_from_tag,
                          sip_to_tag, src_ip, created, calltype, src_gwgroupid, dst_gwgroupid)
        VALUES (v_src_user, v_src_domain, v_dst_user, v_dst_domain, v_inv_time,
                UNIX_TIMESTAMP(v_bye_time) - UNIX_TIMESTAMP(v_inv_time),
                v_callid, v_from_tag, v_to_tag, v_src_ip, NOW(), v_calltype,
                v_src_gwgroupid, v_dst_gwgroupid);
        UPDATE acc
        SET cdr_id=last_insert_id()
        WHERE callid = v_callid
          AND from_tag = v_from_tag
          AND to_tag = v_to_tag;
      END IF;
      SET done = 0;
    END IF;
  UNTIL done END REPEAT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kamailio_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kamailio_rating`(`rgroup` varchar(64))
BEGIN
  DECLARE done, rate_record, vx_cost int DEFAULT 0;
  DECLARE v_cdr_id bigint DEFAULT 0;
  DECLARE v_duration, v_rate_unit, v_time_unit int DEFAULT 0;
  DECLARE v_dst_username varchar(64);
  DECLARE cdrs_cursor CURSOR FOR SELECT cdr_id, dst_username, duration
                                 FROM cdrs
                                 WHERE rated = 0;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  OPEN cdrs_cursor;
  REPEAT
    FETCH cdrs_cursor INTO v_cdr_id, v_dst_username, v_duration;
    IF NOT done THEN
      SET rate_record = 0;
      SELECT 1, rate_unit, time_unit
      INTO rate_record, v_rate_unit, v_time_unit
      FROM billing_rates
      WHERE rate_group = rgroup
        AND v_dst_username LIKE concat(prefix, '%')
      ORDER BY prefix DESC
      LIMIT 1;
      IF rate_record = 1 THEN
        SET vx_cost = v_rate_unit * CEIL(v_duration / v_time_unit);
        UPDATE cdrs SET rated=1, cost=vx_cost WHERE cdr_id = v_cdr_id;
      END IF;
      SET done = 0;
    END IF;
  UNTIL done END REPEAT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dsip_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dsip_settings`(
  IN NEW_DSIP_ID int UNSIGNED, IN NEW_DSIP_CLUSTER_ID int UNSIGNED, IN NEW_DSIP_CLUSTER_SYNC tinyint(1), IN NEW_DSIP_PROTO varchar(16),
  IN NEW_DSIP_PORT int, IN NEW_DSIP_USERNAME varchar(255), IN NEW_DSIP_PASSWORD varbinary(256),
  IN NEW_DSIP_IPC_PASS varbinary(160), IN NEW_DSIP_API_PROTO varchar(16),
  IN NEW_DSIP_API_PORT int, IN NEW_DSIP_PRIV_KEY varchar(255), IN NEW_DSIP_PID_FILE varchar(255),
  IN NEW_DSIP_UNIX_SOCK varchar(255), IN NEW_DSIP_IPC_SOCK varchar(255), IN NEW_DSIP_API_TOKEN varbinary(160), IN NEW_DSIP_LOG_LEVEL int, IN NEW_DSIP_LOG_FACILITY int,
  IN NEW_DSIP_SSL_KEY varchar(255), IN NEW_DSIP_SSL_CERT varchar(255), IN NEW_DSIP_SSL_CA varchar(255), IN NEW_DSIP_SSL_EMAIL varchar(255), IN NEW_DSIP_CERTS_DIR varchar(255),
  IN NEW_VERSION varchar(32),
  IN NEW_DEBUG tinyint(1), IN NEW_ROLE varchar(32), IN NEW_GUI_INACTIVE_TIMEOUT int UNSIGNED, IN NEW_KAM_DB_HOST varchar(255),
  IN NEW_KAM_DB_DRIVER varchar(255), IN NEW_KAM_DB_TYPE varchar(255), IN NEW_KAM_DB_PORT varchar(255), IN NEW_KAM_DB_NAME varchar(255),
  IN NEW_KAM_DB_USER varchar(255), IN NEW_KAM_DB_PASS varbinary(160), IN NEW_KAM_KAMCMD_PATH varchar(255),
  IN NEW_KAM_CFG_PATH varchar(255), IN NEW_KAM_TLSCFG_PATH varchar(255), IN NEW_RTP_CFG_PATH varchar(255), IN NEW_SQLALCHEMY_TRACK_MODIFICATIONS tinyint(1),
  IN NEW_SQLALCHEMY_SQL_DEBUG tinyint(1), IN NEW_FLT_CARRIER int, IN NEW_FLT_PBX int, IN NEW_FLT_MSTEAMS int, IN NEW_FLT_OUTBOUND int, IN NEW_FLT_INBOUND int,
  IN NEW_FLT_LCR_MIN int, IN NEW_FLT_FWD_MIN int, IN NEW_DEFAULT_AUTH_DOMAIN varchar(255), IN NEW_TELEBLOCK_GW_ENABLED tinyint(1),
  IN NEW_TELEBLOCK_GW_IP varchar(255), IN NEW_TELEBLOCK_GW_PORT varchar(255), IN NEW_TELEBLOCK_MEDIA_IP varchar(255),
  IN NEW_TELEBLOCK_MEDIA_PORT varchar(255), IN NEW_FLOWROUTE_ACCESS_KEY varchar(255), IN NEW_FLOWROUTE_SECRET_KEY varchar(255),
  IN NEW_FLOWROUTE_API_ROOT_URL varchar(255), IN NEW_INTERNAL_IP_ADDR varchar(255), IN NEW_INTERNAL_IP_NET varchar(255),
  IN NEW_EXTERNAL_IP_ADDR varchar(255), IN NEW_EXTERNAL_FQDN varchar(255), IN NEW_UPLOAD_FOLDER varchar(255), IN NEW_CLOUD_PLATFORM varchar(16),
  IN NEW_MAIL_SERVER varchar(255), IN NEW_MAIL_PORT int, IN NEW_MAIL_USE_TLS tinyint(1), IN NEW_MAIL_USERNAME varchar(255),
  IN NEW_MAIL_PASSWORD varbinary(160), IN NEW_MAIL_ASCII_ATTACHMENTS tinyint(1), IN NEW_MAIL_DEFAULT_SENDER varchar(255),
  IN NEW_MAIL_DEFAULT_SUBJECT varchar(255)
)
BEGIN
  START TRANSACTION;

  REPLACE INTO dsip_settings
  VALUES (NEW_DSIP_ID, NEW_DSIP_CLUSTER_ID, NEW_DSIP_CLUSTER_SYNC, NEW_DSIP_PROTO, NEW_DSIP_PORT,
          NEW_DSIP_USERNAME, NEW_DSIP_PASSWORD, NEW_DSIP_IPC_PASS, NEW_DSIP_API_PROTO,
          NEW_DSIP_API_PORT, NEW_DSIP_PRIV_KEY, NEW_DSIP_PID_FILE, NEW_DSIP_UNIX_SOCK, NEW_DSIP_IPC_SOCK, NEW_DSIP_API_TOKEN,
          NEW_DSIP_LOG_LEVEL, NEW_DSIP_LOG_FACILITY, NEW_DSIP_SSL_KEY, NEW_DSIP_SSL_CERT, NEW_DSIP_SSL_CA, NEW_DSIP_SSL_EMAIL, NEW_DSIP_CERTS_DIR,
          NEW_VERSION, NEW_DEBUG, NEW_ROLE, NEW_GUI_INACTIVE_TIMEOUT, NEW_KAM_DB_HOST, NEW_KAM_DB_DRIVER,
          NEW_KAM_DB_TYPE, NEW_KAM_DB_PORT, NEW_KAM_DB_NAME, NEW_KAM_DB_USER, NEW_KAM_DB_PASS, NEW_KAM_KAMCMD_PATH,
          NEW_KAM_CFG_PATH, NEW_KAM_TLSCFG_PATH, NEW_RTP_CFG_PATH, NEW_SQLALCHEMY_TRACK_MODIFICATIONS, NEW_SQLALCHEMY_SQL_DEBUG,
          NEW_FLT_CARRIER, NEW_FLT_PBX, NEW_FLT_MSTEAMS, NEW_FLT_OUTBOUND, NEW_FLT_INBOUND, NEW_FLT_LCR_MIN, NEW_FLT_FWD_MIN, NEW_DEFAULT_AUTH_DOMAIN,
          NEW_TELEBLOCK_GW_ENABLED, NEW_TELEBLOCK_GW_IP, NEW_TELEBLOCK_GW_PORT, NEW_TELEBLOCK_MEDIA_IP,
          NEW_TELEBLOCK_MEDIA_PORT, NEW_FLOWROUTE_ACCESS_KEY, NEW_FLOWROUTE_SECRET_KEY, NEW_FLOWROUTE_API_ROOT_URL,
          NEW_INTERNAL_IP_ADDR, NEW_INTERNAL_IP_NET, NEW_EXTERNAL_IP_ADDR, NEW_EXTERNAL_FQDN, NEW_UPLOAD_FOLDER, NEW_CLOUD_PLATFORM,
          NEW_MAIL_SERVER, NEW_MAIL_PORT, NEW_MAIL_USE_TLS, NEW_MAIL_USERNAME, NEW_MAIL_PASSWORD,
          NEW_MAIL_ASCII_ATTACHMENTS, NEW_MAIL_DEFAULT_SENDER, NEW_MAIL_DEFAULT_SUBJECT);

  IF NEW_DSIP_CLUSTER_SYNC = 1 THEN
    UPDATE dsip_settings
    SET DSIP_PROTO = NEW_DSIP_PROTO,
        DSIP_PORT = NEW_DSIP_PORT,
        DSIP_USERNAME = NEW_DSIP_USERNAME,
        DSIP_PASSWORD = NEW_DSIP_PASSWORD,
        DSIP_IPC_PASS = NEW_DSIP_IPC_PASS,
        DSIP_API_PROTO = NEW_DSIP_API_PROTO,
        DSIP_API_PORT = NEW_DSIP_API_PORT,
        DSIP_PRIV_KEY = NEW_DSIP_PRIV_KEY,
        DSIP_PID_FILE = NEW_DSIP_PID_FILE,
        DSIP_UNIX_SOCK = NEW_DSIP_UNIX_SOCK,
        DSIP_IPC_SOCK = NEW_DSIP_IPC_SOCK,
        DSIP_API_TOKEN = NEW_DSIP_API_TOKEN,
        DSIP_LOG_LEVEL = NEW_DSIP_LOG_LEVEL,
        DSIP_LOG_FACILITY = NEW_DSIP_LOG_FACILITY,
        DSIP_SSL_KEY = NEW_DSIP_SSL_KEY,
        DSIP_SSL_CERT = NEW_DSIP_SSL_CERT,
        DSIP_SSL_CA = NEW_DSIP_SSL_CA,
        DSIP_SSL_EMAIL = NEW_DSIP_SSL_EMAIL,
        DSIP_CERTS_DIR = NEW_DSIP_CERTS_DIR,
        VERSION = NEW_VERSION,
        DEBUG = NEW_DEBUG,
        ROLE = NEW_ROLE,
        GUI_INACTIVE_TIMEOUT = NEW_GUI_INACTIVE_TIMEOUT,
        KAM_DB_HOST = NEW_KAM_DB_HOST,
        KAM_DB_DRIVER = NEW_KAM_DB_DRIVER,
        KAM_DB_TYPE = NEW_KAM_DB_TYPE,
        KAM_DB_PORT = NEW_KAM_DB_PORT,
        KAM_DB_NAME = NEW_KAM_DB_NAME,
        KAM_DB_USER = NEW_KAM_DB_USER,
        KAM_DB_PASS = NEW_KAM_DB_PASS,
        KAM_KAMCMD_PATH = NEW_KAM_KAMCMD_PATH,
        KAM_CFG_PATH = NEW_KAM_CFG_PATH,
        KAM_TLSCFG_PATH = NEW_KAM_TLSCFG_PATH,
        RTP_CFG_PATH = NEW_RTP_CFG_PATH,
        SQLALCHEMY_TRACK_MODIFICATIONS = NEW_SQLALCHEMY_TRACK_MODIFICATIONS,
        SQLALCHEMY_SQL_DEBUG = NEW_SQLALCHEMY_SQL_DEBUG,
        FLT_CARRIER = NEW_FLT_CARRIER,
        FLT_PBX = NEW_FLT_PBX,
        FLT_MSTEAMS = NEW_FLT_MSTEAMS,
        FLT_OUTBOUND = NEW_FLT_OUTBOUND,
        FLT_INBOUND = NEW_FLT_INBOUND,
        FLT_LCR_MIN = NEW_FLT_LCR_MIN,
        FLT_FWD_MIN = NEW_FLT_FWD_MIN,
        DEFAULT_AUTH_DOMAIN = NEW_DEFAULT_AUTH_DOMAIN,
        TELEBLOCK_GW_ENABLED = NEW_TELEBLOCK_GW_ENABLED,
        TELEBLOCK_GW_IP = NEW_TELEBLOCK_GW_IP,
        TELEBLOCK_GW_PORT = NEW_TELEBLOCK_GW_PORT,
        TELEBLOCK_MEDIA_IP = NEW_TELEBLOCK_MEDIA_IP,
        TELEBLOCK_MEDIA_PORT = NEW_TELEBLOCK_MEDIA_PORT,
        FLOWROUTE_ACCESS_KEY = NEW_FLOWROUTE_ACCESS_KEY,
        FLOWROUTE_SECRET_KEY = NEW_FLOWROUTE_SECRET_KEY,
        FLOWROUTE_API_ROOT_URL = NEW_FLOWROUTE_API_ROOT_URL,
        UPLOAD_FOLDER = NEW_UPLOAD_FOLDER,
        MAIL_SERVER = NEW_MAIL_SERVER,
        MAIL_PORT = NEW_MAIL_PORT,
        MAIL_USE_TLS = NEW_MAIL_USE_TLS,
        MAIL_USERNAME = NEW_MAIL_USERNAME,
        MAIL_PASSWORD = NEW_MAIL_PASSWORD,
        MAIL_ASCII_ATTACHMENTS = NEW_MAIL_ASCII_ATTACHMENTS,
        MAIL_DEFAULT_SENDER = NEW_MAIL_DEFAULT_SENDER,
        MAIL_DEFAULT_SUBJECT = NEW_MAIL_DEFAULT_SUBJECT
    WHERE DSIP_CLUSTER_ID = NEW_DSIP_CLUSTER_ID
      AND DSIP_CLUSTER_SYNC = 1
      AND DSIP_ID != NEW_DSIP_ID;
  END IF;

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `dsip_dnid_lnp_mapping`
--

/*!50001 DROP VIEW IF EXISTS `dsip_dnid_lnp_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsip_dnid_lnp_mapping` AS select `dsip_dnid_enrich_lnp`.`dnid` AS `dnid`,concat(`dsip_dnid_enrich_lnp`.`country_code`,`dsip_dnid_enrich_lnp`.`routing_number`) AS `prefix`,'0' AS `key_type`,'0' AS `value_type` from `dsip_dnid_enrich_lnp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dsip_prefix_mapping`
--

/*!50001 DROP VIEW IF EXISTS `dsip_prefix_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dsip_prefix_mapping` AS select `dr_rules`.`prefix` AS `prefix`,cast(`dr_rules`.`ruleid` as char(64) charset utf8mb4) AS `ruleid`,cast(`dr_rules`.`priority` as char(64) charset utf8mb4) AS `priority`,'0' AS `key_type`,'0' AS `value_type` from `dr_rules` where `dr_rules`.`groupid` = 9000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-29 13:52:47

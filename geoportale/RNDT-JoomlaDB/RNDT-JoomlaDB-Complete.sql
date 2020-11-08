CREATE DATABASE  IF NOT EXISTS `mysql_rndt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysql_rndt`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mysql_rndt
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `l1pym_acymailing_config`
--

DROP TABLE IF EXISTS `l1pym_acymailing_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_config` (
  `namekey` varchar(200) NOT NULL,
  `value` text,
  PRIMARY KEY (`namekey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_config`
--

LOCK TABLES `l1pym_acymailing_config` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_config` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_config` VALUES ('level','Starter'),('version','4.7.0'),('from_name','Repertorio Nazionale Dati Territoriali'),('from_email','rndt@digitpa.gov.it'),('mailer_method','smtp'),('sendmail_path','/usr/sbin/sendmail'),('smtp_secured',''),('smtp_auth','0'),('smtp_username','rndt'),('smtp_password','rndt'),('reply_name','Repertorio Nazionale Dati Territoriali'),('reply_email','rndt@digitpa.gov.it'),('cron_sendto','rndt@digitpa.gov.it'),('bounce_email',''),('add_names','1'),('encoding_format','8bit'),('charset','UTF-8'),('word_wrapping','150'),('hostname',''),('embed_images','0'),('embed_files','1'),('editor','0'),('multiple_part','1'),('smtp_host','smtp.cnipa.it'),('smtp_port',''),('queue_nbmail','40'),('queue_nbmail_auto','70'),('queue_type','auto'),('queue_try','3'),('queue_pause','120'),('allow_visitor','1'),('require_confirmation','0'),('priority_newsletter','3'),('allowedfiles','zip,doc,docx,pdf,xls,txt,gzip,rar,jpg,gif,xlsx,pps,csv,bmp,ico,odg,odp,ods,odt,png,ppt,swf,xcf,mp3,wma'),('uploadfolder','media/com_acymailing/upload'),('confirm_redirect',''),('subscription_message','1'),('notification_unsuball',''),('cron_next','1251990901'),('confirmation_message','1'),('welcome_message','1'),('unsub_message','1'),('cron_last','0'),('cron_fromip',''),('cron_report',''),('cron_frequency','900'),('cron_sendreport','2'),('cron_fullreport','1'),('cron_savereport','2'),('cron_savepath','media/com_acymailing/logs/report679660781.log'),('notification_created',''),('notification_accept',''),('notification_refuse',''),('forward','0'),('description_starter','Joomla!™ E-mail Marketing'),('description_essential','Joomla!™ Marketing Campaign'),('description_business','Joomla!™ E-mail Marketing'),('description_enterprise','Joomla!™ E-mail Marketing'),('priority_followup','2'),('unsub_redirect',''),('show_footer','1'),('use_sef','0'),('itemid','0'),('css_module','default'),('css_frontend','default'),('css_backend','default'),('menu_position','under'),('unsub_reasons','a:2:{i:0;s:21:\"UNSUB_SURVEY_FREQUENT\";i:1;s:21:\"UNSUB_SURVEY_RELEVANT\";}'),('installcomplete','1'),('Starter','0'),('Essential','1'),('Business','2'),('Enterprise','3'),('website','http://10.14.7.239/RNDT/home/'),('bootstrap_frontend','0'),('max_execution_time','0');
/*!40000 ALTER TABLE `l1pym_acymailing_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_fields`
--

DROP TABLE IF EXISTS `l1pym_acymailing_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_fields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(250) NOT NULL,
  `namekey` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ordering` smallint(5) unsigned DEFAULT '99',
  `options` text,
  `core` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `backend` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `frontcomp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `default` varchar(250) DEFAULT NULL,
  `listing` tinyint(3) unsigned DEFAULT NULL,
  `frontlisting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontjoomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frontjoomlaregistration` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `joomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`published`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_fields`
--

LOCK TABLES `l1pym_acymailing_fields` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_fields` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_fields` VALUES (1,'NAMECAPTION','name','text','',1,1,'',1,1,1,1,'',1,1,0,0,0),(2,'EMAILCAPTION','email','text','',1,2,'',1,1,1,1,'',1,1,0,0,0),(3,'RECEIVE','html','radio','0::JOOMEXT_TEXT\n1::HTML',1,3,'',1,1,1,1,'1',1,0,0,0,0);
/*!40000 ALTER TABLE `l1pym_acymailing_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_filter`
--

DROP TABLE IF EXISTS `l1pym_acymailing_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_filter` (
  `filid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `published` tinyint(3) unsigned DEFAULT NULL,
  `lasttime` int(10) unsigned DEFAULT NULL,
  `trigger` text,
  `report` text,
  `action` text,
  `filter` text,
  PRIMARY KEY (`filid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_filter`
--

LOCK TABLES `l1pym_acymailing_filter` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_geolocation`
--

DROP TABLE IF EXISTS `l1pym_acymailing_geolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_geolocation` (
  `geolocation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `geolocation_subid` int(10) unsigned NOT NULL DEFAULT '0',
  `geolocation_type` varchar(255) NOT NULL DEFAULT 'subscription',
  `geolocation_ip` varchar(255) NOT NULL DEFAULT '',
  `geolocation_created` int(10) unsigned NOT NULL DEFAULT '0',
  `geolocation_latitude` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `geolocation_longitude` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `geolocation_postal_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_city` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`geolocation_id`),
  KEY `geolocation_type` (`geolocation_subid`,`geolocation_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_geolocation`
--

LOCK TABLES `l1pym_acymailing_geolocation` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_geolocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_geolocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_history`
--

DROP TABLE IF EXISTS `l1pym_acymailing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_history` (
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL COMMENT 'different actions: created,modified,confirmed',
  `data` text,
  `source` text,
  `mailid` mediumint(8) unsigned DEFAULT NULL,
  KEY `subid` (`subid`,`date`),
  KEY `dateindex` (`date`),
  KEY `actionindex` (`action`,`mailid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_history`
--

LOCK TABLES `l1pym_acymailing_history` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_list`
--

DROP TABLE IF EXISTS `l1pym_acymailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_list` (
  `name` varchar(250) NOT NULL,
  `description` text,
  `ordering` smallint(5) unsigned DEFAULT '0',
  `listid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `welmailid` mediumint(9) DEFAULT NULL,
  `unsubmailid` mediumint(9) DEFAULT NULL,
  `type` enum('list','campaign') NOT NULL DEFAULT 'list',
  `access_sub` varchar(250) DEFAULT 'all',
  `access_manage` varchar(250) NOT NULL DEFAULT 'none',
  `languages` varchar(250) NOT NULL DEFAULT 'all',
  `startrule` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`listid`),
  KEY `typeorderingindex` (`type`,`ordering`),
  KEY `useridindex` (`userid`),
  KEY `typeuseridindex` (`type`,`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_list`
--

LOCK TABLES `l1pym_acymailing_list` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_list` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_list` VALUES ('Newsletters','Receive our latest news',1,1,1,44,'mailing_list','#3366ff',1,NULL,NULL,'list','all','none','all','0');
/*!40000 ALTER TABLE `l1pym_acymailing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_listcampaign`
--

DROP TABLE IF EXISTS `l1pym_acymailing_listcampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_listcampaign` (
  `campaignid` smallint(5) unsigned NOT NULL,
  `listid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`campaignid`,`listid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_listcampaign`
--

LOCK TABLES `l1pym_acymailing_listcampaign` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_listcampaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_listcampaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_listmail`
--

DROP TABLE IF EXISTS `l1pym_acymailing_listmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_listmail` (
  `listid` smallint(5) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`listid`,`mailid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_listmail`
--

LOCK TABLES `l1pym_acymailing_listmail` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_listmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_listmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_listsub`
--

DROP TABLE IF EXISTS `l1pym_acymailing_listsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_listsub` (
  `listid` smallint(5) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `subdate` int(10) unsigned DEFAULT NULL,
  `unsubdate` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`listid`,`subid`),
  KEY `subidindex` (`subid`),
  KEY `listidstatusindex` (`listid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_listsub`
--

LOCK TABLES `l1pym_acymailing_listsub` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_listsub` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_listsub` VALUES (1,1,1394627838,NULL,1),(1,2,1394627838,NULL,1),(1,3,1394627838,NULL,1),(1,4,1394627838,NULL,1),(1,5,1394627838,NULL,1);
/*!40000 ALTER TABLE `l1pym_acymailing_listsub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_mail`
--

DROP TABLE IF EXISTS `l1pym_acymailing_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_mail` (
  `mailid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL,
  `body` longtext NOT NULL,
  `altbody` longtext NOT NULL,
  `published` tinyint(4) DEFAULT '1',
  `senddate` int(10) unsigned DEFAULT NULL,
  `created` int(10) unsigned DEFAULT NULL,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `type` enum('news','autonews','followup','unsub','welcome','notification','joomlanotification') NOT NULL DEFAULT 'news',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `attach` text,
  `html` tinyint(4) NOT NULL DEFAULT '1',
  `tempid` smallint(6) NOT NULL DEFAULT '0',
  `key` varchar(200) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `params` text,
  `sentby` int(10) unsigned DEFAULT NULL,
  `metakey` text,
  `metadesc` text,
  `filter` text,
  `language` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`mailid`),
  KEY `senddate` (`senddate`),
  KEY `typemailidindex` (`type`,`mailid`),
  KEY `useridindex` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_mail`
--

LOCK TABLES `l1pym_acymailing_mail` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_mail` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_mail` VALUES (1,'New Subscriber on your website : {user:email}','<p>Hello {subtag:name},</p><p>A new user has been created in AcyMailing : </p><blockquote><p>Name : {user:name}</p><p>Email : {user:email}</p><p>IP : {user:ip} </p><p>Subscription : {user:subscription}</p></blockquote>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_created',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(2,'A User unsubscribed from all your lists : {user:email}','<p>Hello {subtag:name},</p><p>The user {user:name} : {user:email} unsubscribed from all your lists</p><p>Subscription : {user:subscription}</p><p>{survey}</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_unsuball',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(3,'A User unsubscribed : {user:email}','<p>Hello {subtag:name},</p><p>The user {user:name} : {user:email} unsubscribed from your list</p><p>Subscription : {user:subscription}</p><p>{survey}</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_unsub',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(4,'A User refuses to receive e-mails from your website : {user:email}','<p>The User {user:name} : {user:email} refuses to receive any e-mail anymore from your website.</p><p>Subscription : {user:subscription}</p><p>{survey}</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_refuse',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(5,'New contact from your website : {user:email}','<p>Hello {subtag:name},</p><p>A user has contacted you : </p><blockquote><p>Name : {user:name}</p><p>Email : {user:email}</p><p>IP : {user:ip} </p><p>Subscription : {user:subscription}</p></blockquote>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_contact',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(6,'A user confirm his subscription : {user:email}','<p>Hello {subtag:name},</p><p>A user has confirmed his subscription in AcyMailing : </p><blockquote><p>Name : {user:name}</p><p>Email : {user:email}</p><p>IP : {user:ip} </p><p>Subscription : {user:subscription}</p></blockquote>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_confirm',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(7,'{subtag:name|ucfirst}, {trans:PLEASE_CONFIRM_SUB}','<div style=\"text-align: center; width: 100%; background-color: #ffffff;\">\r\n			<table style=\"text-align:justify; margin:auto; background-color:#ebebeb; border:1px solid #e7e7e7\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\" align=\"center\" bgcolor=\"#ebebeb\">\r\n			<tbody>\r\n			<tr style=\"line-height: 0px;\">\r\n			<td style=\"line-height: 0px;\" height=\"38px\"><img src=\"media/com_acymailing/templates/newsletter-4/top.png\" border=\"0\" alt=\" - - - \" /></td>\r\n			</tr>\r\n			<tr>\r\n			<td style=\"text-align:center\" width=\"600\">\r\n			<table style=\"margin:auto;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"520\">\r\n			<tbody>\r\n			<tr>\r\n			<td style=\"background-color: #ffffff; border: 1px solid #dbdbdb; padding: 20px; width: 500px; margin: 15px auto; text-align: left;\">\r\n			<h1>Hello {subtag:name|ucfirst},</h1>\r\n			<p>{trans:CONFIRM_MSG}<br /><br />{trans:CONFIRM_MSG_ACTIVATE}</p>\r\n			<br />\r\n			<p style=\"text-align:center;\"><strong>{confirm}{trans:CONFIRM_SUBSCRIPTION}{/confirm}</strong></p>\r\n			</td>\r\n			</tr>\r\n			</tbody>\r\n			</table>\r\n			</td>\r\n			</tr>\r\n			<tr style=\"line-height: 0px;\">\r\n			<td style=\"line-height: 0px;\" height=\"40px\"><img src=\"media/com_acymailing/templates/newsletter-4/bottom.png\" border=\"0\" alt=\" - - - \" /></td>\r\n			</tr>\r\n			</tbody>\r\n			</table>\r\n			</div>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'confirmation',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(8,'AcyMailing Cron Report {mainreport}','<p>{report}</p><p>{detailreport}</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'report',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(9,'A Newsletter has been generated : \"{subject}\"','<p>The Newsletter issue {issuenb} has been generated : </p><p>Subject : {subject}</p><p>{body}</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'notification_autonews',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),(10,'Modify your subscription','<p>Hello {subtag:name}, </p><p>You requested some changes on your subscription,</p><p>Please {modify}click here{/modify} to be identified as the owner of this account and then modify your subscription.</p>','',1,NULL,NULL,NULL,NULL,NULL,NULL,'notification',0,NULL,'modif',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `l1pym_acymailing_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_queue`
--

DROP TABLE IF EXISTS `l1pym_acymailing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_queue` (
  `senddate` int(10) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `priority` tinyint(3) unsigned DEFAULT '3',
  `try` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paramqueue` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`subid`,`mailid`),
  KEY `listingindex` (`senddate`,`subid`),
  KEY `mailidindex` (`mailid`),
  KEY `orderingindex` (`priority`,`senddate`,`subid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_queue`
--

LOCK TABLES `l1pym_acymailing_queue` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_rules`
--

DROP TABLE IF EXISTS `l1pym_acymailing_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_rules` (
  `ruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ordering` smallint(6) DEFAULT NULL,
  `regex` text NOT NULL,
  `executed_on` text NOT NULL,
  `action_message` text NOT NULL,
  `action_user` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `ordering` (`published`,`ordering`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_rules`
--

LOCK TABLES `l1pym_acymailing_rules` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_stats`
--

DROP TABLE IF EXISTS `l1pym_acymailing_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_stats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `senthtml` int(10) unsigned NOT NULL DEFAULT '0',
  `senttext` int(10) unsigned NOT NULL DEFAULT '0',
  `senddate` int(10) unsigned NOT NULL,
  `openunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `opentotal` int(10) unsigned NOT NULL DEFAULT '0',
  `bounceunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fail` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicktotal` int(10) unsigned NOT NULL DEFAULT '0',
  `clickunique` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `unsub` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forward` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bouncedetails` text,
  PRIMARY KEY (`mailid`),
  KEY `senddateindex` (`senddate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_stats`
--

LOCK TABLES `l1pym_acymailing_stats` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_subscriber`
--

DROP TABLE IF EXISTS `l1pym_acymailing_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_subscriber` (
  `subid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `created` int(10) unsigned DEFAULT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `accept` tinyint(4) NOT NULL DEFAULT '1',
  `ip` varchar(100) DEFAULT NULL,
  `html` tinyint(4) NOT NULL DEFAULT '1',
  `key` varchar(250) DEFAULT NULL,
  `confirmed_date` int(10) unsigned NOT NULL DEFAULT '0',
  `confirmed_ip` varchar(100) DEFAULT NULL,
  `lastopen_date` int(10) unsigned NOT NULL DEFAULT '0',
  `lastopen_ip` varchar(100) DEFAULT NULL,
  `lastclick_date` int(10) unsigned NOT NULL DEFAULT '0',
  `lastsent_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subid`),
  UNIQUE KEY `email` (`email`),
  KEY `userid` (`userid`),
  KEY `queueindex` (`enabled`,`accept`,`confirmed`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_subscriber`
--

LOCK TABLES `l1pym_acymailing_subscriber` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_subscriber` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_subscriber` VALUES (1,'deligia.alessio@gmail.com',42,'Super User',1330503025,0,0,1,NULL,1,NULL,0,NULL,0,NULL,0,0),(2,'info@fontecreativa.it',43,'fontecreativa',1330696966,0,0,1,NULL,1,NULL,0,NULL,0,NULL,0,0),(3,'antonio.rotundo@agid.gov.it',44,'Antonio',1330697133,1,1,1,NULL,1,'LXUpG7cPz7KF5U',0,NULL,0,NULL,0,0),(4,'daniele.DellOsso@agid.gov.it',45,'daniele',1330697242,1,1,1,NULL,1,NULL,0,NULL,0,NULL,0,0),(5,'ciasullo@agid.gov.it',46,'gabriele',1330697307,1,1,1,NULL,1,NULL,0,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `l1pym_acymailing_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_template`
--

DROP TABLE IF EXISTS `l1pym_acymailing_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_template` (
  `tempid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `body` longtext,
  `altbody` longtext,
  `created` int(10) unsigned DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `premium` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` smallint(5) unsigned DEFAULT '0',
  `namekey` varchar(50) NOT NULL,
  `styles` text,
  `subject` varchar(250) DEFAULT NULL,
  `stylesheet` text,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `readmore` varchar(250) DEFAULT NULL,
  `access` varchar(250) DEFAULT 'all',
  PRIMARY KEY (`tempid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_template`
--

LOCK TABLES `l1pym_acymailing_template` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_template` DISABLE KEYS */;
INSERT INTO `l1pym_acymailing_template` VALUES (1,'Notification template','','<div style=\"text-align: center; width: 100%; background-color:#ffffff;\">\r\n<div class=\"acymailing_online acyeditor_delete acyeditor_text\" style=\"text-align:center\">{readonline}This email contains graphics, so if you don\'t see them, view it in your browser{/readonline}</div>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" style=\"text-align: justify; margin: auto; width:600px\">\r\n	<tbody>\r\n		<tr style=\"line-height: 0px;\" class=\"acyeditor_delete\">\r\n			<td class=\"w600\" colspan=\"5\" style=\"background-color: #69b4c0;\" valign=\"bottom\" width=\"600\"><img alt=\" - - - \" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-4/images/top.png\" /></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n			<td class=\"acyeditor_text w520\" colspan=\"3\" height=\"80\" style=\"text-align: left; background-color: rgb(235, 235, 235);\" width=\"520\"><img alt=\"-\" src=\"media/com_acymailing/templates/newsletter-4/images/message_icon.png\" style=\"float:left; margin-right:10px;\" />\r\n				<h3>Topic of your message</h3>\r\n\r\n				<h4>Subtitle for your message</h4>\r\n			</td>\r\n			<td class=\"acyeditor_picture w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"w480\" height=\"20\" style=\"background-color:#fff;\" width=\"480\"></td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"acyeditor_text w480 pict\" style=\"background-color:#fff; text-align: left;\" width=\"480\">\r\n			<h1>Dear {subtag:name},</h1>\r\n			Your message here...<br />\r\n			</td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"w480\" height=\"20\" style=\"background-color:#fff;\" width=\"480\"></td>\r\n			<td class=\"w20\" style=\"background-color: #fff;\" width=\"20\"></td>\r\n			<td class=\"w40\" style=\"background-color: #ebebeb;\" width=\"40\"></td>\r\n		</tr>\r\n		<tr style=\"line-height: 0px;\" class=\"acyeditor_delete\">\r\n			<td class=\"w600\" colspan=\"5\" style=\"background-color:#ebebeb;\" width=\"600\"><img alt=\" - - - \" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-4/images/bottom.png\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div class=\"acyeditor_delete acyeditor_text\" style=\"text-align:center\">Not interested any more? {unsubscribe}Unsubscribe{/unsubscribe}</div>\r\n</div>','',NULL,1,0,1,'newsletter-4','a:10:{s:6:\"tag_h1\";s:76:\"color:#393939 !important; font-size:14px; font-weight:bold; margin:10px 0px;\";s:6:\"tag_h2\";s:106:\"color: #309fb3 !important; font-size: 14px; font-weight: normal; text-align:left; margin:0px; padding:0px;\";s:6:\"tag_h3\";s:144:\"color: #393939 !important; font-size: 18px; font-weight: bold; text-align:left; margin:0px; padding-bottom:5px; border-bottom:1px solid #bdbdbd;\";s:6:\"tag_h4\";s:117:\"color: #309fb3 !important; font-size: 14px; font-weight: bold; text-align:left; margin:0px; padding: 5px 0px 0px 0px;\";s:5:\"tag_a\";s:71:\"color:#309FB3; text-decoration:none; font-style:italic; cursor:pointer;\";s:19:\"acymailing_readmore\";s:90:\"font-size: 12px; color: #fff; background-color:#309fb3; font-weight:bold; padding:3px 5px;\";s:17:\"acymailing_online\";s:52:\"color:#a3a3a3; text-decoration:none; font-size:11px;\";s:16:\"acymailing_unsub\";s:52:\"color:#a3a3a3; text-decoration:none; font-size:11px;\";s:8:\"color_bg\";s:7:\"#ffffff\";s:18:\"acymailing_content\";s:19:\"text-align:justify;\";}',NULL,'div,table,p{font-family: Verdana, Arial, Helvetica, sans-serif; font-size:12px; text-align:justify; color:#8c8c8c; margin:0px}\r\ndiv.info{text-align:center;padding:10px;font-size:11px;color:#a3a3a3;}\r\n\r\n@media (max-width:450px){\r\n	table[class=w600], td[class=w600],  table[class=w520], td[class=w520], table[class=w480], td[class=w480], img[class=w600]{ width:100% !important; }\r\n	td[class=w40] { width: 20px !important;}\r\n	td[class=w20] { width: 10px !important;}\r\n	.pict img {max-width:240px; height:auto !important;}\r\n}\r\n\r\n@media (min-width:450px) and (max-width:600px){\r\n	table[class=w600], td[class=w600],  table[class=w520], td[class=w520], table[class=w480], td[class=w480], img[class=w600]{ width:100% !important; }\r\n	td[class=w40] { width: 20px !important;}\r\n	td[class=w20] { width: 10px !important;}\r\n	.pict img {max-width:390px;  height:auto !important;}\r\n}\r\n@media (min-width:600px){\r\n	.pict img {max-width:480px !important;  height:auto !important;}\r\n}\r\n',NULL,NULL,NULL,NULL,'media/com_acymailing/templates/newsletter-4/newsletter-4.png','','all'),(2,'Newspaper','','<div align=\"center\" style=\"width:100%; background-color:#454545; padding-bottom:20px; color:#ffffff;\">\r\n<div class=\"acymailing_online acyeditor_delete acyeditor_text\">{readonline}This e-mail contains graphics, if you don\'t see them <strong>» view it online.</strong>{/readonline}</div>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" style=\"margin:auto; background-color:#ffffff; color:#454545;\" width=\"600\">\r\n		<tr>\r\n			<td class=\"w600\">\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" width=\"600\">\r\n					<tr class=\"acyeditor_delete\" >\r\n						<td class=\"w30\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n						<td class=\"acyeditor_text w540\" style=\"font-family:Times New Roman, Times, serif; background-color:#ffffff; text-align:left\" width=\"540\">&nbsp;\r\n						<h1><img alt=\"logo\" src=\"media/com_acymailing/templates/newsletter-5/images/logo.png\" style=\"float: right; width: 107px; height: 70px;\" /></h1>\r\n\r\n						<h1>Your title here</h1>\r\n\r\n						<h3>your subtitle</h3>\r\n						</td>\r\n						<td class=\"w30\" style=\"line-height:0px; background-color:#ffffff\" width=\"30\"></td>\r\n					</tr>\r\n					<tr class=\"acyeditor_delete\">\r\n						<td class=\"w600\" colspan=\"3\" style=\"line-height:0px; background-color:#e4e4e4\" valign=\"top\" width=\"600\"><img alt=\"---\" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-5/images/header.png\" /></td>\r\n					</tr>\r\n					<tr class=\"acyeditor_delete\">\r\n						<td class=\"acyeditor_picture w600\" colspan=\"3\" style=\"line-height:0px; background-color:#ffffff\" valign=\"top\" width=\"600\"><img alt=\"banner\" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-5/images/banner.png\" /></td>\r\n					</tr>\r\n					<tr class=\"acyeditor_delete\">\r\n						<td class=\"w600\" colspan=\"3\" style=\"line-height:0px;\" valign=\"top\" width=\"600\"><img alt=\"---\" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-5/images/separator.png\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td class=\"w30\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n						<td class=\"acyeditor_text  pict w540\" style=\"text-align:justify; color:#575757; font-family:Times New Roman, Times, serif; font-size:13px; background-color:#ffffff\" width=\"540\">\r\n						<h2>Interviews and reports</h2>\r\n						<span class=\"dark\">Lorem ipsum dolor sit amet, consectLorem ipsum dolor sit amet.</span><br />\r\n						consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi. Vivamus elementum.ed elementum convallis mi. <a href=\"#\">Vivamus elementum</a>.Lorem ipsum dolor sit amet.<br />\r\n						<br />\r\n						cLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi. Vivamus elementum.<br />\r\n						<br />\r\n						<span class=\"acymailing_readmore\">Read More</span><br />\r\n						&nbsp;\r\n						<h2>Journalism around the world</h2>\r\n						<span class=\"dark\">Lorem ipsum dolor sit amet, consectLorem. consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum.</span> consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi. Vivamus elementum.ed elementum convallis mi.<br />\r\n						Vivamus elementum.<a href=\"#\">Lorem ipsum dolor</a> sit amet.Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br />\r\n						<br />\r\n						<span class=\"acymailing_readmore\">Read More</span></td>\r\n						<td class=\"w30\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n					</tr>\r\n					<tr style=\"line-height: 0px;\">\r\n						<td class=\"w600\" colspan=\"3\" style=\"background-color:#ffffff\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-5/images/footer1.png\" width=\"600\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td class=\"acyfooter acyeditor_text w600\" colspan=\"3\" height=\"25\" style=\"text-align:center; background-color:#ebebeb;  color:#454545; font-family:Times New Roman, Times, serif; font-size:13px\" width=\"600\"><a href=\"#\">www.mywebsite.com</a> | <a href=\"#\">contact</a> | <a href=\"#\">Facebook</a> | <a href=\"#\">Twitter</a></td>\r\n					</tr>\r\n					<tr style=\"line-height: 0px;\">\r\n						<td class=\"w600\" colspan=\"3\" style=\"background-color:#454545;\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/newsletter-5/images/footer2.png\" width=\"600\" /></td>\r\n					</tr>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n</table>\r\n\r\n<div class=\"acymailing_unsub acyeditor_delete acyeditor_text\">{unsubscribe}If you\'re not interested any more <strong>» unsubscribe</strong>{/unsubscribe}</div>\r\n</div>\r\n','',NULL,1,0,2,'newsletter-5','a:10:{s:6:\"tag_h1\";s:71:\"color:#454545 !important; font-size:24px; font-weight:bold; margin:0px;\";s:6:\"tag_h2\";s:145:\"color:#b20000 !important; font-size:18px; font-weight:bold; margin:0px; margin-bottom:10px; padding-bottom:4px; border-bottom: 1px solid #d6d6d6;\";s:6:\"tag_h3\";s:76:\"color:#b20101 !important; font-weight:bold; font-size:18px; margin:10px 0px;\";s:6:\"tag_h4\";s:67:\"color:#e52323 !important; font-weight:bold; margin:0px; padding:0px\";s:5:\"tag_a\";s:65:\"cursor:pointer; color:#9d0000; text-decoration:none; border:none;\";s:19:\"acymailing_readmore\";s:152:\"cursor:pointer; color:#ffffff; background-color:#9d0000; border-top:1px solid #9d0000; border-bottom:1px solid #9d0000; padding:3px 5px; font-size:13px;\";s:17:\"acymailing_online\";s:148:\"color:#dddddd; text-decoration:none; font-size:13px; margin:10px; text-align:center; font-family:Times New Roman, Times, serif; padding-bottom:10px;\";s:8:\"color_bg\";s:7:\"#454545\";s:18:\"acymailing_content\";s:0:\"\";s:16:\"acymailing_unsub\";s:131:\"color:#dddddd; text-decoration:none; font-size:13px; text-align:center; font-family:Times New Roman, Times, serif; padding-top:10px\";}',NULL,'.acyfooter a{\r\n	color:#454545;\r\n}\r\n.dark{\r\n	color:#454545;\r\n	font-weight:bold;\r\n}\r\ndiv,table,p{font-family:\"Times New Roman\", Times, serif;font-size:13px;color:#575757;}\r\n\r\n\r\n\r\n@media (max-width:450px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=w600]{ width:100% !important; }\r\n	td[class=w30] { width:20px !important; }\r\n	.pict img {max-width:260px; height:auto !important;}\r\n}\r\n\r\n@media (min-width: 450px) and (max-width: 600px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=w600] { width:100% !important; }\r\n	td[class=w30] { width:20px !important; }\r\n	.pict img {max-width:410px; height:auto !important;}\r\n}\r\n\r\n@media (min-width:600px){\r\n	.pict img {max-width:540px !important;  height:auto !important;}\r\n}',NULL,NULL,NULL,NULL,'media/com_acymailing/templates/newsletter-5/newsletter-5.png','','all'),(3,'Build Bio','','<div align=\"center\" style=\"width:100%; background-color:#3c3c3c; padding-bottom:20px; color:#ffffff;\">\r\n<div class=\"acymailing_online acyeditor_delete acyeditor_text\">{readonline}This e-mail contains graphics, if you don\'t see them <strong>» view it online.</strong>{/readonline}</div>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" style=\"margin:auto; background-color:#ffffff; color:#575757;\" width=\"600\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" width=\"600\">\r\n				<tr class=\"acyeditor_delete\">\r\n					<td class=\"w600\" colspan=\"3\" style=\"line-height:0px; background-color:#eeeeee\" valign=\"bottom\" width=\"600\"><img alt=\"mail\" class=\"w600\" height=\"41\" src=\"media/com_acymailing/templates/newsletter-6/images/header.png\" width=\"600\" /></td>\r\n				</tr>\r\n				<tr class=\"acyeditor_delete\">\r\n					<td class=\"w30\" style=\"color:#ffffff;\" width=\"30\"></td>\r\n					<td class=\"acyeditor_picture w540 pict\" style=\"line-height:0px; background-color:#ffffff; text-align:center\" width=\"540\"><img alt=\"\" src=\"media/com_acymailing/templates/newsletter-6/images/banner.png\" style=\"width: 540px; height: 122px;\" /></td>\r\n					<td class=\"w30\" height=\"122\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n				</tr>\r\n				<tr class=\"acyeditor_delete\">\r\n					<td class=\"w30\" style=\"background-color:#b9cf00; color:#ffffff;\" width=\"30\"></td>\r\n					<td class=\"acyeditor_text w540\" height=\"25\" style=\"text-align:right; background-color:#b9cf00; color:#ffffff;\" width=\"540\"><span class=\"hide\">Newsletter</span> {date:3}</td>\r\n					<td class=\"w30\" style=\"background-color:#b9cf00; color:#ffffff;\" width=\"30\"></td>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"w600\" colspan=\"3\" height=\"25\" style=\"background-color:#ffffff\" width=\"600\"></td>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"w30\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n					<td class=\"acyeditor_text pict w540\" style=\"text-align:justify; color:#575757; background-color:#ffffff\" width=\"540\"><span class=\"intro\">Hello {subtag:name},</span><br />\r\n					<br />\r\n					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum Vivamus elementum. sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi.\r\n					<h2>Day One</h2>\r\n					<strong>Lorem ipsum dolor sit amet, consectLorem ipsum dolor sit amet.</strong><br />\r\n					consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed <a href=\"#\">elementum convallis</a> mi. Vivamus elementum.ed elementum convallis mi. Vivamus elementum.Lorem ipsum dolor sit amet.<br />\r\n					<br />\r\n					cLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi. Vivamus elementum.<br />\r\n					<br />\r\n					<span class=\"acymailing_readmore\">Read More</span>\r\n\r\n					<h2>How to build a green house</h2>\r\n					<img alt=\"picture\" height=\"160\" src=\"media/com_acymailing/templates/newsletter-6/images/picture.png\" style=\"float:left;\" width=\"193\" /> <strong>Lorem ipsum dolor sit amet, elit.</strong> Aenean sollicitudin orci sit amet . Sed <a href=\"#\">elementum convallis</a> mi. Vivamus elementum.ed elementum convallis mi. Vivamus elementum.Lorem ipsum dolor sit amet.<br />\r\n					<br />\r\n					cLorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sollicitudin orci sit amet urna lla pretium ut. Sed elementum convallis mi. Vivamus elementum.<br />\r\n					<br />\r\n					<span class=\"acymailing_readmore\">Read More</span></td>\r\n					<td class=\"w30\" style=\"background-color:#ffffff\" width=\"30\"></td>\r\n				</tr>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td>\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" width=\"600\">\r\n				<tr style=\"line-height: 0px;\">\r\n					<td class=\"w600\" colspan=\"3\" style=\"line-height:0px; background-color:#efefef;\" valign=\"top\" width=\"600\"><img alt=\"--\" class=\"w600\" height=\"18\" src=\"media/com_acymailing/templates/newsletter-6/images/footer1.png\" width=\"600\" /></td>\r\n				</tr>\r\n				<tr>\r\n					<td class=\"w30\" height=\"20\" style=\"line-height:0px; background-color:#efefef;\" width=\"30\"></td>\r\n					<td class=\"acyfooter acyeditor_text w540\" style=\"text-align:right; background-color:#efefef; color:#575757;\" width=\"540\"><a href=\"#\">www.mywebsite.com</a> | <a href=\"#\">Contact</a><a href=\"#\"><img alt=\"message\" class=\"hide\" src=\"media/com_acymailing/templates/newsletter-6/images/mail.png\" style=\"border: medium none; width: 35px; height: 20px;\" /></a></td>\r\n					<td class=\"w30\" height=\"20\" style=\"line-height:0px; background-color:#efefef;\" width=\"30\"></td>\r\n				</tr>\r\n				<tr style=\"line-height: 0px;\">\r\n					<td class=\"w600\" colspan=\"3\" style=\"background-color:#efefef; line-height:0px;\" valign=\"top\" width=\"600\"><img alt=\"--\" class=\"w600\" height=\"24\" src=\"media/com_acymailing/templates/newsletter-6/images/footer2.png\" width=\"600\" /></td>\r\n				</tr>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div class=\"acymailing_unsub acyeditor_delete acyeditor_text\" >{unsubscribe}If you\'re not interested any more <strong>» unsubscribe</strong>{/unsubscribe}</div>\r\n</div>','',NULL,1,0,3,'newsletter-6','a:9:{s:6:\"tag_h1\";s:69:\"font-weight:bold; font-size:14px;color:#3c3c3c !important;margin:0px;\";s:6:\"tag_h2\";s:129:\"color:#b9cf00 !important; font-size:14px; font-weight:bold; margin-top:20px; border-bottom:1px solid #d6d6d6; padding-bottom:4px;\";s:6:\"tag_h3\";s:149:\"color:#7e7e7e !important; font-size:14px; font-weight:bold; margin:20px 0px 0px 0px; border-bottom:1px solid #d6d6d6; padding-bottom:0px 0px 4px 0px;\";s:6:\"tag_h4\";s:84:\"color:#879700 !important; font-size:12px; font-weight:bold; margin:0px; padding:0px;\";s:8:\"color_bg\";s:7:\"#3c3c3c\";s:5:\"tag_a\";s:65:\"cursor:pointer; color:#a2b500; text-decoration:none; border:none;\";s:17:\"acymailing_online\";s:91:\"color:#dddddd; text-decoration:none; font-size:11px; text-align:center; padding-bottom:10px\";s:16:\"acymailing_unsub\";s:88:\"color:#dddddd; text-decoration:none; font-size:11px; text-align:center; padding-top:10px\";s:19:\"acymailing_readmore\";s:73:\"cursor:pointer; color:#ffffff; background-color:#b9cf00; padding:3px 5px;\";}',NULL,'table, div, p{\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	font-size:11px;\r\n	color:#575757;\r\n}\r\n.intro{\r\n	font-weight:bold;\r\n	font-size:12px;}\r\n\r\n.acyfooter a{\r\n	color:#575757;}\r\n\r\n@media (max-width: 450px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=w600]{ width:100% !important; }\r\n	table[class=w30], td[class=w30]{ width:20px !important; }\r\n	.pict img {max-width:260px; height:auto !important;}\r\n}\r\n\r\n@media (min-width: 450px) and (max-width: 600px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=w600]{ width:100% !important; }\r\n	table[class=w30], td[class=w30]{ width:20px !important; }\r\n	.pict img {max-width:410px; height:auto !important;}\r\n}\r\n\r\n@media (min-width:600px){\r\n	.pict img {max-width:540px !important;  height:auto !important;}\r\n}\r\n',NULL,NULL,NULL,NULL,'media/com_acymailing/templates/newsletter-6/newsletter-6.png','','all'),(4,'Technology','','<div align=\"center\" style=\"width:100%; background-color:#575757; padding-bottom:20px; color:#999999;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"w600\" style=\"background-color:#fff; color:#999999; margin:auto\" width=\"600\">\r\n	<tbody>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w30\" style=\"background-color:#575757\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text w540\" style=\"text-align:right; color:#d2d1d1; background-color:#575757\" width=\"540\"><span class=\"acymailing_online\">{readonline}If you can\'t see this e-mail properly, <span style=\"text-decoration:underline\">view it online</span>{/readonline}</span></td>\r\n			<td class=\"w30\" style=\"background-color:#575757\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"acyeditor_picture w600\" colspan=\"3\" style=\"line-height:0px; background-color:#575757\" valign=\"bottom\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/technology_resp/images/shadowtop.jpg\" /></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"acyeditor_picture w600\" colspan=\"3\" style=\"line-height:0px; background-color:#f5f5f5\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/technology_resp/images/top.jpg\" /></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w30\" height=\"32\" style=\"background-color:#f5f5f5; border-bottom:1px solid #ddd\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text links w540\" style=\"background-color:#f5f5f5; border-bottom:1px solid #ddd; text-align:right; color:#ababab\" width=\"540\"><a href=\"#\"><img alt=\"mail\" src=\"media/com_acymailing/templates/technology_resp/images/mail.jpg\" style=\"float:right; border:none\" /></a> Newsletter {mailid} | {date:%B %Y} |&nbsp; <a href=\"#\">www.acyba.com</a> |</td>\r\n			<td class=\"w30\" height=\"32\" style=\"background-color:#f5f5f5; border-bottom:1px solid #ddd\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w600\" colspan=\"3\" height=\"16\" width=\"600\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w30\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text w540 pict\" width=\"540\"><img alt=\"picture\" src=\"media/com_acymailing/templates/technology_resp/images/pic1.jpg\" style=\"float:right\" />\r\n			<h1>Fresh and technologic news !</h1>\r\n\r\n			<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris massa quam, eleifend at ornare.</h3>\r\n			Liget, volutpat esvft sem. Praesent auctor posuere orci, sit amet molee. Integer nec scelerisque quam. Lore uctor posum ipsum dolor sit amesent auctor.</td>\r\n			<td class=\"w30\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n			<td class=\"acyeditor_picture w540\" style=\"background-color:#fafafa; line-height:0px\" width=\"540\"><img alt=\"---\" class=\"w540\" src=\"media/com_acymailing/templates/technology_resp/images/separator1.jpg\" /></td>\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\">\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text w540 pict\" style=\"background-color:#fafafa; color:#999999\" width=\"540\">\r\n			<h2>Choose your smartphone</h2>\r\n			<img alt=\"picture\" src=\"media/com_acymailing/templates/technology_resp/images/pic2.jpg\" style=\"float:left\" />\r\n			<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris massa quam, eleifend at ornare.</h3>\r\n			Liget, volutpat esvft sem. Praesent auctor posuere orci, sit amet molee. Integer nec<a href=\"#\"> scelerisque quam</a>. Lore uctor posum ipsum dolor sit amesent auctor.<br />\r\n			<br />\r\n			<img alt=\"buy this product\" src=\"media/com_acymailing/templates/technology_resp/images/buyproduct.jpg\" /><br />\r\n			<br />\r\n			<br />\r\n			&nbsp;\r\n			<h2>Choose your device</h2>\r\n			<img alt=\"picture\" src=\"media/com_acymailing/templates/technology_resp/images/pic3.jpg\" style=\"float:right\" />\r\n			<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris massa quam, eleifend at ornare.</h3>\r\n			Liget, volutpat esvft sem. Praesent auctor posuere orci, sit amet molee. Integer nec scelerisque quam. Lore uctor posum ipsum dolor sit amesent auctor.<br />\r\n			<br />\r\n			<img alt=\"buy this product\" src=\"media/com_acymailing/templates/technology_resp/images/buyproduct.jpg\" /></td>\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n			<td class=\"acyeditor_picture w540\" style=\"background-color:#fafafa; line-height:0px\" width=\"540\"><img alt=\"---\" class=\"w540\" src=\"media/com_acymailing/templates/technology_resp/images/separator2.jpg\" /></td>\r\n			<td class=\"w30\" style=\"background-color:#fafafa\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w600\" colspan=\"3\" height=\"16\" width=\"600\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w30\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text special w540 pict\" style=\"color:#999999\" width=\"540\">\r\n			<h2>Best product of the month</h2>\r\n\r\n			<h3>Lorem ipsum dolor sit amet.</h3>\r\n			Liget, volutpat esvft sem. Praesent auctor posuere orci, sit amet molee. Integer nec scelerisque quam. Lore uctor posum ipsum doLiget, volutpat esvft sem. Praesent auctor posuere orci, sit amet molee. Integer nec scelerisque quam. Lore uctor posum ipsum dolor sit amesent.<br />\r\n			<br />\r\n			<img alt=\"read more\" src=\"media/com_acymailing/templates/technology_resp/images/readmore.jpg\" style=\"border:none\" /></td>\r\n			<td class=\"w30\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w600\" colspan=\"3\" height=\"16\" width=\"600\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w30\" height=\"30\" style=\"background-color:#f5f5f5; border-top:1px solid #ddd\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text w540\" height=\"30\" style=\"background-color:#f5f5f5; border-top:1px solid #ddd; text-align:right; color:#ababab\" valign=\"bottom\" width=\"540\">Follow us | <img alt=\"facebook\" src=\"media/com_acymailing/templates/technology_resp/images/facebook.jpg\" style=\"border:none\" /> <img alt=\"twitter\" src=\"media/com_acymailing/templates/technology_resp/images/twitter.jpg\" style=\"border:none\" /> <img alt=\"pinterest\" src=\"media/com_acymailing/templates/technology_resp/images/pinterest.jpg\" style=\"border:none\" /> <img alt=\"rss\" src=\"media/com_acymailing/templates/technology_resp/images/rss.jpg\" style=\"border:none\" /></td>\r\n			<td class=\"w30\" height=\"30\" style=\"background-color:#f5f5f5; border-top:1px solid #ddd\" width=\"30\"></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"acyeditor_picture w600\" colspan=\"3\" style=\"line-height:0px; background-color:#f5f5f5\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/technology_resp/images/bottom.jpg\" /></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"acyeditor_picture w600\" colspan=\"3\" style=\"line-height:0px; background-color:#575757\" valign=\"bottom\" width=\"600\"><img alt=\"--\" class=\"w600\" src=\"media/com_acymailing/templates/technology_resp/images/shadowbottom.jpg\" /></td>\r\n		</tr>\r\n		<tr class=\"acyeditor_delete\" >\r\n			<td class=\"w30\" style=\"background-color:#575757\" width=\"30\"></td>\r\n			<td class=\"acyeditor_text w540\" style=\"text-align:right; color:#d2d1d1; background-color:#575757\" width=\"540\"><span class=\"acymailing_unsub\">{unsubscribe}If you don\'t want to receive our news anymore, <span style=\"text-decoration:underline\">unsubscribe</span>{/unsubscribe} </span></td>\r\n			<td class=\"w30\" style=\"background-color:#575757\" width=\"30\"></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>','',NULL,1,0,4,'technology_resp','a:9:{s:6:\"tag_h1\";s:104:\"font-size:20px; margin:0px; margin-bottom:15px; padding:0px; font-weight:bold; color:#01bbe5 !important;\";s:6:\"tag_h2\";s:165:\"font-size:12px; font-weight:bold; color:#565656 !important; text-transform:uppercase; margin:10px 0px; padding:0px; padding-bottom:5px; border-bottom:1px solid #ddd;\";s:6:\"tag_h3\";s:104:\"color:#565656 !important; font-weight:bold; font-size:12px; margin:0px; margin-bottom:10px; padding:0px;\";s:6:\"tag_h4\";s:0:\"\";s:8:\"color_bg\";s:7:\"#575757\";s:5:\"tag_a\";s:62:\"cursor:pointer;color:#01bbe5;text-decoration:none;border:none;\";s:17:\"acymailing_online\";s:30:\"color:#d2d1d1; cursor:pointer;\";s:16:\"acymailing_unsub\";s:30:\"color:#d2d1d1; cursor:pointer;\";s:19:\"acymailing_readmore\";s:88:\"cursor:pointer; font-weight:bold; color:#fff; background-color:#01bbe5; padding:2px 5px;\";}',NULL,'table, div, p {\r\n	font-family:Arial, Helvetica, sans-serif;\r\n	font-size:12px;\r\n}\r\np{margin:0px; padding:0px}\r\n\r\n.special h2{font-size:18px;\r\n	margin:0px;\r\n	margin-bottom:15px;\r\n	padding:0px;\r\n	font-weight:bold;\r\n	color:#01bbe5 !important;\r\n	text-transform:none;\r\n	border:none}\r\n\r\n.links a{color:#ababab}\r\n\r\n@media (max-width:450px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=\"w600\"], img[class=\"w540\"]{ width:100% !important;}\r\n	td[class=w30] { width:20px !important;}\r\n	.pict img {max-width:260px}\r\n}\r\n\r\n@media (min-width: 450px) and (max-width: 600px){\r\n	table[class=w600], td[class=w600], table[class=w540], td[class=w540], img[class=\"w600\"], img[class=\"w540\"]{ width:100% !important;}\r\n	td[class=w30] { width:20px !important;}\r\n	.pict img {max-width:460px}\r\n}\r\n\r\n@media (min-width:600px){\r\n	.pict img {max-width:540px !important;  height:auto !important;}\r\n}\r\n',NULL,NULL,NULL,NULL,'media/com_acymailing/templates/technology_resp/thumb.jpg','','all');
/*!40000 ALTER TABLE `l1pym_acymailing_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_url`
--

DROP TABLE IF EXISTS `l1pym_acymailing_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_url` (
  `urlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`urlid`),
  KEY `url` (`url`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_url`
--

LOCK TABLES `l1pym_acymailing_url` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_urlclick`
--

DROP TABLE IF EXISTS `l1pym_acymailing_urlclick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_urlclick` (
  `urlid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `click` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`urlid`,`mailid`,`subid`),
  KEY `dateindex` (`date`),
  KEY `mailidindex` (`mailid`),
  KEY `subidindex` (`subid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_urlclick`
--

LOCK TABLES `l1pym_acymailing_urlclick` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_urlclick` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_urlclick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_acymailing_userstats`
--

DROP TABLE IF EXISTS `l1pym_acymailing_userstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_acymailing_userstats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `html` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sent` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `senddate` int(10) unsigned NOT NULL,
  `open` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `opendate` int(11) NOT NULL,
  `bounce` tinyint(4) NOT NULL DEFAULT '0',
  `fail` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(100) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` tinyint(3) unsigned DEFAULT NULL,
  `is_mobile` tinyint(3) unsigned DEFAULT NULL,
  `mobile_os` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mailid`,`subid`),
  KEY `senddateindex` (`senddate`),
  KEY `subidindex` (`subid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_acymailing_userstats`
--

LOCK TABLES `l1pym_acymailing_userstats` WRITE;
/*!40000 ALTER TABLE `l1pym_acymailing_userstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_acymailing_userstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_assets`
--

DROP TABLE IF EXISTS `l1pym_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_assets`
--

LOCK TABLES `l1pym_assets` WRITE;
/*!40000 ALTER TABLE `l1pym_assets` DISABLE KEYS */;
INSERT INTO `l1pym_assets` VALUES (1,0,1,1078,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":[],\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,18,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,19,552,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,553,554,1,'com_cpanel','com_cpanel','{}'),(10,1,555,556,1,'com_installer','com_installer','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1},\"core.delete\":[],\"core.edit.state\":[]}'),(11,1,557,558,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,559,560,1,'com_login','com_login','{}'),(13,1,561,562,1,'com_mailto','com_mailto','{}'),(14,1,563,564,1,'com_massmail','com_massmail','{}'),(15,1,565,566,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,567,572,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,573,574,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,575,660,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,661,664,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,665,666,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,667,668,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,669,670,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,671,672,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,673,674,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(25,1,675,682,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(26,1,683,684,1,'com_wrapper','com_wrapper','{}'),(27,8,20,93,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,662,663,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(31,25,676,677,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,8,94,409,2,'com_content.category.7','News','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(33,27,21,22,3,'com_content.article.1','Module Variations','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(35,27,23,24,3,'com_content.article.3','ZOO','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(36,27,25,26,3,'com_content.article.4','Typography','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(39,61,411,412,3,'com_content.article.7','Repertorio nazionale dati territoriali','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(41,32,95,96,3,'com_content.article.9','RNDT, accreditamento PA: che fare','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(43,32,97,98,3,'com_content.article.11','ZOO Extension','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(44,32,99,100,3,'com_content.article.12','On line il portale del RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(56,7,16,17,2,'com_contact.category.8','Contacts','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(57,25,678,679,2,'com_weblinks.category.9','YOOtheme Links','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(58,25,680,681,2,'com_weblinks.category.10','YOOtheme Links (2)','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(59,32,101,102,3,'com_content.article.23','In GU il DM sul RNDT ','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(60,1,1040,1041,1,'com_jce','jce','{}'),(61,8,410,417,2,'com_content.category.11','Homepage','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(62,8,418,449,2,'com_content.category.12','Documenti','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(63,8,450,485,2,'com_content.category.13','Sito','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(64,63,451,452,3,'com_content.article.24','Che cos\'è il RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(65,63,453,454,3,'com_content.article.25','Catalogo','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(66,63,455,456,3,'com_content.article.26','Gestione metadati','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(67,63,457,458,3,'com_content.article.27','RNDT e Inspire','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(68,63,459,460,3,'com_content.article.28','Documenti','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(69,63,461,462,3,'com_content.article.29','Contatti','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(70,1,1042,1043,1,'com_xmap','com_xmap','{}'),(71,61,413,414,3,'com_content.article.30','Contatti','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(72,8,486,487,2,'com_content.category.14','piè di pagina','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(73,77,489,490,3,'com_content.article.31','Informazioni sul sito','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(74,77,491,492,3,'com_content.article.32','Note legali','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(75,77,493,494,3,'com_content.article.33','Privacy','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(76,77,495,496,3,'com_content.article.34','Responsabile procedimento pubblicazione','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(77,8,488,509,2,'com_content.category.15','footer','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(78,77,497,498,3,'com_content.article.35','Crediti','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(79,32,103,104,3,'com_content.article.36','INSPIRE, pubblicato lo State of Play 2011','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(80,62,419,420,3,'com_content.article.37','Archivio Documenti','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(81,62,421,422,3,'com_content.article.38','Direttiva INSPIRE','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(82,62,423,424,3,'com_content.article.39','Regolamento (CE) metadati','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(83,62,425,426,3,'com_content.article.40','Regolamento (CE) servizi di rete','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(84,62,427,428,3,'com_content.article.41','Accreditamento','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(85,62,429,430,3,'com_content.article.42','Linee guida INSPIRE sui servizi di ricerca','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(86,62,431,432,3,'com_content.article.43','Codice Amministrazione Digitale','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(87,62,433,434,3,'com_content.article.44','Decreto recepimento Direttiva INSPIRE','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(88,62,435,436,3,'com_content.article.45','Regole tecniche RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(89,62,437,438,3,'com_content.article.46','Regole tecniche SPC','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(90,63,463,464,3,'com_content.article.47','Dati Territoriali','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(91,63,465,466,3,'com_content.article.48','RNDT e Inspire (2)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(92,1,1044,1045,1,'com_rsform','rsform','{}'),(94,63,467,468,3,'com_content.article.49','Conformità RNDT/INSPIRE','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(95,63,469,470,3,'com_content.article.50','Metadati per l\'interoperabilità','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(96,27,29,30,3,'com_content.article.51','Servizi del portale','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(97,62,439,440,3,'com_content.article.52','Modulo accreditamento','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(98,27,31,32,3,'com_content.article.53','Manuale RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(99,27,33,34,3,'com_content.article.54','Schemi XSD','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(100,32,105,106,3,'com_content.article.55','Nuovo report INSPIRE','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(101,32,107,108,3,'com_content.article.56','Nuove acquisizioni, pubblicata la guida operativa','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(102,32,109,110,3,'com_content.article.57','Il RNDT al Forum PA 2012','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(103,32,111,112,3,'com_content.article.58','Open Standard e INSPIRE','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(104,32,113,114,3,'com_content.article.59','Conferenza INSPIRE 2012','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(105,32,115,116,3,'com_content.article.60','Seminario CISIS','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(106,32,117,118,3,'com_content.article.61','Nuovi metadati nel RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(107,63,471,472,3,'com_content.article.62','Statistiche','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(108,32,119,120,3,'com_content.article.63','RNDT e dati territoriali: eventi e seminari','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(109,32,121,122,3,'com_content.article.64','RNDT, prime scadenze','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(110,32,123,124,3,'com_content.article.65','INSPIRE, disponibili le Specifiche sui dati','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(111,32,125,126,3,'com_content.article.66','Guide RNDT, nuova versione','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(112,32,127,128,3,'com_content.article.67','L\'applicazione del RNDT nel Catalogo del Riuso','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(113,32,129,130,3,'com_content.article.68','Il RNDT nel Catalogo del riuso','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(114,63,473,474,3,'com_content.article.69','RNDT Alert - Dicono di noi','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(115,62,441,442,3,'com_content.article.70','Linee guida INSPIRE sui metadati','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(116,62,443,444,3,'com_content.article.71','Regolamento (UE) interoperabilità dati e servizi','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(117,32,131,132,3,'com_content.article.72','Conferenza AMFM 2012','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(118,32,133,134,3,'com_content.article.73','Il RNDT alla Conferenza AMFM 2012','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(119,32,135,136,3,'com_content.article.74','Pubblicato il nuovo report statistico del RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(120,32,137,138,3,'com_content.article.75','ASITA 2012, il RNDT è on demand','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(121,32,139,140,3,'com_content.article.76','IGM, disponibili i dati RINEX a 30 secondi della RDN','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(122,32,141,142,3,'com_content.article.77','Profilo RNDT per GeoNetwork','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(123,32,143,144,3,'com_content.article.78','Ad ASITA 2012 RNDT on demand','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(124,32,145,146,3,'com_content.article.79','Linked open data, pubblicate le linee guida sull\'interoperabilità semantica','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(125,32,147,148,3,'com_content.article.80','Geo-blogs for RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(126,32,149,150,3,'com_content.article.81','Webinar su metadati, RNDT e dati liberi','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(127,32,151,152,3,'com_content.article.82','ISTAT, disponibile il nuovo sistema informativo geografico','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(128,32,153,154,3,'com_content.article.83','RNDT, pubblicato il nuovo report','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(129,32,155,156,3,'com_content.article.84','INSPIRE, verso Firenze 2013','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(130,32,157,158,3,'com_content.article.85','Dati raster, pubblicata la guida sui metadati','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(131,32,159,160,3,'com_content.article.86','La Conferenza di OpenGeoData Italia','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(132,32,161,162,3,'com_content.article.87','OpenGeoData premia l\'Agenzia per l\'Italia Digitale ','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(133,63,475,476,3,'com_content.article.88','Servizio di ricerca - CSW','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(134,63,477,478,3,'com_content.article.89','Client CSW - RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(135,32,163,164,3,'com_content.article.90','Pubblicati i servizi CSW del RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(136,63,479,480,3,'com_content.article.91','Link utili','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(137,32,165,166,3,'com_content.article.92','Il RNDT diventa social','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(138,32,167,168,3,'com_content.article.93','Dati aperti, tavolo di lavoro per le linee guida nazionali','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(139,32,169,170,3,'com_content.article.94','Un anno di RNDT','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(140,32,171,172,3,'com_content.article.95','Pubblicati i metadati della Regione Siciliana tramite harvesting','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(141,32,173,174,3,'com_content.article.96','Disponibili i metadati della Regione Valle d\'Aosta pubblicati tramite CSW','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(142,32,175,176,3,'com_content.article.97','Conferenza INSPIRE 2013','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(143,32,177,178,3,'com_content.article.98','Il Dipartimento della Protezione Civile  alimenta il RNDT tramite harvesting','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(144,32,179,180,3,'com_content.article.99','Pubblicati i metadati della Regione Friuli Venezia Giulia','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(145,32,181,182,3,'com_content.article.100','Pubblicato l\'e-book \'Dati geografici aperti: istruzioni per l\'uso\'','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(146,32,183,184,3,'com_content.article.101','Importanti eventi su informazione geografica e standardizzazione','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(147,32,185,186,3,'com_content.article.102','Aggiornate le linee guida INSPIRE sui metadati','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(148,32,187,188,3,'com_content.article.103','Consultazione pubblica sull\'implementazione di INSPIRE','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(149,32,189,190,3,'com_content.article.104','Pubblicati i metadati della Regione Basilicata','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(150,32,191,192,3,'com_content.article.105','Nuovo test INSPIRE sul servizio di ricerca del RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(151,32,193,194,3,'com_content.article.106','Piemonte e Trento nuovi nodi della rete RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(152,32,195,196,3,'com_content.article.107','Vogliamo l\'Italia nel registro INSPIRE','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(153,32,197,198,3,'com_content.article.108','Seconda Conferenza OpenGeoData Italia','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(154,32,199,200,3,'com_content.article.109','Pubblicato il primo studio sul settore Geo-ICT in Europa','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(155,32,201,202,3,'com_content.article.110','Il RNDT interrogabile anche con QGIS','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(156,32,203,204,3,'com_content.article.111','OPENS, an opportunity','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(157,32,205,206,3,'com_content.article.112','Rischio sismico, nel piano di soccorso ribadita l\'importanza dei metadati','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(158,32,207,208,3,'com_content.article.113','Dati territoriali, si riparte','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(159,32,209,210,3,'com_content.article.114','Un Forum sulle tecnologie per il territorio, la città intelligente e i beni culturali','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(160,63,483,484,3,'com_content.article.115','Gruppi di lavoro sui dati territoriali','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(161,32,211,212,3,'com_content.article.116','Manuale RNDT, nuova versione delle guide','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(162,27,35,36,3,'com_content.article.117','Manuale RNDT (2)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(163,32,213,214,3,'com_content.article.118','Decreto PA, comunicazione ad AgID delle basi di dati','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(164,32,215,216,3,'com_content.article.119','Documenti INSPIRE su RDF, PID e metadati DCAT-AP','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(165,32,217,218,3,'com_content.article.120','Decreto PA, l\'editor RNDT per la comunicazione dei dati territoriali','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(166,63,481,482,3,'com_content.article.121','Newsletter','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(167,32,219,220,3,'com_content.article.122','Nasce la newsletter del RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(168,32,221,222,3,'com_content.article.123','Geo-localizzazione al servizio del cittadino','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(169,32,223,224,3,'com_content.article.124','Rilasciato il plugin RNDT per GeoNetwork','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(170,32,225,226,3,'com_content.article.125','Un foglio di calcolo per la compilazione dei metadati','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(171,32,227,228,3,'com_content.article.126','AgID alla Conferenza ASITA 2014','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(172,32,229,230,3,'com_content.article.127','Statistiche RNDT, pubblicato il nuovo report','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(173,32,231,232,3,'com_content.article.128','Sardegna, Lodi e Mantova nuovi nodi della rete RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(174,32,233,234,3,'com_content.article.129','INSPIRE lancia la piattaforma sui cluster tematici','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(175,32,235,236,3,'com_content.article.130','Statistiche RNDT, il report in una mappa','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(176,32,237,238,3,'com_content.article.131','Anche l\'Emilia Romagna \"cade\" nella rete RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(177,32,239,240,3,'com_content.article.132','Conferenza OpenGeoData 2015','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(178,32,241,242,3,'com_content.article.133','Sedilo (OR), dal cuore della Sardegna al RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(179,1,1046,1047,1,'com_backupdatabase','backupdatabase','{}'),(180,32,243,244,3,'com_content.article.134','ARPA Piemonte nuovo nodo della rete RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(181,32,245,246,3,'com_content.article.135','AgID al 3° workshop europeo di \"Share-PSI 2.0\"','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(182,1,1048,1049,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.delete\":{\"6\":1},\"core.edit.state\":{\"6\":1,\"5\":1}}'),(183,1,1050,1051,1,'com_finder','com_finder','{}'),(184,1,1052,1053,1,'com_tags','com_tags','{}'),(185,1,1054,1055,1,'com_contenthistory','com_contenthistory','{}'),(186,1,1056,1057,1,'com_ajax','com_ajax','{}'),(187,1,1058,1059,1,'com_postinstall','com_postinstall','{}'),(188,1,1060,1061,1,'com_extplorer','eXtplorer','{}'),(189,1,1062,1063,1,'com_osmap','com_osmap','{}'),(190,1,1064,1065,1,'com_widgetkit','Widgetkit','{}'),(191,18,576,577,2,'com_modules.module.1','Main Menu','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(192,18,578,579,2,'com_modules.module.120','La ricerca dell\'informazione geografica inizia da qui','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(193,18,580,581,2,'com_modules.module.121','Seguici su','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(194,18,582,583,2,'com_modules.module.31','Footer Menu','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(195,18,584,585,2,'com_modules.module.114','RNDT comunica ','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(196,18,586,587,2,'com_modules.module.122','privacy','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(197,18,588,589,2,'com_modules.module.32','Footer','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(198,18,590,591,2,'com_modules.module.123','news','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(199,18,592,593,2,'com_modules.module.124','Servizio CSW','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(200,18,594,595,2,'com_modules.module.125','Newsletter','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(201,18,596,597,2,'com_modules.module.126','I numeri RNDT','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(202,18,598,599,2,'com_modules.module.127','Dicono di noi','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(203,18,600,601,2,'com_modules.module.128','Inspire','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(204,18,602,603,2,'com_modules.module.129','Link utili','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(205,18,604,605,2,'com_modules.module.130','Lorem Ipsum','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(206,18,606,607,2,'com_modules.module.131','Lorem Ipsum','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(207,18,608,609,2,'com_modules.module.48','News - Eventi','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(208,18,610,611,2,'com_modules.module.110','inspire','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(209,18,612,613,2,'com_modules.module.111','portale','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(210,18,614,615,2,'com_modules.module.87','Tutte le news','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(211,18,616,617,2,'com_modules.module.17','Breadcrumbs','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(212,18,618,619,2,'com_modules.module.37','Inner Top','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(213,18,620,621,2,'com_modules.module.62','Top A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(214,18,622,623,2,'com_modules.module.63','Top A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(215,18,624,625,2,'com_modules.module.64','Top A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(216,18,626,627,2,'com_modules.module.34','Inner Bottom','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(217,18,628,629,2,'com_modules.module.35','Inner Bottom','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(218,18,630,631,2,'com_modules.module.79','Twitter Single','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(219,18,632,633,2,'com_modules.module.20','Bottom A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(220,18,634,635,2,'com_modules.module.21','Bottom A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(221,18,636,637,2,'com_modules.module.22','Bottom A','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(222,18,638,639,2,'com_modules.module.105','Bottom C','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(223,18,640,641,2,'com_modules.module.104','Bottom C','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(224,18,642,643,2,'com_modules.module.102','Bottom C','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(225,18,644,645,2,'com_modules.module.101','Bottom C','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(226,18,646,647,2,'com_modules.module.66','Icons Shipping','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(227,18,648,649,2,'com_modules.module.67','Icons E-Commerce','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(228,18,650,651,2,'com_modules.module.68','Icons Action','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(229,18,652,653,2,'com_modules.module.69','Icons Box','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(230,18,654,655,2,'com_modules.module.132','Dati territoriali','{\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"module.edit.frontend\":[]}'),(231,1,1066,1067,1,'#__languages.1','#__languages.1','{}'),(232,18,656,657,2,'com_modules.module.133','Language switcher','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}'),(233,1,1068,1069,1,'#__languages.2','#__languages.2','{}'),(234,16,568,569,2,'com_menus.menu.9','Italiano','{}'),(235,16,570,571,2,'com_menus.menu.10','English','{}'),(236,18,658,659,2,'com_modules.module.40','Cerca','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"module.edit.frontend\":[]}'),(238,61,415,416,3,'com_content.article.136','Home','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(240,241,511,512,3,'com_content.article.137','Metadati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(241,8,510,515,2,'com_content.category.16','Metadati','{}'),(242,27,37,38,3,'com_content.article.138','Report della raccolta','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(243,27,39,40,3,'com_content.article.139','Statistiche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(244,27,41,42,3,'com_content.article.140','Gestione catalogo','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(245,27,43,44,3,'com_content.article.141','Creazione catalogo esterno','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(246,27,45,46,3,'com_content.article.142','Invia Metadati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(247,27,47,48,3,'com_content.article.143','Editing di un metadato','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(248,27,49,50,3,'com_content.article.144','Raccolta','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(249,27,51,52,3,'com_content.article.145','Gestione Utente','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(250,27,53,54,3,'com_content.article.146','Gestione Ente','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(251,27,55,56,3,'com_content.article.147','Login','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(252,1,1070,1071,1,'com_shconfig','com_shconfig','{}'),(253,1,1072,1073,1,'com_shldap','com_shldap','{}'),(254,27,57,58,3,'com_content.article.148','Ricerca avanzata','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(255,62,445,446,3,'com_content.article.149','Regole tecniche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(256,27,59,60,3,'com_content.article.150','Attività in corso','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(257,62,447,448,3,'com_content.article.151','Documentazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(259,27,61,62,3,'com_content.article.153','Pagina non trovata','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(260,1,1074,1075,1,'com_fields','com_fields','{}'),(261,1,1076,1077,1,'com_associations','com_associations','{}'),(262,27,63,64,3,'com_content.article.154','Scheda Metadati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(263,27,65,66,3,'com_content.article.155','Gestisci e Pubblica','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(264,8,516,517,2,'com_content.field.1','Guida Popup (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(265,8,518,519,2,'com_content.field.2','Link footer (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(268,8,520,521,2,'com_content.field.5','Informazioni footer (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(269,8,522,523,2,'com_content.field.6','Contatti footer (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(270,8,524,525,2,'com_content.field.7','Link social (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(271,8,526,527,2,'com_content.field.8','News','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(272,8,528,529,2,'com_content.field.9','Feed (IT)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(273,8,530,531,2,'com_content.field.10','Notizie','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(274,8,532,533,2,'com_content.field.11','Pagina guida pubblica','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(276,8,534,535,2,'com_content.field.13','Link footer (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(277,8,536,537,2,'com_content.field.14','Informazioni footer (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(278,8,538,539,2,'com_content.field.15','Contatti footer (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(279,8,540,541,2,'com_content.field.16','Feed (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(280,8,542,543,2,'com_content.field.17','Link social (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(281,8,544,545,2,'com_content.field.18','Guida','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(282,8,546,547,2,'com_content.field.19','Guida Popup (EN)','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(283,8,548,549,2,'com_content.field.20','Pagina guida Amministratore','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(284,8,550,551,2,'com_content.field.21','Pagina guida PA','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.value\":[]}'),(285,27,67,68,3,'com_content.article.156','User management','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(286,27,69,70,3,'com_content.article.157','External resource management','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(287,27,71,72,3,'com_content.article.158','Metadata editor','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(288,27,73,74,3,'com_content.article.159','Metadata catalog','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(289,27,75,76,3,'com_content.article.160','PA Management','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(290,27,77,78,3,'com_content.article.161','Management Menu','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(291,27,79,80,3,'com_content.article.162','Upload metadata','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(292,27,81,82,3,'com_content.article.163','Page not found','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(293,27,83,84,3,'com_content.article.164','Harvesting','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(294,27,85,86,3,'com_content.article.165','Harvesting report','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(295,27,87,88,3,'com_content.article.166','Advanced search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(296,27,89,90,3,'com_content.article.167','Metadata details','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(297,27,91,92,3,'com_content.article.168','Statistics','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(298,241,513,514,3,'com_content.article.169','Metadata','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(299,77,499,500,3,'com_content.article.170','Site information','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(300,77,501,502,3,'com_content.article.171','Responsible for publication','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(301,77,503,504,3,'com_content.article.172','Privacy','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(302,77,505,506,3,'com_content.article.173','Legal notes','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(303,77,507,508,3,'com_content.article.174','Credits','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(304,32,247,248,3,'com_content.article.175','RNDT, è la volta delle Città Metropolitane','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(305,32,249,250,3,'com_content.article.176','Siena, open data e RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(306,32,251,252,3,'com_content.article.177','AgID al 4° workshop di Share-PSI 2.0','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(307,32,253,254,3,'com_content.article.178','Nasce il SIT federato del Guilcier (Sardegna)','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(308,32,255,256,3,'com_content.article.179','Eventi geo in agenda','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(309,32,257,258,3,'com_content.article.180','Reti di sottoservizi, al via la consultazione pubblica sulle regole tecniche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(310,32,259,260,3,'com_content.article.181','DB geotopografici, evoluzione e aggiornamento delle specifiche in consultazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(311,32,261,262,3,'com_content.article.182','Consultazione pubblica sul profilo europeo GeoDCAT-AP','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(312,32,263,264,3,'com_content.article.183','Nuovo report con i numeri del RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(313,32,265,266,3,'com_content.article.184','Nuovo look per il RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(314,32,267,268,3,'com_content.article.185','Prorogata la consultazione pubblica sulle regole tecniche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(315,32,269,270,3,'com_content.article.186','Regole tecniche, seminario AgID-CISIS ad ASITA 2015','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(316,32,271,272,3,'com_content.article.187','Chiusa la consultazione pubblica sulle regole tecniche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(317,32,273,274,3,'com_content.article.188','AgID al 5° workshop Share-PSI 2.0 su open data e geolocalizzazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(318,32,275,276,3,'com_content.article.189','Prevenzione rischio sismico: RNDT e INSPIRE tra i requisiti per i dati prodotti','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(319,32,277,278,3,'com_content.article.190','Reti di sottoservizi, nasce il Sistema Informativo federato delle infrastrutture','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(320,32,279,280,3,'com_content.article.191','Incontro ISA - AgID al workshop Share-PSI','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(321,32,281,282,3,'com_content.article.192','Webinar su open data e RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(322,32,283,284,3,'com_content.article.193','Profili professionali dell\'informazione geografica, parte il GdL UNINFO','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(323,32,285,286,3,'com_content.article.194','Grande successo dei webinar su open data, cataloghi e RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(324,32,287,288,3,'com_content.article.195','GeoDCAT-AP, pubblicata la versione 1.0','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(325,32,289,290,3,'com_content.article.196','DCAT-AP IT, al via la consultazione pubblica','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(326,32,291,292,3,'com_content.article.197','Profili professionali dell\'informazione geografica, il 1° marzo il kick-off meeting','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(327,32,293,294,3,'com_content.article.198','Servizio Geologico d\'Italia, Liguria e Lombardia nella rete del RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(328,32,295,296,3,'com_content.article.199','Online il nuovo GeoMagazine del Libero Consorzio Comunale di Enna','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(329,32,297,298,3,'com_content.article.200','Il SINFI alla base della strategia per la banda ultra larga','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(330,32,299,300,3,'com_content.article.201','I metadati RNDT nel portale europeo dei dati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(331,32,301,302,3,'com_content.article.202','Regole tecniche reti di sottoservizi, gli esiti della consultazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(332,32,303,304,3,'com_content.article.203','Revisione regole tecniche sui DBT, gli esiti della consultazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(333,32,305,306,3,'com_content.article.204','A maggio la Conferenza nazionale sull\'informazione geografica','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(334,32,307,308,3,'com_content.article.205','A Roma la Conferenza SEMIC 2016','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(335,32,309,310,3,'com_content.article.206','Aggiornamenti sulle Conferenze di maggio','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(336,32,311,312,3,'com_content.article.207','Pubblicare metadati nel CSW attraverso un foglio di calcolo','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(337,32,313,314,3,'com_content.article.208','Nuove regole tecniche su DBGT e reti di sottoservizi / SINFI','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(338,32,315,316,3,'com_content.article.209','Tutto pronto per la Conferenza geo','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(339,32,317,318,3,'com_content.article.210','ITgeoConf: il punto sull\'informazione geografica','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(340,32,319,320,3,'com_content.article.211','I dati territoriali per il governo del territorio, un workshop a Napoli','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(341,32,321,322,3,'com_content.article.212','LandCity Revolution & OpenGeoData','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(342,32,323,324,3,'com_content.article.213','AdB Liri-Garigliano e Volturno e Regione Umbria nel RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(343,32,325,326,3,'com_content.article.214','Al via il GdL UNINFO sui profili dell\'informazione geografica','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(344,32,327,328,3,'com_content.article.215','Nuovi documenti sui DBGT di supporto per le PA','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(345,32,329,330,3,'com_content.article.216','Reti di sottoservizi e SINFI, pubblicate le specifiche aggiornate','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(346,32,331,332,3,'com_content.article.217','Al via la Conferenza INSPIRE 2016','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(347,32,333,334,3,'com_content.article.218','Tecnologie per il territorio: 3 eventi in programma','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(348,32,335,336,3,'com_content.article.219','Informazione geografica, proseguono le attività del GdL UNINFO','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(349,32,337,338,3,'com_content.article.220','SINFI, pubblicate le linee guida','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(350,32,339,340,3,'com_content.article.221','A novembre la Conferenza ASITA 2016','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(351,32,341,342,3,'com_content.article.222','SINFI, aggiornate le specifiche tecniche','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(352,32,343,344,3,'com_content.article.223','Aspettando ASITA, un webinar su informazione geografica e PA locale','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(353,32,345,346,3,'com_content.article.224','Terremoto, le mappe catastali su Copernicus per la catalogazione degli edifici danneggiati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(354,32,347,348,3,'com_content.article.225','I numeri del RNDT: pubblicato il nuovo report','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(355,32,349,350,3,'com_content.article.226','E-government per il governo del territorio, un\'iniziativa in Calabria','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(356,32,351,352,3,'com_content.article.227','EDI, un nuovo editor per i metadati RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(357,32,353,354,3,'com_content.article.228','INSPIRE, pubblicata la versione 2.0 della guida sui metadati','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(358,32,355,356,3,'com_content.article.229','GEOmedia, numero speciale sulla cartografia per le emergenze','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(359,32,357,358,3,'com_content.article.230','A Genova l\'evento FOSS4G italiano','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(360,32,359,360,3,'com_content.article.231','I Comuni liguri nella rete del RNDT grazie alla Regione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(361,32,361,362,3,'com_content.article.232','Nasce la rete accademica del Comitato ONU sull\'informazione geospaziale','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(362,32,363,364,3,'com_content.article.233','Online dall\'8 marzo il nuovo dati.gov.it','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(363,32,365,366,3,'com_content.article.234','Adottato il nuovo Quadro Europeo di Interoperabilità (EIF)','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(364,32,367,368,3,'com_content.article.235','Verso il nuovo RNDT, a maggio l\'anteprima','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(365,32,369,370,3,'com_content.article.236','Indagine su attuazione Direttiva PSI e open data','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(366,32,371,372,3,'com_content.article.237','Pubblicata la nuova versione delle specifiche SINFI','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(367,32,373,374,3,'com_content.article.238','Domani al via la Conferenza ESRI con l\'anteprima del nuovo RNDT','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(368,32,375,376,3,'com_content.article.239','INSPIRE in Italia, monitoraggio e stato di implementazione 2016','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(369,32,377,378,3,'com_content.article.240','Conferenza AMFM 2017, la toponomastica risorsa per la geolocalizzazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(370,32,379,380,3,'com_content.article.241','Verso il nuovo RNDT, la registrazione dell\'evento di presentazione dell\'anteprima','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(371,32,381,382,3,'com_content.article.242','Linking INSPIRE data: linee guida e progetti pilota','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(372,32,383,384,3,'com_content.article.243','AgID e RNDT alla Conferenza INSPIRE 2017','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(373,32,385,386,3,'com_content.article.244','Online il nuovo geoportale della Regione Basilicata','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(374,32,387,388,3,'com_content.article.245','OpenGeoData School 2017','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(375,32,389,390,3,'com_content.article.246','FOSS4G-IT 2018, call for abstract','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(376,32,391,392,3,'com_content.article.247','Conferenza INSPIRE 2017, online video e presentazioni','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(377,32,393,394,3,'com_content.article.248','Fra una settimana il Forum TECHNOLOGY for ALL 2017','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(378,32,395,396,3,'com_content.article.249','Visita di studio della Turchia su geodati e INSPIRE','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(379,32,397,398,3,'com_content.article.250','Consultazione pubblica sulla Direttiva PSI','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(380,32,399,400,3,'com_content.article.251','INSPIRE in Italia, online la versione beta del Sistema di Registri','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(381,32,401,402,3,'com_content.article.252','Conferenza ASITA 2017: AgID su interoperabilità, INSPIRE e competenze digitali','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(382,32,403,404,3,'com_content.article.253','Cartografia catastale, disponibile il servizio di consultazione','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(383,32,405,406,3,'com_content.article.254','Profili professionali dell\'informazione geografica, al via l\'inchiesta pubblica finale','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(384,32,407,408,3,'com_content.article.255','Webinar sul Sistema di Registri INSPIRE Italia','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
/*!40000 ALTER TABLE `l1pym_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_associations`
--

DROP TABLE IF EXISTS `l1pym_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_associations`
--

LOCK TABLES `l1pym_associations` WRITE;
/*!40000 ALTER TABLE `l1pym_associations` DISABLE KEYS */;
INSERT INTO `l1pym_associations` VALUES (266,'com_menus.item','0ba546bee2aee78c5d3a568368fd878d'),(353,'com_menus.item','0ba546bee2aee78c5d3a568368fd878d'),(311,'com_menus.item','14af011b6161597ce3abc7ab8df94701'),(367,'com_menus.item','14af011b6161597ce3abc7ab8df94701'),(298,'com_menus.item','17c3c4a157cc7391c2f2070704c3fffe'),(345,'com_menus.item','17c3c4a157cc7391c2f2070704c3fffe'),(309,'com_menus.item','1f762e304e4e423075273e5dffed4e62'),(365,'com_menus.item','1f762e304e4e423075273e5dffed4e62'),(262,'com_menus.item','1f92a08598c36bbef5bcf5320b9d59b4'),(342,'com_menus.item','1f92a08598c36bbef5bcf5320b9d59b4'),(362,'com_menus.item','42e59ddcb9b978a04608b2113dde7adc'),(363,'com_menus.item','42e59ddcb9b978a04608b2113dde7adc'),(289,'com_menus.item','4803dc0718d59ab4f0214033c217ec10'),(341,'com_menus.item','4803dc0718d59ab4f0214033c217ec10'),(316,'com_menus.item','563d483c1f9a46a785b4d9184cefabab'),(355,'com_menus.item','563d483c1f9a46a785b4d9184cefabab'),(272,'com_menus.item','7012152a813056b487133496efcd77a2'),(356,'com_menus.item','7012152a813056b487133496efcd77a2'),(176,'com_menus.item','73837ffa48a2d02d50b243b015748a2f'),(340,'com_menus.item','73837ffa48a2d02d50b243b015748a2f'),(268,'com_menus.item','79ae74027f367d944d036d8ef2577197'),(352,'com_menus.item','79ae74027f367d944d036d8ef2577197'),(313,'com_menus.item','8f122f379928b67e95ccff5dea339257'),(369,'com_menus.item','8f122f379928b67e95ccff5dea339257'),(190,'com_menus.item','9599a8525692125c2a87e79096e3701f'),(343,'com_menus.item','9599a8525692125c2a87e79096e3701f'),(273,'com_menus.item','ac68bdaeb2173921cab27be8fac1d7cc'),(357,'com_menus.item','ac68bdaeb2173921cab27be8fac1d7cc'),(264,'com_menus.item','b0d42f038215e9390e7a128936391e11'),(347,'com_menus.item','b0d42f038215e9390e7a128936391e11'),(312,'com_menus.item','c74c7e6540ffe190b4ea8b40c120c9ff'),(368,'com_menus.item','c74c7e6540ffe190b4ea8b40c120c9ff'),(307,'com_menus.item','cc957e34a2f0d03d92d11f7e4288cad5'),(349,'com_menus.item','cc957e34a2f0d03d92d11f7e4288cad5'),(308,'com_menus.item','d0cc357cc6b2fe47a789fc0081de567f'),(364,'com_menus.item','d0cc357cc6b2fe47a789fc0081de567f'),(265,'com_menus.item','ee296ca6fa9f70947169314f913f6559'),(351,'com_menus.item','ee296ca6fa9f70947169314f913f6559'),(269,'com_menus.item','eff348f450e6ee6accae0a1b866c2e97'),(354,'com_menus.item','eff348f450e6ee6accae0a1b866c2e97'),(358,'com_menus.item','f117894c29c8583d3bd6dc550a3b6476'),(359,'com_menus.item','f117894c29c8583d3bd6dc550a3b6476'),(310,'com_menus.item','f1771e346161c07cc859d77f4e388d2f'),(366,'com_menus.item','f1771e346161c07cc859d77f4e388d2f'),(360,'com_menus.item','f1de1f4e241ecd6baf4e3582ca1317f4'),(361,'com_menus.item','f1de1f4e241ecd6baf4e3582ca1317f4'),(267,'com_menus.item','f46dfd27b3507fe0724577c5ec3e1afa'),(348,'com_menus.item','f46dfd27b3507fe0724577c5ec3e1afa'),(270,'com_menus.item','fdc6c62f8a891e14de4ad2642832c686'),(350,'com_menus.item','fdc6c62f8a891e14de4ad2642832c686');
/*!40000 ALTER TABLE `l1pym_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_banner_clients`
--

DROP TABLE IF EXISTS `l1pym_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_banner_clients`
--

LOCK TABLES `l1pym_banner_clients` WRITE;
/*!40000 ALTER TABLE `l1pym_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_banner_tracks`
--

DROP TABLE IF EXISTS `l1pym_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_banner_tracks`
--

LOCK TABLES `l1pym_banner_tracks` WRITE;
/*!40000 ALTER TABLE `l1pym_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_banners`
--

DROP TABLE IF EXISTS `l1pym_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_banners`
--

LOCK TABLES `l1pym_banners` WRITE;
/*!40000 ALTER TABLE `l1pym_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_categories`
--

DROP TABLE IF EXISTS `l1pym_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned DEFAULT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_categories`
--

LOCK TABLES `l1pym_categories` WRITE;
/*!40000 ALTER TABLE `l1pym_categories` DISABLE KEYS */;
INSERT INTO `l1pym_categories` VALUES (1,0,0,0,31,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',0,'2009-10-18 16:07:09',0,'0000-00-00 00:00:00',0,'*',1),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:26:37',0,'0000-00-00 00:00:00',0,'*',1),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:35',0,'0000-00-00 00:00:00',0,'*',1),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:57',0,'0000-00-00 00:00:00',0,'*',1),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:15',0,'0000-00-00 00:00:00',0,'*',1),(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*',1),(7,32,1,11,12,1,'news','com_content','News','news','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',44,'2011-05-02 11:42:21',43,'2012-03-28 14:35:29',0,'*',1),(8,56,1,13,14,1,'contacts','com_contact','Contacts','contacts','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2012-01-23 15:30:44',0,'0000-00-00 00:00:00',0,'*',1),(9,57,1,15,16,1,'yootheme-links','com_weblinks','YOOtheme Links','yootheme-links','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2012-01-23 15:41:18',0,'0000-00-00 00:00:00',0,'*',1),(10,58,1,17,18,1,'yootheme-links-2','com_weblinks','YOOtheme Links (2)','yootheme-links-2','','',-2,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',42,'2012-01-23 15:41:21',0,'0000-00-00 00:00:00',0,'*',1),(11,61,1,19,20,1,'homepage','com_content','Homepage','homepage','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',50,'2012-03-02 17:59:43',50,'2017-06-27 10:13:03',0,'*',1),(12,62,1,21,22,1,'documenti','com_content','Documenti','documenti','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',43,'2012-03-11 21:54:06',43,'2012-03-11 21:54:22',0,'*',1),(13,63,1,23,24,1,'sito','com_content','Sito','sito','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',43,'2012-03-11 21:54:35',0,'0000-00-00 00:00:00',0,'*',1),(14,72,1,25,26,1,'pie-di-pagina','com_content','piè di pagina','pie-di-pagina','','',-2,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',44,'2012-03-15 12:47:40',0,'0000-00-00 00:00:00',0,'*',1),(15,77,1,27,28,1,'footer','com_content','footer','footer','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',44,'2012-03-15 14:21:10',0,'0000-00-00 00:00:00',0,'*',1),(16,241,1,29,30,1,'metadati','com_content','Metadati','metadati','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',43,'2017-02-28 08:16:50',0,'2017-02-28 08:16:50',0,'*',1);
/*!40000 ALTER TABLE `l1pym_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_contact_details`
--

DROP TABLE IF EXISTS `l1pym_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_contact_details`
--

LOCK TABLES `l1pym_contact_details` WRITE;
/*!40000 ALTER TABLE `l1pym_contact_details` DISABLE KEYS */;
INSERT INTO `l1pym_contact_details` VALUES (1,'John Q. Public','john-q-public','Chief Information Officer','1 Infinite Loop','Cupertino','California','USA','95014','1-212-555555-1','1-212-555555-2','Lorem ipsum dolor sit amet, consetetur sadipscing elitr.','','email@0.0.0.0',0,1,0,'0000-00-00 00:00:00',1,'{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":\"\",\"linkb_name\":\"\",\"linkb\":\"\",\"linkc_name\":\"\",\"linkc\":\"\",\"linkd_name\":\"\",\"linkd\":\"\",\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}',0,8,1,'','','','','','*','2012-01-23 15:32:10',42,'','2012-01-23 15:36:13',42,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0),(2,'Jane Q. Public','jane-q-public','Chief Information Officer','1 Infinite Loop','Cupertino','California','USA','95014','1-212-555555-1','1-212-555555-2','Lorem ipsum dolor sit amet, consetetur sadipscing elitr.','','email@0.0.0.0',0,1,0,'0000-00-00 00:00:00',2,'{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":\"\",\"linkb_name\":\"\",\"linkb\":\"\",\"linkc_name\":\"\",\"linkc\":\"\",\"linkd_name\":\"\",\"linkd\":\"\",\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}',0,8,1,'','','','','','*','2012-01-23 15:36:05',42,'','0000-00-00 00:00:00',0,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0);
/*!40000 ALTER TABLE `l1pym_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_content`
--

DROP TABLE IF EXISTS `l1pym_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_content`
--

LOCK TABLES `l1pym_content` WRITE;
/*!40000 ALTER TABLE `l1pym_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_content_frontpage`
--

DROP TABLE IF EXISTS `l1pym_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_content_frontpage`
--

LOCK TABLES `l1pym_content_frontpage` WRITE;
/*!40000 ALTER TABLE `l1pym_content_frontpage` DISABLE KEYS */;
INSERT INTO `l1pym_content_frontpage` VALUES (8,3),(10,2),(11,1);
/*!40000 ALTER TABLE `l1pym_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_content_rating`
--

DROP TABLE IF EXISTS `l1pym_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_content_rating`
--

LOCK TABLES `l1pym_content_rating` WRITE;
/*!40000 ALTER TABLE `l1pym_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_content_types`
--

DROP TABLE IF EXISTS `l1pym_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_content_types`
--

LOCK TABLES `l1pym_content_types` WRITE;
/*!40000 ALTER TABLE `l1pym_content_types` DISABLE KEYS */;
INSERT INTO `l1pym_content_types` VALUES (1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\": {\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(2,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\": {\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),(3,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\": {\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(4,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\": {}}','UsersHelperRoute::getUserRoute',''),(5,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(6,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(7,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(8,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(10000,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(10001,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(10002,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),(10003,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(10004,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(10005,'Weblink','com_weblinks.weblink','{\"special\":{\"dbtable\":\"#__weblinks\",\"key\":\"id\",\"type\":\"Weblink\",\"prefix\":\"WeblinksTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"url\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{}}','WeblinksHelperRoute::getWeblinkRoute','{\"formFile\":\"administrator\\/components\\/com_weblinks\\/models\\/forms\\/weblink.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"featured\",\"images\"], \"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(10006,'Weblinks Category','com_weblinks.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','WeblinksHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
/*!40000 ALTER TABLE `l1pym_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_contentitem_tag_map`
--

DROP TABLE IF EXISTS `l1pym_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_contentitem_tag_map`
--

LOCK TABLES `l1pym_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `l1pym_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_core_log_searches`
--

DROP TABLE IF EXISTS `l1pym_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_core_log_searches`
--

LOCK TABLES `l1pym_core_log_searches` WRITE;
/*!40000 ALTER TABLE `l1pym_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_extensions`
--

DROP TABLE IF EXISTS `l1pym_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '0',
  `access` int(10) unsigned DEFAULT NULL,
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_extensions`
--

LOCK TABLES `l1pym_extensions` WRITE;
/*!40000 ALTER TABLE `l1pym_extensions` DISABLE KEYS */;
INSERT INTO `l1pym_extensions` VALUES (1,0,'com_mailto','component','com_mailto','',0,1,1,1,'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,0,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,0,'com_admin','component','com_admin','',1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,0,'com_banners','component','com_banners','',1,1,1,0,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(5,0,'com_cache','component','com_cache','',1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,0,'com_categories','component','com_categories','',1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,0,'com_checkin','component','com_checkin','',1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,0,'com_contact','component','com_contact','',1,1,1,0,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(9,0,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,0,'com_installer','component','com_installer','',1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(11,0,'com_languages','component','com_languages','',1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"it-IT\",\"site\":\"it-IT\"}','','',0,'0000-00-00 00:00:00',0,0),(12,0,'com_login','component','com_login','',1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,0,'com_media','component','com_media','',1,1,0,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\",\"enable_flash\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(14,0,'com_menus','component','com_menus','',1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(15,0,'com_messages','component','com_messages','',1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,0,'com_modules','component','com_modules','',1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(17,0,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,0,'com_plugins','component','com_plugins','',1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(19,0,'com_search','component','com_search','',1,1,1,0,'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(20,0,'com_templates','component','com_templates','',1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{\"template_positions_display\":\"0\",\"upload_limit\":\"2\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}','','',0,'0000-00-00 00:00:00',0,0),(21,0,'com_weblinks','component','com_weblinks','',1,1,1,0,'{\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"2016-03-22\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"weblinks\"}','{\"target\":\"0\",\"count_clicks\":\"1\",\"icons\":1,\"link_icons\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_num_links\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_links_cat\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_link_description\":\"1\",\"show_link_hits\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(22,0,'com_content','component','com_content','',1,1,0,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_tags\":\"1\",\"show_icons\":\"1\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":\"0\",\"captcha\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"0\",\"history_limit\":10,\"show_urls_images_frontend\":\"1\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"right\",\"float_fulltext\":\"right\",\"category_layout\":\"_:blog\",\"show_category_heading_title_text\":\"1\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"0\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"10\",\"num_columns\":\"1\",\"num_links\":\"0\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"-1\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"list_show_votes\":\"0\",\"list_show_ratings\":\"0\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"0\",\"show_featured\":\"show\",\"show_feed_link\":\"0\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"custom_fields_enable\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(23,0,'com_config','component','com_config','',1,1,0,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,0,'com_redirect','component','com_redirect','',1,1,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(25,0,'com_users','component','com_users','',1,1,0,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"1\",\"sendpassword\":\"1\",\"useractivation\":\"1\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"0\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"0\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(27,0,'com_finder','component','com_finder','',1,1,0,0,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"1\",\"show_date_filters\":\"1\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"porter_en\",\"enable_logging\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(28,0,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{\"updatesource\":\"sts\",\"customurl\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(29,0,'com_tags','component','com_tags','',1,1,1,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(30,0,'com_contenthistory','component','com_contenthistory','',1,1,1,0,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(31,0,'com_ajax','component','com_ajax','',1,1,1,1,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(32,0,'com_postinstall','component','com_postinstall','',1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(33,0,'com_fields','component','com_fields','',1,1,1,0,'{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(34,0,'com_associations','component','com_associations','',1,1,1,0,'{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"Januar 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(102,0,'LIB_PHPUTF8','library','phputf8','',0,1,1,1,'{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,0,'LIB_JOOMLA','library','joomla','',0,1,1,1,'{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"mediaversion\":\"6dcce4ea9ec86af3357a1c83c1f679f1\"}','','',0,'0000-00-00 00:00:00',0,0),(104,0,'LIB_IDNA','library','idna_convert','',0,1,1,1,'{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}','','','',0,'0000-00-00 00:00:00',0,0),(105,0,'FOF','library','fof','',0,1,1,1,'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(106,0,'LIB_PHPASS','library','phpass','',0,1,1,1,'{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(200,0,'mod_articles_archive','module','mod_articles_archive','',0,1,1,0,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,0,'mod_articles_latest','module','mod_articles_latest','',0,1,1,0,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,0,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,0,'mod_banners','module','mod_banners','',0,1,1,0,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,0,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,0,'mod_custom','module','mod_custom','',0,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,0,'mod_feed','module','mod_feed','',0,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,0,'mod_footer','module','mod_footer','',0,1,1,0,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,0,'mod_login','module','mod_login','',0,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,0,'mod_menu','module','mod_menu','',0,1,1,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,0,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,0,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,0,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,0,'mod_search','module','mod_search','',0,1,1,0,'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,0,'mod_stats','module','mod_stats','',0,1,1,0,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,0,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,0,'mod_users_latest','module','mod_users_latest','',0,1,1,0,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(217,0,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'{\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"2016-03-22\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_weblinks\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,0,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,0,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,0,'mod_articles_category','module','mod_articles_category','',0,1,1,0,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,0,'mod_articles_categories','module','mod_articles_categories','',0,1,1,0,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,0,'mod_languages','module','mod_languages','',0,1,1,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}','','','',0,'0000-00-00 00:00:00',0,0),(223,0,'mod_finder','module','mod_finder','',0,1,0,0,'','','','',0,'0000-00-00 00:00:00',0,0),(300,0,'mod_custom','module','mod_custom','',1,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,0,'mod_feed','module','mod_feed','',1,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,0,'mod_latest','module','mod_latest','',1,1,1,0,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,0,'mod_logged','module','mod_logged','',1,1,1,0,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,0,'mod_login','module','mod_login','',1,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,0,'mod_menu','module','mod_menu','',1,1,1,0,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,0,'mod_popular','module','mod_popular','',1,1,1,0,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,0,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,0,'mod_status','module','mod_status','',1,1,1,0,'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,0,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,0,'mod_title','module','mod_title','',1,1,1,0,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,0,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,0,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,0,'mod_version','module','mod_version','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(315,0,'mod_stats_admin','module','mod_stats_admin','',1,1,1,0,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0),(316,0,'mod_tags_popular','module','mod_tags_popular','',0,1,1,0,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(317,0,'mod_tags_similar','module','mod_tags_similar','',0,1,1,0,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(400,0,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,0,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(402,0,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"host\":\"localhost\",\"port\":\"389\",\"use_ldapV3\":\"1\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"ou=Users,ou=People,dc=maxcrc,dc=com\",\"search_string\":\"CN=[search]\",\"users_dn\":\"cn=[username],ou=Users,ou=People,dc=maxcrc,dc=com\",\"username\":\"cn=Manager,dc=maxcrc,dc=com\",\"password\":\"secret\",\"ldap_fullname\":\"displayName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',0,0),(403,0,'plg_content_contact','plugin','contact','content',0,1,1,0,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',1,0),(404,0,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(405,0,'plg_content_geshi','plugin','geshi','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(406,0,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}','{\"style\":\"none\"}','','',0,'0000-00-00 00:00:00',0,0),(407,0,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,0,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,0,'plg_content_pagenavigation','plugin','pagenavigation','content',0,0,1,0,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,0,'plg_content_vote','plugin','vote','content',0,1,1,0,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}','{}','','',0,'0000-00-00 00:00:00',6,0),(410,0,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.25.2\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,0,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(412,0,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,0,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2017\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.5.6\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}','{\"mode\":\"1\",\"skin\":\"0\",\"compressed\":\"0\",\"cleanup_startup\":\"0\",\"cleanup_save\":\"2\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\",@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight]\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"safari\":\"0\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,0,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(414,0,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(415,0,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(416,0,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(417,0,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,0,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,0,'plg_search_content','plugin','content','search',0,1,1,0,'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,0,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(421,0,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'{\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"2016-03-22\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"weblinks\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,0,'plg_system_languagefilter','plugin','languagefilter','system',0,1,1,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}','{\"detect_browser\":\"1\",\"automatic_change\":\"1\",\"item_associations\":\"1\",\"alternate_meta\":\"1\",\"xdefault\":\"1\",\"xdefault_language\":\"default\",\"remove_default_prefix\":\"1\",\"lang_cookie\":\"0\"}','','',0,'0000-00-00 00:00:00',6,0),(423,0,'plg_system_p3p','plugin','p3p','system',0,1,1,0,'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',7,0),(424,0,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',15,0),(425,0,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',9,0),(426,0,'plg_system_log','plugin','log','system',0,1,1,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}','{}','','',0,'0000-00-00 00:00:00',10,0),(427,0,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}','{\"collect_urls\":\"1\"}','','',0,'0000-00-00 00:00:00',11,0),(428,0,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}','{}','','',0,'0000-00-00 00:00:00',12,0),(429,0,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}','{}','','',0,'0000-00-00 00:00:00',14,0),(430,0,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}','{}','','',0,'0000-00-00 00:00:00',8,0),(431,0,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,0,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,0,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,0,'plg_user_profile','plugin','profile','user',0,0,1,0,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,0,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(435,0,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(436,0,'plg_system_languagecode','plugin','languagecode','system',0,1,1,0,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}','{}','','',0,'0000-00-00 00:00:00',16,0),(437,0,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(438,0,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(439,0,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,1,1,0,'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(440,0,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'','{}','','',0,'0000-00-00 00:00:00',13,0),(441,0,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.7.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(442,0,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(443,0,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(444,0,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(445,0,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(446,0,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'{\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"2016-03-22\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"weblinks\"}','{}','','',0,'0000-00-00 00:00:00',5,0),(447,0,'plg_finder_tags','plugin','tags','finder',0,1,1,0,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(448,0,'plg_twofactorauth_totp','plugin','totp','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(449,0,'plg_authentication_cookie','plugin','cookie','authentication',0,1,1,0,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(450,0,'plg_twofactorauth_yubikey','plugin','yubikey','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(451,0,'plg_search_tags','plugin','tags','search',0,0,1,0,'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(452,0,'plg_system_updatenotification','plugin','updatenotification','system',0,1,1,0,'{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}','{\"lastrun\":1543496980}','','',0,'0000-00-00 00:00:00',0,0),(453,0,'plg_editors-xtd_module','plugin','module','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}','','','',0,'0000-00-00 00:00:00',0,0),(454,0,'plg_system_stats','plugin','stats','system',0,1,1,0,'{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}','{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"3b793f8128813762d835c529421a10ce04d61556\",\"interval\":12}','','',0,'0000-00-00 00:00:00',0,0),(455,0,'plg_installer_packageinstaller','plugin','packageinstaller','installer',0,1,1,1,'{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}','','','',0,'0000-00-00 00:00:00',1,0),(456,0,'PLG_INSTALLER_FOLDERINSTALLER','plugin','folderinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}','','','',0,'0000-00-00 00:00:00',2,0),(457,0,'PLG_INSTALLER_URLINSTALLER','plugin','urlinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}','','','',0,'0000-00-00 00:00:00',3,0),(458,0,'plg_quickicon_phpversioncheck','plugin','phpversioncheck','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}','','','',0,'0000-00-00 00:00:00',0,0),(459,0,'plg_editors-xtd_menu','plugin','menu','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(460,0,'plg_editors-xtd_contact','plugin','contact','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',0,0),(461,0,'plg_system_fields','plugin','fields','system',0,1,1,0,'{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(462,0,'plg_fields_calendar','plugin','calendar','fields',0,1,1,0,'{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}','','','',0,'0000-00-00 00:00:00',0,0),(463,0,'plg_fields_checkboxes','plugin','checkboxes','fields',0,1,1,0,'{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}','','','',0,'0000-00-00 00:00:00',0,0),(464,0,'plg_fields_color','plugin','color','fields',0,1,1,0,'{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}','','','',0,'0000-00-00 00:00:00',0,0),(465,0,'plg_fields_editor','plugin','editor','fields',0,1,1,0,'{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}','','','',0,'0000-00-00 00:00:00',0,0),(466,0,'plg_fields_imagelist','plugin','imagelist','fields',0,1,1,0,'{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}','','','',0,'0000-00-00 00:00:00',0,0),(467,0,'plg_fields_integer','plugin','integer','fields',0,1,1,0,'{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}','{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(468,0,'plg_fields_list','plugin','list','fields',0,1,1,0,'{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}','','','',0,'0000-00-00 00:00:00',0,0),(469,0,'plg_fields_media','plugin','media','fields',0,1,1,0,'{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','','','',0,'0000-00-00 00:00:00',0,0),(470,0,'plg_fields_radio','plugin','radio','fields',0,1,1,0,'{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}','','','',0,'0000-00-00 00:00:00',0,0),(471,0,'plg_fields_sql','plugin','sql','fields',0,1,1,0,'{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}','','','',0,'0000-00-00 00:00:00',0,0),(472,0,'plg_fields_text','plugin','text','fields',0,1,1,0,'{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}','','','',0,'0000-00-00 00:00:00',0,0),(473,0,'plg_fields_textarea','plugin','textarea','fields',0,1,1,0,'{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}','','','',0,'0000-00-00 00:00:00',0,0),(474,0,'plg_fields_url','plugin','url','fields',0,1,1,0,'{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}','','','',0,'0000-00-00 00:00:00',0,0),(475,0,'plg_fields_user','plugin','user','fields',0,1,1,0,'{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}','','','',0,'0000-00-00 00:00:00',0,0),(476,0,'plg_fields_usergrouplist','plugin','usergrouplist','fields',0,1,1,0,'{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}','','','',0,'0000-00-00 00:00:00',0,0),(477,0,'plg_content_fields','plugin','fields','content',0,1,1,0,'{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(478,0,'plg_editors-xtd_fields','plugin','fields','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}','','','',0,'0000-00-00 00:00:00',0,0),(500,0,'atomic','template','atomic','',0,1,1,0,'{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(502,0,'bluestork','template','bluestork','',1,1,1,0,'{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(503,0,'beez_20','template','beez_20','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,0,'hathor','template','hathor','',1,1,1,0,'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(505,0,'beez5','template','beez5','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(600,802,'English (en-GB)','language','en-GB','',0,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"May 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.2\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,802,'English (en-GB)','language','en-GB','',1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"May 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.2\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,0,'files_joomla','file','joomla','',0,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"May 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2017 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.2\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(802,0,'English (en-GB) Language Pack','package','pkg_en-GB','',0,1,1,1,'{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"May 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.2.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}','','','',0,'0000-00-00 00:00:00',0,0),(10001,0,'Widgetkit','module','mod_widgetkit','',0,1,0,0,'{\"name\":\"Widgetkit\",\"type\":\"module\",\"creationDate\":\"May 2011\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2011 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.0.0\",\"description\":\"Widgetkit module for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"mod_widgetkit\"}','{\"widget_id\":\"\",\"moduleclass_sfx\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10002,0,'Widgetkit Twitter','module','mod_widgetkit_twitter','',0,1,0,0,'{\"name\":\"Widgetkit Twitter\",\"type\":\"module\",\"creationDate\":\"May 2011\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2011 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.0.0\",\"description\":\"Twitter module for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"mod_widgetkit_twitter\"}','{\"style\":\"list\",\"from_user\":\"\",\"to_user\":\"\",\"ref_user\":\"\",\"hashtag\":\"\",\"word\":\"\",\"nots\":\"\",\"limit\":\"5\",\"image_size\":\"48\",\"show_image\":\"1\",\"show_author\":\"1\",\"show_date\":\"1\",\"moduleclass_sfx\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10003,0,'System - Widgetkit','plugin','widgetkit_system','system',0,1,1,0,'{\"name\":\"System - Widgetkit\",\"type\":\"plugin\",\"creationDate\":\"May 2011\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2011 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.0.0\",\"description\":\"Plugin for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"widgetkit_system\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(10004,0,'Content - Widgetkit','plugin','widgetkit_content','content',0,1,1,0,'{\"name\":\"Content - Widgetkit\",\"type\":\"plugin\",\"creationDate\":\"May 2011\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2011 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.0.0\",\"description\":\"Plugin for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"widgetkit_content\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10005,0,'Widgetkit','component','com_widgetkit','',1,1,0,0,'{\"name\":\"Widgetkit\",\"type\":\"component\",\"creationDate\":\"September 2014\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.5.5\",\"description\":\"Widgetkit - A widget toolkit by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"widgetkit\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10006,0,'PKG_JOOMLA','package','pkg_joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10007,0,'System - Widgetkit ZOO','plugin','widgetkit_zoo','system',0,1,1,0,'{\"name\":\"System - Widgetkit ZOO\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2013 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"3.1.0\",\"description\":\"ZOO plugin for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"widgetkit_zoo\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(10009,0,'System - Widgetkit Joomla','plugin','widgetkit_joomla','system',0,1,1,0,'{\"name\":\"System - Widgetkit Joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) 2007 - 2011 YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/www.yootheme.com\",\"version\":\"1.0.0\",\"description\":\"Joomla Content plugin for Widgetkit developed by YOOtheme (http:\\/\\/www.yootheme.com)\",\"group\":\"\",\"filename\":\"widgetkit_joomla\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(10011,10050,'ItalianItaly','language','it-IT','',0,1,0,0,'{\"name\":\"Italian (Italy)\",\"type\":\"language\",\"creationDate\":\"23 Maggio 2017\",\"author\":\"Italian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters and Joomla.it. All rights reserved\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"3.7.2.1\",\"description\":\"Italian site language pack for Joomla! 3.7\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10012,10050,'ItalianItaly','language','it-IT','',1,1,0,0,'{\"name\":\"Italian (Italy)\",\"type\":\"language\",\"creationDate\":\"23 Maggio 2017\",\"author\":\"Italian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters and Joomla.it. All rights reserved\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"3.7.2.1\",\"description\":\"Italian administration language pack for Joomla! 3.7\",\"group\":\"\",\"filename\":\"install\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10014,10059,'plg_editors_jce','plugin','jce','editors',0,1,1,0,'{\"name\":\"plg_editors_jce\",\"type\":\"plugin\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"http:\\/\\/www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"WF_EDITOR_PLUGIN_DESC\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10015,10059,'COM_JCE','component','com_jce','',1,1,0,0,'{\"name\":\"COM_JCE\",\"type\":\"component\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"COM_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','{\"compatibility\":{\"available\":{\"value\":[\"2.5\",\"3.0\",\"3.1\",\"3.2\",\"3.3\",\"3.4\"],\"version\":\"2.4.6\"}}}',0,'0000-00-00 00:00:00',0,0),(10018,0,'com_xmap','component','com_xmap','',1,0,0,0,'{\"legacy\":true,\"name\":\"com_xmap\",\"type\":\"component\",\"creationDate\":\"2011-04-10\",\"author\":\"Guillermo Vargas\",\"copyright\":\"This component is released under the GNU\\/GPL License\",\"authorEmail\":\"guille@vargas.co.cr\",\"authorUrl\":\"http:\\/\\/joomla.vargas.co.cr\",\"version\":\"2.2.1\",\"description\":\"Xmap - Sitemap Generator for Joomla!\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10020,0,'Xmap - Kunena Plugin','plugin','com_kunena','xmap',0,0,1,0,'{\"name\":\"Xmap - Kunena Plugin\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Alledia\",\"copyright\":\"Copyright (C) 2015 Open Source Training, LLC. All rights reserved. \\/ Forked from XMap - Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"support@alledia.com\",\"authorUrl\":\"http:\\/\\/www.alledia.com\",\"version\":\"3.0.2\",\"description\":\"Xmap Plugin for Kunena component\",\"group\":\"\",\"filename\":\"com_kunena\"}','{\"include_topics\":\"1\",\"max_topics\":\"\",\"max_age\":\"\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"-1\",\"topic_priority\":\"-1\",\"topic_changefreq\":\"-1\"}','','',0,'0000-00-00 00:00:00',0,0),(10021,0,'Xmap - SobiPro Plugin','plugin','com_sobipro','xmap',0,0,1,0,'{\"name\":\"Xmap - SobiPro Plugin\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Guillermo Vargas\",\"copyright\":\"Copyright (C) 2014, Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"guille@vargas.co.cr\",\"authorUrl\":\"joomla.vargas.co.cr\",\"version\":\"3.0.2\",\"description\":\"Xmap Plugin for SobiPro component\",\"group\":\"\",\"filename\":\"com_sobipro\"}','{\"include_entries\":\"1\",\"max_entries\":\"\",\"max_age\":\"\",\"entries_order\":\"a.ordering\",\"entries_orderdir\":\"DESC\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"weekly\",\"entry_priority\":\"-1\",\"entry_changefreq\":\"weekly\"}','','',0,'0000-00-00 00:00:00',0,0),(10022,0,'Xmap - Mosets Tree Plugin','plugin','com_mtree','xmap',0,0,1,0,'{\"name\":\"Xmap - Mosets Tree Plugin\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Guillermo Vargas\",\"copyright\":\"Copyright (C) 2014, Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"guille@vargas.co.cr\",\"authorUrl\":\"joomla.vargas.co.cr\",\"version\":\"3.0.2\",\"description\":\"XMAP_MTREE_PLUGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"com_mtree\"}','{\"cats_order\":\"cat_name\",\"cats_orderdir\":\"ASC\",\"include_links\":\"1\",\"links_order\":\"ordering\",\"entries_orderdir\":\"ASC\",\"max_links\":\"\",\"max_age\":\"\",\"cat_priority\":\"0.5\",\"cat_changefreq\":\"weekly\",\"link_priority\":\"0.5\",\"link_changefreq\":\"weekly\"}','','',0,'0000-00-00 00:00:00',0,0),(10023,0,'Xmap - Virtuemart Plugin','plugin','com_virtuemart','xmap',0,0,1,0,'{\"name\":\"Xmap - Virtuemart Plugin\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Alledia \\/ Guillermo Vargas\",\"copyright\":\"Copyright (C) 2015 Open Source Training, LLC. All rights reserved. \\/ Forked from XMap - Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"support@alledia.com\",\"authorUrl\":\"http:\\/\\/www.alledia.com\",\"version\":\"3.0.2\",\"description\":\"XMAP_VM_PLUGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"com_virtuemart\"}','{\"include_products\":\"1\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"-1\",\"prod_priority\":\"-1\",\"prod_changefreq\":\"-1\"}','','',0,'0000-00-00 00:00:00',0,0),(10024,0,'Xmap - WebLinks Plugin','plugin','com_weblinks','xmap',0,0,1,0,'{\"name\":\"Xmap - WebLinks Plugin\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Alledia \\/ Guillermo Vargas\",\"copyright\":\"Copyright (C) 2015 Open Source Training, LLC. All rights reserved. \\/ Forked from XMap - Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"support@alledia.com\",\"authorUrl\":\"http:\\/\\/www.alledia.com\",\"version\":\"3.0.2\",\"description\":\"XMAP_WL_PLUGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"com_weblinks\"}','{\"include_links\":\"1\",\"max_links\":\"\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"-1\",\"link_priority\":\"-1\",\"link_changefreq\":\"-1\"}','','',0,'0000-00-00 00:00:00',0,0),(10025,0,'xmap','package','pkg_xmap','',0,1,1,0,'{\"legacy\":false,\"name\":\"Xmap Package\",\"type\":\"package\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"2.0.0\",\"description\":\"The Site Map generator for Joomla!\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10026,0,'TCPDF','library','tcpdf','',0,1,1,0,'{\"legacy\":true,\"name\":\"TCPDF\",\"type\":\"library\",\"creationDate\":\"28 January 2011\",\"author\":\"Nicola Asuni\",\"copyright\":\"http:\\/\\/www.tcpdf.org\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.tcpdf.org\",\"version\":\"2.5.0\",\"description\":\"Class for generating PDF files on-the-fly without requiring external extensions.\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10027,0,'com_rsform','component','com_rsform','',1,1,0,0,'{\"name\":\"com_rsform\",\"type\":\"component\",\"creationDate\":\"February 2015\",\"author\":\"RSJoomla!\",\"copyright\":\"(C) 2007-2015 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.50.14\",\"description\":\"COM_RSFORM_INSTALL_DESC\",\"group\":\"\",\"filename\":\"rsform\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10028,0,'System - RSForm! Pro','plugin','rsform','system',0,0,1,0,'{\"legacy\":true,\"name\":\"System - RSForm! Pro\",\"type\":\"plugin\",\"creationDate\":\"March 2009\",\"author\":\"RSJoomla\",\"copyright\":\"(C) 2007-2010 www.rsjoomla.com\",\"authorEmail\":\"support@rsjoomla.com\",\"authorUrl\":\"www.rsjoomla.com\",\"version\":\"1.3.0\",\"description\":\"Loads RSForm! Pro Forms within any content; Syntax: {rsform 1}; Make sure you publish the RSForm! Pro System Plugin before you use it! Works with at least RSForm! Pro 1.3.0 REV30!\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0),(10031,0,'TinyMCE lingua IT','file','TinyMCE_it-IT','',0,1,0,0,'{\"legacy\":false,\"name\":\"TinyMCE lingua IT\",\"type\":\"file\",\"creationDate\":\"20 giugno 2012\",\"author\":\"Italian translation team : joomla.it\",\"copyright\":\"(C) 2005-2012 Italian Translation Team\",\"authorEmail\":\"info@joomla.it\",\"authorUrl\":\"www.joomla.it\",\"version\":\"3.5.2\",\"description\":\"\\t\\t\\n\\t\\t<h3>Installazione del pacchetto lingua per TinyMCE 3.5.2 per  Joomla 2.5 effettuato correttamente<\\/h3>\\n \\u00a0 \\u00a0 \\u00a0 \\u00a0<div style=\\\"font-weight:normal\\\">\\n \\t\\tNon dimenticare di selezionare la lingua IT nella\\n \\t\\t<a href=\\\"index.php?option=com_plugins&view=plugins&filter_search=TinyMCE\\\"><strong>gestione del plug-in TinyMCE<\\/strong><\\/a><br \\/>\\n<\\/div>\\t\\t\\n\\t\\t\\n\\t\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10033,0,'','','','',0,0,NULL,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10034,0,'','','','',0,0,NULL,0,'','','','',0,'0000-00-00 00:00:00',0,0),(10035,0,'backupdatabase','component','com_backupdatabase','',1,1,0,0,'{\"legacy\":false,\"name\":\"Backup Database\",\"type\":\"component\",\"creationDate\":\"29\\/06\\/2012\",\"author\":\"Iacopo Guarneri\",\"copyright\":\"\",\"authorEmail\":\"iacopo.guarneri@alice.it\",\"authorUrl\":\"http:\\/\\/www.the-html-tool.com\\/\",\"version\":\"1.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10036,0,'isis','template','isis','',1,1,1,0,'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10037,0,'protostar','template','protostar','',0,1,1,0,'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10038,0,'beez3','template','beez3','',0,1,1,0,'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(10039,0,'eXtplorer','component','com_extplorer','',1,1,0,0,'{\"name\":\"eXtplorer\",\"type\":\"component\",\"creationDate\":\"22.01.2015\",\"author\":\"soeren, QuiX Project\",\"copyright\":\"Soeren Eberhardt-Biermann, QuiX Project\",\"authorEmail\":\"info|-at|-extplorer.net\",\"authorUrl\":\"http:\\/\\/extplorer.net\\/\",\"version\":\"2.1.7\",\"description\":\"\\n\\t<div align=\\\"left\\\"><img src=\\\"components\\/com_extplorer\\/images\\/eXtplorer_logo.png\\\" alt=\\\"eXtplorer Logo\\\" \\/><\\/div>\\n\\t<h2>Successfully installed eXtplorer&nbsp;<\\/h2>\\n\\teXtplorer is a powerful File- and FTP\\/WebDAV Manager script. \\n\\t<br\\/>It allows \\n\\t  <ul><li>Browsing Directories & Files,<\\/li>\\n\\t  <li>Editing, Copying, Moving and Deleting files,<\\/li>\\n\\t  <li>Searching, Uploading and Downloading files,<\\/li>\\n\\t  <li>Creating new Files and Directories,<\\/li>\\n\\t  <li>Creating and Extracting Archives with Files and Directories,<\\/li>\\n\\t  <li>Changing file permissions (chmod)<\\/li><\\/ul><br\\/>and much more.<br\\/><br\\/>\\n\\t  <strong>By default restricted to Superadministrators!<\\/strong>\\n\\t\",\"group\":\"\",\"filename\":\"extplorer.j30\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10040,0,'COM_OSMAP','component','com_osmap','',1,1,0,0,'{\"name\":\"COM_OSMAP\",\"type\":\"component\",\"creationDate\":\"May 09 2017\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016 Open Source Training, LLC. All rights reserved. \\/ Forked from XMap - Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"https:\\/\\/www.joomlashack.com\",\"version\":\"4.2.12\",\"description\":\"COM_OSMAP_DESCRIPTION\",\"group\":\"\",\"filename\":\"osmap\"}','{}','{\"author\":\"Joomlashack\"}','',0,'0000-00-00 00:00:00',0,0),(10042,0,'plg_system_ossystem','plugin','ossystem','system',0,1,1,0,'{\"name\":\"plg_system_ossystem\",\"type\":\"plugin\",\"creationDate\":\"January 06 2017\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"http:\\/\\/www.joomlashack.com\",\"version\":\"1.2.6\",\"description\":\"PLG_SYSTEM_OSSYSTEM_DESCRIPTION\",\"group\":\"\",\"filename\":\"ossystem\"}','[]','{\"author\":\"Joomlashack\"}','',0,'0000-00-00 00:00:00',1,0),(10043,0,'XMAP_PLUGIN_K2','plugin','com_k2','xmap',0,0,1,0,'{\"name\":\"XMAP_PLUGIN_K2\",\"type\":\"plugin\",\"creationDate\":\"April 06, 2015\",\"author\":\"Mohammad Hasani Eghtedar\",\"copyright\":\"Copyright (C) Mohammad Hasani Eghtedar\",\"authorEmail\":\"m.h.eghtedar@gmail.com\",\"authorUrl\":\"https:\\/\\/github.com\\/mhehm\\/Xmap\",\"version\":\"3.0.2\",\"description\":\"XMAP_PLUGIN_K2_DESC\",\"group\":\"\",\"filename\":\"com_k2\"}','{\"subcategories\":\"no\",\"showk2items\":\"always\",\"suppressdups\":\"no\",\"priority\":\"0.5\",\"changefreq\":\"weekly\"}','','',0,'0000-00-00 00:00:00',0,0),(10045,0,'rndt','template','rndt','',0,1,1,0,'{\"name\":\"rndt\",\"type\":\"template\",\"creationDate\":\"29\\/03\\/2015\",\"author\":\"Claudio Carrera\",\"copyright\":\"Copyright (C) 2005 - 2015.\",\"authorEmail\":\"info@3rd-graphic.it\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"template per sito rndt\",\"group\":\"\",\"filename\":\"templateDetails\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10046,0,'plg_system_less','plugin','less','system',0,0,1,0,'{\"name\":\"plg_system_less\",\"type\":\"plugin\",\"creationDate\":\"October 2014\",\"author\":\"Andreas Tasch\",\"copyright\":\"(C) 2012-2014 Andreas Tasch\",\"authorEmail\":\"info@attec.at\",\"authorUrl\":\"www.attec.at\",\"version\":\"0.7.5\",\"description\":\"PLG_SYSTEM_LESS_XML_DESC\",\"group\":\"\",\"filename\":\"less\"}','{\"mode\":\"0\",\"sitelessc\":\"lessc-0.3.9\",\"lessfile\":\"less\\/template.less\",\"cssfile\":\"css\\/template.css\",\"adminlessc\":\"lessc-0.3.9\",\"admin_lessfile\":\"less\\/template.less\",\"admin_cssfile\":\"css\\/template.css\",\"less_force\":\"0\",\"less_comments\":\"0\",\"less_compress\":\"0\",\"clientside_enable\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10048,0,'PLG_OSMAP_JOOMLA','plugin','joomla','osmap',0,1,1,0,'{\"name\":\"PLG_OSMAP_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 09 2017\",\"author\":\"Joomlashack\",\"copyright\":\"Copyright (C) 2016 Open Source Training, LLC. All rights reserved. \\/ Forked from XMap - Guillermo Vargas - guille@vargas.co.cr\",\"authorEmail\":\"help@joomlashack.com\",\"authorUrl\":\"https:\\/\\/www.joomlashack.com\",\"version\":\"4.2.12\",\"description\":\"PLG_OSMAP_JOOMLA_PLUGIN_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"expand_categories\":\"1\",\"expand_featured\":\"1\",\"include_archived\":\"2\",\"show_unauth\":\"0\",\"add_pagebreaks\":\"1\",\"max_art\":\"0\",\"max_art_age\":\"0\",\"add_images\":\"0\",\"cat_priority\":\"-1\",\"cat_changefreq\":\"-1\",\"art_priority\":\"-1\",\"art_changefreq\":\"-1\",\"keywords\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(10050,0,'Italian Language Pack','package','pkg_it-IT','',0,1,1,0,'{\"name\":\"Italian Language Pack\",\"type\":\"package\",\"creationDate\":\"23 Maggio 2017\",\"author\":\"Italian translation team : joomla.it\",\"copyright\":\"Copyright (C) 2005 - 2017 joomla.it e Open Source Matters. Tutti i diritti riservati\",\"authorEmail\":\"info@joomla.it\",\"authorUrl\":\"www.joomla.it\",\"version\":\"3.7.2.1\",\"description\":\"Joomla! 3.7 Full Italian (it-IT) Language Package - Version 3.7.2v1\",\"group\":\"\",\"filename\":\"pkg_it-IT\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10051,0,'plg_installer_webinstaller','plugin','webinstaller','installer',0,1,1,0,'{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"28 April 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2013-2017 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.1.1\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webinstaller\"}','{\"tab_position\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10052,0,'rndt','template','rndt - Copia','',0,1,1,0,'{\"name\":\"rndt\",\"type\":\"template\",\"creationDate\":\"29\\/03\\/2015\",\"author\":\"Claudio Carrera\",\"copyright\":\"Copyright (C) 2005 - 2015.\",\"authorEmail\":\"info@3rd-graphic.it\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"template per sito rndt\",\"group\":\"\",\"filename\":\"templateDetails\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10054,10059,'plg_content_jce','plugin','jce','content',0,1,1,0,'{\"name\":\"plg_content_jce\",\"type\":\"plugin\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"http:\\/\\/www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"PLG_CONTENT_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10055,10059,'plg_extension_jce','plugin','jce','extension',0,1,1,0,'{\"name\":\"plg_extension_jce\",\"type\":\"plugin\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"http:\\/\\/www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"PLG_EXTENSION_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10056,10059,'plg_installer_jce','plugin','jce','installer',0,1,1,0,'{\"name\":\"plg_installer_jce\",\"type\":\"plugin\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"http:\\/\\/www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"PLG_INSTALLER_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10057,10059,'plg_quickicon_jce','plugin','jce','quickicon',0,1,1,0,'{\"name\":\"plg_quickicon_jce\",\"type\":\"plugin\",\"creationDate\":\"31-08-2016\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2016 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"www.joomalcontenteditor.net\",\"version\":\"2.6.0-pro-beta3\",\"description\":\"PLG_QUICKICON_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10058,10059,'plg_system_jce','plugin','jce','system',0,1,1,0,'{\"name\":\"plg_system_jce\",\"type\":\"plugin\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"Copyright (C) 2006 - 2017 Ryan Demmer. All rights reserved\",\"authorEmail\":\"info@joomlacontenteditor.net\",\"authorUrl\":\"http:\\/\\/www.joomlacontenteditor.net\",\"version\":\"2.6.16\",\"description\":\"PLG_SYSTEM_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10059,0,'PKG_JCE','package','pkg_jce','',0,1,1,0,'{\"name\":\"PKG_JCE\",\"type\":\"package\",\"creationDate\":\"27-06-2017\",\"author\":\"Ryan Demmer\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"2.6.16\",\"description\":\"PKG_JCE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pkg_jce\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10061,0,'Home','module','mod_home','',0,1,0,0,'{\"name\":\"Home\",\"type\":\"module\",\"creationDate\":\"Sconosciuto\",\"author\":\"Sconosciuto\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\",\"filename\":\"mod_home\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10063,0,'com_shconfig','component','com_shconfig','',1,1,0,0,'{\"name\":\"com_shconfig\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"COM_SHCONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10064,0,'Shmanic Platform Library','library','lib_shmanic','',0,1,1,0,'{\"name\":\"Shmanic Platform Library\",\"type\":\"library\",\"creationDate\":\"September 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"LIB_SHMANIC_PLATFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"lib_shmanic\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10065,0,'plg_system_shplatform','plugin','shplatform','system',0,1,1,0,'{\"name\":\"plg_system_shplatform\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_SYSTEM_SHPLATFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"shplatform\"}','{\"log_group\":\"shlog\"}','','',0,'0000-00-00 00:00:00',0,0),(10066,0,'pkg_shplatform','package','pkg_shplatform','',0,1,1,0,'{\"name\":\"pkg_shplatform\",\"type\":\"package\",\"creationDate\":\"Sconosciuto\",\"author\":\"Shaun Maunder\",\"copyright\":\"\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PKG_SHPLATFORM_DESCRIPTION\",\"group\":\"\",\"filename\":\"pkg_shplatform\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10067,0,'com_shldap','component','com_shldap','',1,1,0,0,'{\"name\":\"com_shldap\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"COM_SHLDAP_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10068,0,'cli_shmanic_ldap','file','cli_shmanic_ldap','',0,1,0,0,'{\"name\":\"cli_shmanic_ldap\",\"type\":\"file\",\"creationDate\":\"May 2013\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"CLI_SHMANIC_LDAP_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10069,0,'plg_authentication_shadapter','plugin','shadapter','authentication',0,1,1,0,'{\"name\":\"plg_authentication_shadapter\",\"type\":\"plugin\",\"creationDate\":\"June 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_AUTHENTICATION_SHADAPTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"shadapter\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10070,0,'plg_shlog_ldap','plugin','ldap','shlog',0,1,1,0,'{\"name\":\"plg_shlog_ldap\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_SHLOG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"enable_error\":\"0\",\"error_to_screen\":\"0\",\"log_name_error\":\"ldap.error.php\",\"enable_info\":\"0\",\"log_name_info\":\"ldap.info.php\",\"enable_debug\":\"0\",\"log_name_debug\":\"ldap.debug.php\",\"file_format\":\"{DATETIME}\\\\t{ID}\\\\t{MESSAGE}\"}','','',0,'0000-00-00 00:00:00',0,0),(10071,0,'plg_shlog_sso','plugin','sso','shlog',0,0,1,0,'{\"name\":\"plg_shlog_sso\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_SHLOG_SSO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sso\"}','{\"enable_error\":\"1\",\"error_to_screen\":\"0\",\"log_name_error\":\"sso.error.php\",\"enable_info\":\"0\",\"log_name_info\":\"sso.info.php\",\"enable_debug\":\"0\",\"log_name_debug\":\"sso.debug.php\",\"file_format\":\"{DATETIME}\\\\t{ID}\\\\t{MESSAGE}\"}','','',0,'0000-00-00 00:00:00',0,0),(10072,0,'pkg_ldap_sso_core','package','pkg_ldap_sso_core','',0,1,1,0,'{\"name\":\"pkg_ldap_sso_core\",\"type\":\"package\",\"creationDate\":\"Sconosciuto\",\"author\":\"Shaun Maunder\",\"copyright\":\"\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PKG_LDAP_SSO_CORE_DESCRIPTION\",\"group\":\"\",\"filename\":\"pkg_ldap_sso_core\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10073,0,'plg_ldap_creation','plugin','creation','ldap',0,1,1,0,'{\"name\":\"plg_ldap_creation\",\"type\":\"plugin\",\"creationDate\":\"September 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_CREATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"creation\"}','{\"template_name\":\"\",\"template_base\":\"\",\"onfail_delete\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10074,0,'plg_ldap_deletion','plugin','deletion','ldap',0,0,1,0,'{\"name\":\"plg_ldap_deletion\",\"type\":\"plugin\",\"creationDate\":\"September 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_DELETION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"deletion\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10075,0,'plg_ldap_injection','plugin','injection','ldap',0,0,1,0,'{\"name\":\"plg_ldap_injection\",\"type\":\"plugin\",\"creationDate\":\"April 2013\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_INJECTION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"injection\"}','{\"use_ldap_password\":\"0\",\"ldap_password_layout_edit\":\"1\",\"ldap_password_forms\":\"com_users.profile\",\"use_ldap_domain\":\"0\",\"ldap_domain_forms\":\"com_users.login\"}','','',0,'0000-00-00 00:00:00',0,0),(10076,0,'plg_ldap_mapping','plugin','mapping','ldap',0,1,1,0,'{\"name\":\"plg_ldap_mapping\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_MAPPING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mapping\"}','{\"onlogin\":\"1\",\"abort_login\":\"1\",\"sync_groups\":\"0\",\"addition\":\"1\",\"removal\":\"2\",\"unmanaged\":\"\",\"public_id\":\"2\",\"list\":\"\",\"dn_validate\":\"1\",\"lookup_type\":\"0\",\"memberof_attribute\":\"memberOf\",\"member_attribute\":\"member\",\"member_dn\":\"dn\",\"recursion\":\"0\",\"dn_attribute\":\"distinguishedName\",\"recursion_depth\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10077,0,'plg_ldap_password','plugin','password','ldap',0,1,1,0,'{\"name\":\"plg_ldap_password\",\"type\":\"plugin\",\"creationDate\":\"April 2013\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_PASSWORD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"password\"}','{\"authenticate\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10078,0,'plg_ldap_profile','plugin','profile','ldap',0,1,1,0,'{\"name\":\"plg_ldap_profile\",\"type\":\"plugin\",\"creationDate\":\"September 2011\",\"author\":\"Shaun Maunder\",\"copyright\":\"Copyright (C) 2013 Shaun Maunder. All rights reserved.\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PLG_LDAP_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"onlogin\":\"1\",\"abort_login\":\"1\",\"allow_ldap_save\":\"1\",\"sync_name\":\"2\",\"sync_email\":\"2\",\"use_profile\":\"0\",\"use_domain\":\"0\",\"profile_name\":\"\",\"profile_base\":\"\",\"permitted_forms\":\"com_users.profile; com_users.registration; com_users.user; com_admin.profile\"}','','',0,'0000-00-00 00:00:00',0,0),(10079,0,'pkg_ldap_plugins','package','pkg_ldap_plugins','',0,1,1,0,'{\"name\":\"pkg_ldap_plugins\",\"type\":\"package\",\"creationDate\":\"Sconosciuto\",\"author\":\"Shaun Maunder\",\"copyright\":\"\",\"authorEmail\":\"shaun@shmanic.com\",\"authorUrl\":\"www.shmanic.com\",\"version\":\"2.0.3.1\",\"description\":\"PKG_LDAP_PLUGINS_DESCRIPTION\",\"group\":\"\",\"filename\":\"pkg_ldap_plugins\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10081,0,'Alledia Framework (Don\'t uninstall this if you\'re using an Alledia/Joomlashack extension)','library','allediaframework','',0,1,1,0,'{\"name\":\"Alledia Framework (Don\'t uninstall this if you\'re using an Alledia\\/Joomlashack extension)\",\"type\":\"library\",\"creationDate\":\"May 17 2017\",\"author\":\"Alledia\",\"copyright\":\"Copyright (C) 2016 Open Source Training, LLC. All rights reserved.\",\"authorEmail\":\"support@alledia.com\",\"authorUrl\":\"https:\\/\\/www.alledia.com\",\"version\":\"1.5.10\",\"description\":\"Shared library for Alledia extensions\",\"group\":\"\",\"filename\":\"allediaframework\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `l1pym_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_fields`
--

DROP TABLE IF EXISTS `l1pym_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_fields`
--

LOCK TABLES `l1pym_fields` WRITE;
/*!40000 ALTER TABLE `l1pym_fields` DISABLE KEYS */;
INSERT INTO `l1pym_fields` VALUES (1,264,'com_content.article',0,'Guida Popup (IT)','guida-popup-it','Guida Popup (IT)','','editor','','',0,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"2\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','it-IT','2017-05-19 16:18:06',50,'2017-06-09 11:04:55',50,1),(2,265,'com_content.article',0,'Link footer (IT)','link-footer-it','Link footer (IT)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"Informazioni sul sito\",\"value\":\"informazioni\"},\"options1\":{\"name\":\"Responsabile pubblicazione\",\"value\":\"responsabile-procedimento-pubblicazione\"},\"options2\":{\"name\":\"Privacy\",\"value\":\"privacy\"},\"options3\":{\"name\":\"Note legali\",\"value\":\"note-legali\"},\"options4\":{\"name\":\"Crediti\",\"value\":\"credits\"}}}','it-IT','2017-05-22 17:06:25',50,'2017-07-13 08:27:00',50,1),(5,268,'com_content.article',0,'Informazioni footer (IT)','informazioni-footer-it','Informazioni footer (IT)','','editor','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','it-IT','2017-05-22 17:10:12',50,'2017-06-07 10:44:33',50,1),(6,269,'com_content.article',0,'Contatti footer (IT)','contatti-footer-it','Contatti footer (IT)','','editor','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','it-IT','2017-05-22 17:10:35',50,'2017-06-07 10:46:40',50,1),(7,270,'com_content.article',0,'Link social (IT)','link-social-it','Link social (IT)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"Facebook\",\"value\":\"https:\\/\\/www.facebook.com\\/groups\\/rndt.gov\"},\"options1\":{\"name\":\"Twitter\",\"value\":\"https:\\/\\/twitter.com\\/rndt_it\"},\"options2\":{\"name\":\"Feed RSS\",\"value\":\"index.php?option=com_content&view=category&layout=blog&id=7&Itemid=225&format=feed&type=rss\"}}}','it-IT','2017-05-23 12:28:18',50,'2017-07-13 08:27:45',50,1),(8,271,'com_content.article',0,'News','news','News','','list','','Inserire come valori gli Alias delle news',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"News 1\",\"value\":\"webinar-sul-sistema-di-registri-inspire-italia\"},\"options1\":{\"name\":\"News 2\",\"value\":\"profili-professionali-dell-informazione-geografica-al-via-l-inchiesta-pubblica-finale\"},\"options2\":{\"name\":\"News 3\",\"value\":\"cartografia-catastale-disponibile-il-servizio-di-consultazione\"}}}','*','2017-05-23 13:37:49',50,'2018-03-19 13:07:19',50,1),(9,272,'com_content.article',0,'Feed (IT)','feed-it','Feed (IT)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"AgID\",\"value\":\"https:\\/\\/www.agid.gov.it\\/novita_feed.xml\"},\"options1\":{\"name\":\"INSPIRE\",\"value\":\"http:\\/\\/inspire.ec.europa.eu\\/news_rss\"},\"options2\":{\"name\":\"dati.gov.it\",\"value\":\"https:\\/\\/www.dati.gov.it\\/notizie.xml\"}}}','it-IT','2017-05-23 13:39:53',50,'2018-07-16 07:24:51',50,1),(10,273,'com_content.article',0,'Notizie','notizie','Notizie','','list','','Inserire come valori gli Alias delle notizie',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"Notizia 1\",\"value\":\"webinar-sul-sistema-di-registri-inspire-italia\"},\"options1\":{\"name\":\"Notizia 2\",\"value\":\"profili-professionali-dell-informazione-geografica-al-via-l-inchiesta-pubblica-finale\"},\"options2\":{\"name\":\"Notizia 3\",\"value\":\"cartografia-catastale-disponibile-il-servizio-di-consultazione\"}}}','*','2017-05-23 13:49:48',50,'2017-12-07 17:43:54',50,1),(11,274,'com_content.article',0,'Pagina guida pubblica','pagina-guida-public','Pagina guida pubblica','0','integer','','Inserisci il numero della pagina del manuale',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"0\"}','{\"multiple\":\"0\",\"first\":\"0\",\"last\":\"\",\"step\":\"1\"}','*','2017-05-30 10:13:47',50,'2017-06-27 15:26:20',50,1),(13,276,'com_content.article',0,'Link footer (EN)','link-footer-en','Link footer (EN)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"About the site\",\"value\":\"eng\\/about-site\"},\"options1\":{\"name\":\"Responsible for publication\",\"value\":\"eng\\/responsible-publication\"},\"options2\":{\"name\":\"Privacy\",\"value\":\"eng\\/privacy-eng\"},\"options3\":{\"name\":\"Legal notices\",\"value\":\"eng\\/legal-notes\"},\"options4\":{\"name\":\"Credits\",\"value\":\"eng\\/credits-eng\"}}}','en-GB','2017-06-07 10:39:41',50,'2017-10-26 16:10:56',50,1),(14,277,'com_content.article',0,'Informazioni footer (EN)','informazioni-footer-en','Informazioni footer (EN)','','editor','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','en-GB','2017-06-07 10:45:04',50,'2017-06-07 10:45:09',50,1),(15,278,'com_content.article',0,'Contatti footer (EN)','contatti-footer-en','Contatti footer (EN)','','editor','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"2\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','en-GB','2017-06-07 10:47:02',50,'2017-06-07 10:47:06',50,1),(16,279,'com_content.article',0,'Feed (EN)','feed-en','Feed (EN)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"AgID\",\"value\":\"http:\\/\\/www.agid.gov.it\\/novita_feed.xml\"},\"options1\":{\"name\":\"INSPIRE\",\"value\":\"http:\\/\\/inspire.ec.europa.eu\\/news_rss\"},\"options2\":{\"name\":\"dati.gov.it\",\"value\":\"http:\\/\\/www.dati.gov.it\\/notizie.xml\"}}}','en-GB','2017-06-07 12:10:29',50,'2018-03-19 12:12:16',50,1),(17,280,'com_content.article',0,'Link social (EN)','link-social-en','Link social (EN)','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"Facebook\",\"value\":\"https:\\/\\/www.facebook.com\\/groups\\/rndt.gov\"},\"options1\":{\"name\":\"Twitter\",\"value\":\"https:\\/\\/twitter.com\\/rndt_it\"},\"options2\":{\"name\":\"RSS Feeds\",\"value\":\"index.php?option=com_content&view=category&layout=blog&id=7&Itemid=225&format=feed&type=rss\"}}}','en-GB','2017-06-07 12:36:40',50,'2017-07-13 08:27:34',50,1),(18,281,'com_content.article',0,'Guida','link-guida','Guida','','list','','',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"0\"}','{\"multiple\":\"\",\"options\":{\"options0\":{\"name\":\"Pubblica\",\"value\":\"images\\/guida\\/guida.html#pf\"},\"options1\":{\"name\":\"Amministratore\",\"value\":\"images\\/guida\\/guida_adm.html#pf\"},\"options2\":{\"name\":\"PA\",\"value\":\"images\\/guida\\/guida_pa.html#pf\"}}}','*','2017-06-08 08:12:05',50,'2017-06-27 15:10:37',50,1),(19,282,'com_content.article',0,'Guida Popup (EN)','guida-popup-en','Guida Popup (EN)','','editor','','',0,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"0\"}','{\"buttons\":\"\",\"width\":\"\",\"height\":\"\",\"filter\":\"safehtml\"}','en-GB','2017-06-08 08:23:35',50,'2017-06-09 12:53:32',50,1),(20,283,'com_content.article',0,'Pagina guida Amministratore','pagina-guida-adm','Pagina guida Amministratore','0','integer','','Inserisci il numero della pagina del manuale',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"0\"}','{\"multiple\":\"0\",\"first\":\"0\",\"last\":\"\",\"step\":\"1\"}','*','2017-06-27 15:11:21',50,'2017-06-27 15:26:54',50,1),(21,284,'com_content.article',0,'Pagina guida PA','pagina-guida-pa','Pagina guida PA','0','integer','','Inserisci il numero della pagina del manuale',1,0,0,'0000-00-00 00:00:00',0,'{\"hint\":\"\",\"render_class\":\"\",\"class\":\"\",\"showlabel\":\"1\",\"show_on\":\"2\",\"display\":\"0\"}','{\"multiple\":\"0\",\"first\":\"0\",\"last\":\"\",\"step\":\"1\"}','*','2017-06-27 15:12:18',50,'2017-06-27 15:26:38',50,1);
/*!40000 ALTER TABLE `l1pym_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_fields_categories`
--

DROP TABLE IF EXISTS `l1pym_fields_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_fields_categories`
--

LOCK TABLES `l1pym_fields_categories` WRITE;
/*!40000 ALTER TABLE `l1pym_fields_categories` DISABLE KEYS */;
INSERT INTO `l1pym_fields_categories` VALUES (2,15),(5,11),(6,11),(7,15),(8,15),(9,15),(10,15),(13,15),(14,11),(15,11),(16,15),(17,15),(18,15);
/*!40000 ALTER TABLE `l1pym_fields_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_fields_groups`
--

DROP TABLE IF EXISTS `l1pym_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_fields_groups`
--

LOCK TABLES `l1pym_fields_groups` WRITE;
/*!40000 ALTER TABLE `l1pym_fields_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_fields_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_fields_values`
--

DROP TABLE IF EXISTS `l1pym_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_fields_values`
--

LOCK TABLES `l1pym_fields_values` WRITE;
/*!40000 ALTER TABLE `l1pym_fields_values` DISABLE KEYS */;
INSERT INTO `l1pym_fields_values` VALUES (5,'136','<p>Il sito del Repertorio Nazionale dei Dati Territoriali è stato realizzato per agevolare la pubblicità dei dati territoriali disponibili presso le pubbliche amministrazioni a livello nazionale, regionale e locale. Tale è, infatti, lo scopo del RNDT sancito dall\'art. 59 del Codice dell\'Amministrazione Digitale (d. lgs. 82/2005 e s.m.i.).</p>'),(6,'136','<p>AgID - Agenzia per l\'Italia Digitale<br />Via Liszt 21 - 00144 Roma<br />Chat Skype: <a href=\"skype:rndt.help?chat\">rndt.help</a><br />email: <a href=\"mailto:info@rndt.gov.it\">info@rndt.gov.it</a></p>'),(11,'136','6'),(14,'136','<p>The website of Repertorio Nazionale dei Dati Territoriali was developed to foster the use of territorial data available in Public Administrations at national, regional or local level. This is what the law named \"art. 59 del Codice dell\'Amministrazione Digitale (d. lgs. 82/2005 e s.m.i.)\" says, thus is the scope of RNDT.</p>'),(15,'136','<p>AgID - Agenzia per l\'Italia Digitale<br />Via Liszt 21 - 00144 Roma<br />Chat Skype: <a href=\"skype:rndt.help?chat\">rndt.help</a><br />email: <a href=\"mailto:info@rndt.gov.it\">info@rndt.gov.it</a></p>'),(1,'136','<p>Guida Home</p>'),(19,'136','<p>Home guide</p>'),(18,'136','images/guida/guida.html#pf'),(18,'137','images/guida/guida.html#pf'),(18,'146','images/guida/guida_adm.html#pf'),(18,'145','images/guida/guida_adm.html#pf'),(11,'147','4'),(20,'147','2'),(21,'147','2'),(11,'154','11'),(11,'139','16'),(20,'143','20'),(20,'142','19'),(20,'141','9'),(20,'140','5'),(20,'138','24'),(21,'143','14'),(21,'142','13'),(21,'141','9'),(21,'140','5'),(21,'138','18'),(20,'146','15'),(20,'145','16'),(20,'144','23'),(21,'144','17'),(11,'148','12'),(16,'35','http://www.agid.gov.it/novita_feed.xml'),(17,'35','https://www.facebook.com/groups/rndt.gov'),(2,'35','informazioni'),(7,'35','https://www.facebook.com/groups/rndt.gov'),(18,'35','images/guida/guida.html#pf'),(11,'137','8'),(20,'156','16'),(20,'157','9'),(21,'157','9'),(20,'158','20'),(21,'158','14'),(20,'159','5'),(21,'159','5'),(20,'160','15'),(20,'162','19'),(21,'162','13'),(20,'164','23'),(21,'164','17'),(20,'165','23'),(21,'165','18'),(11,'166','12'),(11,'167','11'),(11,'168','16'),(11,'169','8'),(2,'31','informazioni'),(7,'31','https://www.facebook.com/groups/rndt.gov'),(18,'31','images/guida/guida.html#pf'),(2,'170','informazioni'),(7,'170','https://www.facebook.com/groups/rndt.gov'),(18,'170','images/guida/guida.html#pf'),(16,'170','http://www.agid.gov.it/novita_feed.xml'),(17,'170','https://www.facebook.com/groups/rndt.gov'),(2,'34','informazioni'),(7,'34','https://www.facebook.com/groups/rndt.gov'),(18,'34','images/guida/guida.html#pf'),(2,'171','informazioni'),(7,'171','https://www.facebook.com/groups/rndt.gov'),(18,'171','images/guida/guida.html#pf'),(2,'33','informazioni'),(7,'33','https://www.facebook.com/groups/rndt.gov'),(18,'33','images/guida/guida.html#pf'),(2,'172','informazioni'),(7,'172','https://www.facebook.com/groups/rndt.gov'),(18,'172','images/guida/guida.html#pf'),(13,'171','eng/about-site'),(16,'171','http://www.agid.gov.it/novita_feed.xml'),(17,'171','https://www.facebook.com/groups/rndt.gov'),(2,'32','informazioni'),(7,'32','https://www.facebook.com/groups/rndt.gov'),(18,'32','images/guida/guida.html#pf'),(2,'173','informazioni'),(7,'173','https://www.facebook.com/groups/rndt.gov'),(18,'173','images/guida/guida.html#pf'),(2,'174','informazioni'),(7,'174','https://www.facebook.com/groups/rndt.gov'),(18,'174','images/guida/guida.html#pf'),(8,'35','webinar-sul-sistema-di-registri-inspire-italia'),(10,'35','webinar-sul-sistema-di-registri-inspire-italia'),(13,'174','eng/about-site'),(16,'174','http://www.agid.gov.it/novita_feed.xml'),(17,'174','https://www.facebook.com/groups/rndt.gov'),(8,'174','webinar-sul-sistema-di-registri-inspire-italia'),(10,'174','webinar-sul-sistema-di-registri-inspire-italia'),(8,'32','webinar-sul-sistema-di-registri-inspire-italia'),(10,'32','webinar-sul-sistema-di-registri-inspire-italia'),(13,'173','eng/about-site'),(16,'173','http://www.agid.gov.it/novita_feed.xml'),(17,'173','https://www.facebook.com/groups/rndt.gov'),(8,'173','webinar-sul-sistema-di-registri-inspire-italia'),(10,'173','webinar-sul-sistema-di-registri-inspire-italia');
/*!40000 ALTER TABLE `l1pym_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_filters`
--

DROP TABLE IF EXISTS `l1pym_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `params` longtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_filters`
--

LOCK TABLES `l1pym_finder_filters` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links`
--

DROP TABLE IF EXISTS `l1pym_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`),
  KEY `idx_title` (`title`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links`
--

LOCK TABLES `l1pym_finder_links` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms0`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms0`
--

LOCK TABLES `l1pym_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms1`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms1`
--

LOCK TABLES `l1pym_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms2`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms2`
--

LOCK TABLES `l1pym_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms3`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms3`
--

LOCK TABLES `l1pym_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms4`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms4`
--

LOCK TABLES `l1pym_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms5`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms5`
--

LOCK TABLES `l1pym_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms6`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms6`
--

LOCK TABLES `l1pym_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms7`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms7`
--

LOCK TABLES `l1pym_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms8`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms8`
--

LOCK TABLES `l1pym_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_terms9`
--

DROP TABLE IF EXISTS `l1pym_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_terms9`
--

LOCK TABLES `l1pym_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termsa`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termsa`
--

LOCK TABLES `l1pym_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termsb`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termsb`
--

LOCK TABLES `l1pym_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termsc`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termsc`
--

LOCK TABLES `l1pym_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termsd`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termsd`
--

LOCK TABLES `l1pym_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termse`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termse`
--

LOCK TABLES `l1pym_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_links_termsf`
--

DROP TABLE IF EXISTS `l1pym_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_links_termsf`
--

LOCK TABLES `l1pym_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_taxonomy`
--

DROP TABLE IF EXISTS `l1pym_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_taxonomy`
--

LOCK TABLES `l1pym_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `l1pym_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `l1pym_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `l1pym_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_taxonomy_map`
--

LOCK TABLES `l1pym_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_terms`
--

DROP TABLE IF EXISTS `l1pym_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_terms`
--

LOCK TABLES `l1pym_finder_terms` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_terms_common`
--

DROP TABLE IF EXISTS `l1pym_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_terms_common`
--

LOCK TABLES `l1pym_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_terms_common` DISABLE KEYS */;
INSERT INTO `l1pym_finder_terms_common` VALUES ('a','en'),('about','en'),('after','en'),('ago','en'),('all','en'),('am','en'),('an','en'),('and','en'),('ani','en'),('any','en'),('are','en'),('aren\'t','en'),('as','en'),('at','en'),('be','en'),('but','en'),('by','en'),('for','en'),('from','en'),('get','en'),('go','en'),('how','en'),('if','en'),('in','en'),('into','en'),('is','en'),('isn\'t','en'),('it','en'),('its','en'),('me','en'),('more','en'),('most','en'),('must','en'),('my','en'),('new','en'),('no','en'),('none','en'),('not','en'),('noth','en'),('nothing','en'),('of','en'),('off','en'),('often','en'),('old','en'),('on','en'),('onc','en'),('once','en'),('onli','en'),('only','en'),('or','en'),('other','en'),('our','en'),('ours','en'),('out','en'),('over','en'),('page','en'),('she','en'),('should','en'),('small','en'),('so','en'),('some','en'),('than','en'),('thank','en'),('that','en'),('the','en'),('their','en'),('theirs','en'),('them','en'),('then','en'),('there','en'),('these','en'),('they','en'),('this','en'),('those','en'),('thus','en'),('time','en'),('times','en'),('to','en'),('too','en'),('true','en'),('under','en'),('until','en'),('up','en'),('upon','en'),('use','en'),('user','en'),('users','en'),('veri','en'),('version','en'),('very','en'),('via','en'),('want','en'),('was','en'),('way','en'),('were','en'),('what','en'),('when','en'),('where','en'),('whi','en'),('which','en'),('who','en'),('whom','en'),('whose','en'),('why','en'),('wide','en'),('will','en'),('with','en'),('within','en'),('without','en'),('would','en'),('yes','en'),('yet','en'),('you','en'),('your','en'),('yours','en');
/*!40000 ALTER TABLE `l1pym_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_tokens`
--

DROP TABLE IF EXISTS `l1pym_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_tokens`
--

LOCK TABLES `l1pym_finder_tokens` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `l1pym_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_tokens_aggregate`
--

LOCK TABLES `l1pym_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_finder_types`
--

DROP TABLE IF EXISTS `l1pym_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_finder_types`
--

LOCK TABLES `l1pym_finder_types` WRITE;
/*!40000 ALTER TABLE `l1pym_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_it_attachment`
--

DROP TABLE IF EXISTS `l1pym_it_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the attachment.',
  `issue_id` varchar(10) NOT NULL COMMENT 'Foreign key to associated issue',
  `uid` int(11) DEFAULT NULL COMMENT 'User id of the user attaching the file',
  `title` varchar(255) NOT NULL COMMENT 'Title for attachment',
  `description` mediumtext NOT NULL COMMENT 'Description of the file attachment',
  `filepath` mediumtext NOT NULL COMMENT 'Path to the file in the system',
  `filename` varchar(255) NOT NULL COMMENT 'Original name of the file attachment',
  `hashname` text NOT NULL COMMENT 'Hash of file name and date string',
  `filetype` varchar(255) NOT NULL DEFAULT 'application/octet-stream' COMMENT 'Type of file attachment',
  `size` int(10) NOT NULL COMMENT 'Size of file attachment',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which issues are presented.',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  KEY `l1pym_it_attachment_issue_id_fk` (`issue_id`),
  CONSTRAINT `l1pym_it_attachment_issue_id_fk` FOREIGN KEY (`issue_id`) REFERENCES `l1pym_it_issues` (`alias`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Attachments for raised issues.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_attachment`
--

LOCK TABLES `l1pym_it_attachment` WRITE;
/*!40000 ALTER TABLE `l1pym_it_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_attachment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_attachment_bi` BEFORE INSERT ON `l1pym_it_attachment` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_attachment_bu` BEFORE UPDATE ON `l1pym_it_attachment` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_chistory`
--

DROP TABLE IF EXISTS `l1pym_it_chistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_chistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key of the table.',
  `table_name` varchar(255) NOT NULL COMMENT 'The name of the table for which the change record applies',
  `component` varchar(255) DEFAULT NULL COMMENT 'The component to which the change record applies.',
  `state` tinyint(4) DEFAULT '1' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `row_key` int(11) NOT NULL COMMENT 'The value of the primary key for the record.',
  `row_key_link` text NOT NULL COMMENT 'The value of the alias for the record if it exists, the value of the Primary key otherwise.',
  `column_name` text NOT NULL COMMENT 'The name of the table column being recorded.',
  `column_type` tinytext COMMENT 'The type of column for the record.',
  `action` tinytext NOT NULL COMMENT 'The action of the change record. i.e.INSERT, UPDATE or DELETE.',
  `old_value` mediumtext COMMENT 'For an DELETE or UPDATE action the former field value.',
  `new_value` mediumtext COMMENT 'For an UPDATE or INSERT action the new field value.',
  `change_by` int(11) NOT NULL COMMENT 'The Joomla id of the person who made the change where it can be determined otherwise the super user id.',
  `change_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The date when the change was made.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Change History (audit) record.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_chistory`
--

LOCK TABLES `l1pym_it_chistory` WRITE;
/*!40000 ALTER TABLE `l1pym_it_chistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_chistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_it_custom_field`
--

DROP TABLE IF EXISTS `l1pym_it_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key of the table.',
  `name` varchar(255) NOT NULL COMMENT 'Name for the custom field.',
  `value` text NOT NULL COMMENT 'Default value for the field.',
  `type` varchar(255) NOT NULL COMMENT 'Type of custom field.',
  `tooltip` mediumtext NOT NULL COMMENT 'Text for the tooltip of the field, if any.',
  `validation` mediumtext COMMENT 'Validation rules for the field.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Access rules for the field.',
  `group` int(11) NOT NULL COMMENT 'Name of the group for which this field is part.',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `ordering` int(11) NOT NULL COMMENT 'Ordering of the field.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Custom field definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_custom_field`
--

LOCK TABLES `l1pym_it_custom_field` WRITE;
/*!40000 ALTER TABLE `l1pym_it_custom_field` DISABLE KEYS */;
INSERT INTO `l1pym_it_custom_field` VALUES (1,'Product Details','[{\"name\":null,\"value\":\"Product Details\",\"displayInFrontEnd\":\"1\",\"target\":null,\"alias\":\"\",\"required\":\"1\",\"showNull\":\"0\"}]','header','','',1,1,1,1,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(2,'Joomla Version','[{\"name\":null,\"value\":\"\",\"target\":null,\"alias\":\"\",\"required\":\"1\",\"showNull\":\"0\"}]','textfield','Details of the Joomla Version being used.','',1,1,1,2,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(3,'PHP Version','[{\"name\":null,\"value\":\"\",\"target\":null,\"alias\":\"\",\"required\":\"0\",\"showNull\":\"0\"}]','textfield','Details of the PHP version.','',1,1,1,3,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(4,'Product Version','[{\"name\":null,\"value\":\"\",\"target\":null,\"alias\":\"\",\"required\":\"1\",\"showNull\":\"0\"}]','textfield','Version of the product.','',1,1,1,4,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(5,'Database Type','[{\"name\":\"MySQL\",\"value\":1,\"target\":null,\"alias\":\"\",\"required\":\"0\",\"showNull\":\"0\"},{\"name\":\"MS-SQLSVR\",\"value\":2,\"target\":null,\"alias\":\"\",\"required\":\"0\",\"showNull\":\"0\"}]','radio','Details of the Database upon which Joomla is running.','',1,1,1,5,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(6,'Database Version','[{\"name\":null,\"value\":\"\",\"target\":null,\"alias\":\"\",\"required\":\"0\",\"showNull\":\"0\"}]','textfield','Version number of the database.','',1,1,1,6,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_custom_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_custom_field_bi` BEFORE INSERT ON `l1pym_it_custom_field` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_custom_field_bu` BEFORE UPDATE ON `l1pym_it_custom_field` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_custom_field_group`
--

DROP TABLE IF EXISTS `l1pym_it_custom_field_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_custom_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key of the table.',
  `name` varchar(255) NOT NULL COMMENT 'Name of the custom field group.',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Groups for Custom fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_custom_field_group`
--

LOCK TABLES `l1pym_it_custom_field_group` WRITE;
/*!40000 ALTER TABLE `l1pym_it_custom_field_group` DISABLE KEYS */;
INSERT INTO `l1pym_it_custom_field_group` VALUES (1,'Product Request',1,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_custom_field_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_custom_field_group_bi` BEFORE INSERT ON `l1pym_it_custom_field_group` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_custom_field_group_bu` BEFORE UPDATE ON `l1pym_it_custom_field_group` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_emails`
--

DROP TABLE IF EXISTS `l1pym_it_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL COMMENT 'Short name of the email message type.',
  `description` mediumtext NOT NULL COMMENT 'Description of the email message type',
  `subject` varchar(32) NOT NULL COMMENT 'Email subject title for email message type',
  `body` longtext NOT NULL COMMENT 'Template for the email message itself.',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which issues are presented.',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Email message templates for Issue Tracker notifications.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_emails`
--

LOCK TABLES `l1pym_it_emails` WRITE;
/*!40000 ALTER TABLE `l1pym_it_emails` DISABLE KEYS */;
INSERT INTO `l1pym_it_emails` VALUES (1,'ass_close','Assignee - Issue Closure','Assigned Issue [issue_id] Closed','<p>The following issue that is assigned to you has been closed.</p>\n<p>You can view the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>Priority: [priority]</p>\n<p>Project: [project]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">RESOLUTION</span></p>\n<p>[resolution]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(2,'ass_new','Assignee - New Issue assignment.','Assigned Issue [issue_id] Create','<p>The following issue has been assigned to you.</p>\n<p>You can update the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">&nbsp;</span></p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>Priority: [priority]</p>\n<p>Project: [project]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">USER INFORMATION</span></p>\n<p>Username: [user_name]</p>\n<p>Email: [user_email]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(3,'ass_update','Assignee - Issue Updated','Assigned Issue [issue_id] Update','<p>The following assigned issue has been updated.</p>\n<p>You can view the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>&nbsp; ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">PROGRESS</span></p>\n<p>[progress]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(4,'user_close','User - Issue Closure Message','Issue [issue_id] Closed','<p>Your raised issue has been closed.</p>\n<p>You can view the issue resolution below or at: [url]</p>\n<p><span style=\"text-decoration: underline;\">&nbsp;</span></p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">RESOLUTION</span></p>\n<p>[resolution]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(5,'user_new','User - Issue Creation Message','Issue [issue_id] Created','<p>Thank you for submitting your issue.</p>\n<p>You can view or update [requires login] the issue at: [url]</p>\n<p><span style=\"text-decoration: underline;\">&nbsp;</span></p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(6,'user_update','User - Issue Update Message','Your Issue [issue_id] Updated','<p>Your raised issue has been updated.</p>\n<p>You can view the issue at: [url]</p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">PROGRESS </span></p>\n<p>[progress]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(7,'admin_new','Admin - New Issue Message','Issue [issue_id] Created','<p>The following issue has been created and the assignment may need checking.</p>\n<p>You can update the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS </span></p>\n<p>ID: [issue_id]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>Priority: [priority]</p>\n<p>Project: [project]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">USER INFORMATION </span></p>\n<p>Fullname: [user_fullname]</p>\n<p>Username: [user_name]</p>\n<p>Email: [user_email]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(8,'admin_update','Admin - Issue Updated Message','Issue [issue_id] Updated','<p>The following issue has been updated. You can view the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>Priority: [priority]</p>\n<p>Project: [project]</p>\n<p>Status: [status]</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">USER INFORMATION</span></p>\n<p>Fullname: [user_fullname]</p>\n<p>Username: [user_name]</p>\n<p>Email: [user_email]</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><span style=\"text-decoration: underline;\">DESCRIPTION</span></p>\n<p>[description]</p>',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(9,'admin_close','Admin - Issue closure','Issue [issue_id] closed','<p>The following issue has been closed.</p>\n<p>You can view the issue at [url]</p>\n<p><span style=\"text-decoration: underline;\">&nbsp;</span></p>\n<p><span style=\"text-decoration: underline;\">ISSUE DETAILS</span></p>\n<p>ID: [issue_id]</p>\n<p>User: [user_name]</p>\n<p>Date: [startdate]</p>\n<p>Title: [title]</p>\n<p>Priority: [priority]</p>\n<p>Project: [project]</p>\n<p><span style=\"text-decoration: underline;\">&nbsp;</span></p>\n<p><span style=\"text-decoration: underline;\">RESOLUTION</span></p>\n<p>[resolution]</p>',1,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_emails_bi` BEFORE INSERT ON `l1pym_it_emails` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_emails_bu` BEFORE UPDATE ON `l1pym_it_emails` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_issues`
--

DROP TABLE IF EXISTS `l1pym_it_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the issue.',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ACL permissions field',
  `alias` varchar(10) DEFAULT NULL COMMENT 'Issue Alias.  Used to mask primary key of issue from random selection.',
  `issue_summary` varchar(255) NOT NULL COMMENT 'A brief summary of the issue.',
  `issue_description` varchar(4000) DEFAULT NULL COMMENT 'A full description of the issue.',
  `identified_by_person_id` int(11) NOT NULL COMMENT 'The person who identified the issue.',
  `identified_date` datetime NOT NULL COMMENT 'The date the issue was identified.',
  `related_project_id` int(10) unsigned NOT NULL COMMENT 'The project that the issue is related to.',
  `assigned_to_person_id` int(11) DEFAULT NULL COMMENT 'The person that the issue is assigned to.',
  `issue_type` int(11) NOT NULL DEFAULT '1' COMMENT 'The issue type.  i.e. defect etc.',
  `status` int(11) NOT NULL COMMENT 'The current status of the issue.',
  `public` tinyint(3) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which issues are presented.',
  `priority` int(11) NOT NULL COMMENT 'The priority of the issue. How important it is to get resolved.',
  `target_resolution_date` datetime DEFAULT NULL COMMENT 'The date on which the issue is planned to be resolved.',
  `progress` mediumtext COMMENT 'Any progress notes on the issue resolution.',
  `actual_resolution_date` datetime DEFAULT NULL COMMENT 'The date the issue was actually resolved.',
  `resolution_summary` varchar(4000) DEFAULT NULL COMMENT 'The description of the resolution of the issue.',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `custom_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Custom field.',
  `metadata` text NOT NULL,
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  KEY `l1pym_it_issues_identified_by_fk` (`identified_by_person_id`),
  KEY `l1pym_it_issues_assigned_to_fk` (`assigned_to_person_id`),
  KEY `l1pym_it_issues_project_fk` (`related_project_id`),
  KEY `l1pym_it_issues_status_fk` (`status`),
  KEY `l1pym_it_issues_types_fk` (`issue_type`),
  KEY `l1pym_it_issues_priority_fk` (`priority`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_alias` (`alias`),
  CONSTRAINT `l1pym_it_issues_assigned_to_fk` FOREIGN KEY (`assigned_to_person_id`) REFERENCES `l1pym_it_people` (`user_id`),
  CONSTRAINT `l1pym_it_issues_identified_by_fk` FOREIGN KEY (`identified_by_person_id`) REFERENCES `l1pym_it_people` (`id`),
  CONSTRAINT `l1pym_it_issues_priority_fk` FOREIGN KEY (`priority`) REFERENCES `l1pym_it_priority` (`id`),
  CONSTRAINT `l1pym_it_issues_project_fk` FOREIGN KEY (`related_project_id`) REFERENCES `l1pym_it_projects` (`id`),
  CONSTRAINT `l1pym_it_issues_status_fk` FOREIGN KEY (`status`) REFERENCES `l1pym_it_status` (`id`),
  CONSTRAINT `l1pym_it_issues_type_fk` FOREIGN KEY (`issue_type`) REFERENCES `l1pym_it_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All issues related to the company projects being undertaken.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_issues`
--

LOCK TABLES `l1pym_it_issues` WRITE;
/*!40000 ALTER TABLE `l1pym_it_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_issues` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_issues_bi` BEFORE INSERT ON `l1pym_it_issues` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_issues_bu` BEFORE UPDATE ON `l1pym_it_issues` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_issues_log`
--

DROP TABLE IF EXISTS `l1pym_it_issues_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_issues_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `priority` int(11) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_date_priority` (`category`,`date`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log table for various messages for Issue Tracker.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_issues_log`
--

LOCK TABLES `l1pym_it_issues_log` WRITE;
/*!40000 ALTER TABLE `l1pym_it_issues_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_issues_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_it_meta`
--

DROP TABLE IF EXISTS `l1pym_it_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `version` varchar(100) DEFAULT NULL COMMENT 'Version number of the installed component.',
  `type` varchar(20) DEFAULT NULL COMMENT 'Type of extension.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_meta`
--

LOCK TABLES `l1pym_it_meta` WRITE;
/*!40000 ALTER TABLE `l1pym_it_meta` DISABLE KEYS */;
INSERT INTO `l1pym_it_meta` VALUES (1,'1.6.2','component');
/*!40000 ALTER TABLE `l1pym_it_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_it_people`
--

DROP TABLE IF EXISTS `l1pym_it_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the person.',
  `user_id` int(11) DEFAULT NULL COMMENT 'The user identifier as recorded in the Joomla user table.',
  `person_name` varchar(255) NOT NULL COMMENT 'The unique name of the person.',
  `alias` varchar(10) DEFAULT NULL COMMENT 'Person Alias.  Used to mask primary key of person from random selection.',
  `person_email` varchar(100) NOT NULL COMMENT 'The email address of the person.',
  `person_role` int(11) NOT NULL COMMENT 'The role the person plays within the company.',
  `username` varchar(150) NOT NULL COMMENT 'The username of this person. Used to link login to person details.',
  `assigned_project` int(10) unsigned DEFAULT NULL COMMENT 'The project that the person is currently assigned to.',
  `issues_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates that the person is an Issues administrator.',
  `staff` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates that the person is a member of staff.',
  `email_notifications` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Person has requested email notifications when their raised issues are changed.',
  `registered` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether user is registered.',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether visible in the front end.',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which people are presented.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `l1pym_it_people_name_uk` (`person_name`,`person_email`),
  UNIQUE KEY `l1pym_it_people_username_uk` (`username`),
  UNIQUE KEY `l1pym_it_people_userid_uk` (`user_id`),
  KEY `l1pym_it_people_project_fk` (`assigned_project`),
  KEY `l1pym_it_people_role_fk` (`person_role`),
  CONSTRAINT `l1pym_it_people_project_fk` FOREIGN KEY (`assigned_project`) REFERENCES `l1pym_it_projects` (`id`),
  CONSTRAINT `l1pym_it_people_role_fk` FOREIGN KEY (`person_role`) REFERENCES `l1pym_it_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='All people within the company.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_people`
--

LOCK TABLES `l1pym_it_people` WRITE;
/*!40000 ALTER TABLE `l1pym_it_people` DISABLE KEYS */;
INSERT INTO `l1pym_it_people` VALUES (1,NULL,'Anonymous',NULL,'anonymous@bademail.com',6,'anon',10,0,0,0,0,0,0,0,'0000-00-00 00:00:00','2014-06-27 12:56:07','admin',NULL,NULL),(31,42,'Super User',NULL,'deligia.alessio@gmail.com',6,'alessiodeligia',10,1,1,0,1,0,0,0,'0000-00-00 00:00:00','2012-02-29 09:10:25','antonio.rotundo','2014-06-27 10:56:07','root@localhost'),(32,43,'fontecreativa',NULL,'info@fontecreativa.it',6,'fontecreativa',10,0,0,0,1,0,0,0,'0000-00-00 00:00:00','2012-03-02 15:02:46','antonio.rotundo',NULL,NULL),(33,44,'Antonio',NULL,'antonio.rotundo@agid.gov.it',6,'antonio.rotundo',10,0,0,0,1,0,0,0,'0000-00-00 00:00:00','2012-03-02 15:05:33','antonio.rotundo','2015-02-26 15:15:39','root@localhost'),(34,45,'daniele',NULL,'daniele.DellOsso@agid.gov.it',6,'daniele.dellosso',10,0,0,0,1,0,0,0,'0000-00-00 00:00:00','2012-03-02 15:07:22','antonio.rotundo',NULL,NULL),(35,46,'gabriele',NULL,'ciasullo@agid.gov.it',6,'gabriele.ciasullo',10,0,0,0,1,0,0,0,'0000-00-00 00:00:00','2012-03-02 15:08:27','antonio.rotundo',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_people` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_people_bi` BEFORE INSERT ON `l1pym_it_people` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_people_bu` BEFORE UPDATE ON `l1pym_it_people` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_priority`
--

DROP TABLE IF EXISTS `l1pym_it_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the priority.',
  `priority_name` varchar(60) NOT NULL COMMENT 'The unique name of the priority.',
  `response_time` decimal(11,2) NOT NULL COMMENT 'The target response time expressed in hours.',
  `ranking` int(11) NOT NULL COMMENT 'The ranking of the priority expressed as a value between 0 and 100.  Higher numbers indicate higher priority.',
  `resolution_time` decimal(11,2) NOT NULL COMMENT 'The target resolution time expressed in hours.',
  `description` varchar(1024) DEFAULT NULL COMMENT 'The full text description of the priority.',
  `state` tinyint(4) DEFAULT '1' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `ordering` int(11) NOT NULL COMMENT 'Default ordering column',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Issue priorities within the company.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_priority`
--

LOCK TABLES `l1pym_it_priority` WRITE;
/*!40000 ALTER TABLE `l1pym_it_priority` DISABLE KEYS */;
INSERT INTO `l1pym_it_priority` VALUES (1,'High',0.50,70,4.00,'Office, department, or user has completely lost ability to perform all their functions but does not lend itself to financial liability or loss.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(2,'Low',4.00,10,24.00,'1 or 2 Users have a minor inconvenience with the functionality of a single product.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(3,'Medium',2.00,40,8.00,'Office, department, or user has a marginal loss of functionality but has an alternate method of performing task without financial liability or loss.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(4,'Critical',0.25,90,2.00,'Office, department, or user has completely lost ability to perform all their functions, which in turn may cause financial liability or loss.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_priority` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_priority_bi` BEFORE INSERT ON `l1pym_it_priority` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_priority_bu` BEFORE UPDATE ON `l1pym_it_priority` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_progress`
--

DROP TABLE IF EXISTS `l1pym_it_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the progress table.',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ACL permissions field',
  `issue_id` int(11) NOT NULL COMMENT 'The system generated unique identifier for the specific issue. FK to issue table.',
  `alias` varchar(10) DEFAULT NULL COMMENT 'Issue Alias. Used to mask primary key of issue from random selection.',
  `public` tinyint(3) NOT NULL DEFAULT '1',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which issues are presented.',
  `progress` mediumtext COMMENT 'Any progress notes on the issue resolution.',
  `lineno` int(11) NOT NULL COMMENT 'Value defining the default order of the various progress updates for a specific issue.',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_issueid_lineno` (`issue_id`,`lineno`),
  KEY `idx_progress_issueid_fk` (`issue_id`),
  KEY `idx_progress_checkout` (`checked_out`),
  KEY `idx_progress_state` (`state`),
  KEY `idx_progress_createdby` (`created_by`),
  KEY `idx_progress_alias` (`alias`),
  CONSTRAINT `idx_progress_issue_id_fk` FOREIGN KEY (`issue_id`) REFERENCES `l1pym_it_issues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Issue progress records.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_progress`
--

LOCK TABLES `l1pym_it_progress` WRITE;
/*!40000 ALTER TABLE `l1pym_it_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_progress` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_progress_bi` BEFORE INSERT ON `l1pym_it_progress` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_progress_bu` BEFORE UPDATE ON `l1pym_it_progress` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `l1pym_it_project_view1`
--

DROP TABLE IF EXISTS `l1pym_it_project_view1`;
/*!50001 DROP VIEW IF EXISTS `l1pym_it_project_view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `l1pym_it_project_view1` AS SELECT 
 1 AS `id`,
 1 AS `pid`,
 1 AS `level`,
 1 AS `title`,
 1 AS `access`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `l1pym_it_project_view2`
--

DROP TABLE IF EXISTS `l1pym_it_project_view2`;
/*!50001 DROP VIEW IF EXISTS `l1pym_it_project_view2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `l1pym_it_project_view2` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `access`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `l1pym_it_projects`
--

DROP TABLE IF EXISTS `l1pym_it_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the project.',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Link to parent project id.',
  `title` varchar(255) NOT NULL COMMENT 'The unique name of the project.',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Project Alias.  Used to mask primary key of issue from random selection.',
  `description` varchar(4000) DEFAULT NULL COMMENT 'A full description of the project.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested table left',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested table right',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Nested table level.',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Required for nested table.',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Required for nested table.',
  `state` tinyint(4) DEFAULT '0' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `assignee` int(11) NOT NULL DEFAULT '0' COMMENT 'A specified default assignee for the project.',
  `customfieldsgroup` int(11) NOT NULL COMMENT 'Custom field group associated with this project.',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in which categories are presented.',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `start_date` datetime NOT NULL COMMENT 'The start date of the project.',
  `target_end_date` datetime DEFAULT NULL COMMENT 'The targeted end date of the project.',
  `actual_end_date` datetime DEFAULT NULL COMMENT 'The actual end date of the project.',
  `metadata` text NOT NULL,
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_left_right` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='All projects currently underway.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_projects`
--

LOCK TABLES `l1pym_it_projects` WRITE;
/*!40000 ALTER TABLE `l1pym_it_projects` DISABLE KEYS */;
INSERT INTO `l1pym_it_projects` VALUES (1,0,0,'Root',NULL,'Root',0,7,0,1,'',1,0,0,0,0,'0000-00-00 00:00:00','2014-06-27 12:56:07',NULL,NULL,'','2014-06-27 12:56:07','admin','2014-06-27 11:08:58','root@localhost'),(10,0,1,'Unspecified Project',NULL,'Unspecified Project',1,2,1,1,'',1,0,0,0,0,'0000-00-00 00:00:00','2014-06-27 12:56:07',NULL,NULL,'','2014-06-27 12:56:07','admin','2014-06-27 11:10:49','root@localhost'),(11,153,1,'RNDT','rndt','<p>Applicazione del RNDT</p>',3,6,1,1,'rndt',-2,0,0,1,0,'0000-00-00 00:00:00','2014-06-27 11:08:57','0000-00-00 00:00:00',NULL,'','2014-06-27 11:08:57','antonio.rotundo','2014-06-27 11:08:57','antonio.rotundo'),(12,154,11,'RNDT','rndt','<p>Applicazione del RNDT</p>',4,5,2,1,'rndt/rndt',-2,0,0,2,0,'0000-00-00 00:00:00','2014-06-27 00:00:00','0000-00-00 00:00:00',NULL,'','2014-06-27 11:20:36','antonio.rotundo','2014-06-27 11:20:36','antonio.rotundo');
/*!40000 ALTER TABLE `l1pym_it_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_projects_bi` BEFORE INSERT ON `l1pym_it_projects` FOR EACH ROW BEGIN 
   IF (NEW.ACTUAL_END_DATE = '0000-00-00 00:00:00') THEN
      SET NEW.ACTUAL_END_DATE := NULL;
   END IF;
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_projects_bu` BEFORE UPDATE ON `l1pym_it_projects` FOR EACH ROW BEGIN 
   IF (NEW.ACTUAL_END_DATE = '0000-00-00 00:00:00') THEN
      SET NEW.ACTUAL_END_DATE := NULL;
   END IF;
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_roles`
--

DROP TABLE IF EXISTS `l1pym_it_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the person role.',
  `role_name` varchar(60) NOT NULL COMMENT 'The unique name of the role.',
  `description` varchar(1024) DEFAULT NULL COMMENT 'The full text description of the role.',
  `state` tinyint(4) DEFAULT '1' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `ordering` int(11) NOT NULL COMMENT 'Default ordering column',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='People Roles.  i.e. CEO, Member, Lead, Guest, Customer etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_roles`
--

LOCK TABLES `l1pym_it_roles` WRITE;
/*!40000 ALTER TABLE `l1pym_it_roles` DISABLE KEYS */;
INSERT INTO `l1pym_it_roles` VALUES (1,'CEO','Chief Executive Office.  Senior member of company.  Does not usually have any specific projects assigned.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(2,'Customer','Customer of the product or company.  Usually just reports problems, raises queries etc.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(3,'Lead','This role indicate an individual with direct responsibility for any assigned projects.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(4,'Manager','The person responsible for many projects and usually many staff, each of which is associated with one or more projects.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(5,'Member','A team member working or assigned to one or more projects but without overall responsibility for any one.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(6,'User','A user of the product.  Might be considered a customer but usually no financial transaction has occurred.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_roles_bi` BEFORE INSERT ON `l1pym_it_roles` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_roles_bu` BEFORE UPDATE ON `l1pym_it_roles` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_status`
--

DROP TABLE IF EXISTS `l1pym_it_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the issue status.',
  `status_name` varchar(60) NOT NULL COMMENT 'The unique name of the status.',
  `description` varchar(1024) DEFAULT NULL COMMENT 'The full text description of the status.',
  `state` tinyint(4) DEFAULT '1' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `ordering` int(11) NOT NULL COMMENT 'Default ordering column',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Issue statuses.  i.e. Open, closed, on-hold etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_status`
--

LOCK TABLES `l1pym_it_status` WRITE;
/*!40000 ALTER TABLE `l1pym_it_status` DISABLE KEYS */;
INSERT INTO `l1pym_it_status` VALUES (1,'Closed','Used when an issue is completed and no further change related to the issue is expected.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(2,'In-Progress','The issue is being actively worked by an individual.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(3,'On-Hold','The issue is currently awaiting some unspecified activity and is not currently being worked.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(4,'Open','The issue is open but no work has commenced to resolve it.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(5,'Undefined','The current status of this issue is unknown.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_status_bi` BEFORE INSERT ON `l1pym_it_status` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_status_bu` BEFORE UPDATE ON `l1pym_it_status` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_it_triggers`
--

DROP TABLE IF EXISTS `l1pym_it_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_triggers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key of the table.',
  `table_name` varchar(255) NOT NULL COMMENT 'The name of the table to which the trigger applies.',
  `trigger_schema` varchar(255) NOT NULL COMMENT 'The database schema to which the trigger applies.',
  `trigger_name` varchar(255) NOT NULL COMMENT 'The name of the trigger.',
  `trigger_type` varchar(255) NOT NULL DEFAULT 'AFTER' COMMENT 'The type of trigger. i.e. BEFORE or AFTER.',
  `trigger_event` varchar(255) NOT NULL COMMENT 'The type of trigger. i.e. INSERT, UPDATE or DELETE.',
  `trigger_text` mediumtext NOT NULL COMMENT 'The actual trigger text from specified criteria.',
  `columns` text NOT NULL COMMENT 'The columns to which the trigger applies.',
  `action_orientation` varchar(10) NOT NULL DEFAULT 'ROW' COMMENT 'How the trigger is applied.',
  `applied` tinyint(4) DEFAULT '0' COMMENT 'State of the specific trigger.  i.e.  Active or Inactive.',
  `created_by` int(11) DEFAULT NULL COMMENT 'The Joomla id of the use who created the trigger text.',
  `created_by_alias` varchar(255) DEFAULT NULL COMMENT 'The name of the person who created the trigger text.',
  `created_on` date NOT NULL COMMENT 'Date the trigger text was created',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_Jaudit_trigname` (`trigger_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Trigger text applied to tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_triggers`
--

LOCK TABLES `l1pym_it_triggers` WRITE;
/*!40000 ALTER TABLE `l1pym_it_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_it_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_it_types`
--

DROP TABLE IF EXISTS `l1pym_it_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_it_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The system generated unique identifier for the issue type.',
  `type_name` varchar(60) NOT NULL COMMENT 'The unique name of the type.',
  `description` varchar(1024) DEFAULT NULL COMMENT 'The full text description of the type.',
  `state` tinyint(4) DEFAULT '1' COMMENT 'State of the specific record.  i.e.  Published, archived, trashed etc.',
  `ordering` int(11) NOT NULL COMMENT 'Default ordering column',
  `checked_out` int(11) NOT NULL DEFAULT '0' COMMENT 'Checked out indicator.  User id of user editing the record.',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time and date when the record was checked out.',
  `created_on` datetime NOT NULL COMMENT 'Audit Column: Date the record was created.',
  `created_by` varchar(255) NOT NULL COMMENT 'Audit Column: The user who created the record.',
  `modified_on` datetime DEFAULT NULL COMMENT 'Audit Column: Date the record was last modified.',
  `modified_by` varchar(255) DEFAULT NULL COMMENT 'Audit Column: The user who last modified the record.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Issue types.  i.e. Defect , Enhancement etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_it_types`
--

LOCK TABLES `l1pym_it_types` WRITE;
/*!40000 ALTER TABLE `l1pym_it_types` DISABLE KEYS */;
INSERT INTO `l1pym_it_types` VALUES (1,'Defect','The product has a defect that prevents it working correctly.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(2,'Enhancement','The product could be improved if this enhancement were applied.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(3,'Documentation','The documentation needs correcting.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(4,'Suggestion','The product could be improved if this suggestion were implemented.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL),(5,'Other','The issue is not described by any of the other types.',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',NULL,NULL);
/*!40000 ALTER TABLE `l1pym_it_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_types_bi` BEFORE INSERT ON `l1pym_it_types` FOR EACH ROW BEGIN 
   IF (NEW.ID IS NULL) THEN
      SET NEW.ID := 0;
   END IF;
   IF (NEW.CREATED_ON IS NULL OR NEW.CREATED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.CREATED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.CREATED_BY IS NULL OR NEW.CREATED_BY = '') THEN
      SET NEW.CREATED_BY := USER();
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `l1pym_it_types_bu` BEFORE UPDATE ON `l1pym_it_types` FOR EACH ROW BEGIN 
   IF (NEW.MODIFIED_ON IS NULL OR NEW.MODIFIED_ON = '0000-00-00 00:00:00') THEN
      SET NEW.MODIFIED_ON := UTC_TIMESTAMP();
   END IF; 
   IF (NEW.MODIFIED_BY IS NULL OR NEW.MODIFIED_BY = '') THEN
      SET NEW.MODIFIED_BY := USER();
   END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `l1pym_languages`
--

DROP TABLE IF EXISTS `l1pym_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_ordering` (`ordering`),
  KEY `idx_access` (`access`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_languages`
--

LOCK TABLES `l1pym_languages` WRITE;
/*!40000 ALTER TABLE `l1pym_languages` DISABLE KEYS */;
INSERT INTO `l1pym_languages` VALUES (1,231,'en-GB','English','English','eng','en','','','','',1,1,1),(2,233,'it-IT','Italiano','Italiano','ita','it','','','','',1,1,0);
/*!40000 ALTER TABLE `l1pym_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_menu`
--

DROP TABLE IF EXISTS `l1pym_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100))
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_menu`
--

LOCK TABLES `l1pym_menu` WRITE;
/*!40000 ALTER TABLE `l1pym_menu` DISABLE KEYS */;
INSERT INTO `l1pym_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,369,0,'*',0),(2,'main','com_banners','Banners','','Banners','index.php?option=com_banners','component',1,1,1,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',3,12,0,'*',1),(3,'main','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',4,5,0,'*',1),(4,'main','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',1,2,2,6,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',6,7,0,'*',1),(5,'main','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',8,9,0,'*',1),(6,'main','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',1,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',10,11,0,'*',1),(7,'main','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',1,1,1,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',89,94,0,'*',1),(8,'main','com_contact_contacts','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',1,7,2,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',90,91,0,'*',1),(9,'main','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',1,7,2,6,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',92,93,0,'*',1),(10,'main','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',1,1,1,15,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',97,100,0,'*',1),(11,'main','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',1,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',98,99,0,'*',1),(13,'main','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',1,1,1,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',105,110,0,'*',1),(14,'main','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',1,13,2,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',106,107,0,'*',1),(15,'main','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',1,13,2,6,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',108,109,0,'*',1),(16,'main','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',1,1,1,24,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',113,114,0,'*',1),(17,'main','com_search','Search','','Search','index.php?option=com_search','component',1,1,1,19,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',111,112,0,'*',1),(21,'main','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',1,1,1,27,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',87,88,0,'*',1),(22,'main','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',1,1,1,28,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',95,96,0,'*',1),(101,'mainmenu','Home','home','','home','index.php?option=com_content&view=article&id=136','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"0\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"0\",\"show_print_icon\":\"0\",\"show_email_icon\":\"0\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"home columns-2 columnwidth-200\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',1,2,1,'*',0),(102,'mainmenu','Guida','features','','features','#guida','url',1,1,1,0,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"link_guida\",\"menu-anchor_rel\":\"\",\"menu_image\":\"templates\\/rndt\\/images\\/icons\\/MenuInfo.png\",\"menu_text\":1,\"menu_show\":1}',313,318,0,'it-IT',0),(103,'mainmenu','Module Variations','module-variations','','features/module-variations','index.php?option=com_content&view=article&id=1','component',-2,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',314,315,0,'*',0),(104,'mainmenu','Typography','typography','','features/typography','index.php?option=com_content&view=article&id=4','component',-2,102,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"0\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',316,317,0,'*',0),(108,'topmenu','Informazioni sito','informazioni','','informazioni','index.php?option=com_content&view=article&id=31','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',115,116,0,'it-IT',0),(109,'privacy','Note legali','note-legali','','note-legali','index.php?option=com_content&view=article&id=32','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',83,84,0,'it-IT',0),(110,'privacy','Privacy','privacy','','privacy','index.php?option=com_content&view=article&id=33','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',79,80,0,'it-IT',0),(111,'sidebarmenu','Che cos\'è il RNDT','sample-levels','','sample-levels','index.php?option=com_content&view=article&id=5','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',119,130,0,'*',0),(112,'sidebarmenu','Level 2','level-2','','sample-levels/level-2','index.php?option=com_content&view=article&id=5','component',-2,111,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',120,121,0,'*',0),(113,'sidebarmenu','Level 2','level-21','','sample-levels/level-21','index.php?option=com_content&view=article&id=5','component',-2,111,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',122,127,0,'*',0),(114,'sidebarmenu','Level 3','level-3','','sample-levels/level-21/level-3','index.php?option=com_content&view=article&id=5','component',-2,113,3,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',123,126,0,'*',0),(115,'sidebarmenu','Level 4','level-4','','sample-levels/level-21/level-3/level-4','index.php?option=com_content&view=article&id=5','component',-2,114,4,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',124,125,0,'*',0),(116,'sidebarmenu','Level 2','level-22','','sample-levels/level-22','index.php?option=com_content&view=article&id=5','component',-2,111,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',128,129,0,'*',0),(117,'sidebarmenu','Catalogo','accordion-a','','accordion-a','','separator',-2,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"\",\"menu_text\":1}',131,138,0,'*',0),(118,'sidebarmenu','Level 2','level-2','','accordion-a/level-2','index.php?option=com_content&view=article&id=5','component',-2,117,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',132,133,0,'*',0),(119,'sidebarmenu','Level 2','level-21','','accordion-a/level-21','index.php?option=com_content&view=article&id=5','component',-2,117,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',134,135,0,'*',0),(120,'sidebarmenu','Level 2','level-22','','accordion-a/level-22','index.php?option=com_content&view=article&id=5','component',-2,117,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',136,137,0,'*',0),(121,'sidebarmenu','Servizi PA','accordion-b','','accordion-b','','separator',-2,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"\",\"menu_text\":1}',139,144,0,'*',0),(122,'sidebarmenu','Level 2','level-2','','accordion-b/level-2','index.php?option=com_content&view=article&id=5','component',-2,121,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',140,141,0,'*',0),(123,'sidebarmenu','News - eventi','level-21','','accordion-b/level-21','index.php?option=com_content&view=category&layout=blog&id=7','component',-2,121,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',142,143,0,'*',0),(166,'topmenu','Responsabile pubblicazione ','responsabile-procedimento-pubblicazione','','responsabile-procedimento-pubblicazione','index.php?option=com_content&view=article&id=34','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',145,146,0,'it-IT',0),(167,'mainmenu','Contatti','contatti','','contatti','index.php?option=com_content&view=article&id=30','component',0,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',41,42,0,'*',0),(175,'mainmenu','Catalogo','catalogo','','portale/catalogo','index.php?option=com_content&view=article&id=25','component',-2,216,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',230,231,0,'*',0),(176,'mainmenu','Cos\'è','che-cos-e-il-rndt','','che-cos-e-il-rndt','index.php?option=com_content&view=article&id=24','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',13,30,0,'it-IT',0),(177,'mainmenu','Servizi PA','servizi-pa','','portale/servizi-pa','index.php?option=com_content&view=article&id=26','component',-2,216,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',232,233,0,'*',0),(180,'mainmenu','News - Eventi','news-eventi','','format/news-eventi','index.php?option=com_content&view=category&layout=blog&id=7','component',-2,187,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"10\",\"num_columns\":\"1\",\"num_links\":\"10\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"created\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"1\",\"show_modify_date\":\"1\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',72,73,0,'*',0),(181,'mainmenu','Link utili','link-utili','','link-utili','index.php?option=com_weblinks&view=category&id=9','component',-2,1,1,21,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_links\":\"\",\"show_pagination_limit\":\"\",\"show_headings\":\"\",\"show_link_description\":\"\",\"show_link_hits\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_feed_link\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',65,66,0,'*',0),(182,'topmenu','Credits','credits','','credits','index.php?option=com_content&view=article&id=35','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',149,150,0,'it-IT',0),(184,'main','COM_XMAP_TITLE','com-xmap-title','','com-xmap-title','index.php?option=com_xmap','component',1,1,1,10018,0,'0000-00-00 00:00:00',0,1,'components/com_xmap/images/xmap-favicon.png',0,'',153,154,0,'',1),(185,'nascosto','Mappa del sito','mappa-del-sito','','mappa-del-sito','index.php?option=com_xmap&view=html&id=1','component',1,1,1,10018,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',155,156,0,'*',0),(187,'mainmenu','Format','format','','format','index.php?option=com_content&view=article&id=4','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',69,74,0,'*',0),(188,'mainmenu','Posizioni','posizioni','','format/posizioni','index.php?option=com_content&view=article&id=1','component',-2,187,2,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',70,71,0,'*',0),(189,'nascosto','INSPIRE','inspire','','inspire','index.php?option=com_content&view=article&id=27','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',157,158,0,'*',0),(190,'mainmenu','Documenti','documenti','','documenti','index.php?option=com_content&view=article&id=37','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',43,44,0,'it-IT',0),(191,'nascosto','direttiva inspire','direttiva-inspire','','direttiva-inspire','index.php?option=com_content&view=article&id=38','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',159,160,0,'*',0),(192,'nascosto','regolamento metadati','regolamento-metadati','','regolamento-metadati','index.php?option=com_content&view=article&id=39','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',161,162,0,'*',0),(193,'nascosto','Regolamento (CE) servizi di rete','regolamento-ce-servizi-rete','','regolamento-ce-servizi-rete','index.php?option=com_content&view=article&id=40','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',163,164,0,'*',0),(194,'nascosto','Linee guida INSPIRE metadati','linee-guida-inspire-metadati','','linee-guida-inspire-metadati','index.php?option=com_content&view=article&id=70','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',167,168,0,'*',0),(195,'nascosto','Linee guida INSPIRE sui servizi di ricerca','linee-guida-inspire-servizi-ricerca','','linee-guida-inspire-servizi-ricerca','index.php?option=com_content&view=article&id=42','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',169,170,0,'*',0),(196,'nascosto','CAD','cad','','cad','index.php?option=com_content&view=article&id=43','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',173,174,0,'*',0),(197,'nascosto','Decreto recepimento Direttiva INSPIRE','decreto-recepimento-direttiva-inspire','','decreto-recepimento-direttiva-inspire','index.php?option=com_content&view=article&id=44','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',175,176,0,'*',0),(198,'nascosto','Regole tecniche RNDT','regole-tecniche-rndt','','regole-tecniche-rndt','index.php?option=com_content&view=article&id=45','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',177,178,0,'*',0),(199,'nascosto','Regole tecniche SPC','regole-tecniche-spc','','regole-tecniche-spc','index.php?option=com_content&view=article&id=46','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',179,180,0,'*',0),(200,'nascosto','Comitato','comitato','','comitato','index.php?option=com_content&view=article&id=47','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',181,182,0,'*',0),(201,'nascosto','RNDT','rndt','','rndt','index.php?option=com_content&view=article&id=24','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',183,184,0,'*',0),(212,'inspire','Conformità','conformita','','conformita','index.php?option=com_content&view=article&id=49','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',185,186,0,'*',0),(213,'inspire','Metadati per l\'interoperabilità','metadati-per-l-interoperabilita','','metadati-per-l-interoperabilita','index.php?option=com_content&view=article&id=50','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',187,188,0,'*',0),(214,'mainmenu','inspire','inspire-home','','inspire-home','index.php?Itemid=','alias',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"189\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',67,68,0,'*',0),(215,'inspire','Servizi del portale','servizi-del-portale','','servizi-del-portale','index.php?option=com_content&view=article&id=51','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',189,190,0,'*',0),(216,'mainmenu','portale','portale','','portale','index.php?option=com_content&view=article&id=24','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',229,234,0,'*',0),(217,'portale','Catalogo','catalogo','','catalogo','index.php?option=com_content&view=article&id=25','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',51,52,0,'*',0),(218,'portale','Gestione metadati','gestione-metadati','','gestione-metadati','index.php?option=com_content&view=article&id=26','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',53,54,0,'*',0),(219,'nascosto','Accreditamento','accreditamento','','accreditamento','index.php?option=com_content&view=article&id=41','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',191,192,0,'*',0),(220,'nascosto','Modulo accreditamento','modulo-accreditamento','','modulo-accreditamento','index.php?option=com_content&view=article&id=52','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',193,194,0,'*',0),(221,'nascosto','Manuale RNDT','manuale-rndt','','manuale-rndt','index.php?option=com_content&view=article&id=53','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',195,196,0,'*',0),(222,'nascosto','Schemi XSD','schemi-xsd','','schemi-xsd','index.php?option=com_content&view=article&id=54','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',197,198,0,'*',0),(223,'nascosto','RNDT online','rndt-online','','rndt-online','index.php?option=com_content&view=article&id=12','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',199,200,0,'*',0),(224,'portale','Statistiche','statistiche','','statistiche','index.php?option=com_content&view=article&id=62','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',57,58,0,'*',0),(225,'nascosto','Tutte le notizie','tutte-le-notizie','','tutte-le-notizie','index.php?option=com_content&view=category&layout=blog&id=7','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"0\",\"num_columns\":\"\",\"num_links\":\"1000\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',201,202,0,'*',0),(226,'portale','RNDT Alert - Dicono di noi','rndt-alert-dicono-di-noi','','rndt-alert-dicono-di-noi','index.php?option=com_content&view=article&id=69','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',61,62,0,'*',0),(227,'nascosto','Linee guida INSPIRE sui servizi di ricerca (2)','linee-guida-inspire-servizi-ricerca-2','','linee-guida-inspire-servizi-ricerca-2','index.php?option=com_content&view=article&id=42','component',-2,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',171,172,0,'*',0),(228,'nascosto','Regolamento (UE) interoperabilità dati e servizi','regolamento-ue-interoperabilita-dati-servizi','','regolamento-ue-interoperabilita-dati-servizi','index.php?option=com_content&view=article&id=71','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',165,166,0,'*',0),(229,'portale','Servizio di ricerca - CSW','servizio-di-ricerca-csw','','servizio-di-ricerca-csw','index.php?option=com_content&view=article&id=88','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',55,56,0,'*',0),(230,'nascosto','Client CSW - RNDT','client-csw-rndt','','client-csw-rndt','index.php?option=com_content&view=article&id=89','component',0,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',203,204,0,'*',0),(231,'nascosto','Client CSW','client-csw','','client-csw','index.php?option=com_content&view=article&id=89','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',205,206,0,'*',0),(232,'portale','Link utili','links-utili','','links-utili','index.php?option=com_content&view=article&id=91','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',63,64,0,'*',0),(238,'portale','Newsletter','newsletter','','newsletter','index.php?option=com_content&view=article&id=121','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',59,60,0,'*',0),(239,'main','Backup Database','backup-database','','backup-database','index.php?option=com_backupdatabase','component',1,1,1,10035,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',207,208,0,'',1),(240,'main','com_tags','Tags','','Tags','index.php?option=com_tags','component',1,1,1,29,0,'0000-00-00 00:00:00',0,1,'class:tags',0,'',101,102,0,'',1),(241,'main','com_postinstall','Post-installation messages','','Post-installation messages','index.php?option=com_postinstall','component',1,1,1,32,0,'0000-00-00 00:00:00',0,1,'class:postinstall',0,'',103,104,0,'*',1),(248,'main','eXtplorer','extplorer','','extplorer','index.php?option=com_extplorer&tmpl=component','component',1,1,1,10039,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',209,210,0,'',1),(250,'main','COM_WIDGETKIT','com-widgetkit','','com-widgetkit','index.php?option=com_widgetkit','component',1,1,1,10005,0,'0000-00-00 00:00:00',0,1,'components/com_widgetkit/images/widgetkit_16.png',0,'',211,212,0,'',1),(251,'main','RSFormPro','rsformpro','','rsformpro','index.php?option=com_rsform','component',1,1,1,10027,0,'0000-00-00 00:00:00',0,1,'components/com_rsform/assets/images/rsformpro.gif',0,'',213,228,0,'',1),(252,'main','COM_RSFORM_MANAGE_FORMS','com-rsform-manage-forms','','rsformpro/com-rsform-manage-forms','index.php?option=com_rsform&view=forms','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',214,215,0,'',1),(253,'main','COM_RSFORM_MANAGE_SUBMISSIONS','com-rsform-manage-submissions','','rsformpro/com-rsform-manage-submissions','index.php?option=com_rsform&view=submissions','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',216,217,0,'',1),(254,'main','COM_RSFORM_MANAGE_DIRECTORY_SUBMISSIONS','com-rsform-manage-directory-submissions','','rsformpro/com-rsform-manage-directory-submissions','index.php?option=com_rsform&view=directory','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',218,219,0,'',1),(255,'main','COM_RSFORM_CONFIGURATION','com-rsform-configuration','','rsformpro/com-rsform-configuration','index.php?option=com_rsform&view=configuration','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',220,221,0,'',1),(256,'main','COM_RSFORM_BACKUP_RESTORE','com-rsform-backup-restore','','rsformpro/com-rsform-backup-restore','index.php?option=com_rsform&view=backuprestore','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',222,223,0,'',1),(257,'main','COM_RSFORM_UPDATES','com-rsform-updates','','rsformpro/com-rsform-updates','index.php?option=com_rsform&view=updates','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',224,225,0,'',1),(258,'main','COM_RSFORM_PLUGINS','com-rsform-plugins','','rsformpro/com-rsform-plugins','index.php?option=com_rsform&task=goto.plugins','component',1,251,2,10027,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',226,227,0,'',1),(260,'mainmenu','Cos\'è','2015-04-13-13-52-47','','2015-04-13-13-52-47','#','url',-2,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',75,78,0,'*',0),(261,'mainmenu','Che cos\'è il RNDT','2015-04-13-13-53-52','','2015-04-13-13-52-47/2015-04-13-13-53-52','index.php?Itemid=','alias',-2,260,2,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"176\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',76,77,0,'*',0),(262,'mainmenu','Dati territoriali','datiterritoriali','','datiterritoriali','index.php?option=com_content&view=article&id=47','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',33,40,0,'it-IT',0),(264,'mainmenu','Catalogo','catalogo','','che-cos-e-il-rndt/catalogo','index.php?option=com_content&view=article&id=25','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',14,15,0,'it-IT',0),(265,'mainmenu','Gestione Metadati','gestione-metadati','','che-cos-e-il-rndt/gestione-metadati','index.php?option=com_content&view=article&id=26','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',16,17,0,'it-IT',0),(266,'mainmenu','Servizio di ricerca - CSW','2015-04-21-22-41-05','','che-cos-e-il-rndt/2015-04-21-22-41-05','index.php?option=com_content&view=article&id=88','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',18,19,0,'it-IT',0),(267,'mainmenu','Statistiche (OLD)','2015-04-21-22-41-43','','che-cos-e-il-rndt/2015-04-21-22-41-43','index.php?option=com_content&view=article&id=62','component',0,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',20,21,0,'it-IT',0),(268,'mainmenu','Newsletter','2015-04-21-22-44-07','','che-cos-e-il-rndt/2015-04-21-22-44-07','index.php?option=com_content&view=article&id=121','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',22,23,0,'it-IT',0),(269,'mainmenu','RNDT Alert - Dicono di noi','2015-04-21-22-44-56','','che-cos-e-il-rndt/2015-04-21-22-44-56','index.php?option=com_content&view=article&id=69','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',24,25,0,'it-IT',0),(270,'mainmenu','Link utili','2015-04-21-22-45-33','','che-cos-e-il-rndt/2015-04-21-22-45-33','index.php?option=com_content&view=article&id=91','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',26,27,0,'it-IT',0),(271,'portale','Cos\'è','2015-04-21-22-52-43','','2015-04-21-22-52-43','index.php?Itemid=','alias',1,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"aliasoptions\":\"176\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',49,50,0,'*',0),(272,'mainmenu','Attività in corso','attivita-in-corso','','datiterritoriali/attivita-in-corso','index.php?option=com_content&view=article&id=150','component',1,262,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',36,37,0,'it-IT',0),(273,'mainmenu','Documentazione','documentazione','','datiterritoriali/documentazione','index.php?option=com_content&view=article&id=151','component',1,262,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',38,39,0,'it-IT',0),(274,'dati-territoriali','Dati territoriali','dati-territoriali','','dati-territoriali','index.php?option=com_content&view=article&id=47','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,'',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',235,236,0,'*',0),(275,'dati-territoriali','specifiche tecniche','2015-04-23-09-27-50','','2015-04-23-09-27-50','#','url',1,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',237,238,0,'*',0),(276,'dati-territoriali','Attività in corso','2015-04-23-09-28-29','','2015-04-23-09-28-29','#','url',1,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',239,240,0,'*',0),(277,'dati-territoriali','Documentazione','2015-04-23-09-28-54','','2015-04-23-09-28-54','#','url',1,1,1,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1}',241,242,0,'*',0),(279,'main','com_weblinks','com-weblinks','','com-weblinks','index.php?option=com_weblinks','component',1,1,1,21,0,'0000-00-00 00:00:00',0,1,'class:weblinks',0,'{}',243,248,0,'',1),(280,'main','com_weblinks_links','com-weblinks-links','','com-weblinks/com-weblinks-links','index.php?option=com_weblinks','component',1,279,2,21,0,'0000-00-00 00:00:00',0,1,'class:weblinks',0,'{}',244,245,0,'',1),(281,'main','com_weblinks_categories','com-weblinks-categories','','com-weblinks/com-weblinks-categories','index.php?option=com_categories&extension=com_weblinks','component',1,279,2,21,0,'0000-00-00 00:00:00',0,1,'class:weblinks-cat',0,'{}',246,247,0,'',1),(287,'english-en-gb','Home','english','','english','index.php?option=com_content&view=article&id=136','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',249,250,1,'en-GB',0),(288,'italian-it','Home','italiano','','italiano','index.php?option=com_content&view=article&id=136','component',1,1,1,22,50,'2017-03-01 12:28:22',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',251,252,1,'it-IT',0),(289,'mainmenu','Ricerca Dettagliata','ricerca-dettagliata','','ricerca-dettagliata','index.php?option=com_content&view=article&id=148','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',31,32,0,'it-IT',0),(290,'mainmenu','Visualizzatore','visualizzatore','','visualizzatore','geoviewer','url',1,1,1,0,50,'2017-10-18 11:13:20',1,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',47,48,0,'it-IT',0),(298,'mainmenu','Notizie','notizie','','notizie','index.php?option=com_content&view=category&layout=blog&id=7','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',45,46,0,'it-IT',0),(299,'nascosto','Metadati','metadati','','metadati','index.php?option=com_content&view=article&id=137','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',253,254,0,'*',0),(305,'nascosto','Login','login','','login','index.php?option=com_users&view=login','component',1,1,1,25,50,'2017-10-27 11:19:08',0,1,' ',0,'{\"loginredirectchoice\":\"1\",\"login_redirect_url\":\"\",\"login_redirect_menuitem\":\"\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"logoutredirectchoice\":\"1\",\"logout_redirect_url\":\"\",\"logout_redirect_menuitem\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',255,256,0,'*',0),(306,'mainmenu','Gestisci e Pubblica','gestisci-e-pubblica','','gestisci-e-pubblica','index.php?option=com_content&view=article&id=155','component',1,1,1,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"gestisci-e-pubblica\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',339,356,0,'it-IT',0),(307,'mainmenu','Statistiche','visualizzazione-statistiche','','che-cos-e-il-rndt/visualizzazione-statistiche','index.php?option=com_content&view=article&id=139','component',1,176,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',28,29,0,'it-IT',0),(308,'mainmenu','Gestione del catalogo','gestione-del-catalogo','','gestisci-e-pubblica/gestione-del-catalogo','index.php?option=com_content&view=article&id=140','component',1,306,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',340,341,0,'it-IT',0),(309,'mainmenu','Creazione catalogo esterno','gestione-di-un-catalogo-esterno','','gestisci-e-pubblica/gestione-di-un-catalogo-esterno','index.php?option=com_content&view=article&id=141','component',1,306,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',342,343,0,'it-IT',0),(310,'mainmenu','Caricamento di un file di metadati','caricamento-di-un-file-di-metadati','','gestisci-e-pubblica/caricamento-di-un-file-di-metadati','index.php?option=com_content&view=article&id=142','component',1,306,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',344,345,0,'it-IT',0),(311,'mainmenu','Creazione metadato','editing-metadato','','gestisci-e-pubblica/editing-metadato','index.php?option=com_content&view=article&id=143','component',1,306,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',346,347,0,'it-IT',0),(312,'mainmenu','Gestione utente','gestione-utente','','gestisci-e-pubblica/gestione-utente','index.php?option=com_content&view=article&id=145','component',1,306,2,22,0,'0000-00-00 00:00:00',0,4,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',348,349,0,'it-IT',0),(313,'mainmenu','Gestione ente','gestione-ente','','gestisci-e-pubblica/gestione-ente','index.php?option=com_content&view=article&id=146','component',1,306,2,22,0,'0000-00-00 00:00:00',0,4,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',350,351,0,'it-IT',0),(314,'main','COM_SHCONFIG','com-shconfig','','com-shconfig','index.php?option=com_shconfig','component',1,1,1,10063,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',257,258,0,'',1),(315,'main','com_shldap','com-shldap','','com-shldap','index.php?option=com_shldap','component',1,1,1,10067,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',259,260,0,'',1),(316,'mainmenu','Regole tecniche','regole-tecniche','','datiterritoriali/regole-tecniche','index.php?option=com_content&view=article&id=149','component',1,262,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',34,35,0,'it-IT',0),(321,'main','com_associations','multilingual-associations','','multilingual-associations','index.php?option=com_associations','component',1,1,1,34,0,'0000-00-00 00:00:00',0,1,'class:associations',0,'{}',261,262,0,'*',1),(326,'nascosto','Scheda Metadati','scheda-metadati','','visualizzazione-metadati/scheda-metadati','index.php?option=com_content&view=article&id=154','component',1,328,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',266,267,0,'it-IT',0),(327,'nascosto','404','404','','404','index.php?option=com_content&view=article&id=153','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',263,264,0,'*',0),(328,'nascosto','Visualizzazione metadati','visualizzazione-metadati','','visualizzazione-metadati','index.php?option=com_content&view=article&id=137','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',265,268,0,'it-IT',0),(329,'nascosto','Cerca','cerca','','cerca','index.php?option=com_search&view=search','component',1,1,1,19,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"search_phrases\":\"\",\"search_areas\":\"\",\"show_date\":\"\",\"searchphrase\":\"0\",\"ordering\":\"newest\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',273,274,0,'*',0),(330,'main','COM_OSMAP_TITLE','com-osmap-title','','com-osmap-title','index.php?option=com_osmap','component',1,1,1,10040,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',275,276,0,'',1),(339,'nascosto','Report della raccolta','report-della-raccolta','','report-della-raccolta','index.php?option=com_content&view=article&id=138','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',277,278,0,'*',0),(340,'mainmenu','Main topics','main-topics','','main-topics','index.php?option=com_content&view=article&id=24','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',279,296,0,'en-GB',0),(341,'mainmenu','Advanced search','advanced-search','','advanced-search','index.php?option=com_content&view=article&id=166','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',297,298,0,'en-GB',0),(342,'mainmenu','Geodata','geodata','','geodata','index.php?option=com_content&view=article&id=47','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',299,306,0,'en-GB',0),(343,'mainmenu','Documents','documents','','documents','index.php?option=com_content&view=article&id=37','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',307,308,0,'en-GB',0),(344,'mainmenu','Geoviewer','viewer','','viewer','geoviewer','url',1,1,1,0,0,'0000-00-00 00:00:00',1,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1}',311,312,0,'en-GB',0),(345,'mainmenu','News','news','','news','index.php?option=com_content&view=category&layout=blog&id=7','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"layout_type\":\"blog\",\"show_category_heading_title_text\":\"\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_featured\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',309,310,0,'en-GB',0),(346,'mainmenu','Manage and Publish','manage-and-publish','','manage-and-publish','index.php?option=com_content&view=article&id=161','component',1,1,1,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"gestisci-e-pubblica\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',321,338,0,'en-GB',0),(347,'mainmenu','Catalog','catalog','','main-topics/catalog','index.php?option=com_content&view=article&id=25','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',280,281,0,'en-GB',0),(348,'mainmenu','Statistics (OLD)','statistics-old','','main-topics/statistics-old','index.php?option=com_content&view=article&id=62','component',0,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',286,287,0,'en-GB',0),(349,'mainmenu','Statistics','statistics','','main-topics/statistics','index.php?option=com_content&view=article&id=168','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',294,295,0,'en-GB',0),(350,'mainmenu','Useful links','useful-links','','main-topics/useful-links','index.php?option=com_content&view=article&id=91','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',292,293,0,'en-GB',0),(351,'mainmenu','Metadata management','metadata-management','','main-topics/metadata-management','index.php?option=com_content&view=article&id=26','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',282,283,0,'en-GB',0),(352,'mainmenu','Newsletter','newsletter','','main-topics/newsletter','index.php?option=com_content&view=article&id=121','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',288,289,0,'en-GB',0),(353,'mainmenu','Discovery service (CSW)','search-service-csw','','main-topics/search-service-csw','index.php?option=com_content&view=article&id=88','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',284,285,0,'en-GB',0),(354,'mainmenu','RNDT Alert - About us','rndt-alert-about-us','','main-topics/rndt-alert-about-us','index.php?option=com_content&view=article&id=69','component',1,340,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',290,291,0,'en-GB',0),(355,'mainmenu','Technical specifications','technical-specifications','','geodata/technical-specifications','index.php?option=com_content&view=article&id=149','component',1,342,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',300,301,0,'en-GB',0),(356,'mainmenu','Ongoing activities','current-activities','','geodata/current-activities','index.php?option=com_content&view=article&id=150','component',1,342,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',302,303,0,'en-GB',0),(357,'mainmenu','Documentation','documentation','','geodata/documentation','index.php?option=com_content&view=article&id=151','component',1,342,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',304,305,0,'en-GB',0),(358,'nascosto','Modifica profilo','modifica-profilo','','modifica-profilo','index.php?option=com_users&view=profile&layout=edit','component',1,1,1,25,50,'2017-10-27 09:55:45',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',357,358,0,'it-IT',0),(359,'nascosto','Edit profile','edit-profile','','edit-profile','index.php?option=com_users&view=profile&layout=edit','component',1,1,1,25,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',359,360,0,'en-GB',0),(360,'mainmenu','Raccolta','raccolta','','gestisci-e-pubblica/raccolta','index.php?option=com_content&view=article&id=144','component',1,306,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',352,353,0,'it-IT',0),(361,'mainmenu','Harvesting','harvesting','','manage-and-publish/harvesting','index.php?option=com_content&view=article&id=164','component',1,346,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',322,323,0,'en-GB',0),(362,'mainmenu','Harvesting Report','harvesting-report','','manage-and-publish/harvesting-report','index.php?option=com_content&view=article&id=165','component',1,346,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',324,325,0,'en-GB',0),(363,'mainmenu','Report della raccolta','report-della-raccolta','','gestisci-e-pubblica/report-della-raccolta','index.php?option=com_content&view=article&id=138','component',1,306,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',354,355,0,'it-IT',0),(364,'mainmenu','Catalog management','catalog-management','','manage-and-publish/catalog-management','index.php?option=com_content&view=article&id=159','component',1,346,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',326,327,0,'en-GB',0),(365,'mainmenu','External resource mgmt','external-resource-mgmt','','manage-and-publish/external-resource-mgmt','index.php?option=com_content&view=article&id=157','component',1,346,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',328,329,0,'en-GB',0),(366,'mainmenu','Upload metadata file','upload-metadata-file','','manage-and-publish/upload-metadata-file','index.php?option=com_content&view=article&id=162','component',1,346,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',330,331,0,'en-GB',0),(367,'mainmenu','Metadata editor','metadata-editor','','manage-and-publish/metadata-editor','index.php?option=com_content&view=article&id=158','component',1,346,2,22,0,'0000-00-00 00:00:00',0,2,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',332,333,0,'en-GB',0),(368,'mainmenu','User management','user-management','','manage-and-publish/user-management','index.php?option=com_content&view=article&id=156','component',1,346,2,22,0,'0000-00-00 00:00:00',0,4,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',334,335,0,'en-GB',0),(369,'mainmenu','PA management','pa-management','','manage-and-publish/pa-management','index.php?option=com_content&view=article&id=160','component',1,346,2,22,0,'0000-00-00 00:00:00',0,4,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',336,337,0,'en-GB',0),(370,'main','COM_JCE','com-jce','','com-jce','index.php?option=com_jce','component',1,1,1,10015,0,'0000-00-00 00:00:00',0,1,'components/com_jce/media/img/menu/logo.png',0,'{}',361,368,0,'',1),(371,'main','COM_JCE_MENU_CPANEL','com-jce-menu-cpanel','','com-jce/com-jce-menu-cpanel','index.php?option=com_jce','component',1,370,2,10015,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',362,363,0,'',1),(372,'main','COM_JCE_MENU_CONFIG','com-jce-menu-config','','com-jce/com-jce-menu-config','index.php?option=com_jce&view=config','component',1,370,2,10015,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',364,365,0,'',1),(373,'main','COM_JCE_MENU_PROFILES','com-jce-menu-profiles','','com-jce/com-jce-menu-profiles','index.php?option=com_jce&view=profiles','component',1,370,2,10015,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',366,367,0,'',1),(374,'topmenu','About site','about-site','','about-site','index.php?option=com_content&view=article&id=170','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',117,118,0,'en-GB',0),(375,'nascosto','Metadata search results','metadata-search-results','','metadata-search-results','index.php?option=com_content&view=article&id=169','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',269,272,0,'en-GB',0),(376,'topmenu','Responsible for publication','responsible-publication','','responsible-publication','index.php?option=com_content&view=article&id=171','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',147,148,0,'en-GB',0),(377,'privacy','Privacy','privacy-eng','','privacy-eng','index.php?option=com_content&view=article&id=172','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',81,82,0,'en-GB',0),(378,'privacy','Legal notes','legal-notes','','legal-notes','index.php?option=com_content&view=article&id=173','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',85,86,0,'en-GB',0),(379,'topmenu','Credits','credits-eng','','credits-eng','index.php?option=com_content&view=article&id=174','component',1,1,1,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',151,152,0,'en-GB',0),(380,'nascosto','Metadata details','metadata-details','','metadata-search-results/metadata-details','index.php?option=com_content&view=article&id=167','component',1,375,2,22,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',270,271,0,'en-GB',0),(381,'mainmenu','Help','features-2','','features-2','#guida','url',1,1,1,0,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"link_guida\",\"menu-anchor_rel\":\"\",\"menu_image\":\"templates\\/rndt\\/images\\/icons\\/MenuInfo.png\",\"menu_text\":1,\"menu_show\":1}',319,320,0,'en-GB',0);
/*!40000 ALTER TABLE `l1pym_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_menu_types`
--

DROP TABLE IF EXISTS `l1pym_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_menu_types`
--

LOCK TABLES `l1pym_menu_types` WRITE;
/*!40000 ALTER TABLE `l1pym_menu_types` DISABLE KEYS */;
INSERT INTO `l1pym_menu_types` VALUES (1,0,'mainmenu','Main Menu','The main menu for the site',0),(2,0,'topmenu','Top Menu','',0),(3,0,'sidebarmenu','Sidebar Menu','',0),(4,0,'nascosto','Nascosto','',0),(5,0,'inspire','INSPIRE','',0),(6,0,'portale','portale','',0),(7,0,'privacy','privacy','privacy',0),(8,0,'dati-territoriali','Dati territoriali','dati-territoriali',0),(9,234,'italian-it','Italiano','',0),(10,235,'english-en-gb','English','',0);
/*!40000 ALTER TABLE `l1pym_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_messages`
--

DROP TABLE IF EXISTS `l1pym_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_messages`
--

LOCK TABLES `l1pym_messages` WRITE;
/*!40000 ALTER TABLE `l1pym_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_messages_cfg`
--

DROP TABLE IF EXISTS `l1pym_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_messages_cfg`
--

LOCK TABLES `l1pym_messages_cfg` WRITE;
/*!40000 ALTER TABLE `l1pym_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_modules`
--

DROP TABLE IF EXISTS `l1pym_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_modules`
--

LOCK TABLES `l1pym_modules` WRITE;
/*!40000 ALTER TABLE `l1pym_modules` DISABLE KEYS */;
INSERT INTO `l1pym_modules` VALUES (1,191,'Main Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"rndt:menu-principale\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(2,0,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,0,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(4,0,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(6,0,'Unread Messages','','',1,'header',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_unread',3,1,'',1,'*'),(7,0,'Online Users','','',2,'header',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_online',3,1,'',1,'*'),(8,0,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,0,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*'),(10,0,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(12,0,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,0,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,0,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,0,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(17,211,'Breadcrumbs','','',1,'breadcrumbs',50,'2017-04-26 13:54:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,0,'{\"showHere\":\"0\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showLast\":\"1\",\"separator\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(19,0,'Benvenuti nel RNDT','','<p>Il <strong><a href=\"index.php?option=com_content&amp;view=article&amp;id=24&amp;Itemid=216\">Repertorio Nazionale dei Dati Territoriali</a></strong> è lo <strong>strumento per ricercare, attraverso i metadati, i dati territoriali - e relativi servizi - disponibili presso le Pubbliche Amministrazioni</strong>, per valutarne l’idoneità allo scopo e ottenere le opportune indicazioni sulle loro condizioni di accesso e utilizzo.<strong></strong></p>\r\n<p>Il portale del RNDT è in continua evoluzione. Per qualsiasi segnalazione o richiesta di informazioni, <a target=\"_self\" href=\"index.php?option=com_content&amp;view=article&amp;id=30:contatti&amp;catid=11:homepage&amp;Itemid=167\"><strong>contattaci</strong></a>.</p>\r\n<p align=\"center\"><span style=\"background-color: #fafafa; padding: 3px; text-align: center; border-color: #E2E2E2; border-width: 1px; border-style: solid; border-radius: 2px;\"><a href=\"/RNDT/home/index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=7&amp;Itemid=225&amp;format=feed&amp;type=rss\"> <img src=\"/RNDT/home/templates/atomic/css/blueprint/plugins/link-icons/icons/feed.png\" alt=\"Feed RSS\" title=\"Feed RSS\" style=\"vertical-align: middle; padding-right: 3px;\" /></a><strong><a href=\"index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=7&amp;Itemid=225\">Tutte le notizie &gt;&gt;</a></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"background-color: #fafafa; padding: 3px; text-align: center; border-color: #E2E2E2; border-width: 1px; border-style: solid; border-radius: 2px;\"><a href=\"index.php?option=com_content&amp;view=article&amp;id=69&amp;Itemid=226\"><strong>Dicono di noi &gt;&gt;</strong></a></span></p>',9,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(20,219,'Bottom A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>icon-twitter</code>',2,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"icon-twitter\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(21,220,'Bottom A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>icon-mail</code>',3,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"icon-mail\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(22,221,'Bottom A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>icon-bubble</code>',4,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"icon-bubble\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(23,0,'Home Teaser Fast','','<img class=\"align-left\" src=\"images/yootheme/features_icon_lightweight.png\" width=\"42\" height=\"42\" />\r\n<div class=\"bfc-o\">\r\n	<h3 class=\"remove-margin\">Fast and lightweight</h3>\r\n	<p class=\"remove-margin-b\">Well designed and coded to provide optimal loading times.</p>\r\n</div>',5,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(24,0,'Home Teaser Mobile','','<img class=\"align-left\" src=\"images/yootheme/features_icon_mobile.png\" width=\"42\" height=\"50\" />\r\n<div class=\"bfc-o\">\r\n	<h3 class=\"remove-margin\">Mobile Theme included</h3>\r\n	<p class=\"remove-margin-b\">Dedicated theme for mobile devices with Retina support.</p>\r\n</div>',6,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(25,0,'Home Teaser HTML5','','<img class=\"align-left\" src=\"images/yootheme/features_icon_html5.png\" width=\"42\" height=\"50\" />\r\n<div class=\"bfc-o\">\r\n	<h3 class=\"remove-margin\">Latest web techniques</h3>\r\n	<p class=\"remove-margin-b\">Completely built with HTML5, CSS3, PHP 5.2+ and jQuery.</p>\r\n</div>',7,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(26,0,'Home Teaser Demo','','<img class=\"align-left\" src=\"images/yootheme/features_icon_demo_package.png\" width=\"42\" height=\"46\" />\r\n<div class=\"bfc-o\">\r\n	<h3 class=\"remove-margin\">Demo Package available</h3>\r\n	<p class=\"remove-margin-b\">Sample data for Joomla and WordPress is available.</p>\r\n</div>',8,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(27,0,'Bottom B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>badge-hot</code>',1,'bottom-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-hot\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(28,0,'Bottom B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code> <code>badge-new</code>',2,'bottom-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey badge-new\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(29,0,'Bottom B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>badge-live</code>',3,'bottom-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-live\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(30,0,'Bottom B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code> <code>badge-top</code>',4,'bottom-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey badge-top\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(31,194,'Footer Menu','','',1,'footer',43,'2017-01-20 11:49:30','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"topmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"menu_servizio\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(32,197,'Footer','','<p><a href=\"http://creativecommons.org/licenses/by-sa/3.0/it/\" rel=\"license\"><img style=\"border-width: 0;\" src=\"http://i.creativecommons.org/l/by-sa/3.0/it/80x15.png\" alt=\"Licenza Creative Commons\" /></a></p>',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(33,0,'Header Base di dati di interessa nazionale','','<h3>Base di dati di interesse Nazionale</h3>',3,'headerbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"scrittaheader\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(34,216,'Inner Bottom','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-black</code> <code>icon-login</code>',1,'innerbottom',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"icon-login color-black\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(35,217,'Inner Bottom','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-black</code> <code>icon-cart</code>',2,'innerbottom',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"icon-cart color-black\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(36,0,'Inner Top','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-color</code>',1,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(37,212,'Inner Top','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-color</code>',2,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(38,0,'Logo','','<img style=\"margin-left: 5px;\" src=\"images/yootheme/logo_RNDT.png\" alt=\"Logo Portale RND\" width=\"250\" height=\"77\" />',1,'logo',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(39,0,'Login || Module Position','','',2,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_login',1,1,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',0,'*'),(40,236,'Cerca','','',1,'search',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_search',1,1,'{\"label\":\"Cerca...\",\"width\":\"37\",\"text\":\"Cerca...\",\"button\":\"1\",\"button_pos\":\"right\",\"imagebutton\":\"0\",\"button_text\":\"CERCA\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(41,0,'Sub Menu','','',9,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"startLevel\":\"2\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(42,0,'Portale RNDT','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_menu',1,1,'{\"menutype\":\"sidebarmenu\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(43,0,'Sidebar A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code>',2,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(44,0,'Sidebar A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code>',2,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(45,0,'List Line','','<p>Use the CSS class <code>line</code> to create this list style.</p>\r\n\r\n<ul class=\"line\">\r\n	<li>Item 1</li>\r\n	<li>Item 2</li>\r\n	<li>Item 3</li>\r\n	<li>Item 4</li>\r\n	<li>Item 5</li>\r\n</ul>',10,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-black\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(46,0,'List Zebra','','<p>Use the CSS class <code>zebra</code> to create this list style.</p>\r\n\r\n<ul class=\"zebra\">\r\n	<li class=\"odd\">Item 1</li>\r\n	<li>Item 2</li>\r\n	<li class=\"odd\">Item 3</li>\r\n	<li>Item 4</li>\r\n	<li class=\"odd\">Item 5</li>\r\n</ul>',11,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(47,0,'List Check','','<p>Use the CSS class <code>check</code> to create this list style.</p>\r\n\r\n<ul class=\"check\">\r\n	<li>Item 1</li>\r\n	<li>Item 2</li>\r\n	<li>Item 3</li>\r\n	<li>Item 4</li>\r\n	<li>Item 5</li>\r\n</ul>',16,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(48,207,'News - Eventi','','',3,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_articles_latest',1,1,'{\"catid\":[\"7\"],\"count\":\"5\",\"show_featured\":\"\",\"ordering\":\"c_dsc\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(49,0,'Login','','',9,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',0,'*'),(50,0,'Download ZOO','','<a class=\"display-block text-center\" href=\"http://www.yootheme.com/zoo\" target=\"_blank\"><img class=\"size-auto\" src=\"images/yootheme/zoo_icon.png\" alt=\"A flexible and powerful content application builder to manage your content\" title=\"A flexible and powerful content application builder to manage your content\" width=\"140\" height=\"130\" /></a>\r\n\r\n<p>A flexible and powerful content application builder to manage your content.</p>\r\n\r\n<p><a class=\"button-more\" href=\"http://www.yootheme.com/zoo\" target=\"_blank\">Download ZOO</a></p>',10,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-free\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(51,0,'App Bundle','','<p>The ZOO app bundle contains the following apps:</p>\r\n\r\n<ul class=\"line\">\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=9\">Blog</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=10\">Product Catalog</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=11\">Download Archive</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=12\">Business Directory</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=13\">Movie Database</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=14\">Cookbook</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=frontpage&amp;Itemid=15\">Documentation</a></li>\r\n	<li><a href=\"index.php?option=com_zoo&amp;view=item&amp;Itemid=16\">Pages</a></li>\r\n</ul>',11,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(52,0,'Icon Freebies','','<ul class=\"line text-center\">\r\n	<li>\r\n		<a href=\"http://www.yootheme.com/icons\" target=\"_blank\">\r\n			<figure>\r\n				<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_socialbookmarks.png\" alt=\"Social Bookmarks Icons\" />\r\n				<figcaption>Social Bookmarks Icons</figcaption>\r\n			</figure>\r\n		</a>\r\n	</li>\r\n	<li>\r\n		<a href=\"http://www.yootheme.com/icons\" target=\"_blank\">\r\n			<figure>\r\n				<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_halloween.png\" alt=\"Halloween Icons\" />\r\n				<figcaption>Halloween Icons</figcaption>\r\n			</figure>\r\n		</a>\r\n	</li>\r\n	<li>\r\n		<a href=\"http://www.yootheme.com/icons\" target=\"_blank\">\r\n			<figure>\r\n				<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_html5geekmatt.png\" alt=\"HTML5 Geek Icon\" />\r\n				<figcaption>HTML5 Geek Icon</figcaption>\r\n			</figure>\r\n		</a>\r\n	</li>\r\n</ul>',12,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-free\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(53,0,'Warp Framework','','<a class=\"display-block text-center\" href=\"http://www.yootheme.com/warp\" target=\"_blank\"><img class=\"size-auto\" src=\"images/yootheme/features_warp_icon.png\" alt=\"Warp is a fast and slick theme framework which provides a rich tool set to develop cross-platform themes\" title=\"Warp is a fast and slick theme framework which provides a rich tool set to develop cross-platform themes\" width=\"140\" height=\"130\" /></a>\r\n\r\n<p>A fast and slick theme framework built on the latest web techniques like HTML5, CSS3 and PHP 5.2+</p>\r\n\r\n<p><a class=\"button-more\" href=\"http://www.yootheme.com/warp\" target=\"_blank\">Visit Website</a></p>',13,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(54,0,'Warp Features','','<p>All Warp features are available in this theme:</p>\r\n\r\n<ul class=\"check\">\r\n	<li>Fast and Lightweight</li>\r\n	<li>Mobile Theme</li>\r\n	<li>Update Notifications</li>\r\n	<li>HTML5 markup</li>\r\n	<li>RTL Support</li>\r\n	<li>CSS Framework</li>\r\n	<li>Nice Admin UI</li>\r\n	<li>File Minification</li>\r\n</ul>',14,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(55,0,'JavaScript Library','','All client side effects use the JavaScript framework <a href=\"http://www.jquery.com\" target=\"_blank\">jQuery</a> which offers most reliable functionality and compact size!',15,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(56,0,'Warp6 Blog Posts','','<ul class=\"line\">\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-engage\" target=\"_blank\">Warp6 - Engage</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/inside-the-warp6-framework\" target=\"_blank\">Inside the Framework</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-styles\" target=\"_blank\">Warp6 Styles</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-and-html5\" target=\"_blank\">Warp6 and HTML5</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-css-framework\" target=\"_blank\">Warp6 CSS Framework</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-administration\" target=\"_blank\">Warp6 Administration</a></li>\r\n	<li><a href=\"http://www.yootheme.com/blog/item/root/warp6-mobile-theme\" target=\"_blank\">Warp6 Mobile Theme</a></li>\r\n</ul>',16,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(57,0,'Accesso al catalogo','','<p>Navigatore geografico per la ricerca dei metadati presenti nel RNDT ...</p>\r\n<p> </p>',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-box color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(58,0,'Gestione metadati','','<p>Editor, servizi di validazione e di upload dei metadati nel RNDT (area riservata per la PA) ...<code></code></p>',2,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(59,0,'RNDT E INSPIRE','','<p><img src=\"images/struttura/ec.jpg\" alt=\"\" align=\"right\" />Il RNDT è parte integrante dell\'<strong>Infrastruttura Nazionale per l\'Informazione Territoriale e del Monitoraggio Ambientale</strong> istituita con il <a href=\"index.php?option=com_content&amp;view=article&amp;id=44&amp;Itemid=197\">D. Lgs. 32/2010</a>, norma di recepimento della Direttiva INSPIRE in Italia.</p>\r\n<p><a href=\"index.php?option=com_content&amp;view=article&amp;id=27&amp;Itemid=214\"><strong>Approfondisci &gt;&gt;</strong></a></p>',3,'sidebar-b',43,'2017-01-20 12:02:18','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(60,0,'Joomla & WordPress','','<img class=\"size-auto\" width=\"205\" height=\"90\" src=\"images/yootheme/features_icon_cross_platform.png\" />\r\n<p>This theme is available for Joomla and WordPress including the same features on each system.</p>',4,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(61,0,'Top Menu','','',0,'toolbar-l',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_menu',1,1,'{\"menutype\":\"topmenu\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(62,213,'Top A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code>',1,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(63,214,'Top A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code>',2,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(64,215,'Top A','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code>',3,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(65,0,'Link Utili','','<ul class=\"line line-icon\">\r\n<li><a title=\"INSPIRE\" href=\"http://inspire.jrc.ec.europa.eu/\" target=\"_blank\">INSPIRE</a></li>\r\n<li><a target=\"_blank\" href=\"http://inspire-geoportal.ec.europa.eu/\">INSPIRE Geoportal</a></li>\r\n<li><a title=\"Geoportale Nazionale\" href=\"http://www.pcn.minambiente.it/GN/\" target=\"_blank\">Geoportale Nazionale</a></li>\r\n<li><a href=\"http://www.minambiente.it/pagina/inspire\" target=\"_blank\">MATTM - INSPIRE</a></li>\r\n<li><a title=\"JRC\" href=\"http://ies.jrc.ec.europa.eu/index.php?page=DE\" target=\"_blank\">JRC</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=91&amp;Itemid=232\">Altri link</a></li>\r\n</ul>',6,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(66,226,'Icons Shipping','','<a href=\"http://www.yootheme.com/icons\" target=\"_blank\" class=\"display-block text-center\">\r\n	<figure class=\"remove-margin\">\r\n		<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_shipping.png\" alt=\"Shipping Icons\" />\r\n		<figcaption>Shipping Icons</figcaption>\r\n	</figure>\r\n</a>',5,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(67,227,'Icons E-Commerce','','<a href=\"http://www.yootheme.com/icons\" target=\"_blank\" class=\"display-block text-center\">\r\n	<figure class=\"remove-margin\">\r\n		<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_ecommerce.png\" alt=\"E-Commerce Icons\" />\r\n		<figcaption>E-Commerce Icons</figcaption>\r\n	</figure>\r\n</a>',6,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(68,228,'Icons Action','','<a href=\"http://www.yootheme.com/icons\" target=\"_blank\" class=\"display-block text-center\">\r\n	<figure class=\"remove-margin\">\r\n		<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_actions.png\" alt=\"Action Icons\" />\r\n		<figcaption>Action Icons</figcaption>\r\n	</figure>\r\n</a>',7,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(69,229,'Icons Box','','<a href=\"http://www.yootheme.com/icons\" target=\"_blank\" class=\"display-block text-center\">\r\n	<figure class=\"remove-margin\">\r\n		<img class=\"size-auto\" height=\"120\" width=\"180\" src=\"images/yootheme/icons_box.png\" alt=\"Box Icons\" />\r\n		<figcaption>Box Icons</figcaption>\r\n	</figure>\r\n</a>',8,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(70,0,'Warp Teaser','','<div class=\"text-center\"><img class=\"size-auto\" src=\"images/yootheme/home_warp_teaser.jpg\" border=\"0\" width=\"915\" height=\"300\" />\r\n<h1 style=\"margin: 15px 0 10px 0; letter-spacing: 2px;\">Introducing Warp6</h1>\r\n<p style=\"margin: 0; font-size: 26px; color: #999999;\">The fast and slick theme framework</p>\r\n</div>',9,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(71,0,'Top B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code>',1,'top-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(72,0,'Top B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code>',2,'top-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(73,0,'Top B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code>',3,'top-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(74,0,'Top B','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-box</code> <code>color-grey</code>',4,'top-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-grey\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(75,0,'Widgetkit','','',0,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit',1,1,'',0,'*'),(76,0,'Twitter List','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit_twitter',1,0,'{\"style\":\"list\",\"from_user\":\"yootheme\",\"to_user\":\"\",\"ref_user\":\"\",\"hashtag\":\"\",\"word\":\"\",\"nots\":\"\",\"limit\":\"4\",\"image_size\":\"48\",\"show_image\":\"1\",\"show_author\":\"1\",\"show_date\":\"1\",\"moduleclass_sfx\":\"\"}',0,'*'),(77,0,'Accesso al catalogo','','<p><img src=\"images/struttura/catalogo1.png\" alt=\"\" style=\"display: block; margin-left: auto; margin-right: auto;\" border=\"0\" height=\"80\" width=\"80\" /></p>\r\n<p>Navigatore geografico per la ricerca dei metadati presenti nel RNDT ...</p>\r\n<p><a class=\"button-more\" href=\"http://www.\">Accedi ora</a></p>',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(78,0,'Twitter Bubbles','','',1,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit_twitter',1,0,'{\"style\":\"bubbles\",\"from_user\":\"\",\"to_user\":\"\",\"ref_user\":\"\",\"hashtag\":\"\",\"word\":\"\",\"nots\":\"\",\"limit\":\"4\",\"image_size\":\"48\",\"show_image\":\"1\",\"show_author\":\"1\",\"show_date\":\"1\",\"moduleclass_sfx\":\"\"}',0,'*'),(79,218,'Twitter Single','','',1,'innerbottom',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit_twitter',1,0,'{\"style_\":\"list\",\"from_user\":\"yootheme\",\"to_user\":\"\",\"ref_user\":\"\",\"hashtag\":\"\",\"word\":\"\",\"nots\":\"\",\"limit\":\"4\",\"image_size\":\"48\",\"show_image\":\"1\",\"show_author\":\"1\",\"show_date\":\"1\",\"consumer_key\":\"\",\"consumer_secret\":\"\",\"access_token\":\"\",\"access_token_secret\":\"\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(80,0,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','2017-01-23 16:58:35','0000-00-00 00:00:00',1,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(81,0,'Frontpage Gallery Slideshow','','',1,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_widgetkit',1,0,'{\"widget_id\":\"48\",\"moduleclass_sfx\":\"\"}',0,'*'),(82,0,'News - Eventi','','',1,'top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit',1,1,'{\"widget_id\":\"49\",\"moduleclass_sfx\":\"\"}',0,'*'),(83,0,'Frontpage Demo Tabs','','',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit',1,0,'{\"widget_id\":\"47\",\"moduleclass_sfx\":\"style-blank\"}',0,'*'),(84,0,'Frontpage Slideset Demo','','',1,'top-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_widgetkit',1,0,'{\"widget_id\":\"46\",\"moduleclass_sfx\":\"\"}',0,'*'),(85,0,'Twitter Frontpage','','',1,'bottom-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_widgetkit_twitter',1,0,'{\"style\":\"bubbles\",\"from_user\":\"\",\"to_user\":\"\",\"ref_user\":\"\",\"hashtag\":\"\",\"word\":\"joomla\",\"nots\":\"\",\"limit\":\"4\",\"image_size\":\"32\",\"show_image\":\"1\",\"show_author\":\"1\",\"show_date\":\"1\",\"moduleclass_sfx\":\"style-blank\"}',0,'*'),(86,0,'Top Movies','','<img class=\"size-auto\" src=\"images/yootheme/home_article1.jpg\" alt=\"Demo\" width=\"214\" height=\"94\" />\r\nThe Adventures of Tintin: Intrepid reporter Tintin and Captain Haddock set off on a treasure hunt for a sunken ship.\r\n<p><a class=\"button-more\" href=\"index.php?option=com_content&view=article&id=6&Itemid=102\">read more</a></p>',1,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(87,210,'Tutte le news','','<ul class=\"nav nav-social nav-social-icons\">\r\n<li>\r\n<a class=\"button-more\" href=\"index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=7&amp;Itemid=225\"><span class=\"fa fa-newspaper-o fa-2x\"></span> Tutte le notizie</a>\r\n</li>\r\n<li><a href=\"index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=7&amp;Itemid=225&amp;format=feed&amp;type=rss\">\r\n<span class=\"fa fa-rss-square fa-2x\"></span> Feed RSS </a></li>\r\n</ul>',9,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(88,0,'Video Stream','','<div class=\"frontpage-video\">\r\n<a class=\"align-left\" style=\"margin-right: 10px;\" data-lightbox href=\"http://vimeo.com/15261921\" title=\"Vimeo Video\">\r\n	<img class=\"border-box\" src=\"images/yootheme/demo_stream.jpg\" alt=\"Demo\" width=\"69\" height=\"46\" />\r\n</a>\r\n<strong>Alone in NY</strong><br />\r\n<small>by Giuseppe Vetrano</small><br />\r\n<a data-lightbox href=\"http://vimeo.com/15261921\" title=\"Vimeo Video\">watch now »</a>\r\n</div>',3,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-live\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(89,0,'Menu Sidebar','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_menu',1,1,'{\"menutype\":\"sidebarmenu\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(90,0,'Social Icons Special','','<ul class=\"social-icons-special\">\r\n<li class=\"twitter\"><a href=\"https://twitter.com/rndt_it\" title=\"Twitter\"></a></li>\r\n<li class=\"facebook\"><a href=\"http://www.facebook.com/groups/rndt.gov/\" title=\"Facebook\"></a></li>\r\n</ul>\r\n<div class=\"frontpage-social\">Seguici su:</div>',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(91,0,'Testo 1','','<ul class=\"line line-icon\">\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=8:joomla-templates&amp;catid=7:blog&amp;Itemid=126\">Joomla Templates</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=9:beautiful-icons&amp;catid=7:blog&amp;Itemid=126\">Beautiful Icons</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=10:warp-theme-framework&amp;catid=7:blog&amp;Itemid=126\">Warp Theme Framework</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=5:zoo-extension&amp;catid=7:blog&amp;Itemid=126\">ZOO Extension</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=6:free-social-icons&amp;catid=7:blog&amp;Itemid=126\">Free Social Icons</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=1&amp;Itemid=103\">Module Variations</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=4&amp;Itemid=104\">Featured Content Elements</a></li>\r\n<li><a href=\"index.php?option=com_content&amp;view=article&amp;id=13&amp;Itemid=137\">Next Generation Toolset</a></li>\r\n</ul>',1,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(92,0,'Testo 2','','<p><img class=\"size-auto\" src=\"images/yootheme/home_article3.jpg\" border=\"0\" alt=\"Demo\" width=\"214\" height=\"94\" />Explore the extraordinary secrets of the Caribean Islands.</p>\r\n<p><a class=\"button-more\" href=\"index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=102\">read more</a></p>',1,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(93,0,'Sondaggio 1','','<p><strong>What is your favorite travel destination?</strong></p>\r\n<form id=\"weekylpoll\" class=\"short style frontpage-form\" action=\"index.php?option=com_content&amp;view=article&amp;id=6&amp;Itemid=102\" method=\"post\">\r\n<div><input id=\"vote1\" type=\"radio\" name=\"poll\" checked=\"checked\" /><label for=\"vote1\"> America</label></div>\r\n<div><input id=\"vote2\" type=\"radio\" name=\"poll\" /> <label for=\"vote2\">Europe and Asia</label></div>\r\n<div><input id=\"vote3\" type=\"radio\" name=\"poll\" /> <label for=\"vote3\">Africa</label></div>\r\n<button>Vote</button></form>',1,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(94,0,'Testo importante','','<p><strong>Cover story of this issue:</strong> We focus on the global finacial crisis and the power of rating agencies. And we will have a look at the latest 3D TV technologies.</p>\r\n<div class=\"frontpage-newspaper\"><img src=\"images/yootheme/home_newspaper.png\" border=\"0\" alt=\"Demo\" width=\"94\" height=\"74\" />\r\n<div>\r\n<h4>Revista #258</h4>\r\nFebruary 2012<br /> <a href=\"#\">now available</a></div>\r\n</div>',1,'bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"badge-new\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(95,0,'Services','','<ul class=\"blank\">\r\n<li><a href=\"#\">Headlines</a></li>\r\n<li><a href=\"#\">RSS Feed</a></li>\r\n<li><a href=\"#\">Newsletter</a></li>\r\n<li><a href=\"#\">Mobile View</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(96,0,'Video','','<ul class=\"blank\">\r\n<li><a href=\"#\">Video Archive</a></li>\r\n<li><a href=\"#\">Live Stream</a></li>\r\n<li><a href=\"#\">Tv Guide</a></li>\r\n<li><a href=\"#\">Podcasts</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(97,0,'Media','','<ul class=\"blank\">\r\n<li><a href=\"#\">Media Library</a></li>\r\n<li><a href=\"#\">iOS App</a></li>\r\n<li><a href=\"#\">Android App</a></li>\r\n<li><a href=\"#\">Print Version</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(98,0,'Magazine','','<ul class=\"blank\">\r\n<li><a href=\"#\">Revista Nueva</a></li>\r\n<li><a href=\"#\">Revista Classic</a></li>\r\n<li><a href=\"#\">Revista History</a></li>\r\n<li><a href=\"#\">Revista Science</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(99,0,'Network','','<ul class=\"blank\">\r\n<li><a href=\"#\">Subscription</a></li>\r\n<li><a href=\"#\">Online Shop</a></li>\r\n<li><a href=\"#\">Blog</a></li>\r\n<li><a href=\"#\">Partners</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(100,0,'Support','','<ul class=\"blank\">\r\n<li><a href=\"#\">Contact</a></li>\r\n<li><a href=\"#\">F.A.Q.</a></li>\r\n<li><a href=\"#\">Privacy</a></li>\r\n<li><a href=\"#\">Disclaimer</a></li>\r\n</ul>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(101,225,'Bottom C','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-plain</code>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(102,224,'Bottom C','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-plain</code>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(103,0,'Balance Theme','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-plain</code>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(104,223,'Bottom C','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-plain</code>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(105,222,'Bottom C','','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Module Class Suffix <code>style-plain</code>',1,'bottom-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"style-plain\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(106,0,'List Line Icon','','<p>Use the CSS class <code>line line-icon</code> to create this list style.</p>\r\n\r\n<ul class=\"line line-icon\">\r\n	<li>Item 1</li>\r\n	<li>Item 2</li>\r\n	<li>Item 3</li>\r\n	<li>Item 4</li>\r\n	<li>Item 5</li>\r\n</ul>',10,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(107,0,'Login Frontpage','','',1,'headerbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_login',1,0,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',0,'*'),(108,0,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(109,0,'Dati Territoriali','','<p>Le attività, l\'agenda e la documentazione in materia di <strong>regole tecniche</strong> sui dati territoriali delle Pubbliche Amministrazioni.</p>\r\n<p><strong><a href=\"index.php?option=com_content&amp;view=article&amp;id=47:comitato-dati-territoriali&amp;catid=13:sito&amp;Itemid=200\" target=\"_self\">Approfondisci &gt;&gt;</a></strong></p>',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(110,208,'inspire','','',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"inspire\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\" menu_contestuale b2\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(111,209,'portale','','',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,0,'{\"menutype\":\"portale\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\" menu_contestuale b2\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(112,0,'logo header digitpa','','<p><a title=\"Vai al sito AgID\" href=\"http://www.agid.gov.it\"><img style=\"margin-top: 14px; float: right;\" src=\"images/yootheme/logo_aid.png\" alt=\"logo aid\" /></a></p>',2,'headerbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(113,0,'Servizio di ricerca - CSW','','<p><img style=\"margin-left: 10px; margin-bottom: 5px; float: right;\" src=\"images/rndt_csw_logo_87x79_b.png\" alt=\"rndt csw logo 87x79 b\" width=\"87\" height=\"79\" /><br style=\"clear: left;\" />Il servizio di ricerca del RNDT, basato sulle Specifiche OGC per i&nbsp; CSW e conforme alla guida tecnica INSPIRE, consente di cercare i set di dati territoriali e i servizi ad essi relativi in base al contenuto dei metadati corrispondenti e di visualizzare il contenuto dei metadati.</p>\r\n<p><a href=\"index.php?option=com_content&amp;view=article&amp;id=88&amp;Itemid=229\"><strong>Approfondisci &gt;&gt;</strong></a></p>',1,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"color-color\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(114,195,'RNDT comunica ','','<!--h3>RNDT comunica <span class=\"fa fa-newspaper-o\"></span></h3-->\r\n<p><strong>27/02/2015</strong>- Pubblicato il position paper \"<a href=\"http://www.sinergis.it/download/dati/Dati_Geografici_Armonizzati_e_Omogenei_a_Scala_Nazionale.pdf\"><strong>Dati geografici armonizzati e omogenei a scala nazionale: una chimera?</strong></a> - Un panel di \"addetti ai lavori\" si confronta alla Conferenza ASITA\".</p>\r\n<p><strong>24/02/2015 </strong>Il 4 marzo p.v. si terr&agrave; un <a href=\"http://www.isprambiente.gov.it/it/events/workshop-progetto-linkvit\"><strong>workshop formativo sulla Direttiva INSPIRE</strong></a> organizzato nell\'ambito del <strong>progetto LINKVIT</strong>. Richiesta la registrazione.</p>',1,'sidebar-a',0,'0000-00-00 00:00:00','2017-01-30 09:14:22','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\" comunica\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(115,0,'I numeri del RNDT','','<p><img style=\"margin-right: 10px; margin-bottom: 10px; float: left;\" src=\"images/statistiche.png\" alt=\"statistiche\" />A cadenza mediamente bimestrale sono pubblicati i report statistici che offrono una <strong>panoramica sugli effettivi contenuti del Repertorio</strong> e sull\'<strong>andamento delle attività di alimentazione</strong> da parte delle Amministrazioni competenti.</p>\r\n<p>Accedi alle <strong><a href=\"index.php?option=com_content&amp;view=article&amp;id=62&amp;Itemid=224\">statistiche &gt;&gt;</a></strong></p>',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(116,0,'hashtag','','<a href=\"https://twitter.com/rndt_it\"><img style=\"margin-right: 15px; margin-left: 30px;\" src=\"images/twitter-bird-white-on-blue_p.png\" alt=\"logo twitter\"/></a>\r\n<a href=\"http://www.facebook.com/groups/rndt.gov/\"><img style=\"margin-left: 15px; margin-right: 15px;\" src=\"images/f_logo_p.png\" alt=\"logo facebook\" /></a>\r\n<a href=\"/RNDT/home/index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=7&amp;Itemid=225&amp;format=feed&amp;type=rss\"><img style=\"margin-left: 15px;\" src=\"images/feed-icon-28x28.png\" alt=\"logo rss feed\"/></a>',2,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(117,0,'Premio opengeodata','','<p><a href=\"index.php?option=com_content&amp;view=article&amp;id=87:opengeodata-italia-premia-l-agenzia&amp;catid=7:news&amp;Itemid=225\"><img style=\"margin-left: 30px; margin-top: 5px; vertical-align: middle;\" src=\"images/opengeodata_targa_5_small.jpg\" alt=\"opengeodata targa\" width=\"150\" height=\"312\" /></a></p>',1,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(118,0,'Social media','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_custom',1,1,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(119,0,'#italy4INSPIRE','','<a class=\"twitter-timeline\"  href=\"https://twitter.com/search?q=%23italy4INSPIRE\"  data-widget-id=\"432836126567452673\">Tweet su \"#italy4INSPIRE\"</a>\r\n    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\"://platform.twitter.com/widgets.js\";fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>',4,'innertop',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(120,192,'La ricerca dell\'informazione geografica inizia da qui','','<h1>La ricerca dell\'informazione geografica inizia da qui.</h1>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et interdum neque. Quisque tempor mi lectus. Maecenas ultrices aliquam urna. Curabitur at tortor dictum, sollicitudin eros convallis, tempus orci.</p>',1,'topb',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(121,193,'Seguici su','','<ul class=\"nav nav-social nav-social-icons\">\r\n	<li><a href=\"https://www.facebook.com/groups/rndt.gov/\"><span class=\"fa fa-facebook-square fa-2x\"></span> gruppo  facebook</a></li>\r\n	<li><a href=\"https://twitter.com/rndt_it/\"><span class=\"fa fa-twitter-square fa-2x\"></span> @rndt_it</a></li>\r\n	<li><a href=\"https://twitter.com/rndt_it/\"><span class=\"fa fa-skype fa-2x\"></span> rndt.help</a></li>\r\n	<li><a href=\"http://www.agid.gov.it/feed-agid\" title=\"Feed RSS\"><span class=\"fa fa-rss-square fa-2x\"></span> RSS</a></li>\r\n</ul>',1,'topc',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\" content\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(122,196,'privacy','','',1,'privacy',43,'2017-01-20 13:47:53','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"privacy\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(123,198,'news','','',1,'sidebar-c',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_articles_category',1,0,'{\"mode\":\"normal\",\"show_on_article_page\":\"1\",\"count\":\"2\",\"show_front\":\"show\",\"category_filtering_type\":\"1\",\"catid\":[\"7\"],\"show_child_category_articles\":\"0\",\"levels\":\"1\",\"author_filtering_type\":\"0\",\"created_by\":[\"\"],\"author_alias_filtering_type\":\"0\",\"created_by_alias\":[\"\"],\"excluded_articles\":\"\",\"date_filtering\":\"off\",\"date_field\":\"a.created\",\"start_date_range\":\"\",\"end_date_range\":\"\",\"relative_date\":\"30\",\"article_ordering\":\"a.title\",\"article_ordering_direction\":\"ASC\",\"article_grouping\":\"none\",\"article_grouping_direction\":\"ksort\",\"month_year_format\":\"F Y\",\"link_titles\":\"1\",\"show_date\":\"1\",\"show_date_field\":\"modified\",\"show_date_format\":\"Y-m-d H:i:s\",\"show_category\":\"0\",\"show_hits\":\"0\",\"show_author\":\"0\",\"show_introtext\":\"1\",\"introtext_limit\":\"100\",\"show_readmore\":\"0\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"15\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"owncache\":\"1\",\"cache_time\":\"900\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(124,199,'Servizio CSW','','<div class=\"sin\">\r\n<a href=\"index.php?option=com_content&view=article&id=88&Itemid=229\">\r\n<span class=\"fa fa-connectdevelop fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3>\r\n<a href=\"index.php?option=com_content&view=article&id=88&Itemid=229\">\r\nServizio CSW\r\n</a>\r\n</h3>\r\n	<p>Il servizio di ricerca del RNDT, basato sulle Specifiche OGC <span>...</span></p>\r\n</div>\r\n  </a>',1,'ban1',43,'2017-01-20 11:36:44','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(125,200,'Newsletter','','<div class=\"sin\">\r\n<a href=\"index.php?option=com_content&view=article&id=121&Itemid=238\">\r\n<span class=\"fa fa-newspaper-o fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3>\r\n<a href=\"index.php?option=com_content&view=article&id=121&Itemid=238\">\r\nNewsletter\r\n</a>\r\n</h3>\r\n	<p>Iscriviti alla nostra newsletter <span>...<span></p>\r\n</div>\r\n  </a>',1,'ban1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(126,201,'I numeri RNDT','','<div class=\"sin\"><a href=\"index.php?option=com_content&view=article&id=62&Itemid=224\">\r\n<span class=\"fa fa-bar-chart-o fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3><a href=\"index.php?option=com_content&view=article&id=62&Itemid=224\">I numeri RNDT</a></h3>\r\n	<p>A cadenza mediamente bimestrale sono pubblicati i report statistici ...</p>\r\n</div>\r\n',1,'ban2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(127,202,'Dicono di noi','','<div class=\"sin\">\r\n<a href=\"index.php?option=com_content&view=article&id=69&Itemid=226\">\r\n<span class=\"fa fa-comments-o fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3>\r\n<a href=\"index.php?option=com_content&view=article&id=69&Itemid=226\">\r\nDicono di noi\r\n</a>\r\n</h3>\r\n	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit<span>...</span></p>\r\n</div>',1,'ban2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(128,203,'Inspire','','<div class=\"sin\">\r\n<a href=\"index.php?option=com_content&view=article&id=27&Itemid=189\">\r\n<span class=\"fa fa-globe fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3>\r\n<a href=\"index.php?option=com_content&view=article&id=27&Itemid=189\">\r\nInspire\r\n</a>\r\n</h3>\r\n	<p>Il servizio di ricerca del RNDT, basato sulle Specifiche OGC ...</p>\r\n</div>\r\n</a>',1,'ban3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(129,204,'Link utili','','<div class=\"sin\"><a href=\"index.php?option=com_content&view=article&id=91&Itemid=232\">\r\n<span class=\"fa fa-link fa-4x\"></span>\r\n</a>\r\n</div>\r\n<div class=\"des\">\r\n	<h3><a href=\"index.php?option=com_content&view=article&id=91&Itemid=232\">Link utili</a></h3>\r\n	<ul class=\"line line-icon\">\r\n		<li>INSPIRE\r\n		</li>\r\n		<li>INSPIRE Geoportal\r\n		</li>\r\n		<li>...</li>\r\n	</ul>\r\n</div>',1,'ban3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,1,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(130,205,'Lorem Ipsum','','<a href=\"index.php?option=com_content&view=article&id=134:arpa-piemonte-nuovo-nodo-della-rete-rndt&catid=7&Itemid=225\"><img src=\"images/modulo1.jpg\" alt=\"modulo1\" /><h3 class=\"blu\">Sedilo, dal cuore della Sardegna al RNDT</h3></a><span>Il piccolo paese, in provincia di Oristano, &egrave; il primo Comune ad alimentare il RNDT con i metadati dei propri dati e servizi attraverso il servizio CSW ...</span>',1,'modulo1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(131,206,'Lorem Ipsum','','<a href=\"index.php?option=com_content&view=article&id=135:agid-al-3-workshop-europeo-di-share-psi-2-0&catid=7&Itemid=225\" ><img src=\"images/modulo2.jpg\" alt=\"modulo2\" /><h3 class=\"blu\">AgID al 3&deg; workshop di \"Share-PSI 2.0\"</h3></a><span>AgID sar&agrave; fra i partecipanti del seminario \"Open Data Priorities and Engagement\", il 3&deg; workshop del progetto Share-PSI 2.0 dedicato agli open data nel settore pubblico ...</span>\r\n',1,'modulo2',43,'2017-02-22 16:46:07','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"0\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(132,230,'Dati territoriali','','',1,'sidebar-b',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,0,'{\"menutype\":\"dati-territoriali\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\" menu_contestuale b2\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(133,232,'Language switcher','','',1,'language',0,'0000-00-00 00:00:00','2017-01-24 10:47:42','0000-00-00 00:00:00',1,'mod_languages',1,1,'{\"header_text\":\"\",\"footer_text\":\"\",\"dropdown\":\"0\",\"dropdownimage\":\"1\",\"lineheight\":\"0\",\"image\":\"0\",\"show_active\":\"1\",\"full_name\":\"0\",\"inline\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
/*!40000 ALTER TABLE `l1pym_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_modules_menu`
--

DROP TABLE IF EXISTS `l1pym_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_modules_menu`
--

LOCK TABLES `l1pym_modules_menu` WRITE;
/*!40000 ALTER TABLE `l1pym_modules_menu` DISABLE KEYS */;
INSERT INTO `l1pym_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(17,0),(19,101),(23,101),(24,101),(25,101),(26,101),(27,103),(28,103),(29,103),(30,103),(31,0),(32,0),(33,0),(36,103),(38,0),(39,0),(40,0),(41,102),(41,104),(41,107),(41,123),(41,124),(41,125),(41,126),(41,127),(41,128),(41,129),(41,130),(41,137),(41,138),(41,139),(41,140),(41,145),(41,146),(41,147),(41,148),(41,149),(41,155),(41,156),(41,157),(41,158),(41,159),(41,160),(42,0),(43,103),(44,103),(45,104),(46,104),(47,104),(48,225),(49,107),(49,124),(49,128),(50,106),(51,106),(52,105),(53,102),(54,102),(55,102),(56,101),(57,0),(58,102),(58,103),(58,104),(58,108),(58,109),(58,110),(58,111),(58,112),(58,113),(58,114),(58,115),(58,116),(58,117),(58,118),(58,119),(58,120),(58,121),(58,122),(58,123),(58,166),(58,167),(58,168),(59,101),(60,101),(61,0),(65,101),(70,101),(71,103),(72,103),(73,103),(74,103),(76,141),(77,102),(77,103),(77,104),(77,108),(77,109),(77,110),(77,111),(77,112),(77,113),(77,114),(77,115),(77,116),(77,117),(77,118),(77,119),(77,120),(77,121),(77,122),(77,123),(77,166),(77,167),(77,168),(78,101),(80,0),(81,101),(82,101),(83,101),(84,101),(85,101),(86,101),(87,102),(87,108),(87,109),(87,110),(87,166),(87,167),(87,176),(87,182),(87,185),(87,189),(87,190),(87,191),(87,192),(87,193),(87,194),(87,195),(87,196),(87,197),(87,198),(87,199),(87,200),(87,201),(87,212),(87,213),(87,215),(87,217),(87,218),(87,219),(87,220),(87,221),(87,222),(87,224),(87,225),(87,226),(87,228),(87,229),(87,230),(87,231),(87,232),(87,238),(87,262),(87,263),(87,264),(87,265),(87,266),(87,267),(87,268),(87,269),(87,270),(87,271),(87,272),(87,273),(87,274),(87,275),(87,276),(87,277),(88,101),(89,101),(90,101),(91,101),(92,101),(93,101),(94,101),(95,-103),(96,-103),(97,-103),(98,-103),(99,-103),(100,-103),(103,103),(106,104),(107,101),(108,0),(109,101),(110,189),(110,212),(110,213),(110,214),(110,215),(111,176),(111,217),(111,218),(111,224),(111,226),(111,229),(111,232),(111,238),(112,0),(113,101),(114,101),(115,101),(116,101),(117,101),(118,101),(119,101),(120,0),(121,0),(122,0),(123,101),(124,101),(125,101),(126,101),(127,101),(128,101),(129,101),(130,101),(131,101),(132,274),(132,275),(132,276),(132,277),(133,0);
/*!40000 ALTER TABLE `l1pym_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_newsfeeds`
--

DROP TABLE IF EXISTS `l1pym_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_newsfeeds`
--

LOCK TABLES `l1pym_newsfeeds` WRITE;
/*!40000 ALTER TABLE `l1pym_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_osmap_items_settings`
--

DROP TABLE IF EXISTS `l1pym_osmap_items_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_osmap_items_settings` (
  `sitemap_id` int(11) unsigned NOT NULL,
  `uid` varchar(100) NOT NULL DEFAULT '',
  `settings_hash` char(32) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'weekly',
  `priority` float NOT NULL DEFAULT '0.5',
  `format` tinyint(1) unsigned DEFAULT NULL COMMENT 'Format of the setting: 1) Legacy Mode - UID Only; 2) Based on menu ID and UID',
  PRIMARY KEY (`sitemap_id`,`uid`,`settings_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_osmap_items_settings`
--

LOCK TABLES `l1pym_osmap_items_settings` WRITE;
/*!40000 ALTER TABLE `l1pym_osmap_items_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_osmap_items_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_osmap_sitemap_menus`
--

DROP TABLE IF EXISTS `l1pym_osmap_sitemap_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_osmap_sitemap_menus` (
  `sitemap_id` int(11) unsigned NOT NULL,
  `menutype_id` int(11) NOT NULL,
  `changefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL DEFAULT 'weekly',
  `priority` float NOT NULL DEFAULT '0.5',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sitemap_id`,`menutype_id`),
  KEY `idx_ordering` (`sitemap_id`,`ordering`),
  KEY `idx_sitemap_menus` (`sitemap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_osmap_sitemap_menus`
--

LOCK TABLES `l1pym_osmap_sitemap_menus` WRITE;
/*!40000 ALTER TABLE `l1pym_osmap_sitemap_menus` DISABLE KEYS */;
INSERT INTO `l1pym_osmap_sitemap_menus` VALUES (1,1,'weekly',0.5,0),(1,2,'weekly',0.5,1),(1,3,'weekly',0.5,2),(1,4,'weekly',0.5,3),(1,5,'weekly',0.5,4),(1,6,'weekly',0.5,5),(1,7,'weekly',0.5,7),(1,8,'weekly',0.5,6);
/*!40000 ALTER TABLE `l1pym_osmap_sitemap_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_osmap_sitemaps`
--

DROP TABLE IF EXISTS `l1pym_osmap_sitemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_osmap_sitemaps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `params` text,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `links_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `default_idx` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_osmap_sitemaps`
--

LOCK TABLES `l1pym_osmap_sitemaps` WRITE;
/*!40000 ALTER TABLE `l1pym_osmap_sitemaps` DISABLE KEYS */;
INSERT INTO `l1pym_osmap_sitemaps` VALUES (1,'Sitemap',NULL,1,1,'2015-03-29 10:39:35',0);
/*!40000 ALTER TABLE `l1pym_osmap_sitemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_overrider`
--

DROP TABLE IF EXISTS `l1pym_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_overrider`
--

LOCK TABLES `l1pym_overrider` WRITE;
/*!40000 ALTER TABLE `l1pym_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_postinstall_messages`
--

DROP TABLE IF EXISTS `l1pym_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_postinstall_messages`
--

LOCK TABLES `l1pym_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `l1pym_postinstall_messages` DISABLE KEYS */;
INSERT INTO `l1pym_postinstall_messages` VALUES (1,700,'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION','plg_twofactorauth_totp',1,'action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_condition','3.2.0',1),(2,700,'COM_CPANEL_MSG_EACCELERATOR_TITLE','COM_CPANEL_MSG_EACCELERATOR_BODY','COM_CPANEL_MSG_EACCELERATOR_BUTTON','com_cpanel',1,'action','admin://components/com_admin/postinstall/eaccelerator.php','admin_postinstall_eaccelerator_action','admin://components/com_admin/postinstall/eaccelerator.php','admin_postinstall_eaccelerator_condition','3.2.0',1),(3,700,'COM_CPANEL_MSG_PHPVERSION_TITLE','COM_CPANEL_MSG_PHPVERSION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/phpversion.php','admin_postinstall_phpversion_condition','3.2.2',1),(4,700,'COM_CPANEL_MSG_HTACCESS_TITLE','COM_CPANEL_MSG_HTACCESS_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/htaccess.php','admin_postinstall_htaccess_condition','3.4.0',1),(5,700,'COM_CPANEL_MSG_ROBOTS_TITLE','COM_CPANEL_MSG_ROBOTS_BODY','','com_cpanel',1,'message','','','','','3.3.0',1),(6,700,'COM_CPANEL_MSG_LANGUAGEACCESS340_TITLE','COM_CPANEL_MSG_LANGUAGEACCESS340_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/languageaccess340.php','admin_postinstall_languageaccess340_condition','3.4.1',1),(7,700,'COM_CPANEL_MSG_STATS_COLLECTION_TITLE','COM_CPANEL_MSG_STATS_COLLECTION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/statscollection.php','admin_postinstall_statscollection_condition','3.5.0',0),(8,700,'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME','PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY','PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION','plg_system_updatenotification',1,'action','site://plugins/system/updatenotification/postinstall/updatecachetime.php','updatecachetime_postinstall_action','site://plugins/system/updatenotification/postinstall/updatecachetime.php','updatecachetime_postinstall_condition','3.6.3',1),(9,700,'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE','COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/joomla40checks.php','admin_postinstall_joomla40checks_condition','3.7.0',1),(10,700,'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE','TPL_HATHOR_MESSAGE_POSTINSTALL_BODY','TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION','tpl_hathor',1,'action','admin://templates/hathor/postinstall/hathormessage.php','hathormessage_postinstall_action','admin://templates/hathor/postinstall/hathormessage.php','hathormessage_postinstall_condition','3.7.0',1);
/*!40000 ALTER TABLE `l1pym_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_redirect_links`
--

DROP TABLE IF EXISTS `l1pym_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_link_modifed` (`modified_date`),
  KEY `idx_old_url` (`old_url`(100))
) ENGINE=InnoDB AUTO_INCREMENT=5586 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_redirect_links`
--

LOCK TABLES `l1pym_redirect_links` WRITE;
/*!40000 ALTER TABLE `l1pym_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_calculations`
--

DROP TABLE IF EXISTS `l1pym_rsform_calculations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_calculations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `expression` text NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_calculations`
--

LOCK TABLES `l1pym_rsform_calculations` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_calculations` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_calculations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_component_type_fields`
--

DROP TABLE IF EXISTS `l1pym_rsform_component_type_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_component_type_fields` (
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldType` enum('hidden','hiddenparam','textbox','textarea','select','emailattach') NOT NULL DEFAULT 'hidden',
  `FieldValues` text NOT NULL,
  `Ordering` int(11) NOT NULL DEFAULT '0',
  KEY `ComponentTypeId` (`ComponentTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_component_type_fields`
--

LOCK TABLES `l1pym_rsform_component_type_fields` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_component_type_fields` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_component_type_fields` VALUES (11,'DEFAULTVALUE','textarea','',1),(11,'NAME','textbox','',1),(10,'COMPONENTTYPE','hidden','10',9),(10,'TEXT','textarea','',1),(10,'NAME','textbox','',1),(9,'PREFIX','textarea','',6),(9,'EMAILATTACH','emailattach','',102),(9,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(9,'COMPONENTTYPE','hidden','9',9),(9,'DESCRIPTION','textarea','',8),(9,'ADDITIONALATTRIBUTES','textarea','',7),(9,'ACCEPTEDFILES','textarea','',5),(9,'DESTINATION','textbox','//<code>\r\nreturn \'components/com_rsform/uploads/\';\r\n//</code>',6),(9,'REQUIRED','select','NO\r\nYES',4),(9,'FILESIZE','textbox','',3),(9,'CAPTION','textbox','',2),(9,'NAME','textbox','',1),(8,'IMAGETYPE','select','FREETYPE\r\nNOFREETYPE\r\nINVISIBLE',3),(8,'SIZE','textbox','15',12),(8,'REFRESHTEXT','textbox','REFRESH',11),(8,'SHOWREFRESH','select','NO\r\nYES',8),(8,'FLOW','select','VERTICAL\r\nHORIZONTAL',7),(8,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(8,'COMPONENTTYPE','hidden','8',9),(8,'DESCRIPTION','textarea','',9),(8,'ADDITIONALATTRIBUTES','textarea','style=\"text-align:center;width:75px;\"',7),(8,'TYPE','select','ALPHA\r\nNUMERIC\r\nALPHANUMERIC',6),(8,'TEXTCOLOR','textbox','#000000',5),(8,'BACKGROUNDCOLOR','textbox','#FFFFFF',4),(8,'LENGTH','textbox','4',3),(8,'CAPTION','textbox','',2),(8,'NAME','textbox','',1),(7,'BUTTONTYPE','select','TYPEINPUT\nTYPEBUTTON',6),(7,'COMPONENTTYPE','hidden','7',8),(7,'DESCRIPTION','textarea','',7),(7,'ADDITIONALATTRIBUTES','textarea','',6),(7,'RESETLABEL','textbox','',5),(7,'RESET','select','NO\r\nYES',4),(7,'LABEL','textbox','',3),(7,'CAPTION','textbox','',2),(7,'NAME','textbox','',1),(6,'DEFAULTVALUE','textarea','',2),(6,'MAXDATE','textarea','',5),(6,'MINDATE','textarea','',5),(6,'POPUPLABEL','textbox','...',6),(6,'READONLY','select','NO\r\nYES',6),(6,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(6,'COMPONENTTYPE','hidden','6',8),(6,'DESCRIPTION','textarea','',7),(6,'CALENDARLAYOUT','select','FLAT\r\nPOPUP',5),(6,'ADDITIONALATTRIBUTES','textarea','',6),(6,'DATEFORMAT','textbox','DDMMYYYY',4),(6,'VALIDATIONCALENDAR','select','//<code>\r\nreturn RSFormProHelper::getOtherCalendars();\r\n//</code>',4),(6,'REQUIRED','select','NO\r\nYES',3),(6,'CAPTION','textbox','',2),(6,'NAME','textbox','',1),(5,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(5,'COMPONENTTYPE','hidden','5',7),(5,'DESCRIPTION','textarea','',6),(5,'ADDITIONALATTRIBUTES','textarea','',6),(5,'REQUIRED','select','NO\r\nYES',5),(5,'FLOW','select','HORIZONTAL\r\nVERTICAL',4),(5,'ITEMS','textarea','',3),(5,'CAPTION','textbox','',2),(5,'NAME','textbox','',1),(4,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(4,'COMPONENTTYPE','hidden','4',7),(4,'DESCRIPTION','textarea','',6),(4,'ADDITIONALATTRIBUTES','textarea','',6),(4,'REQUIRED','select','NO\r\nYES',5),(4,'FLOW','select','HORIZONTAL\r\nVERTICAL',4),(4,'ITEMS','textarea','',3),(4,'CAPTION','textbox','',2),(4,'NAME','textbox','',1),(3,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(3,'COMPONENTTYPE','hidden','3',10),(3,'DESCRIPTION','textarea','',8),(3,'ADDITIONALATTRIBUTES','textarea','',7),(3,'REQUIRED','select','NO\r\nYES',6),(3,'ITEMS','textarea','',5),(3,'MULTIPLE','select','NO\r\nYES',4),(3,'SIZE','textbox','',3),(3,'CAPTION','textbox','',2),(3,'NAME','textbox','',1),(2,'VALIDATIONEXTRA','textbox','',6),(2,'WYSIWYG','select','NO\r\nYES',11),(2,'COMPONENTTYPE','hidden','2',10),(2,'DESCRIPTION','textarea','',10),(2,'DEFAULTVALUE','textarea','',9),(2,'ADDITIONALATTRIBUTES','textarea','',8),(2,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',7),(2,'VALIDATIONRULE','select','//<code>\r\nreturn RSgetValidationRules();\r\n//</code>',6),(2,'COLS','textbox','50',4),(2,'ROWS','textbox','5',5),(2,'REQUIRED','select','NO\r\nYES',3),(2,'CAPTION','textbox','',2),(2,'NAME','textbox','',1),(1,'VALIDATIONEXTRA','textbox','',6),(1,'COMPONENTTYPE','hidden','1',15),(1,'DESCRIPTION','textarea','',11),(1,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',7),(1,'ADDITIONALATTRIBUTES','textarea','',8),(1,'DEFAULTVALUE','textarea','',9),(0,'','hidden','',0),(1,'VALIDATIONRULE','select','//<code>\r\nreturn RSgetValidationRules();\r\n//</code>',6),(1,'NAME','textbox','',1),(1,'CAPTION','textbox','',2),(1,'REQUIRED','select','NO\r\nYES',3),(1,'SIZE','textbox','20',4),(1,'MAXSIZE','textbox','',5),(11,'ADDITIONALATTRIBUTES','textarea','',1),(11,'COMPONENTTYPE','hidden','11',9),(12,'COMPONENTTYPE','hidden','12',10),(12,'ADDITIONALATTRIBUTES','textarea','',9),(12,'RESETLABEL','textbox','',7),(12,'RESET','select','NO\r\nYES',6),(12,'IMAGERESET','textbox','',5),(12,'IMAGEBUTTON','textbox','',4),(12,'LABEL','textbox','',3),(12,'CAPTION','textbox','',2),(12,'NAME','textbox','',1),(12,'DESCRIPTION','textarea','',10),(13,'NAME','textbox','',1),(13,'CAPTION','textbox','',3),(13,'LABEL','textbox','',2),(13,'RESET','select','NO\r\nYES',6),(13,'RESETLABEL','textbox','',7),(13,'ADDITIONALATTRIBUTES','textarea','',9),(13,'COMPONENTTYPE','hidden','13',10),(13,'BUTTONTYPE','select','TYPEINPUT\nTYPEBUTTON',9),(13,'PREVBUTTON','textbox','//<code>\r\nreturn JText::_(\'PREV\');\r\n//</code>',8),(13,'DISPLAYPROGRESS','select','NO\r\nYES',8),(13,'DISPLAYPROGRESSMSG','textarea','<div>\r\n <p><em>Page <strong>{page}</strong> of {total}</em></p>\r\n <div class=\"rsformProgressContainer\">\r\n  <div class=\"rsformProgressBar\" style=\"width: {percent}%;\"></div>\r\n </div>\r\n</div>',8),(14,'NAME','textbox','',1),(14,'CAPTION','textbox','',2),(14,'REQUIRED','select','NO\r\nYES',3),(14,'SIZE','textbox','',4),(14,'MAXSIZE','textbox','',5),(14,'DEFAULTVALUE','textarea','',6),(14,'ADDITIONALATTRIBUTES','textarea','',7),(14,'COMPONENTTYPE','hidden','14',8),(14,'DESCRIPTION','textarea','',100),(14,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',100),(14,'VALIDATIONRULE','select','//<code>\r\nreturn RSgetValidationRules();\r\n//</code>',9),(14,'VALIDATIONEXTRA','textbox','',6),(15,'NAME','textbox','',1),(15,'LENGTH','textbox','8',4),(15,'ADDITIONALATTRIBUTES','textarea','',7),(15,'COMPONENTTYPE','hidden','15',8),(15,'CHARACTERS','select','ALPHANUMERIC\r\nALPHA\r\nNUMERIC',3),(41,'NAME','textbox','',1),(41,'COMPONENTTYPE','hidden','41',5),(41,'NEXTBUTTON','textbox','//<code>\r\nreturn JText::_(\'NEXT\');\r\n//</code>',2),(41,'PREVBUTTON','textbox','//<code>\r\nreturn JText::_(\'PREV\');\r\n//</code>',3),(41,'ADDITIONALATTRIBUTES','textarea','',4),(41,'VALIDATENEXTPAGE','select','NO\r\nYES',5),(41,'DISPLAYPROGRESS','select','NO\r\nYES',6),(41,'DISPLAYPROGRESSMSG','textarea','<div>\r\n <p><em>Page <strong>{page}</strong> of {total}</em></p>\r\n <div class=\"rsformProgressContainer\">\r\n  <div class=\"rsformProgressBar\" style=\"width: {percent}%;\"></div>\r\n </div>\r\n</div>',7),(211,'VALIDATION_ALLOW_INCORRECT_DATE','select','NO\r\nYES',0),(211,'NAME','textbox','',1),(211,'VALIDATIONRULE_DATE','select','//<code>\r\nreturn RSFormProHelper::getDateValidationRules();\r\n//</code>',1),(211,'CAPTION','textbox','',2),(211,'DESCRIPTION','textarea','',3),(211,'REQUIRED','select','NO\r\nYES',4),(211,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',5),(211,'DATEORDERING','select','DMY\r\nMDY\r\nYMD\r\nYDM\r\nMYD\r\nDYM',6),(211,'DATESEPARATOR','textbox',' / ',7),(211,'SHOWDAY','select','YES\r\nNO',8),(211,'SHOWDAYPLEASE','textbox','Day',9),(211,'SHOWDAYTYPE','select','DAY_TYPE_01\r\nDAY_TYPE_1',10),(211,'SHOWMONTH','select','YES\r\nNO',11),(211,'SHOWMONTHPLEASE','textbox','Month',12),(211,'SHOWMONTHTYPE','select','MONTH_TYPE_01\r\nMONTH_TYPE_1\r\nMONTH_TYPE_TEXT_SHORT\r\nMONTH_TYPE_TEXT_LONG',13),(211,'SHOWYEAR','select','YES\r\nNO',14),(211,'SHOWYEARPLEASE','textbox','Year',15),(211,'STARTYEAR','textbox','1960',16),(211,'ENDYEAR','textbox','2013',17),(211,'STORELEADINGZERO','select','NO\r\nYES',18),(211,'ADDITIONALATTRIBUTES','textarea','',18),(211,'COMPONENTTYPE','hidden','211',19),(212,'NAME','textbox','',0),(212,'CAPTION','textbox','',1),(212,'DESCRIPTION','textarea','',3),(212,'REQUIRED','select','NO\r\nYES',4),(212,'VALIDATIONMESSAGE','textarea','INVALIDINPUT',5),(212,'DEFAULTVALUE','textarea','',2),(212,'ADDITIONALATTRIBUTES','textarea','',6),(212,'MAPWIDTH','textbox','450px',7),(212,'MAPHEIGHT','textbox','300px',8),(212,'MAPCENTER','textbox','39.5500507,-105.7820674',9),(212,'COMPONENTTYPE','hidden','212',12),(212,'SIZE','textbox','20',13),(212,'MAPZOOM','textbox','10',10),(212,'MAPRESULT','select','ADDRESS\r\nCOORDINATES',12),(212,'GEOLOCATION','select','NO\r\nYES',11);
/*!40000 ALTER TABLE `l1pym_rsform_component_type_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_component_types`
--

DROP TABLE IF EXISTS `l1pym_rsform_component_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_component_types` (
  `ComponentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentTypeName` text NOT NULL,
  PRIMARY KEY (`ComponentTypeId`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_component_types`
--

LOCK TABLES `l1pym_rsform_component_types` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_component_types` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_component_types` VALUES (1,'textBox'),(2,'textArea'),(3,'selectList'),(4,'checkboxGroup'),(5,'radioGroup'),(6,'calendar'),(7,'button'),(8,'captcha'),(9,'fileUpload'),(10,'freeText'),(11,'hidden'),(12,'imageButton'),(13,'submitButton'),(14,'password'),(15,'ticket'),(41,'pageBreak'),(211,'birthDay'),(212,'gmaps');
/*!40000 ALTER TABLE `l1pym_rsform_component_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_components`
--

DROP TABLE IF EXISTS `l1pym_rsform_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_components` (
  `ComponentId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `Order` int(11) NOT NULL DEFAULT '0',
  `Published` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `ComponentId` (`ComponentId`),
  KEY `ComponentTypeId` (`ComponentTypeId`),
  KEY `FormId` (`FormId`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_components`
--

LOCK TABLES `l1pym_rsform_components` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_components` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_components` VALUES (1,1,2,5,1),(17,1,8,6,1),(3,1,1,1,1),(4,1,1,3,1),(5,1,1,4,1),(6,1,1,2,1),(8,1,13,7,1),(9,2,13,8,1),(10,2,3,5,1),(11,2,1,2,1),(12,2,1,4,1),(13,2,1,3,1),(14,2,2,7,1),(15,2,3,6,1),(16,2,1,1,1);
/*!40000 ALTER TABLE `l1pym_rsform_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_condition_details`
--

DROP TABLE IF EXISTS `l1pym_rsform_condition_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_condition_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `operator` varchar(16) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condition_id` (`condition_id`),
  KEY `component_id` (`component_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_condition_details`
--

LOCK TABLES `l1pym_rsform_condition_details` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_condition_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_condition_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_conditions`
--

DROP TABLE IF EXISTS `l1pym_rsform_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `action` varchar(16) NOT NULL,
  `block` tinyint(1) NOT NULL,
  `component_id` int(11) NOT NULL,
  `condition` varchar(16) NOT NULL,
  `lang_code` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `component_id` (`component_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_conditions`
--

LOCK TABLES `l1pym_rsform_conditions` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_config`
--

DROP TABLE IF EXISTS `l1pym_rsform_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_config` (
  `SettingName` varchar(64) NOT NULL DEFAULT '',
  `SettingValue` text NOT NULL,
  PRIMARY KEY (`SettingName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_config`
--

LOCK TABLES `l1pym_rsform_config` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_config` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_config` VALUES ('global.register.code',''),('global.debug.mode','0'),('global.iis','0'),('global.editor','1'),('global.codemirror','0'),('auto_responsive','1'),('global.date_mask','Y-m-d H:i:s'),('global.filtering','joomla'),('calculations.thousands',','),('calculations.decimal','.'),('calculations.nodecimals','2'),('request_timeout','0'),('backup.mask','backup-{domain}-{date}');
/*!40000 ALTER TABLE `l1pym_rsform_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_directory`
--

DROP TABLE IF EXISTS `l1pym_rsform_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_directory` (
  `formId` int(11) NOT NULL,
  `enablepdf` tinyint(1) NOT NULL,
  `enablecsv` tinyint(1) NOT NULL,
  `ViewLayout` longtext NOT NULL,
  `ViewLayoutName` text NOT NULL,
  `ViewLayoutAutogenerate` tinyint(1) NOT NULL,
  `CSS` text NOT NULL,
  `JS` text NOT NULL,
  `ListScript` text NOT NULL,
  `DetailsScript` text NOT NULL,
  `EmailsScript` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`formId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_directory`
--

LOCK TABLES `l1pym_rsform_directory` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_directory` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_directory_fields`
--

DROP TABLE IF EXISTS `l1pym_rsform_directory_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_directory_fields` (
  `formId` int(11) NOT NULL,
  `componentId` int(11) NOT NULL,
  `viewable` tinyint(1) NOT NULL,
  `searchable` tinyint(1) NOT NULL,
  `editable` tinyint(1) NOT NULL,
  `indetails` tinyint(1) NOT NULL,
  `incsv` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  UNIQUE KEY `formId` (`formId`,`componentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_directory_fields`
--

LOCK TABLES `l1pym_rsform_directory_fields` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_directory_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_directory_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_emails`
--

DROP TABLE IF EXISTS `l1pym_rsform_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `replyto` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_emails`
--

LOCK TABLES `l1pym_rsform_emails` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_forms`
--

DROP TABLE IF EXISTS `l1pym_rsform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_forms` (
  `FormId` int(11) NOT NULL AUTO_INCREMENT,
  `FormName` text NOT NULL,
  `FormLayout` longtext NOT NULL,
  `FormLayoutName` text NOT NULL,
  `FormLayoutAutogenerate` tinyint(1) NOT NULL DEFAULT '1',
  `CSS` text NOT NULL,
  `JS` text NOT NULL,
  `FormTitle` text NOT NULL,
  `ShowFormTitle` tinyint(1) NOT NULL DEFAULT '1',
  `Published` tinyint(1) NOT NULL DEFAULT '1',
  `Lang` varchar(255) NOT NULL DEFAULT '',
  `ReturnUrl` text NOT NULL,
  `ShowThankyou` tinyint(1) NOT NULL DEFAULT '1',
  `Thankyou` text NOT NULL,
  `ShowContinue` tinyint(1) NOT NULL DEFAULT '1',
  `UserEmailText` text NOT NULL,
  `UserEmailTo` text NOT NULL,
  `UserEmailCC` varchar(255) NOT NULL,
  `UserEmailBCC` varchar(255) NOT NULL,
  `UserEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `UserEmailReplyTo` varchar(255) NOT NULL,
  `UserEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `UserEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `UserEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `UserEmailAttach` tinyint(4) NOT NULL,
  `UserEmailAttachFile` varchar(255) NOT NULL,
  `AdminEmailText` text NOT NULL,
  `AdminEmailTo` text NOT NULL,
  `AdminEmailCC` varchar(255) NOT NULL,
  `AdminEmailBCC` varchar(255) NOT NULL,
  `AdminEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailReplyTo` varchar(255) NOT NULL,
  `AdminEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `ScriptProcess` text NOT NULL,
  `ScriptProcess2` text NOT NULL,
  `ScriptDisplay` text NOT NULL,
  `UserEmailScript` text NOT NULL,
  `AdminEmailScript` text NOT NULL,
  `AdditionalEmailsScript` text NOT NULL,
  `MetaTitle` tinyint(1) NOT NULL,
  `MetaDesc` text NOT NULL,
  `MetaKeywords` text NOT NULL,
  `Required` varchar(255) NOT NULL DEFAULT '(*)',
  `ErrorMessage` text NOT NULL,
  `MultipleSeparator` varchar(64) NOT NULL DEFAULT '\\n',
  `TextareaNewLines` tinyint(1) NOT NULL DEFAULT '1',
  `CSSClass` varchar(255) NOT NULL,
  `CSSId` varchar(255) NOT NULL DEFAULT 'userForm',
  `CSSName` varchar(255) NOT NULL,
  `CSSAction` text NOT NULL,
  `CSSAdditionalAttributes` text NOT NULL,
  `AjaxValidation` tinyint(1) NOT NULL,
  `ThemeParams` text NOT NULL,
  `Keepdata` tinyint(1) NOT NULL DEFAULT '1',
  `KeepIP` tinyint(1) NOT NULL DEFAULT '1',
  `Backendmenu` tinyint(1) NOT NULL,
  `ConfirmSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `Access` varchar(5) NOT NULL,
  PRIMARY KEY (`FormId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_forms`
--

LOCK TABLES `l1pym_rsform_forms` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_forms` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_forms` VALUES (1,'Modulo di segnalazione','<fieldset class=\"formFieldset\">\n<legend>{global:formtitle}</legend>\n{error}\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<ol class=\"formContainer\" id=\"rsform_1_page_0\">\n	<li class=\"rsform-block rsform-block-nome\">\n		<div class=\"formCaption\">{Nome:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Nome:body}<span class=\"formClr\">{Nome:validation}</span></div>\n		<div class=\"formDescription\">{Nome:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-citta\">\n		<div class=\"formCaption\">{Citta:caption}</div>\n		<div class=\"formBody\">{Citta:body}<span class=\"formClr\">{Citta:validation}</span></div>\n		<div class=\"formDescription\">{Citta:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-email\">\n		<div class=\"formCaption\">{Email:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Email:body}<span class=\"formClr\">{Email:validation}</span></div>\n		<div class=\"formDescription\">{Email:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-telefono\">\n		<div class=\"formCaption\">{Telefono:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Telefono:body}<span class=\"formClr\">{Telefono:validation}</span></div>\n		<div class=\"formDescription\">{Telefono:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-messaggio\">\n		<div class=\"formCaption\">{Messaggio:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Messaggio:body}<span class=\"formClr\">{Messaggio:validation}</span></div>\n		<div class=\"formDescription\">{Messaggio:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-captcha\">\n		<div class=\"formCaption\">{captcha:caption}</div>\n		<div class=\"formBody\">{captcha:body}<span class=\"formClr\">{captcha:validation}</span></div>\n		<div class=\"formDescription\">{captcha:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-invia\">\n		<div class=\"formCaption\">{Invia:caption}</div>\n		<div class=\"formBody\">{Invia:body}<span class=\"formClr\">{Invia:validation}</span></div>\n		<div class=\"formDescription\">{Invia:description}</div>\n	</li>\n</ol>\n</fieldset>\n','inline-xhtml',1,'','','Modulo di segnalazione',1,1,'it-IT','',1,'<p>Ti ringraziamo per averci contattato.</p>',1,'<div style=\"border: 1px solid #cccccc; margin: 5px;\" id=\"UserEmailText\">\r\n<p>Salve {FullName:value},</p>\r\n<p>avete ricevuto una richiesta di contatto. Rispondete il prima possibile a  {ContactBy:value} .</p>\r\n</div>','','','','','','','',1,0,'','<p><strong>Nome &nbsp;</strong>{Nome:value}</p>\r\n<p><strong>Citta &nbsp;</strong>{Citta:value}</p>\r\n<p><strong>Email &nbsp;</strong>{Email:value}</p>\r\n<p><strong>Telefono &nbsp;</strong>{Telefono:value}</p>\r\n<p><b>Messaggio &nbsp;</b>{Messaggio:value}</p>','rndt@digitpa.gov.it','','','{Email:value}','','{Nome:value}','Richiesta dal sito RNDT',1,'','','','','','',0,'','','(*)','','\\n',1,'','userForm','Modulo di segnalazione','','',1,'name=clean\nnum_css=1\ncss0=css/style.css',1,1,0,0,''),(2,'Richiedi informazioni copy','<fieldset class=\"formFieldset\">\n<legend>{global:formtitle}</legend>\n{error}\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<ol class=\"formContainer\" id=\"rsform_4_page_0\">\n	<li class=\"rsform-block rsform-block-nome\">\n		<div class=\"formCaption\">{Nome:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Nome:body}<span class=\"formClr\">{Nome:validation}</span></div>\n		<div class=\"formDescription\">{Nome:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-citta\">\n		<div class=\"formCaption\">{Citta:caption}</div>\n		<div class=\"formBody\">{Citta:body}<span class=\"formClr\">{Citta:validation}</span></div>\n		<div class=\"formDescription\">{Citta:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-email\">\n		<div class=\"formCaption\">{Email:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Email:body}<span class=\"formClr\">{Email:validation}</span></div>\n		<div class=\"formDescription\">{Email:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-telefono\">\n		<div class=\"formCaption\">{Telefono:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Telefono:body}<span class=\"formClr\">{Telefono:validation}</span></div>\n		<div class=\"formDescription\">{Telefono:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-come-ci-hai-trovato\">\n		<div class=\"formCaption\">{Come ci hai trovato:caption}</div>\n		<div class=\"formBody\">{Come ci hai trovato:body}<span class=\"formClr\">{Come ci hai trovato:validation}</span></div>\n		<div class=\"formDescription\">{Come ci hai trovato:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-budget\">\n		<div class=\"formCaption\">{Budget:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Budget:body}<span class=\"formClr\">{Budget:validation}</span></div>\n		<div class=\"formDescription\">{Budget:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-richiesta\">\n		<div class=\"formCaption\">{Richiesta:caption}<strong class=\"formRequired\">(*)</strong></div>\n		<div class=\"formBody\">{Richiesta:body}<span class=\"formClr\">{Richiesta:validation}</span></div>\n		<div class=\"formDescription\">{Richiesta:description}</div>\n	</li>\n	<li class=\"rsform-block rsform-block-richiedi-informazioni\">\n		<div class=\"formCaption\">{Richiedi informazioni:caption}</div>\n		<div class=\"formBody\">{Richiedi informazioni:body}<span class=\"formClr\">{Richiedi informazioni:validation}</span></div>\n		<div class=\"formDescription\">{Richiedi informazioni:description}</div>\n	</li>\n</ol>\n</fieldset>\n','inline-xhtml',1,'','','Richiedi informazioni copy',1,1,'it-IT','',1,'<p>Ti ringraziamo per averci contattato.</p>\r\n<p>Sarà nostra cura ricontattarti subito!!</p>',1,'<div style=\"border: 1px solid #cccccc; margin: 5px;\" id=\"UserEmailText\">\r\n<p>Salve {FullName:value},</p>\r\n<p>avete ricevuto una richiesta di contatto. Rispondete il prima possibile a  {ContactBy:value} .</p>\r\n</div>','','','','','','','',1,0,'','<p><strong>Nome  </strong>{Nome:value}</p>\r\n<p><strong>Citta  </strong>{Citta:value}</p>\r\n<p><strong>Email  </strong>{Email:value}</p>\r\n<p><strong>Telefono  </strong>{Telefono:value}</p>\r\n<p><strong>Come ci hai trovato  </strong>{Come ci hai trovato:value}</p>\r\n<p><strong>Budget </strong> {Budget:value}</p>\r\n<p><strong>Richiesta </strong> {Richiesta:value}</p>','info@fontecreativa.it','','','{Email:value}','','{Email:value}','Richiesta dal sito fontecreativa.it',1,'','','','','','',0,'','','(*)','','\\n',1,'','userForm','','','',1,'name=clean\nnum_css=1\ncss0=css/style.css',1,1,0,0,'');
/*!40000 ALTER TABLE `l1pym_rsform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_mappings`
--

DROP TABLE IF EXISTS `l1pym_rsform_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `connection` tinyint(1) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `method` tinyint(1) NOT NULL,
  `table` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `wheredata` text NOT NULL,
  `extra` text NOT NULL,
  `andor` text NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_mappings`
--

LOCK TABLES `l1pym_rsform_mappings` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_posts`
--

DROP TABLE IF EXISTS `l1pym_rsform_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_posts` (
  `form_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `method` tinyint(1) NOT NULL,
  `silent` tinyint(1) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_posts`
--

LOCK TABLES `l1pym_rsform_posts` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_properties`
--

DROP TABLE IF EXISTS `l1pym_rsform_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_properties` (
  `PropertyId` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentId` int(11) NOT NULL DEFAULT '0',
  `PropertyName` text NOT NULL,
  `PropertyValue` text NOT NULL,
  UNIQUE KEY `PropertyId` (`PropertyId`),
  KEY `ComponentId` (`ComponentId`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_properties`
--

LOCK TABLES `l1pym_rsform_properties` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_properties` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_properties` VALUES (1,1,'EMAILATTACH',''),(2,1,'ADDITIONALATTRIBUTES',''),(3,1,'WYSIWYG','NO'),(4,1,'ROWS','10'),(5,1,'COLS','50'),(6,1,'VALIDATIONMESSAGE','Input non valido'),(7,1,'VALIDATIONRULE','none'),(8,1,'VALIDATIONEXTRA',''),(9,1,'REQUIRED','YES'),(10,1,'DESCRIPTION',''),(11,1,'DEFAULTVALUE',''),(12,1,'CAPTION','Messaggio'),(13,1,'NAME','Messaggio'),(172,17,'BACKGROUNDCOLOR','#FFFFFF'),(171,17,'LENGTH','4'),(170,17,'IMAGETYPE','FREETYPE'),(169,17,'VALIDATIONMESSAGE','Input non valido'),(168,17,'DESCRIPTION',''),(167,17,'CAPTION',''),(164,8,'DISPLAYPROGRESS','NO'),(165,8,'BUTTONTYPE','TYPEINPUT'),(166,17,'NAME','captcha'),(163,8,'DISPLAYPROGRESSMSG',''),(24,3,'NAME','Nome'),(25,3,'CAPTION','Nome'),(26,3,'REQUIRED','YES'),(27,3,'SIZE','20'),(28,3,'MAXSIZE','50'),(29,3,'VALIDATIONRULE','none'),(30,3,'VALIDATIONMESSAGE','Invalid Input'),(31,3,'ADDITIONALATTRIBUTES',''),(32,3,'DEFAULTVALUE',''),(33,3,'DESCRIPTION',''),(34,4,'ADDITIONALATTRIBUTES',''),(35,4,'MAXSIZE',''),(36,4,'VALIDATIONRULE','email'),(37,4,'VALIDATIONMESSAGE','Invalid Input'),(38,4,'SIZE','20'),(39,4,'REQUIRED','YES'),(40,4,'CAPTION','E-mail'),(41,4,'NAME','Email'),(42,4,'DEFAULTVALUE',''),(43,4,'DESCRIPTION',''),(44,5,'NAME','Telefono'),(45,5,'CAPTION','Telefono'),(46,5,'REQUIRED','YES'),(47,5,'SIZE','20'),(48,5,'MAXSIZE','20'),(49,5,'VALIDATIONRULE','numeric'),(50,5,'VALIDATIONMESSAGE','Invalid Input'),(51,5,'ADDITIONALATTRIBUTES',''),(52,5,'DEFAULTVALUE',''),(53,5,'DESCRIPTION',''),(54,6,'NAME','Citta'),(55,6,'CAPTION','Città'),(56,6,'REQUIRED','NO'),(57,6,'SIZE','20'),(58,6,'MAXSIZE',''),(59,6,'VALIDATIONRULE','none'),(60,6,'VALIDATIONMESSAGE','Invalid Input'),(61,6,'ADDITIONALATTRIBUTES',''),(62,6,'DEFAULTVALUE',''),(63,6,'DESCRIPTION',''),(179,17,'ADDITIONALATTRIBUTES','style=\"text-align:center;width:75px;\"'),(178,17,'SIZE','15'),(177,17,'REFRESHTEXT','Aggiorna'),(174,17,'TYPE','ALPHA'),(175,17,'FLOW','VERTICAL'),(176,17,'SHOWREFRESH','NO'),(173,17,'TEXTCOLOR','#000000'),(74,8,'ADDITIONALATTRIBUTES',''),(75,8,'RESETLABEL',''),(76,8,'RESET','NO'),(77,8,'CAPTION',''),(78,8,'LABEL','Invia'),(79,8,'NAME','Invia'),(80,8,'PREVBUTTON',''),(81,8,'EMAILATTACH',''),(82,9,'ADDITIONALATTRIBUTES',''),(83,9,'RESETLABEL',''),(84,9,'RESET','NO'),(85,9,'CAPTION',''),(86,9,'LABEL','Richiedi informazioni'),(87,9,'NAME','Richiedi informazioni'),(88,9,'PREVBUTTON',''),(89,9,'EMAILATTACH',''),(90,10,'EMAILATTACH',''),(91,10,'ADDITIONALATTRIBUTES',''),(92,10,'MULTIPLE','NO'),(93,10,'SIZE',''),(94,10,'VALIDATIONMESSAGE','Input non valido'),(95,10,'REQUIRED','NO'),(96,10,'DESCRIPTION',''),(97,10,'ITEMS','Motori di ricerca\r\nPubblicità su quotidiani/riviste\r\nPubblicità su web\r\nContatto di amici/collaboratori\r\nAltro\r\n'),(98,10,'CAPTION','Come ci hai trovato?'),(99,10,'NAME','Come ci hai trovato'),(100,11,'NAME','Citta'),(101,11,'CAPTION','Città'),(102,11,'REQUIRED','NO'),(103,11,'SIZE','20'),(104,11,'MAXSIZE',''),(105,11,'VALIDATIONRULE','none'),(106,11,'VALIDATIONMESSAGE','Invalid Input'),(107,11,'ADDITIONALATTRIBUTES',''),(108,11,'DEFAULTVALUE',''),(109,11,'DESCRIPTION',''),(110,12,'NAME','Telefono'),(111,12,'CAPTION','Telefono'),(112,12,'REQUIRED','YES'),(113,12,'SIZE','20'),(114,12,'MAXSIZE','20'),(115,12,'VALIDATIONRULE','numeric'),(116,12,'VALIDATIONMESSAGE','Invalid Input'),(117,12,'ADDITIONALATTRIBUTES',''),(118,12,'DEFAULTVALUE',''),(119,12,'DESCRIPTION',''),(120,13,'ADDITIONALATTRIBUTES',''),(121,13,'MAXSIZE',''),(122,13,'VALIDATIONRULE','email'),(123,13,'VALIDATIONMESSAGE','Invalid Input'),(124,13,'SIZE','20'),(125,13,'REQUIRED','YES'),(126,13,'CAPTION','E-mail'),(127,13,'NAME','Email'),(128,13,'DEFAULTVALUE',''),(129,13,'DESCRIPTION',''),(130,14,'EMAILATTACH',''),(131,14,'ADDITIONALATTRIBUTES',''),(132,14,'WYSIWYG','NO'),(133,14,'ROWS','10'),(134,14,'COLS','50'),(135,14,'VALIDATIONMESSAGE','Input non valido'),(136,14,'VALIDATIONRULE','none'),(137,14,'VALIDATIONEXTRA',''),(138,14,'REQUIRED','YES'),(139,14,'DESCRIPTION',''),(140,14,'DEFAULTVALUE',''),(141,14,'CAPTION','Richiesta'),(142,14,'NAME','Richiesta'),(143,15,'EMAILATTACH',''),(144,15,'ADDITIONALATTRIBUTES',''),(145,15,'MULTIPLE','NO'),(146,15,'SIZE',''),(147,15,'VALIDATIONMESSAGE','Input non valido'),(148,15,'REQUIRED','YES'),(149,15,'DESCRIPTION',''),(150,15,'ITEMS','Qualsiasi Budget\r\nfino a 2.000€\r\nda 2.000 - 5.000€\r\n5.000€ - 10.000€\r\n10.000€ - 25.000€\r\n25.000€ - 50.000€\r\noltre 50.000€'),(151,15,'CAPTION','Budget'),(152,15,'NAME','Budget'),(153,16,'NAME','Nome'),(154,16,'CAPTION','Nome'),(155,16,'REQUIRED','YES'),(156,16,'SIZE','20'),(157,16,'MAXSIZE','50'),(158,16,'VALIDATIONRULE','none'),(159,16,'VALIDATIONMESSAGE','Invalid Input'),(160,16,'ADDITIONALATTRIBUTES',''),(161,16,'DEFAULTVALUE',''),(162,16,'DESCRIPTION',''),(180,17,'EMAILATTACH','');
/*!40000 ALTER TABLE `l1pym_rsform_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_submission_columns`
--

DROP TABLE IF EXISTS `l1pym_rsform_submission_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_submission_columns` (
  `FormId` int(11) NOT NULL,
  `ColumnName` varchar(255) NOT NULL,
  `ColumnStatic` tinyint(1) NOT NULL,
  PRIMARY KEY (`FormId`,`ColumnName`,`ColumnStatic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_submission_columns`
--

LOCK TABLES `l1pym_rsform_submission_columns` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_submission_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_rsform_submission_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_submission_values`
--

DROP TABLE IF EXISTS `l1pym_rsform_submission_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_submission_values` (
  `SubmissionValueId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL,
  `SubmissionId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldValue` text NOT NULL,
  PRIMARY KEY (`SubmissionValueId`),
  KEY `FormId` (`FormId`),
  KEY `SubmissionId` (`SubmissionId`)
) ENGINE=MyISAM AUTO_INCREMENT=825 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_submission_values`
--

LOCK TABLES `l1pym_rsform_submission_values` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_submission_values` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_submission_values` VALUES (1,1,1,'Nome','ciasullo'),(2,1,1,'Citta',''),(3,1,1,'Email','ciasullo@digitpa.gov.it'),(4,1,1,'Telefono','3204329574'),(5,1,1,'Messaggio','prova1'),(6,1,1,'captcha','acyt'),(7,1,1,'Invia','Invia'),(8,1,1,'formId','1'),(9,1,2,'Nome','Antonio'),(10,1,2,'Citta',''),(11,1,2,'Email','antonio.rotundo@digitpa.gov.it'),(12,1,2,'Telefono','3382617429'),(13,1,2,'Messaggio','ciao'),(14,1,2,'captcha','ssqk'),(15,1,2,'Invia','Invia'),(16,1,2,'formId','1'),(17,1,3,'Nome','gabriele'),(18,1,3,'Citta',''),(19,1,3,'Email','ciasullo@digitpa.gov.it'),(20,1,3,'Telefono','3204329574'),(21,1,3,'Messaggio','prova 1'),(22,1,3,'captcha','djoj'),(23,1,3,'Invia','Invia'),(24,1,3,'formId','1'),(25,1,4,'Nome','gabriele'),(26,1,4,'Citta',''),(27,1,4,'Email','ciasullo@digitpa.gov.it'),(28,1,4,'Telefono','3204329574'),(29,1,4,'Messaggio','prova da rndt'),(30,1,4,'captcha','xynp'),(31,1,4,'Invia','Invia'),(32,1,4,'formId','1'),(33,1,5,'Nome','Antonio'),(34,1,5,'Citta',''),(35,1,5,'Email','antonio.rotundo@digitpa.gov.it'),(36,1,5,'Telefono','338'),(37,1,5,'Messaggio','ciao'),(38,1,5,'captcha','fycn'),(39,1,5,'Invia','Invia'),(40,1,5,'formId','1'),(41,1,6,'Nome','Antonio'),(42,1,6,'Citta',''),(43,1,6,'Email','antonio.rotundo@digitpa.gov.it'),(44,1,6,'Telefono','035776'),(45,1,6,'Messaggio','rtyrtjryjsrky'),(46,1,6,'captcha','ldhc'),(47,1,6,'Invia','Invia'),(48,1,6,'formId','1'),(49,1,7,'Nome','Antonio'),(50,1,7,'Citta',''),(51,1,7,'Email','antonio.rotundo@digitpa.gov.it'),(52,1,7,'Telefono','06'),(53,1,7,'Messaggio','dfhgedhy ergherh'),(54,1,7,'captcha','jwiq'),(55,1,7,'Invia','Invia'),(56,1,7,'formId','1'),(57,1,8,'Nome','alessio deligia'),(58,1,8,'Citta','roma'),(59,1,8,'Email','deligia.alessio@gmail.com'),(60,1,8,'Telefono','3402753416'),(61,1,8,'Messaggio','test'),(62,1,8,'captcha','eafm'),(63,1,8,'Invia','Invia'),(64,1,8,'formId','1'),(65,1,9,'Nome','Stefano Iacovella'),(66,1,9,'Citta','Roma'),(67,1,9,'Email','stefano.iacovella@gmail.com'),(68,1,9,'Telefono','3299412332'),(69,1,9,'Messaggio','Buongiorno\r\n\r\nvolevo segnalare che la consultazione estesa, con mappa, non sembra funzionare su browser Chrome rel. 18.x su windows 7.\r\nE\' in programma un fixing del problema?\r\n\r\nBuona giornata\r\n\r\nStefano Iacovella'),(70,1,9,'captcha','meli'),(71,1,9,'Invia','Invia'),(72,1,9,'formId','1'),(73,1,10,'Nome','luca corsato'),(74,1,10,'Citta','venezia'),(75,1,10,'Email','luca.corsato@comune.venezia.it'),(76,1,10,'Telefono','3339187853'),(77,1,10,'Messaggio','complimenti per il sito. Fate riferimento all\'uso di tecnologie opensource: avete usato semplicemente html5 e css3 oppure avete usato anche dei cms? sarà possibile in futuro scaricare la struttura del sito per poterlo adattare anche nelle amministrazioni locali? grazie mille'),(78,1,10,'captcha','wliv'),(79,1,10,'Invia','Invia'),(80,1,10,'formId','1'),(81,1,11,'Nome','antonio'),(82,1,11,'Citta',''),(83,1,11,'Email','antonio.rotundo@digitpa.gov.it'),(84,1,11,'Telefono','035776'),(85,1,11,'Messaggio','cccc'),(86,1,11,'captcha','zumw'),(87,1,11,'Invia','Invia'),(88,1,11,'formId','1'),(89,1,12,'Nome','Emiliano'),(90,1,12,'Citta','Vernio'),(91,1,12,'Email','e.baldi@cmvaldibisenzio.it'),(92,1,12,'Telefono','05749312229'),(93,1,12,'Messaggio','Buongiorno, \r\nchi vi scrive è il responsabile del Servzio Civile Regionale dell\'Unione dei Comuni della Val di Bisenzio.\r\nNell\'ambito del progetto di Servzio Civile Regionale \"Loaded -  database terriotoriali per la protezioen civile\" i volontari in forza al progetto hanno raccolto e gereferenziati dati legati al Piano Intercomunale di protezione Civile, es: \r\nPunti di sosta sicuri, Farmacie, posti letto, viabilità in sicurezza sulla base di diversi scenari di rischio, intomabmento di torrenti e fiumi.\r\nLa domanda che vi pongo è la seguente:  possiamo utilizzare il portale RNDT per la pubblicazione dei dati suddetti  già georeferenziati?\r\nSe si come possimo pubblicarli???\r\n\r\nNell\'attesa di una vostra  sollecita risposta, cordiali saluti.\r\n\r\nEmiliano Baldi\r\nUnione dei Comuni della Val di Bisenzio\r\n\r\n'),(94,1,12,'captcha','iznj'),(95,1,12,'Invia','Invia'),(96,1,12,'formId','1'),(97,1,13,'Nome','Leonardo'),(98,1,13,'Citta','Tezza'),(99,1,13,'Email','tezza.leonardo@tiscali.it'),(100,1,13,'Telefono','3687208235'),(101,1,13,'Messaggio','Mi sono imbattuto quasi per caso nel portale RNDT e vorrei sapere se ee eventualmente come, sia possibile esportare dati territoriali per essere utilizzati per applicazioni GIS. Grazie, Leonardo Tezza (VR)'),(102,1,13,'captcha','ldkb'),(103,1,13,'Invia','Invia'),(104,1,13,'formId','1'),(105,1,14,'Nome','Maurizio Motta'),(106,1,14,'Citta','Torino'),(107,1,14,'Email','maurizio.mottam@libero.it'),(108,1,14,'Telefono','011488164'),(109,1,14,'Messaggio','Potreste per cortesia farmi sapere se sono già registrati dati relativi alle condizioni di salute della popolazione, oppure a problemi di natura sociale (ad esempio povertà)? Oppure se sono in previsione registrazioni su questi temi?\r\nGrazie'),(110,1,14,'captcha','bstt'),(111,1,14,'Invia','Invia'),(112,1,14,'formId','1'),(113,1,15,'Nome','Federica Barattieri'),(114,1,15,'Citta',''),(115,1,15,'Email','federica.barattieri@adbpo.it'),(116,1,15,'Telefono','0521276240'),(117,1,15,'Messaggio','Il nostro obiettivo è creare un nuovo xml utilizzando l\'Editor Metadati. A seguito della compilazione della form newMetadatoForm il tasto Invia presenta il messaggio \"Nessun metadato trovato. Riprovare.\" e sembra che cerchi un metadato esistente anziché crearne uno nuovo come ci aspettiamo. Come si usa la form di inserimento dei metadati?\r\nGrazie'),(118,1,15,'captcha','lyzg'),(119,1,15,'Invia','Invia'),(120,1,15,'formId','1'),(121,1,16,'Nome','rami alsaeh'),(122,1,16,'Citta','kuwait'),(123,1,16,'Email','r.a.m.i.1990@hotmail.com'),(124,1,16,'Telefono','0096565191357'),(125,1,16,'Messaggio','plz  send 2 me more info about us   ,,,,,,,,,,,  gracia'),(126,1,16,'captcha','ibeu'),(127,1,16,'Invia','Invia'),(128,1,16,'formId','1'),(129,1,17,'Nome','Raimondo Barbieri'),(130,1,17,'Citta',''),(131,1,17,'Email','raimondo.barbieri@regione.basilicata.it'),(132,1,17,'Telefono','0971668128'),(133,1,17,'Messaggio','Gentili Signori siamo registrati come ente nell\'indice delle Pubbliche Amministrazioni (Codice abb_) ma non riusciamo ad accedere ai servizi di editing ed invio dei metadati presenti sul vostro sito.\r\nPotreste indicarci i passaggi necessari per l\'accreditamento presso di voi?\r\nraimondo barbieri\r\nAutorità di Bacino della Basilicata\r\n'),(134,1,17,'captcha','jixd'),(135,1,17,'Invia','Invia'),(136,1,17,'formId','1'),(137,1,18,'Nome','Grippo Anna Maria'),(138,1,18,'Citta','Potenza'),(139,1,18,'Email','annamaria.grippo@regione.basilicata.it'),(140,1,18,'Telefono','0971668324'),(141,1,18,'Messaggio','Buongiorno,\r\nsono il responsabile della posizione organizzativa che si occupana in regione Basilicata della piattaforma e del catalogo regionale dei dati territoriali, avrei necessità di capire come fare per trasmettere i miei dati in modo automatico sul repertorio nazionale. Premetto che non mi sono ancora accreditata e che essendo la materia ancora un po\' in fase sperimentale avrei la necessità di un contatto telefonico per meglio valutare la migliore organizzazione da creare. preciso inoltre che il catalogo da noi messo in linea è realizzato con geonetwork e siamo allineati alla normativa compresi gli ultimi aggiornamenti. \r\nI miei recapiti sono i seguenti:\r\nAnna Maria Grippo\r\nannamaria.grippo@regione.basilicata.it\r\ntel 0971.668324'),(142,1,18,'captcha','xups'),(143,1,18,'Invia','Invia'),(144,1,18,'formId','1'),(145,1,19,'Nome','Federica Barattieri'),(146,1,19,'Citta','Parma'),(147,1,19,'Email','federica.barattieri@adbpo.it'),(148,1,19,'Telefono','0521276240'),(149,1,19,'Messaggio','Obiettivo: trasmettere il file xml creato con l\'editor. Nome della sessione = AcqueSuperficiali\r\nAlla funzione di validazione il sistema risponde =  Risultato validazione Nessun errore da segnalare.\r\nSe utilizzo l\'icona per trasmettere il sistema risponde = Risultato caricamento Errori 	Riscontrati: 1 [null - null] org.cnipa.rndt.strutture.Exception.RNDTXMLErrorException: org.hibernate.NonUniqueResultException: query did not return a unique result: 2\r\nCosa devo fare?\r\n\r\n'),(150,1,19,'captcha','vfub'),(151,1,19,'Invia','Invia'),(152,1,19,'formId','1'),(153,1,20,'Nome','Ruben Durante'),(154,1,20,'Citta',''),(155,1,20,'Email','duranteruben@gmail.com'),(156,1,20,'Telefono','0033663650713'),(157,1,20,'Messaggio','Buongiorno, mi chiamo Ruben Durante e sono un docente universitario presso l\'università di Parigi (Francia). Vi scrivo per chiedervi informazioni circa la disponibilità presso i vostri archivi di file geografici relativi alla rete stradale e viaria italiana (strade primarie e secondarie) di cui avrei bisogno per una ricerca che sto conducendo. Grazie sin d\'ora per il vostro aiuto.\r\n\r\nRuben Durante'),(158,1,20,'captcha','bffk'),(159,1,20,'Invia','Invia'),(160,1,20,'formId','1'),(161,1,21,'Nome','Pietro Baldan'),(162,1,21,'Citta','Rubano'),(163,1,21,'Email','pietrobaldan@rubano.it'),(164,1,21,'Telefono','0498739247'),(165,1,21,'Messaggio','Sono un dipendente del Comune di Rubano PD e mi occupo di conservazione ed implementazione di banche dati geografiche.\r\nHo chiesto in questi giorni al GSE, che attraverso il portale ATLASOLE rende disponibili i dati delle istallazioni del comune in formato xls, di poter avere gli stessi dati anche in formato gis compatibile.  la risposta è stata la seguente \"ci dispiace ma non disponiamo dei dati puntuali relativi agli impianti fotovoltaici.\" \r\nPer quanto mi è dato di conoscere il GSE dispone per ogni impianto delle coordinate geografiche.\r\nMi pare che la risposta sia alquanto vaga e contradditoria rispetto alle finalità dichiarate dallo stesso \" Il GSE, nell’ambito delle attività previste dall’art. 40 del D.Lgs. 28/2011 di monitoraggio delle fonti rinnovabili, ha realizzato un sistema informativo geografico “ATLASOLE” contenente dati e informazioni sugli impianti fotovoltaici che hanno fatto richiesta di incentivo mediante il Conto Energia (CE).\" Mi chiedevo se in qualche modo questo non contravviene all\'art. 50 del Codice PA Digitale. Puntualizzo che i dati richiesti erano finalizzati alla conoscenza dell\'evoluzione degli impianti fotovoltaici del territorio per poter monitorare i risultati del PAES Piane d\'Azione per l\'Energia Sostenibile.\r\nGrato se poteste fornirmi indicazioni o suggerimenti.\r\nCordiali saluti\r\narch. Pietro Baldan\r\n'),(166,1,21,'captcha','oufs'),(167,1,21,'Invia','Invia'),(168,1,21,'formId','1'),(169,1,22,'Nome','Tonino Conti'),(170,1,22,'Citta','Jesi'),(171,1,22,'Email','t.conti@comune.jesi.an.it'),(172,1,22,'Telefono','0731538312'),(173,1,22,'Messaggio','Buongiorno, circa due mesi fa ho iniziato il caricamento dei metadati relativi a tre dataset.\r\nPer uno di questi ho fatto la validazione e l\'invio mentre gli altri due erano ancora da validare.\r\nHo provato a vedere se erano in catalogo ma non li ho trovati.\r\nCosa posso aver sbagliato?\r\nCordialmente\r\nTonino Conti\r\nSIT Comune di Jesi'),(174,1,22,'captcha','trex'),(175,1,22,'Invia','Invia'),(176,1,22,'formId','1'),(177,1,23,'Nome','Camillo Zanini'),(178,1,23,'Citta','San Giuliano Milanese'),(179,1,23,'Email','fazzyuk@yahoo.com'),(180,1,23,'Telefono','02'),(181,1,23,'Messaggio','Le potenzialità del catalogo sono enormi peccato che l\'usabilità è pessima. Per favore investite risorse su user test e migliorie sull\'usabilità. Aggiungete un modulo di segnalazione di malfunzionamenti e feedback che vi aiuti ad implementare rapidamente le modifiche. Alcune modalità di ricerca danno risultati errati, le keyword sono utilizzate in modo disomogeneo, le liste di risultati sono difficilmente utilizzabili per esempio c\'è il nome del dato ma non quello dell\'area geografica di riferimento.. solo per citare alcuni elementi che da soli rendono quasi inutilizzabile il catalogo..\r\nGrazie per l\'attenzione.\r\nCordiali Saluti\r\nCamillo Zanini'),(182,1,23,'captcha','zcpq'),(183,1,23,'Invia','Invia'),(184,1,23,'formId','1'),(185,1,24,'Nome','Alberto Vaquer'),(186,1,24,'Citta',''),(187,1,24,'Email','a.vaquer@riteco.it'),(188,1,24,'Telefono','3357527764'),(189,1,24,'Messaggio','usando il l\'indirizzo del csw si riesce a collegarsi senza problemi.\r\nfacendo la ricerca di un tema si presenta il seguente errore:\r\n\"Errore del server:500 Internal Server Error\"\r\ncome mai?\r\ngrazie'),(190,1,24,'captcha','nlzz'),(191,1,24,'Invia','Invia'),(192,1,24,'formId','1'),(193,1,25,'Nome','Massimo Orciani'),(194,1,25,'Citta','Ancona'),(195,1,25,'Email','m.orciani@provincia.ancona.it'),(196,1,25,'Telefono','0715894418'),(197,1,25,'Messaggio','Purtroppo non riesco ad accedere con le credenziali inviate.\r\nGrazie.'),(198,1,25,'captcha','mdnj'),(199,1,25,'Invia','Invia'),(200,1,25,'formId','1'),(201,1,26,'Nome','Eugenio Trumpy'),(202,1,26,'Citta',''),(203,1,26,'Email','e.trumpy@igg.cnr.it'),(204,1,26,'Telefono','0506212324'),(205,1,26,'Messaggio','Buongiorno,\r\n\r\namministro una infrastruttura dati territoriali corredata di catalogo metadati. Vorrei poter rendere i metadati RNDT e INSPIRE compliant.\r\nEsiste uno template metadati che posso utilizzare nel mio gestore (geonetwork), così da allinearmi alle normative?\r\nSe si dove lo posso trovare/utilizzare?\r\n\r\nGrazie\r\n\r\nEugenio Trumpy'),(206,1,26,'captcha','qqdu'),(207,1,26,'Invia','Invia'),(208,1,26,'formId','1'),(209,1,27,'Nome','Giovanni Virdis'),(210,1,27,'Citta','sassari'),(211,1,27,'Email','g.virdis@riteco.it'),(212,1,27,'Telefono','0795905991'),(213,1,27,'Messaggio','Salve il caricamento del vostro CSW http://www.rndt.gov.it/RNDT/CSW) su mapstore viene eseguito con successo però poi viene restituito un errore quando si ricercano i dati. Il problema dovrebbe dipendere da alcune differenze tra il formato della vs richiesta e quello di mapstore.Potreste darmi qualche informazioni  e/o aiuto in merito\r\n\r\nGrazie'),(214,1,27,'captcha','xopr'),(215,1,27,'Invia','Invia'),(216,1,27,'formId','1'),(217,1,28,'Nome','vernier'),(218,1,28,'Citta','fransa'),(219,1,28,'Email','christian.vernier1@free.fr'),(220,1,28,'Telefono','0033677470364'),(221,1,28,'Messaggio','Hello,\r\n\r\nI’m looking for a map set about eurovelo n°5, (via Romea Francigena).\r\nWould you be so kind to inform me where I can find such kind of map, or any information about road to travel with bicycle from Switzerland to Roma.\r\n\r\nThanks in advance.\r\nBest regards.\r\nChris vernier\r\n'),(222,1,28,'captcha','khia'),(223,1,28,'Invia','Invia'),(224,1,28,'formId','1'),(225,1,29,'Nome','GAUDIOSO'),(226,1,29,'Citta','OLEGGIO'),(227,1,29,'Email','NOEE035001@ISTRUZIONE.IT'),(228,1,29,'Telefono','032191335'),(229,1,29,'Messaggio','IN RIFERIMENTO ALL\'ADEMPIMENTO PREVISTO DAL DECRETO 90/2014, QUALI SONO I DATI DA INSERIRE? ESISTE UN MANUALE O FAC SIMILE? COSA SI INTENDE PER BASI DATI?'),(230,1,29,'captcha','lwqi'),(231,1,29,'Invia','Invia'),(232,1,29,'formId','1'),(233,1,30,'Nome','CANTELLO GIOVANNA'),(234,1,30,'Citta','IVREA'),(235,1,30,'Email','TOIC8AB00N@pec.istruzione.it'),(236,1,30,'Telefono','0125641088'),(237,1,30,'Messaggio','SIAMO UNA SCUOLA E PONIAMO I SEGUENTI QUESITI:\r\n1-SIAMO TENUTI A COMUNICARE L\'ELENCO DELLE BASI E DEGLI APPLICATIVI?\r\n2-SCORRENDO TUTTO IL VS SITO NON ABBIAMO TROVATO UN MANUALE DI SPIEGAZIONE DEL MODELLO PER L\'INSERIMENTO DATI\r\n'),(238,1,30,'captcha','kvep'),(239,1,30,'Invia','Invia'),(240,1,30,'formId','1'),(241,1,31,'Nome','COMUNE DI BATTUDA'),(242,1,31,'Citta',''),(243,1,31,'Email','comune.battuda@pec.provincia.pv.it'),(244,1,31,'Telefono','0382926031'),(245,1,31,'Messaggio','Buongiorno,\r\ncon la presente si chiede quanto tempo occorra, per ricevere le credenziali di accesso, dalla data di protocollazione del modulo di accreditamento.\r\nGrazie'),(246,1,31,'captcha','iyuv'),(247,1,31,'Invia','Invia'),(248,1,31,'formId','1'),(249,1,32,'Nome','GIUDITTA MASCHERI'),(250,1,32,'Citta','CREMENO'),(251,1,32,'Email','ragioneria@comune.cremeno.lc'),(252,1,32,'Telefono','0341996113'),(253,1,32,'Messaggio','buongiorno, devo registrarmi come PA per l\'invio della basi dati AGID scadenza 18/09/2014 e vorrei sapere come devo fare. Grazie Giuditta Mascheri'),(254,1,32,'captcha','vkul'),(255,1,32,'Invia','Invia'),(256,1,32,'formId','1'),(257,1,33,'Nome','Giuseppe Chielli'),(258,1,33,'Citta',''),(259,1,33,'Email','g.chielli@innova.puglia.it'),(260,1,33,'Telefono','0804670399'),(261,1,33,'Messaggio','Con la presente chiedo di ricevere aggiornamenti circa la pubblicazione di nuovi numeri della newsletter.\r\nSaluti.\r\n\r\nGiuseppe Chielli'),(262,1,33,'captcha','gqxd'),(263,1,33,'Invia','Invia'),(264,1,33,'formId','1'),(265,1,34,'Nome','Gloria Galli'),(266,1,34,'Citta','Blera'),(267,1,34,'Email','gloria@gallilab.it'),(268,1,34,'Telefono','3493572771'),(269,1,34,'Messaggio','Le Istituzioni Scolastiche, in quanto PA, hanno l\'obbligo di comunicazione dell\'elenco della basi di dati territoriali?\r\nA mio giudizio incorrono solo nell\'obbligo di comunicazione di quelli non territoriali.'),(270,1,34,'captcha','etdk'),(271,1,34,'Invia','Invia'),(272,1,34,'formId','1'),(273,1,35,'Nome','Giorgio Balzan'),(274,1,35,'Citta','Belluno'),(275,1,35,'Email','gbalzan@sitbelluno.it'),(276,1,35,'Telefono','3357520396'),(277,1,35,'Messaggio','CORTESEMENTE HO BISOGNO DI ALCUNE INFORMAZIONI PER MODALITA\' ACCREDITAMENTO E TRASMISSIONE DANCA DATI ART. 24 QUATER'),(278,1,35,'captcha','qpzc'),(279,1,35,'Invia','Invia'),(280,1,35,'formId','1'),(281,1,36,'Nome','Fabrizio Vanzulli'),(282,1,36,'Citta','Milano'),(283,1,36,'Email','fabrizio.vanzulli@enel.com'),(284,1,36,'Telefono','0223208243'),(285,1,36,'Messaggio','Buongiorno, gradirei avere notifica di pubblicazione dei nuovi numeri, facendo parte del \"GDL 8 Cartografia - Agenzia per l\'Italia Digitale\"'),(286,1,36,'captcha','asls'),(287,1,36,'Invia','Invia'),(288,1,36,'formId','1'),(289,1,37,'Nome','MARCO'),(290,1,37,'Citta','PICCI'),(291,1,37,'Email','marco.picci@agenziaentrate.it'),(292,1,37,'Telefono','3472690960'),(293,1,37,'Messaggio','Per ricevere la notifica di pubblicazione dei nuovi numeri di \"RNDT news\", la newsletter del RNDT.\r\n'),(294,1,37,'captcha','mabw'),(295,1,37,'Invia','Invia'),(296,1,37,'formId','1'),(297,1,38,'Nome','Andrea'),(298,1,38,'Citta','Chelossi'),(299,1,38,'Email','Ilchelossi@gmail.com'),(300,1,38,'Telefono','3280094079'),(301,1,38,'Messaggio','Buongiorno\r\nGradirei ricevere RNDT News\r\nGrazie'),(302,1,38,'captcha','pnic'),(303,1,38,'Invia','Invia'),(304,1,38,'formId','1'),(305,1,39,'Nome','claudio acquati'),(306,1,39,'Citta','monza'),(307,1,39,'Email','c.acquati@gmail.com'),(308,1,39,'Telefono','3383958672'),(309,1,39,'Messaggio','Chiedo cortesemente la notifica di pubblicazione della newsletter.\r\nGrazie '),(310,1,39,'captcha','uiyt'),(311,1,39,'Invia','Invia'),(312,1,39,'formId','1'),(313,1,40,'Nome','Gloria Galli'),(314,1,40,'Citta','Blera'),(315,1,40,'Email','gloria@gallilab.it'),(316,1,40,'Telefono','3493572771'),(317,1,40,'Messaggio','Le scuole che sto seguendo elaborano i seguenti dati: carriere scolastiche alunni (e relativi dati anagrafici); dati riferiti al personale scolastico; dati di bilancio.\r\nSono questi dati territoriali?'),(318,1,40,'captcha','hgpd'),(319,1,40,'Invia','Invia'),(320,1,40,'formId','1'),(321,1,41,'Nome','Antonio De Luca'),(322,1,41,'Citta','Massa'),(323,1,41,'Email','a.deluca@provincia.ms.it'),(324,1,41,'Telefono','0585816445'),(325,1,41,'Messaggio','Buongiorno\r\nSono i lresponsabile del SIT della provincia di Massa-Carrara e sto adeguando degli archivi inseriti dalla mia collega Primetta Menchini ed inserendo nuovi archivi\r\nrelativamente al PTC_raster (id.file p_MS:00003:20100114:095328), nonostante la verifica non segnali errori quando tento di trasmettere il tema ho questo errore:\r\n[null - null ]org.cnipa.rndt.strutture.Exception.RNDTXMLErrorException: org.hibernate.PropertyValueException: not-null property references a null or transient value: org.cnipa.rndt.server.hibernate.ExVerticalExtent.mdReferenceSystemCode\r\n\r\nè possibile avere chiarimenti?\r\ngrazie'),(326,1,41,'captcha','nklw'),(327,1,41,'Invia','Invia'),(328,1,41,'formId','1'),(329,1,42,'Nome','Studio AlpTer'),(330,1,42,'Citta',''),(331,1,42,'Email','info@alpter.eu'),(332,1,42,'Telefono','3771583417'),(333,1,42,'Messaggio','Vorrei ricevere la newsletter\r\n\r\nGrazie'),(334,1,42,'captcha','ikzt'),(335,1,42,'Invia','Invia'),(336,1,42,'formId','1'),(337,1,43,'Nome','oriana mottadelli'),(338,1,43,'Citta',''),(339,1,43,'Email','oriana.mottadelli@lom.camcom.it'),(340,1,43,'Telefono','026079601'),(341,1,43,'Messaggio','si chiede iscrizione newsletter.\r\ngrazie\r\nMottadelli'),(342,1,43,'captcha','zbfg'),(343,1,43,'Invia','Invia'),(344,1,43,'formId','1'),(345,1,44,'Nome','Antonio'),(346,1,44,'Citta','Lanusei'),(347,1,44,'Email','gamma@tiscali.it'),(348,1,44,'Telefono','3280190722'),(349,1,44,'Messaggio','Salve sono il docente di una scuola e mi chiamo Antonio. Sono alle prese con la compilazione  del Modello per la comunicazione delle basi di dati - formato XLS e del Modello per la comunicazione delle basi di dati - formato ODS. Intanto quale di questi modelli va compilato?\r\nCosa si intende per basi di dati territoriali e basi di dati non territoriali? Come va fatta la comunicazione dei suddetti dati territoriali ad www.rndt.gov.it. Cosa si intende per basi di dati? Il database? La nostra scuola utilizza SISSI in rete, SIDI per la gestione e infoschool per il registro elettronico. Mi potreste dare un aiuto e chiarimenti in merito alla compilazione dei modelli? Grazie'),(350,1,44,'captcha','hfyn'),(351,1,44,'Invia','Invia'),(352,1,44,'formId','1'),(353,1,45,'Nome','Rocco'),(354,1,45,'Citta','Roccasecca'),(355,1,45,'Email','rocco.dilauro@postemail.it'),(356,1,45,'Telefono','3494225054'),(357,1,45,'Messaggio','Iscrizione alla \"RNDT news\", la newsletter del RNDT.'),(358,1,45,'captcha','txau'),(359,1,45,'Invia','Invia'),(360,1,45,'formId','1'),(361,1,46,'Nome','Andrea'),(362,1,46,'Citta','Cento'),(363,1,46,'Email','a.fabbri@ambito.it'),(364,1,46,'Telefono','393939112463'),(365,1,46,'Messaggio','Iscrizione Newsletter '),(366,1,46,'captcha','unif'),(367,1,46,'Invia','Invia'),(368,1,46,'formId','1'),(369,1,47,'Nome','comune di mascali'),(370,1,47,'Citta','mascali'),(371,1,47,'Email','protocollomascali@pec.it'),(372,1,47,'Telefono','0957709146'),(373,1,47,'Messaggio','quale codice si deve indicare nell\'applicativo  identificatore ,se la ditta non oppone nessun codice ,il comune pùo generare un codice proprio per ogni programma con dei numeri da 1 a 10\r\ngrazie '),(374,1,47,'captcha','suwe'),(375,1,47,'Invia','Invia'),(376,1,47,'formId','1'),(377,1,48,'Nome','comune di Storo'),(378,1,48,'Citta','Storo'),(379,1,48,'Email','anagrafe@comune.storo.tn.it'),(380,1,48,'Telefono','0465681200'),(381,1,48,'Messaggio','Chiedo che venga inviata la newsletter del RNDT .\r\n\r\ngrazie'),(382,1,48,'captcha','umfj'),(383,1,48,'Invia','Invia'),(384,1,48,'formId','1'),(385,1,49,'Nome','Tania Fabrello'),(386,1,49,'Citta',''),(387,1,49,'Email','tania.fabrello@gmail.com'),(388,1,49,'Telefono','0445691475'),(389,1,49,'Messaggio','Buongiorno.\r\nla guida presente all\'indirizzo http://www.rndt.gov.it/RNDT/guida/ è disponibile anche in una versione stampabile?\r\n\r\nGrazie e cordiali saluti\r\nTania Fabrello'),(390,1,49,'captcha','xhym'),(391,1,49,'Invia','Invia'),(392,1,49,'formId','1'),(393,1,50,'Nome','Martino Vicino'),(394,1,50,'Citta',''),(395,1,50,'Email','edilizia@comune.orcofeglino.sv.it'),(396,1,50,'Telefono','019699010'),(397,1,50,'Messaggio','Buongiorno, in merito all\'obbligo per le pubbliche amministrazioni di trasmettere a RNDT le basi di dati territoriali in gestione e degli applicativi che le utilizzano, stabilito dall’art. 24-quater comma 2 del D.L. n. 90/2014, chiedo di conoscere le modalità per la comunicazione a RNDT delle banche dati in gestione.\r\n\r\nConsiderato che rappresento un Comune, le banche dati in questione riguardano le pratiche di edilizia privata ed il Piano Regolatore Generale, queste banche dati sono banche dati territoriali?\r\n\r\nDevo compilare un file .xml? per l\'inoltro ad AGID è sufficiente caricare un file .xls.\r\n\r\nIn caso sia necessario compilare un file .xml chiedo di conoscere le specifiche necessarie per caricare i dati obbligatori stabiliti dall’art. 24-quater comma 2 del D.L. n. 90/2014.\r\n\r\nGrazie per la collaborazione'),(398,1,50,'captcha','xcwk'),(399,1,50,'Invia','Invia'),(400,1,50,'formId','1'),(401,1,51,'Nome','Massimo Figaroli'),(402,1,51,'Citta','Vedano Olona'),(403,1,51,'Email','massimo.figaroli@gmail.com'),(404,1,51,'Telefono','3381471605'),(405,1,51,'Messaggio','Buongiorno, con la presente manifesto l\'interesse verso l\'iscrizione alla Vostra newsletter.\r\nAuspicando in un esito positivo,\r\nporgo distinti saluti.\r\n\r\nMF'),(406,1,51,'captcha','wiet'),(407,1,51,'Invia','Invia'),(408,1,51,'formId','1'),(409,1,52,'Nome','sabina di giorgi'),(410,1,52,'Citta','firenze'),(411,1,52,'Email','sabina.digiorgi@unifi.it'),(412,1,52,'Telefono','0552757147'),(413,1,52,'Messaggio','Quando è la scadenza per la comunicazione della base di dati territoriale RNDT?'),(414,1,52,'captcha','zdfk'),(415,1,52,'Invia','Invia'),(416,1,52,'formId','1'),(417,1,53,'Nome','Achille'),(418,1,53,'Citta','Roma'),(419,1,53,'Email','anapoletano@regione.lazio.it'),(420,1,53,'Telefono','0651689894'),(421,1,53,'Messaggio','Si richiede cortese invio della newsletter del RNDT'),(422,1,53,'captcha','ryms'),(423,1,53,'Invia','Invia'),(424,1,53,'formId','1'),(425,1,54,'Nome','comune'),(426,1,54,'Citta','vigevano'),(427,1,54,'Email','urbanisticavigevano@pec.it'),(428,1,54,'Telefono','0381299321'),(429,1,54,'Messaggio','sono impossibilitato all\'accesso alla procedura on line per la trasmissione dell\'elenco base dati. La procedura di attivazione è stata eseguita in data 16 settembre 2014. saluti. '),(430,1,54,'captcha','majr'),(431,1,54,'Invia','Invia'),(432,1,54,'formId','1'),(433,1,55,'Nome','rossini gianluca'),(434,1,55,'Citta','Berlingo'),(435,1,55,'Email','rossini@comune.berlingo.bs.it'),(436,1,55,'Telefono','0309787247'),(437,1,55,'Messaggio','buongiorno,\r\n\r\ndevo caricare il file delle basi di dati per AGID ma il sito non è raggiungibile e contunua a saltare.\r\nHo verificato con altri pc ma il problema persiste.\r\n\r\navendo la scadenza di invio dati il 18 settembre sono achiedere cortesemente se il problema è temporaneo e potra essere risolto a breve.\r\n\r\ndistinti saluti\r\n\r\nRossini Gianluca'),(438,1,55,'captcha','eduv'),(439,1,55,'Invia','Invia'),(440,1,55,'formId','1'),(441,1,56,'Nome','istituto P.Levi'),(442,1,56,'Citta','ronco scrivia'),(443,1,56,'Email','segramm@isprimolevi.it'),(444,1,56,'Telefono','0109643160'),(445,1,56,'Messaggio','inviato modulo accreditamento in data 16/09 ma non ancora ricevute credenziali per accesso al sito. \r\nvista scadenza odierna si sollecita invio password.'),(446,1,56,'captcha','lote'),(447,1,56,'Invia','Invia'),(448,1,56,'formId','1'),(449,1,57,'Nome','SABINA TOMBESI'),(450,1,57,'Citta','MACERATA'),(451,1,57,'Email','MCIC82800P@ISTRUZIONE.IT'),(452,1,57,'Telefono','0733230336'),(453,1,57,'Messaggio','CON LA PRESENTE SI RICHIEDONO LE CREDENZIALI PER ACCEDERE ALL\'AREA RISERVATA PER POTER CARICARE IL MODELLO COMPILATO'),(454,1,57,'captcha','jvor'),(455,1,57,'Invia','Invia'),(456,1,57,'formId','1'),(457,1,58,'Nome','FILIPPO'),(458,1,58,'Citta','SANTO STEFANO BELBO'),(459,1,58,'Email','ragioneria@santostefanobelbo.it'),(460,1,58,'Telefono','0141841816'),(461,1,58,'Messaggio','COMUNE DI SANTO STEFANO BELBO\r\n\r\nho urgenza di ricevere le creziali per poter accedere all\'invio delle basi di dati territoriali.\r\nl\'email per l\'accreditamento l\'ho inviata questa mattina.\r\n\r\nDistinti saluti'),(462,1,58,'captcha','atho'),(463,1,58,'Invia','Invia'),(464,1,58,'formId','1'),(465,1,59,'Nome','enrica molini'),(466,1,59,'Citta','crocefieschi (ge)'),(467,1,59,'Email','segreteria@comune.crocefieschi.ge.it'),(468,1,59,'Telefono','010931215'),(469,1,59,'Messaggio','Non riesco a capire come funziona la getsione dei caricamento dei dati. Avrei bisogno di supporto nel piiù breve tempo possibile.Grazie'),(470,1,59,'captcha','ffbw'),(471,1,59,'Invia','Invia'),(472,1,59,'formId','1'),(473,1,60,'Nome','BECILLI GIORGIO'),(474,1,60,'Citta','BRESCIA'),(475,1,60,'Email','bsic878006@pec.istruzione.it'),(476,1,60,'Telefono','3883815059'),(477,1,60,'Messaggio','non riesco ad entrare per completare ed inviare l\'elencoBasidati_10 m perche\' non mi riconosce la password\r\n'),(478,1,60,'captcha','gyiq'),(479,1,60,'Invia','Invia'),(480,1,60,'formId','1'),(481,1,61,'Nome','Ugo Fabbri'),(482,1,61,'Citta','Montevarchi'),(483,1,61,'Email','fabbriu@comune.montevarchi.ar.it'),(484,1,61,'Telefono','0559108345'),(485,1,61,'Messaggio','Ho inviato il modulo per l\'accreditamento al portale.\r\nAl momento non ho ricevuto nessuna risposta.\r\nVolevo sapere a che punto era la pratica.\r\nCordiali saluti\r\nUgo Fabbri'),(486,1,61,'captcha','nawq'),(487,1,61,'Invia','Invia'),(488,1,61,'formId','1'),(489,1,62,'Nome','Leda Bultrini'),(490,1,62,'Citta','Roma'),(491,1,62,'Email','leda.bultrini@arpalazio.it'),(492,1,62,'Telefono','0648054549'),(493,1,62,'Messaggio','Vorrei ricevere la newsletter RNDT.'),(494,1,62,'captcha','txdv'),(495,1,62,'Invia','Invia'),(496,1,62,'formId','1'),(497,1,63,'Nome','Marco Battaglia'),(498,1,63,'Citta','Ragusa'),(499,1,63,'Email','marco.battaglia@provincia.ragusa.it'),(500,1,63,'Telefono','3395921951'),(501,1,63,'Messaggio','spett.le AgiD,\r\nla presente per richiedere di ricevere la notifica della pubblicazione di \"RNDT news\", la newsletter del RNDT.\r\nringrazio anticipatamente\r\nmarco battaglia\r\n'),(502,1,63,'captcha','fnzu'),(503,1,63,'Invia','Invia'),(504,1,63,'formId','1'),(505,1,64,'Nome','Dr. Mario Scandura'),(506,1,64,'Citta','CATANIA'),(507,1,64,'Email','mr.scandura@gmail.com'),(508,1,64,'Telefono','3450271613'),(509,1,64,'Messaggio','Chiedo gentilmente di essere inserito nella mailin list per la notifica della pubblicazione della newsletter.\r\nGrazie'),(510,1,64,'captcha','lnhl'),(511,1,64,'Invia','Invia'),(512,1,64,'formId','1'),(513,1,65,'Nome','CRISTIANO ABONDIO'),(514,1,65,'Citta','DARFO BOARIO TERME'),(515,1,65,'Email','c.abondio@darfoboarioterme.net'),(516,1,65,'Telefono','0364541150'),(517,1,65,'Messaggio','Buongiorno, sto cercando di inserire i dati per creare il file xml da inviare ma continua ad uscirmi questo errore:\r\n\r\n[Serie - c_d251:dati_territorio_serie ]L\'elemento non e\' specificato nel modo corretto o non e\' presente. (nome elemento:GridSpatialRepresentation)\r\n[Dataset - c_d251:mappe_catasto ]L\'elemento non e\' specificato nel modo corretto o non e\' presente. (nome elemento:GridSpatialRepresentation)\r\n[Dataset - c_d251:indirizzi ]L\'elemento non e\' specificato nel modo corretto o non e\' presente. (nome elemento:GridSpatialRepresentation)\r\n[Dataset - c_d251:archi_stradali ]L\'elemento non e\' specificato nel modo corretto o non e\' presente. (nome elemento:PointOfContact)\r\n[Dataset - c_d251:archi_stradali ]L\'elemento non e\' specificato nel modo corretto o non e\' presente. (nome elemento:GridSpatialRepresentation)\r\n\r\nCosa devo fare ? Cosa manca ?'),(518,1,65,'captcha','nfdv'),(519,1,65,'Invia','Invia'),(520,1,65,'formId','1'),(521,1,66,'Nome','Giuseppe Vilardo'),(522,1,66,'Citta','Napoli'),(523,1,66,'Email','giuseppe.vilardo@ingv.it'),(524,1,66,'Telefono','0816108212'),(525,1,66,'Messaggio','vorrei ricevere la notifica dell\'avvenute pubblicazioni delle newsletters'),(526,1,66,'captcha','wxqu'),(527,1,66,'Invia','Invia'),(528,1,66,'formId','1'),(529,1,67,'Nome','Gabriele Garnero'),(530,1,67,'Citta','Torino'),(531,1,67,'Email','gabriele.garnero@unito.it'),(532,1,67,'Telefono','3356073024'),(533,1,67,'Messaggio','Gradirei ricevere la newsletter'),(534,1,67,'captcha','acjr'),(535,1,67,'Invia','Invia'),(536,1,67,'formId','1'),(537,1,68,'Nome','istituto di istruzione superiore a zoli '),(538,1,68,'Citta','atri'),(539,1,68,'Email','teis00300e@istruzione.it'),(540,1,68,'Telefono','08587269'),(541,1,68,'Messaggio','Seguendo il manuale dell’applicazione basi dati.agid.gov.it, abbiamo effettuato la registrazione, siamo in possesso della password ma non riusciamo ad effettuare le operazioni – fase 2 di caricamento dati in quanto non ci compare  la voce basi dati>aggiungi contenuto. Non possiamo creare Basedati e inviare il file. \r\n\r\nCome possiamo procedere?\r\n\r\nVista l’impossibilità di procedere e la scadenza  si chiede se ci sarà una proroga.\r\nIL DSGA GIUSEPPINA DI SABATINO\r\n\r\n \r\n\r\n'),(542,1,68,'captcha','yycv'),(543,1,68,'Invia','Invia'),(544,1,68,'formId','1'),(545,1,69,'Nome','Ale Bonel'),(546,1,69,'Citta',''),(547,1,69,'Email','info@3drte.com'),(548,1,69,'Telefono','051270371'),(549,1,69,'Messaggio','desidero ricevere la newsletter\r\nGrazie\r\nAle Bonel'),(550,1,69,'captcha','rdqs'),(551,1,69,'Invia','Invia'),(552,1,69,'formId','1'),(553,1,70,'Nome','tiziano guglielmi'),(554,1,70,'Citta',''),(555,1,70,'Email','guglielmi.tiziano@altovicentinoservizi.it'),(556,1,70,'Telefono','0445801555'),(557,1,70,'Messaggio','chiedo di essere iscritto alla newsletter'),(558,1,70,'captcha','idew'),(559,1,70,'Invia','Invia'),(560,1,70,'formId','1'),(561,1,71,'Nome','Antonio'),(562,1,71,'Citta','Padova'),(563,1,71,'Email','antonio.calzavara@provincia.padova.it'),(564,1,71,'Telefono','0498201313'),(565,1,71,'Messaggio','Bongiorno,\r\nvolevo chiedere l\'iscrizione alla newletters.\r\nCordiali saluti.'),(566,1,71,'captcha','eflu'),(567,1,71,'Invia','Invia'),(568,1,71,'formId','1'),(569,1,72,'Nome','EMANUELA'),(570,1,72,'Citta','SANTO STEFANO BELBO'),(571,1,72,'Email','ragioneria@santostefanobelbo.it'),(572,1,72,'Telefono','0141841816'),(573,1,72,'Messaggio','Con la presente chiediamo di poter ricevere con urgenza le credenziali per l\'adempimento '),(574,1,72,'captcha','wrkc'),(575,1,72,'Invia','Invia'),(576,1,72,'formId','1'),(577,1,73,'Nome','francesco'),(578,1,73,'Citta','schioppa'),(579,1,73,'Email','francesco.schioppa@gmail.com'),(580,1,73,'Telefono','3385693510'),(581,1,73,'Messaggio','desidererei essere iscritto alla mailing list delle vs. news periodiche RNDT News\r\nsaluti'),(582,1,73,'captcha','yvfv'),(583,1,73,'Invia','Invia'),(584,1,73,'formId','1'),(585,1,74,'Nome','Angelo Belloro'),(586,1,74,'Citta','Muggiò (MB)'),(587,1,74,'Email','belloro@comune.muggio.mb.it'),(588,1,74,'Telefono','0392709344'),(589,1,74,'Messaggio','Non so come fare la login che mi consenta di vedere ed eventualmente aggiornare le informazioni trasmesse alla Agenzia riguardo le banche dati ed i sw applicativi. Grazie'),(590,1,74,'captcha','pqaj'),(591,1,74,'Invia','Invia'),(592,1,74,'formId','1'),(593,1,75,'Nome','comune'),(594,1,75,'Citta','vigevano'),(595,1,75,'Email','cfranzosi@comune.vigevano.pv.it'),(596,1,75,'Telefono','0381299321'),(597,1,75,'Messaggio','Con la presente, chiedo cortesemente, di avere informazioni relative alla data di scadenza per la compilazione del RNDT.\r\nCordiali saluti.'),(598,1,75,'captcha','qbql'),(599,1,75,'Invia','Invia'),(600,1,75,'formId','1'),(601,1,76,'Nome','Giampaolo Pregnolato'),(602,1,76,'Citta','Azzano d\'Asti'),(603,1,76,'Email','tecnico.valtiglione@ruparpiemonte.it'),(604,1,76,'Telefono','0141953938'),(605,1,76,'Messaggio','Sono il responsabile del servizio tecnico del Comune di Azzano d\'Asti. Sto procedendo al caricamento dei metadati relativi al Comune. Sono riuscito a creare il file xml, ma in fase di convalida del file, mi trova due errori che non riesco a comprendere.\r\nAvrei bisogno di un contatto telefonico per poter procedere.\r\nGrazie. Cordiali saluti\r\nGeom. Giampaolo Pregnolato'),(606,1,76,'captcha','hxvr'),(607,1,76,'Invia','Invia'),(608,1,76,'formId','1'),(609,1,77,'Nome','SABATO  CIARDO'),(610,1,77,'Citta','CASTELNUOVO CILEN TO'),(611,1,77,'Email','castelnuovoutc@virgilio.it'),(612,1,77,'Telefono','097462128'),(613,1,77,'Messaggio','si invita gentilmente a comunicare le modalità per la trasmissione dei dati delle basi digitali.\r\nGrazie.'),(614,1,77,'captcha','kqtp'),(615,1,77,'Invia','Invia'),(616,1,77,'formId','1'),(617,1,78,'Nome','Ivo Planötscher'),(618,1,78,'Citta','Bolzano'),(619,1,78,'Email','ivo.planoetscher@siag.it'),(620,1,78,'Telefono','0471566180'),(621,1,78,'Messaggio','Spett.le AgID,\r\ndesidero ricevere la notifica di pubblicazione dei nuovi numeri di \"RNDT news\", la newsletter del RNDT.\r\n\r\nCordiali saluti\r\n\r\nIvo Planötscher\r\nCentro di Competenza GIS\r\nProvincia Autonoma di Bolzano\r\n'),(622,1,78,'captcha','sdmb'),(623,1,78,'Invia','Invia'),(624,1,78,'formId','1'),(625,1,79,'Nome','Chiara Gardini'),(626,1,79,'Citta','Milano'),(627,1,79,'Email','c.gardini@provincia.milano.it'),(628,1,79,'Telefono','0277405868'),(629,1,79,'Messaggio','Buongiorno,\r\nnel caso un ente abbia più unità organizzative dedicate alla gestione dei dati territoriali è possibile che vengano inviati tanti documenti di richiesta di accreditamento tante quante sono le UO o è necessaria un\'utenza per tutto l\'Ente?\r\nGrazie\r\nCordiali saluti\r\nChiara Gardini'),(630,1,79,'captcha','oakh'),(631,1,79,'Invia','Invia'),(632,1,79,'formId','1'),(633,1,80,'Nome','Coraini Anna'),(634,1,80,'Citta','Copparo'),(635,1,80,'Email','acoraini@unioneterrefiumi.fe.it'),(636,1,80,'Telefono','0532864638'),(637,1,80,'Messaggio','Salve, volevo segnalare problematica in fase di validazione XML. Si riporta di seguito elenco degli errori e chiediamo cortesemente informazioni per la correzione.\r\n\r\nGrazie\r\n\r\n(r:53 - c:54) :Elemento trovato \'ns4:referenceSystemInfo\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":contact, \"http://www.isotc211.org/2005/gmd\":dateStamp}\' .\r\n(r:135 - c:25) :Elemento trovato \'ns4:pointOfContact\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":abstract}\' .\r\n(r:457 - c:54) :Elemento trovato \'ns4:referenceSystemInfo\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":contact, \"http://www.isotc211.org/2005/gmd\":dateStamp}\' .\r\n(r:539 - c:25) :Elemento trovato \'ns4:pointOfContact\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":abstract}\' .\r\n(r:861 - c:54) :Elemento trovato \'ns4:referenceSystemInfo\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":contact, \"http://www.isotc211.org/2005/gmd\":dateStamp}\' .\r\n(r:943 - c:25) :Elemento trovato \'ns4:pointOfContact\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":abstract}\' .\r\n(r:1265 - c:54) :Elemento trovato \'ns4:referenceSystemInfo\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":contact, \"http://www.isotc211.org/2005/gmd\":dateStamp}\' .\r\n(r:1283 - c:29) :Elemento trovato \'ns4:identifier\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":alternateTitle, \"http://www.isotc211.org/2005/gmd\":date}\' .\r\n(r:1337 - c:25) :Elemento trovato \'ns4:pointOfContact\' . Gli elementi consentiti sono solo \'{\"http://www.isotc211.org/2005/gmd\":abstract}\' .\r\n'),(638,1,80,'captcha','bvok'),(639,1,80,'Invia','Invia'),(640,1,80,'formId','1'),(641,1,81,'Nome','Daniela'),(642,1,81,'Citta','Cava de\' Tirreni'),(643,1,81,'Email','danielasenatore.cav@gmail.com'),(644,1,81,'Telefono','3208352977'),(645,1,81,'Messaggio','Sono interessata a ricevere informazioni e aggiornamenti sul repertorio nazionale dei dati territoriali'),(646,1,81,'captcha','omwb'),(647,1,81,'Invia','Invia'),(648,1,81,'formId','1'),(649,1,82,'Nome','Emanuele Masiero'),(650,1,82,'Citta','Veggiano'),(651,1,82,'Email','emanuele.masiero@gmail.com'),(652,1,82,'Telefono','3471387881'),(653,1,82,'Messaggio','non funziona il link per l\'export xml dei metadati'),(654,1,82,'captcha','oegv'),(655,1,82,'Invia','Invia'),(656,1,82,'formId','1'),(657,1,83,'Nome','ilaria morelli'),(658,1,83,'Citta','firenze'),(659,1,83,'Email','coll0078@provincia.fi.it '),(660,1,83,'Telefono','0552760199'),(661,1,83,'Messaggio','Salve. Verifico la validità di un metadata con lo strumento \"Conformità RNDT\": non segnala nessun errore. Tento quindi di caricarlo con lo strumento \"Importa XML RNDT\" e mi segnala il seguente errore: \r\nRapporto di validazione:	Download\r\nErrori	Riscontrati: 1\r\n[null - null ]Documento XML Errato'),(662,1,83,'captcha','hqjm'),(663,1,83,'Invia','Invia'),(664,1,83,'formId','1'),(665,1,84,'Nome','Costa Domenico'),(666,1,84,'Citta','Asti'),(667,1,84,'Email','d.costa@comune.asti.it'),(668,1,84,'Telefono','0141399218'),(669,1,84,'Messaggio','Buongiorno.\r\nMi occupo del SIT del Comune di Asti, di conseguenza mi piacerebbe ricevere le informazioni relative al portale RNDT.\r\ngrazie.\r\ncordialmente \r\nCosta Domenico'),(670,1,84,'captcha','ajoe'),(671,1,84,'Invia','Invia'),(672,1,84,'formId','1'),(673,1,85,'Nome','Gabriele Andreozzi'),(674,1,85,'Citta','Firenze'),(675,1,85,'Email','g.andreozzi@lineacomune.it'),(676,1,85,'Telefono','05545587223'),(677,1,85,'Messaggio','sono interessato alla newsletter di RNDT'),(678,1,85,'captcha','zpll'),(679,1,85,'Invia','Invia'),(680,1,85,'formId','1'),(681,1,86,'Nome','Michele Mondelli'),(682,1,86,'Citta','Siena'),(683,1,86,'Email','mithenks.ml@gmail.com'),(684,1,86,'Telefono','0577531049'),(685,1,86,'Messaggio','Buongiorno,\r\nvolevo chiedere se è attivo, o se prevedere di attivare, un webservice attraverso il quale verificare la validità di un XML secondo lo standard dell\'RNDT.\r\nUn servizio simile è offerto da INSPIRE, ed è molto importante nella realizzazione di software in quanto permette di verificare la validità degli XML generati per i clienti.\r\n\r\nGrazie e saluti'),(686,1,86,'captcha','vdsw'),(687,1,86,'Invia','Invia'),(688,1,86,'formId','1'),(689,1,87,'Nome','Pierpaolo Rugiero'),(690,1,87,'Citta','Verona'),(691,1,87,'Email','pierpaolo.rugiero@acqueveronesi.it'),(692,1,87,'Telefono','0458677534'),(693,1,87,'Messaggio','desidero ricevere notifica di pubblicazione Newsletter RNDT\r\nGrazie\r\nPierpaolo Rugiero'),(694,1,87,'captcha','szdu'),(695,1,87,'Invia','Invia'),(696,1,87,'formId','1'),(697,1,88,'Nome','AVERONE MARCO'),(698,1,88,'Citta','LA SALLE'),(699,1,88,'Email','biblioteca@comune.lasalle.ao.it'),(700,1,88,'Telefono','3889321783'),(701,1,88,'Messaggio','Buongiorno, nella validazione del file formato xml con elenco base dati territoriali del Comune di La Salle è stato riscontrato il seguente errore: r:7 - c:47 non è stata trovata la dichiarazione dell\'elemento workbook.\r\nSi prega di indicare la procedura da effettuare per lo sblocco della validazione ed il conseguente caricamento dei dati territoriali.\r\nsaluti.\r\n '),(702,1,88,'captcha','wxzn'),(703,1,88,'Invia','Invia'),(704,1,88,'formId','1'),(705,1,89,'Nome','Comune Piazzola sul Brenta'),(706,1,89,'Citta','PIAZZOLA SUL BRENTA'),(707,1,89,'Email','fabio.toniati@comune.piazzola.pd.it'),(708,1,89,'Telefono','0499697922'),(709,1,89,'Messaggio','Buongiorno,\r\nin data 02/10/14 abbiamo compilato il modulo di accreditamento al portale RNDT, alla data odierna non abbiamo ricevuto i dati, gentilmente  ci potete indicare la stato di avanzamento della pratica.\r\n Cordialmente.\r\n\r\n arch. Rossetto Danilo\r\n'),(710,1,89,'captcha','aegt'),(711,1,89,'Invia','Invia'),(712,1,89,'formId','1'),(713,1,90,'Nome','Davide Cecchini'),(714,1,90,'Citta','Fabriano'),(715,1,90,'Email','d.cecchini@comune.fabriano.an.it'),(716,1,90,'Telefono','3357987976'),(717,1,90,'Messaggio','Esiste un manuale per interpretare i codici di errore nella validazione del file XML prodotto tramite l\'editor online.\r\nAd esempio:\r\n(r:5 - c:33) :Elemento trovato \'ns6:seriesMetadata\' . Gli elementi consentiti sono solo \'{\"http://www.cnipa.gov.it/RNDT/ITgmd\":composedOf}\' \r\n\r\nnon capisco che tipo di errore è e come poterlo correggere online visto che tutti i campi sono compilati.'),(718,1,90,'captcha','kztw'),(719,1,90,'Invia','Invia'),(720,1,90,'formId','1'),(721,1,91,'Nome','Michele Mondelli'),(722,1,91,'Citta','Siena'),(723,1,91,'Email','mondelli@ldpgis.it'),(724,1,91,'Telefono','0577531049'),(725,1,91,'Messaggio','Salve,\r\nvorrei maggiori informazioni sull\'utilizzo del servizio CSW per l\'invio automatico dei dati al RNDT. \r\nÈ possibile tramite tale servizio inviare automaticamente i dati di un\'amministrazione? È possibile integrare quindi in un software di metadatazione esistente un plugin che invia i dati a RNDT? \r\nÈ necessario, immagino, che l\'amministrazione sia accreditata e che si debbano fornire le credenziali di accesso.\r\nEsistono dei manuali su come implementare il servizio? Ho letto nelle news che è possibile concordare una fase di test del servizio con RNDT.\r\n\r\nCordiali saluti,'),(726,1,91,'captcha','xmeh'),(727,1,91,'Invia','Invia'),(728,1,91,'formId','1'),(729,1,92,'Nome','luca campana'),(730,1,92,'Citta','roma'),(731,1,92,'Email','luca.campana@isprambiente.it'),(732,1,92,'Telefono','390650074599'),(733,1,92,'Messaggio','Richiesta di iscrizione alla mailing list RNDT News'),(734,1,92,'captcha','pymu'),(735,1,92,'Invia','Invia'),(736,1,92,'formId','1'),(737,1,93,'Nome','lorenzo torricelli'),(738,1,93,'Citta','martellago'),(739,1,93,'Email','lorenzo.torricelli@comune.martellago.ve.it'),(740,1,93,'Telefono','0415404162'),(741,1,93,'Messaggio','chiedo di essere informato della pubblicazione delle newsletter. grazie'),(742,1,93,'captcha','nnfy'),(743,1,93,'Invia','Invia'),(744,1,93,'formId','1'),(745,1,94,'Nome','daniele ravaioli'),(746,1,94,'Citta',''),(747,1,94,'Email','d.ravaioli@scsitaly.com'),(748,1,94,'Telefono','3337965962'),(749,1,94,'Messaggio','buongiorno,\r\nvorrei essere iscritto alla vostra newsletter\r\n\r\ngrazie'),(750,1,94,'captcha','otgi'),(751,1,94,'Invia','Invia'),(752,1,94,'formId','1'),(753,1,95,'Nome','DANIELE BASSAN'),(754,1,95,'Citta','TRENTO'),(755,1,95,'Email','daniele.bassan@provincia.tn.it'),(756,1,95,'Telefono','0461496162'),(757,1,95,'Messaggio','Desidero ricevere la vs newsletter. Grazie. DB'),(758,1,95,'captcha','jwfr'),(759,1,95,'Invia','Invia'),(760,1,95,'formId','1'),(761,1,96,'Nome','MARCO AVERONE'),(762,1,96,'Citta','COMUNE DI LA SALLE'),(763,1,96,'Email','g.marchini@comune.lasalle.ao.it'),(764,1,96,'Telefono','0165861908'),(765,1,96,'Messaggio','Prot. 11078\r\nBuongiorno, trasmetto in allegato file xml relativo al Comune di La Salle  (Aosta).\r\nil file è conforme e utilizzando la funzionalità \"conformità RNDT\" il rapporto di validazione è il seguente: Nessun errore da segnalare.\r\nUtilizzando la funzionalità \" Importa xml RNDT\" per l\'invio   compare il seguente errore:\r\n[null - null ]Documento XML Errato\r\n\r\n\r\nErrori  Riscontrati: 1 \r\n\r\n[null - null ]Documento XML Errato\r\n'),(766,1,96,'captcha','utdq'),(767,1,96,'Invia','Invia'),(768,1,96,'formId','1'),(769,1,97,'Nome','Giuseppe Celsi'),(770,1,97,'Citta',''),(771,1,97,'Email','g.celsi@provincia.crotone.it'),(772,1,97,'Telefono','0962952650'),(773,1,97,'Messaggio','Desidero ricevere la notifica di pubblicazione dei nuovi numeri di \"RNDT News\"'),(774,1,97,'captcha','svuv'),(775,1,97,'Invia','Invia'),(776,1,97,'formId','1'),(777,1,98,'Nome','STEFANIA TRAVERSO'),(778,1,98,'Citta','Genova'),(779,1,98,'Email','stefania.traverso@gmail.com'),(780,1,98,'Telefono','393406650331'),(781,1,98,'Messaggio','Con la presente richiedo se possibile iscrizione alla newsletter.\r\nGrazie.'),(782,1,98,'captcha','vjtr'),(783,1,98,'Invia','Invia'),(784,1,98,'formId','1'),(785,1,99,'Nome','Mariangela Grandini'),(786,1,99,'Citta','Milano'),(787,1,99,'Email','mariangela.grandini@comune.milano.it'),(788,1,99,'Telefono','0288458123'),(789,1,99,'Messaggio','desidero iscrivermi alla newsletter'),(790,1,99,'captcha','sfup'),(791,1,99,'Invia','Invia'),(792,1,99,'formId','1'),(793,1,100,'Nome','Altana'),(794,1,100,'Citta','Milano'),(795,1,100,'Email','altanaa_89@mail.ru'),(796,1,100,'Telefono','3894467579'),(797,1,100,'Messaggio','Buongiorno, sono interessata fare stage per Vostra agenzia.\r\nDove posso inviare il mio CV?\r\nGrazie,\r\nAltana Grishkina'),(798,1,100,'captcha','dekr'),(799,1,100,'Invia','Invia'),(800,1,100,'formId','1'),(801,1,101,'Nome','Vittorio Marino'),(802,1,101,'Citta',''),(803,1,101,'Email','vittorio.mrn@gmail.com'),(804,1,101,'Telefono','3296466543'),(805,1,101,'Messaggio','Non è possibile inviare i dati da Voi richiesti.\r\nSi prega di contattarmi al fine di stabilire un collegamento diretto fra Voi e la società fornitrice dei software utilizzati dall\'Ente, di modo che questi possano predisporre un file xml con tutte le specifiche tecniche e le notizie richieste.\r\nGrazie per la collaborazione.'),(806,1,101,'captcha','cklf'),(807,1,101,'Invia','Invia'),(808,1,101,'formId','1'),(809,1,102,'Nome','Stefano Cattani'),(810,1,102,'Citta',''),(811,1,102,'Email','scattani@arpa.emr.it'),(812,1,102,'Telefono','3206198714'),(813,1,102,'Messaggio','Salve, ho riscontrato un problema di accesso via CSW utilizzando CKan spatial-extension.\r\nIl problema segnalato dal log di Ckan è\r\n\r\nError gathering the identifiers from the CSW server [xmlns:gsr: \'http://www.isotc211.org/2005/gsr \' is not a valid URI\r\n\r\nPer qualsiasi cosa sopra ci sono i miei contatti.\r\nGrazie, a presto\r\n\r\nStefano Cattani\r\nArpa Emilia-Romagna\r\n'),(814,1,102,'captcha','utjs'),(815,1,102,'Invia','Invia'),(816,1,102,'formId','1'),(817,1,103,'Nome','alvaro canciani'),(818,1,103,'Citta','Novara'),(819,1,103,'Email','canciani.alvaro@comune.novara.it'),(820,1,103,'Telefono','03213703654'),(821,1,103,'Messaggio','non accetta la mia password. deve essere scaduta'),(822,1,103,'captcha','qvcq'),(823,1,103,'Invia','Invia'),(824,1,103,'formId','1');
/*!40000 ALTER TABLE `l1pym_rsform_submission_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_submissions`
--

DROP TABLE IF EXISTS `l1pym_rsform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_submissions` (
  `SubmissionId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `DateSubmitted` datetime NOT NULL,
  `UserIp` varchar(15) NOT NULL DEFAULT '',
  `Username` varchar(255) NOT NULL DEFAULT '',
  `UserId` text NOT NULL,
  `Lang` varchar(255) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`SubmissionId`),
  KEY `FormId` (`FormId`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_submissions`
--

LOCK TABLES `l1pym_rsform_submissions` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_submissions` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_submissions` VALUES (1,1,'2012-03-26 15:32:23','10.14.10.163','','0','it-IT',1),(2,1,'2012-03-27 17:00:07','10.14.9.170','','0','it-IT',1),(3,1,'2012-03-27 17:00:14','10.14.10.163','','0','it-IT',1),(4,1,'2012-03-27 19:00:59','10.14.10.163','','0','it-IT',1),(5,1,'2012-03-28 12:08:04','10.14.9.170','','0','it-IT',1),(6,1,'2012-03-28 13:11:32','10.14.9.170','','0','it-IT',1),(7,1,'2012-03-28 18:02:40','10.14.9.170','','0','it-IT',1),(8,1,'2012-04-04 14:57:05','10.14.9.201','','0','it-IT',1),(9,1,'2012-04-11 06:11:44','2.115.198.194','','0','it-IT',1),(10,1,'2012-04-11 11:52:20','94.247.8.13','','0','it-IT',1),(11,1,'2012-04-13 16:42:48','10.14.9.170','','0','it-IT',1),(12,1,'2012-04-16 12:31:54','194.243.23.18','','0','it-IT',1),(13,1,'2012-05-07 14:29:15','151.62.39.186','','0','it-IT',1),(14,1,'2012-07-22 10:16:19','82.50.138.168','','0','it-IT',1),(15,1,'2012-12-04 10:37:35','213.255.78.66','','0','it-IT',1),(16,1,'2013-01-23 11:24:44','95.175.78.140','','0','it-IT',1),(17,1,'2013-02-21 08:58:09','78.40.168.26','','0','it-IT',1),(18,1,'2013-02-21 10:38:36','78.40.168.26','','0','it-IT',1),(19,1,'2013-02-26 11:20:13','213.255.78.66','','0','it-IT',1),(20,1,'2013-02-28 10:48:02','193.54.67.93','','0','it-IT',1),(21,1,'2013-03-14 08:37:38','31.194.103.49','','0','it-IT',1),(22,1,'2013-04-11 09:54:39','213.26.178.34','','0','it-IT',1),(23,1,'2014-02-26 15:50:02','151.96.3.241','','0','it-IT',1),(24,1,'2014-03-15 11:54:29','82.85.101.163','','0','it-IT',1),(25,1,'2014-05-12 08:46:49','88.48.255.114','','0','it-IT',1),(26,1,'2014-05-13 09:08:47','146.48.94.194','','0','it-IT',1),(27,1,'2014-05-29 16:54:02','82.85.101.163','','0','it-IT',1),(28,1,'2014-06-13 05:58:18','82.238.114.227','','0','it-IT',1),(29,1,'2014-09-09 07:44:20','213.26.42.106','','0','it-IT',1),(30,1,'2014-09-09 11:02:06','88.55.209.162','','0','it-IT',1),(31,1,'2014-09-10 09:44:19','188.9.88.65','','0','it-IT',1),(32,1,'2014-09-10 11:13:38','88.149.228.68','','0','it-IT',1),(33,1,'2014-09-10 15:40:07','138.66.30.14','','0','it-IT',1),(34,1,'2014-09-10 17:53:52','79.29.36.195','','0','it-IT',1),(35,1,'2014-09-11 07:57:19','88.42.168.195','','0','it-IT',1),(36,1,'2014-09-11 08:04:00','146.133.9.163','','0','it-IT',1),(37,1,'2014-09-11 08:44:43','217.175.48.51','','0','it-IT',1),(38,1,'2014-09-11 12:20:56','5.86.157.93','','0','it-IT',1),(39,1,'2014-09-11 13:23:44','2.228.2.196','','0','it-IT',1),(40,1,'2014-09-11 14:36:53','79.29.36.195','','0','it-IT',1),(41,1,'2014-09-11 15:33:17','159.213.88.210','','0','it-IT',1),(42,1,'2014-09-11 22:32:24','2.36.252.188','','0','it-IT',1),(43,1,'2014-09-12 08:48:48','89.96.56.34','','0','it-IT',1),(44,1,'2014-09-14 07:22:29','87.3.83.35','','0','it-IT',1),(45,1,'2014-09-14 14:23:45','151.47.208.25','','0','it-IT',1),(46,1,'2014-09-15 09:09:09','95.225.207.52','','0','it-IT',1),(47,1,'2014-09-15 12:14:02','62.86.185.26','','0','it-IT',1),(48,1,'2014-09-16 08:25:23','194.105.48.5','','0','it-IT',1),(49,1,'2014-09-16 12:16:48','5.96.70.100','','0','it-IT',1),(50,1,'2014-09-17 07:10:11','87.23.36.39','','0','it-IT',1),(51,1,'2014-09-17 08:38:16','95.244.153.9','','0','it-IT',1),(52,1,'2014-09-17 09:02:04','150.217.43.60','','0','it-IT',1),(53,1,'2014-09-17 11:13:45','89.97.235.24','','0','it-IT',1),(54,1,'2014-09-17 11:19:59','83.103.77.3','','0','it-IT',1),(55,1,'2014-09-17 11:28:18','81.174.31.39','','0','it-IT',1),(56,1,'2014-09-18 07:03:49','95.243.117.177','','0','it-IT',1),(57,1,'2014-09-18 08:17:57','195.81.22.253','','0','it-IT',1),(58,1,'2014-09-18 11:15:39','94.95.197.98','','0','it-IT',1),(59,1,'2014-09-18 13:21:31','88.63.209.9','','0','it-IT',1),(60,1,'2014-09-18 13:27:03','82.184.253.38','','0','it-IT',1),(61,1,'2014-09-18 16:12:58','159.213.139.18','','0','it-IT',1),(62,1,'2014-09-18 22:00:07','94.34.16.104','','0','it-IT',1),(63,1,'2014-09-19 07:13:12','82.191.215.41','','0','it-IT',1),(64,1,'2014-09-19 08:11:30','151.99.169.182','','0','it-IT',1),(65,1,'2014-09-19 10:09:23','109.205.20.35','','0','it-IT',1),(66,1,'2014-09-19 16:56:29','79.22.40.224','','0','it-IT',1),(67,1,'2014-09-19 18:18:27','95.244.87.110','','0','it-IT',1),(68,1,'2014-09-20 07:33:51','88.41.216.9','','0','it-IT',1),(69,1,'2014-09-20 16:18:11','2.234.11.212','','0','it-IT',1),(70,1,'2014-09-20 18:22:30','93.62.147.4','','0','it-IT',1),(71,1,'2014-09-22 09:16:41','94.124.33.230','','0','it-IT',1),(72,1,'2014-09-22 11:21:11','94.95.197.98','','0','it-IT',1),(73,1,'2014-09-22 11:34:14','80.207.190.216','','0','it-IT',1),(74,1,'2014-09-23 08:09:50','93.62.116.36','','0','it-IT',1),(75,1,'2014-09-25 11:17:56','83.103.77.3','','0','it-IT',1),(76,1,'2014-09-30 10:56:20','158.102.131.49','','0','it-IT',1),(77,1,'2014-10-01 14:43:10','195.120.113.169','','0','it-IT',1),(78,1,'2014-10-02 07:10:05','62.101.0.30','','0','it-IT',1),(79,1,'2014-10-02 08:51:02','89.96.217.22','','0','it-IT',1),(80,1,'2014-10-02 12:12:51','195.62.166.226','','0','it-IT',1),(81,1,'2014-10-06 10:09:47','193.205.162.69','','0','it-IT',1),(82,1,'2014-10-06 13:33:02','80.180.181.19','','0','it-IT',1),(83,1,'2014-10-09 14:12:04','159.213.247.29','','0','it-IT',1),(84,1,'2014-10-14 08:26:47','93.62.218.235','','0','it-IT',1),(85,1,'2014-10-17 16:20:04','31.199.208.50','','0','it-IT',1),(86,1,'2014-10-20 08:50:49','2.119.118.234','','0','it-IT',1),(87,1,'2014-10-22 10:56:59','213.171.96.131','','0','it-IT',1),(88,1,'2014-10-28 10:03:01','79.38.149.80','','0','it-IT',1),(89,1,'2014-10-31 10:33:27','151.22.76.202','','0','it-IT',1),(90,1,'2014-11-05 10:24:36','93.63.144.2','','0','it-IT',1),(91,1,'2014-11-12 16:59:18','2.119.118.234','','0','it-IT',1),(92,1,'2014-11-19 14:50:55','193.206.192.186','','0','it-IT',1),(93,1,'2014-11-20 08:41:34','81.114.251.62','','0','it-IT',1),(94,1,'2014-11-20 12:20:29','37.186.204.50','','0','it-IT',1),(95,1,'2014-11-24 08:25:47','194.105.50.17','','0','it-IT',1),(96,1,'2014-11-27 10:29:39','79.38.149.80','','0','it-IT',1),(97,1,'2014-12-01 21:21:06','95.251.19.227','','0','it-IT',1),(98,1,'2015-01-19 16:00:13','130.251.104.8','','0','it-IT',1),(99,1,'2015-02-04 11:35:55','217.31.112.86','','0','it-IT',1),(100,1,'2015-03-01 14:27:37','82.56.96.68','','0','it-IT',1),(101,1,'2015-03-02 10:23:38','91.81.113.92','','0','it-IT',1),(102,1,'2015-03-02 13:06:52','193.43.200.181','','0','it-IT',1),(103,1,'2015-03-18 06:53:13','10.14.251.182','','0','it-IT',1);
/*!40000 ALTER TABLE `l1pym_rsform_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_rsform_translations`
--

DROP TABLE IF EXISTS `l1pym_rsform_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_rsform_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `lang_code` varchar(32) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `reference_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_rsform_translations`
--

LOCK TABLES `l1pym_rsform_translations` WRITE;
/*!40000 ALTER TABLE `l1pym_rsform_translations` DISABLE KEYS */;
INSERT INTO `l1pym_rsform_translations` VALUES (1,1,'en-GB','forms','FormTitle','Modulo di segnalazione'),(2,1,'en-GB','forms','UserEmailFromName',''),(3,1,'en-GB','forms','UserEmailSubject',''),(4,1,'en-GB','forms','AdminEmailFromName','{Email:value}'),(5,1,'en-GB','forms','AdminEmailSubject','Richiesta dal sito RNDT'),(6,1,'en-GB','forms','MetaDesc',''),(7,1,'en-GB','forms','MetaKeywords','');
/*!40000 ALTER TABLE `l1pym_rsform_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_schemas`
--

DROP TABLE IF EXISTS `l1pym_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_schemas`
--

LOCK TABLES `l1pym_schemas` WRITE;
/*!40000 ALTER TABLE `l1pym_schemas` DISABLE KEYS */;
INSERT INTO `l1pym_schemas` VALUES (21,'3.4.0'),(700,'3.7.0-2017-04-19'),(10040,'4.2.0'),(10063,'2.0.3.1'),(10067,'2.0.3.1');
/*!40000 ALTER TABLE `l1pym_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_session`
--

DROP TABLE IF EXISTS `l1pym_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_session`
--

LOCK TABLES `l1pym_session` WRITE;
/*!40000 ALTER TABLE `l1pym_session` DISABLE KEYS */;
INSERT INTO `l1pym_session` VALUES ('0fpi2lprq1egaf24m6ed4psllu',0,1,'1543499574','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTU3MztzOjQ6Imxhc3QiO2k6MTU0MzQ5OTU3NDtzOjM6Im5vdyI7aToxNTQzNDk5NTc0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('2kiqu8ma5jd92mkb66b9ugtm3f',0,1,'1543498420','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODQxOTtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODQxOTtzOjM6Im5vdyI7aToxNTQzNDk4NDIwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('3uu72hp9fb2lrb7dlmolglcjlp',0,1,'1543499287','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTI4NTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTI4NjtzOjM6Im5vdyI7aToxNTQzNDk5Mjg3O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('5jektmdvqd3d8m5gvq2a7h9rt7',0,1,'1543497844','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5Nzg0MztzOjQ6Imxhc3QiO2k6MTU0MzQ5Nzg0MztzOjM6Im5vdyI7aToxNTQzNDk3ODQ0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('6f4q277773qbsns2e90go13jkg',0,1,'1543499572','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTU3MTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTU3MTtzOjM6Im5vdyI7aToxNTQzNDk5NTcyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('73saif0kt6crj531fb10oj6cbf',0,1,'1543499650','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTY0OTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTY0OTtzOjM6Im5vdyI7aToxNTQzNDk5NjQ5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('91nh84qnpgrj2c7j5uol3grtj2',0,1,'1543500728','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDcyNjtzOjQ6Imxhc3QiO2k6MTU0MzUwMDcyNztzOjM6Im5vdyI7aToxNTQzNTAwNzI4O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('9lneb0vt8q1mhsj25s3fmhr8cd',0,1,'1543500853','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDg1MDtzOjQ6Imxhc3QiO2k6MTU0MzUwMDg1MDtzOjM6Im5vdyI7aToxNTQzNTAwODUwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('bm05f5j2r0br3ln4s65d0p4uop',0,1,'1543500436','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDQzNTtzOjQ6Imxhc3QiO2k6MTU0MzUwMDQzNTtzOjM6Im5vdyI7aToxNTQzNTAwNDM2O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('bt9j49geq48ht0tkb2j1dkanci',0,1,'1543499951','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTk0OTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTk0OTtzOjM6Im5vdyI7aToxNTQzNDk5OTQ5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('bugpnqvut22dekqvnncihu5gu2',0,1,'1543499824','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTgyMTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTgyMTtzOjM6Im5vdyI7aToxNTQzNDk5ODIxO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('c30p3969pqt79p3eupqko2oj9l',0,1,'1543499863','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTg2MTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTg2MjtzOjM6Im5vdyI7aToxNTQzNDk5ODYzO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('clf62j9repj2ffsnp521auo5ah',0,1,'1543500737','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDczNztzOjQ6Imxhc3QiO2k6MTU0MzUwMDczNztzOjM6Im5vdyI7aToxNTQzNTAwNzM3O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('cn4ko0dsfe7r73cl2etm79v7g5',0,1,'1543498670','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODY2OTtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODY2OTtzOjM6Im5vdyI7aToxNTQzNDk4NjY5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('d3a68skobquj2n1ifn8kt5nrl2',0,1,'1543498999','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODk5NztzOjQ6Imxhc3QiO2k6MTU0MzQ5ODk5ODtzOjM6Im5vdyI7aToxNTQzNDk4OTk5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('dorkelea6aiiscu391p63gkgbj',0,1,'1543498134','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODEzMztzOjQ6Imxhc3QiO2k6MTU0MzQ5ODEzMztzOjM6Im5vdyI7aToxNTQzNDk4MTM0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('eciho2pc9liit5sf1l29l70hsg',0,1,'1543500439','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDQzNztzOjQ6Imxhc3QiO2k6MTU0MzUwMDQzODtzOjM6Im5vdyI7aToxNTQzNTAwNDM5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('he3qpd6ibup8hd6sajomdb56vi',0,1,'1543498132','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODEzMTtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODEzMTtzOjM6Im5vdyI7aToxNTQzNDk4MTMyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('hl39osrb4cqsqa0va1018sm9oa',0,1,'1543498709','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODcwNztzOjQ6Imxhc3QiO2k6MTU0MzQ5ODcwNztzOjM6Im5vdyI7aToxNTQzNDk4NzA5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('ig2q7ltugk8hu2qd7oirm20rcl',0,1,'1543500151','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDE0OTtzOjQ6Imxhc3QiO2k6MTU0MzUwMDE1MDtzOjM6Im5vdyI7aToxNTQzNTAwMTUxO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('jrq2glsmrp9b106k8pvaoji4j3',0,1,'1543498711','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODcxMDtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODcxMTtzOjM6Im5vdyI7aToxNTQzNDk4NzExO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('k4an44f8tqgmofifbbmdsj6k8n',0,1,'1543500482','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDQ4MTtzOjQ6Imxhc3QiO2k6MTU0MzUwMDQ4MTtzOjM6Im5vdyI7aToxNTQzNTAwNDgyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('lg345qu6a2pp7njahbe4mk5cke',0,1,'1543499284','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTI4MztzOjQ6Imxhc3QiO2k6MTU0MzQ5OTI4MztzOjM6Im5vdyI7aToxNTQzNDk5Mjg0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('mt07v9bj00s00ek9i50bh56f9c',0,1,'1543500148','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDE0NztzOjQ6Imxhc3QiO2k6MTU0MzUwMDE0NztzOjM6Im5vdyI7aToxNTQzNTAwMTQ4O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('o4op2b0hhsgvh170fan6dn7eha',0,1,'1543497847','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5Nzg0NTtzOjQ6Imxhc3QiO2k6MTU0MzQ5Nzg0NjtzOjM6Im5vdyI7aToxNTQzNDk3ODQ2O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('odgapv9h8tv0pooi28t0nctevh',0,1,'1543501303','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMTMwMTtzOjQ6Imxhc3QiO2k6MTU0MzUwMTMwMjtzOjM6Im5vdyI7aToxNTQzNTAxMzAyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('pa8d040q5omddv5npr9ccspe8h',0,1,'1543498996','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODk5NTtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODk5NTtzOjM6Im5vdyI7aToxNTQzNDk4OTk2O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('pfmvkn6korfbt6v2ma6qfmf8og',0,1,'1543501300','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMTI5OTtzOjQ6Imxhc3QiO2k6MTU0MzUwMTI5OTtzOjM6Im5vdyI7aToxNTQzNTAxMzAwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('pn0stcus23iaottgl6q6kccmt9',0,1,'1543499945','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTk0NDtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTk0NDtzOjM6Im5vdyI7aToxNTQzNDk5OTQ1O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('qho4e82msgt5749iob36ak6ktt',0,1,'1543501012','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMTAxMjtzOjQ6Imxhc3QiO2k6MTU0MzUwMTAxMjtzOjM6Im5vdyI7aToxNTQzNTAxMDEyO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('qpojk545g8otg2fbmdpfa30e3s',0,1,'1543499860','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTg1OTtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTg1OTtzOjM6Im5vdyI7aToxNTQzNDk5ODYwO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('rkr7osv45iklaps7qmg4hom0jc',0,1,'1543498213','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODIxMztzOjQ6Imxhc3QiO2k6MTU0MzQ5ODIxMztzOjM6Im5vdyI7aToxNTQzNDk4MjEzO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('s1b0bblj3tk26rq1nugcroqcfs',0,1,'1543498620','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODYxNTtzOjQ6Imxhc3QiO2k6MTU0MzQ5ODYxNTtzOjM6Im5vdyI7aToxNTQzNDk4NjE1O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('s61skucccif34qcq8fe4bvo05n',0,1,'1543500887','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDg4MztzOjQ6Imxhc3QiO2k6MTU0MzUwMDg4MztzOjM6Im5vdyI7aToxNTQzNTAwODgzO319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('sae9m4l84oiso40k32u3cm4qhi',0,1,'1543501016','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMTAxNDtzOjQ6Imxhc3QiO2k6MTU0MzUwMTAxNTtzOjM6Im5vdyI7aToxNTQzNTAxMDE2O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('sidue02fhsrm6fp2noqi5nh6q9',0,1,'1543498424','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5ODQyMztzOjQ6Imxhc3QiO2k6MTU0MzQ5ODQyMztzOjM6Im5vdyI7aToxNTQzNDk4NDI0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('tsaonp7ibdbbpd9e1mvcqenfva',1,1,'1543500913','joomla|s:712:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDkxMztzOjQ6Imxhc3QiO2k6MTU0MzUwMDkxMztzOjM6Im5vdyI7aToxNTQzNTAwOTEzO31zOjU6InRva2VuIjtzOjMyOiJRMm41Tzc5T3ZnYlZqdFFQNmNpUDdVbVBmWW41d1hiaSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";',0,''),('u9r0qk4c8f5nt8vfnrdimfk7ie',0,1,'1543499947','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTozO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzQ5OTk0NjtzOjQ6Imxhc3QiO2k6MTU0MzQ5OTk0NjtzOjM6Im5vdyI7aToxNTQzNDk5OTQ3O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('uiu7nj43vo0h1g09mffdrm2u3v',0,1,'1543500724','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDcyMztzOjQ6Imxhc3QiO2k6MTU0MzUwMDcyMztzOjM6Im5vdyI7aToxNTQzNTAwNzI0O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('usqh54aoub8gdi5nvp2h4o0537',0,1,'1543500199','joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDE5ODtzOjQ6Imxhc3QiO2k6MTU0MzUwMDE5ODtzOjM6Im5vdyI7aToxNTQzNTAwMTk4O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('uut0s333updtmi5thkin6g5bia',0,1,'1543500846','getThemeDocumentsNumberRecord|a:39:{i:0;a:2:{s:4:\"name\";s:23:\"Condizioni atmosferiche\";s:9:\"documents\";i:54;}i:1;a:2:{s:4:\"name\";s:19:\"Copertura del suolo\";s:9:\"documents\";i:523;}i:2;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione - demografia\";s:9:\"documents\";i:11;}i:3;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione _ demografia\";s:9:\"documents\";i:6;}i:4;a:2:{s:4:\"name\";s:44:\"Distribuzione della popolazione ? demografia\";s:9:\"documents\";i:15;}i:5;a:2:{s:4:\"name\";s:26:\"Distribuzione delle specie\";s:9:\"documents\";i:46;}i:6;a:2:{s:4:\"name\";s:7:\"Edifici\";s:9:\"documents\";i:481;}i:7;a:2:{s:4:\"name\";s:33:\"Elementi geografici meteorologici\";s:9:\"documents\";i:3;}i:8;a:2:{s:4:\"name\";s:33:\"Elementi geografici oceanografici\";s:9:\"documents\";i:8;}i:9;a:2:{s:4:\"name\";s:10:\"Elevazione\";s:9:\"documents\";i:450;}i:10;a:2:{s:4:\"name\";s:8:\"Geologia\";s:9:\"documents\";i:476;}i:11;a:2:{s:4:\"name\";s:17:\"Habitat e biotopi\";s:9:\"documents\";i:158;}i:12;a:2:{s:4:\"name\";s:10:\"Idrografia\";s:9:\"documents\";i:559;}i:13;a:2:{s:4:\"name\";s:35:\"Impianti agricoli e di acquacoltura\";s:9:\"documents\";i:60;}i:14;a:2:{s:4:\"name\";s:35:\"Impianti di monitoraggio ambientale\";s:9:\"documents\";i:172;}i:15;a:2:{s:4:\"name\";s:9:\"Indirizzi\";s:9:\"documents\";i:129;}i:16;a:2:{s:4:\"name\";s:36:\"Meteorological geographical features\";s:9:\"documents\";i:22;}i:17;a:2:{s:4:\"name\";s:15:\"Nomi geografici\";s:9:\"documents\";i:991;}i:18;a:2:{s:4:\"name\";s:13:\"Orto immagini\";s:9:\"documents\";i:911;}i:19;a:2:{s:4:\"name\";s:18:\"Parcelle catastali\";s:9:\"documents\";i:7810;}i:20;a:2:{s:4:\"name\";s:33:\"Produzione e impianti industriali\";s:9:\"documents\";i:126;}i:21;a:2:{s:4:\"name\";s:15:\"Protected sites\";s:9:\"documents\";i:1;}i:22;a:2:{s:4:\"name\";s:22:\"Regioni biogeografiche\";s:9:\"documents\";i:71;}i:23;a:2:{s:4:\"name\";s:14:\"Regioni marine\";s:9:\"documents\";i:56;}i:24;a:2:{s:4:\"name\";s:17:\"Reti di trasporto\";s:9:\"documents\";i:679;}i:25;a:2:{s:4:\"name\";s:19:\"Risorse energetiche\";s:9:\"documents\";i:38;}i:26;a:2:{s:4:\"name\";s:17:\"Risorse minerarie\";s:9:\"documents\";i:34;}i:27;a:2:{s:4:\"name\";s:24:\"Salute umana e sicurezza\";s:9:\"documents\";i:32;}i:28;a:2:{s:4:\"name\";s:53:\"Servizi di pubblica utilità e servizi amministrativi\";s:9:\"documents\";i:329;}i:29;a:2:{s:4:\"name\";s:21:\"Sistemi di coordinate\";s:9:\"documents\";i:92;}i:30;a:2:{s:4:\"name\";s:30:\"Sistemi di griglie geografiche\";s:9:\"documents\";i:94;}i:31;a:2:{s:4:\"name\";s:13:\"Siti protetti\";s:9:\"documents\";i:329;}i:32;a:2:{s:4:\"name\";s:5:\"Suolo\";s:9:\"documents\";i:241;}i:33;a:2:{s:4:\"name\";s:21:\"Unità amministrative\";s:9:\"documents\";i:267;}i:34;a:2:{s:4:\"name\";s:18:\"Unità statistiche\";s:9:\"documents\";i:88;}i:35;a:2:{s:4:\"name\";s:23:\"Utilizzo del territorio\";s:9:\"documents\";i:3687;}i:36;a:2:{s:4:\"name\";s:23:\"Zone a rischio naturale\";s:9:\"documents\";i:479;}i:37;a:2:{s:4:\"name\";s:95:\"Zone sottoposte a gestione/limitazioni/regolamentazione e unità con obbligo di comunicare dati\";s:9:\"documents\";i:1131;}i:38;a:2:{s:4:\"name\";s:36:\"population distribution ? demography\";s:9:\"documents\";i:5;}}joomla|s:644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTU0MzUwMDgzOTtzOjQ6Imxhc3QiO2k6MTU0MzUwMDgzOTtzOjM6Im5vdyI7aToxNTQzNTAwODM5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,'');
/*!40000 ALTER TABLE `l1pym_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_sh_config`
--

DROP TABLE IF EXISTS `l1pym_sh_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_sh_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_sh_config`
--

LOCK TABLES `l1pym_sh_config` WRITE;
/*!40000 ALTER TABLE `l1pym_sh_config` DISABLE KEYS */;
INSERT INTO `l1pym_sh_config` VALUES (1,'platform:version','2.0.3.1'),(2,'platform:import','[\"ldap\"]'),(3,'user:autoregister','2'),(4,'user:defaultgroup','2'),(6,'ldap:version','2.0.3.1'),(7,'ldap:source','1'),(8,'ldap:plugin','ldap'),(9,'user:type','ldap'),(10,'user:nullpassword','1'),(11,'user:usedomain','1'),(12,'user:blacklist','');
/*!40000 ALTER TABLE `l1pym_sh_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_sh_ldap_config`
--

DROP TABLE IF EXISTS `l1pym_sh_ldap_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_sh_ldap_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  `params` text NOT NULL,
  `checked_out` int(10) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_sh_ldap_config`
--

LOCK TABLES `l1pym_sh_ldap_config` WRITE;
/*!40000 ALTER TABLE `l1pym_sh_ldap_config` DISABLE KEYS */;
INSERT INTO `l1pym_sh_ldap_config` VALUES (1,'LDAP',1,0,'{\"table\":\"#__sh_ldap_config\",\"use_v3\":\"1\",\"negotiate_tls\":\"0\",\"use_referrals\":\"0\",\"host\":\"localhost\",\"port\":\"389\",\"proxy_username\":\"\",\"proxy_password\":\"\",\"proxy_encryption\":\"0\",\"base_dn\":\"ou=Users,ou=People,dc=maxcrc,dc=com\",\"user_qry\":\"cn=[username],ou=Users,ou=People,dc=maxcrc,dc=com\",\"ldap_uid\":\"cn\",\"ldap_fullname\":\"uid\",\"ldap_email\":\"mail\",\"ldap_password\":\"userPassword\",\"password_hash\":\"plain\",\"password_prefix\":\"0\",\"all_user_filter\":\"(objectClass=person)\"}',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `l1pym_sh_ldap_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_tags`
--

DROP TABLE IF EXISTS `l1pym_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_tags`
--

LOCK TABLES `l1pym_tags` WRITE;
/*!40000 ALTER TABLE `l1pym_tags` DISABLE KEYS */;
INSERT INTO `l1pym_tags` VALUES (1,0,0,1,0,'','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',0,'2011-01-01 00:00:01','',0,'0000-00-00 00:00:00','','',0,'*',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `l1pym_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_template_styles`
--

DROP TABLE IF EXISTS `l1pym_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_template_styles`
--

LOCK TABLES `l1pym_template_styles` WRITE;
/*!40000 ALTER TABLE `l1pym_template_styles` DISABLE KEYS */;
INSERT INTO `l1pym_template_styles` VALUES (2,'bluestork',1,'0','Bluestork - Default','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}'),(3,'atomic',0,'0','Atomic - Default','{}'),(4,'beez_20',0,'0','Beez2 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(6,'beez5',0,'0','Beez5 - Default-Fruit Shop','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Matuna Market \",\"sitedescription\":\"Fruit Shop Sample Site\",\"navposition\":\"left\",\"html5\":\"0\"}'),(11,'protostar',0,'0','protostar - Default','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),(12,'isis',1,'1','isis - Default','{\"templateColor\":\"\",\"logoFile\":\"\"}'),(13,'beez3',0,'0','beez3 - Default','{\"wrapperSmall\":53,\"wrapperLarge\":72,\"logo\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"bootstrap\":\"\",\"templatecolor\":\"nature\",\"headerImage\":\"\",\"backgroundcolor\":\"#eee\"}'),(14,'rndt',0,'1','rndt - Predefinito','{}'),(15,'rndt - Copia',0,'0','rndt - Predefinito','{}');
/*!40000 ALTER TABLE `l1pym_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_ucm_base`
--

DROP TABLE IF EXISTS `l1pym_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_ucm_base`
--

LOCK TABLES `l1pym_ucm_base` WRITE;
/*!40000 ALTER TABLE `l1pym_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_ucm_content`
--

DROP TABLE IF EXISTS `l1pym_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_language` (`core_language`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_content_type` (`core_type_alias`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_ucm_content`
--

LOCK TABLES `l1pym_ucm_content` WRITE;
/*!40000 ALTER TABLE `l1pym_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_ucm_history`
--

DROP TABLE IF EXISTS `l1pym_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_ucm_history`
--

LOCK TABLES `l1pym_ucm_history` WRITE;
/*!40000 ALTER TABLE `l1pym_ucm_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_ucm_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_update_categories`
--

DROP TABLE IF EXISTS `l1pym_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_update_categories`
--

LOCK TABLES `l1pym_update_categories` WRITE;
/*!40000 ALTER TABLE `l1pym_update_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_update_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_update_sites`
--

DROP TABLE IF EXISTS `l1pym_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_update_sites`
--

LOCK TABLES `l1pym_update_sites` WRITE;
/*!40000 ALTER TABLE `l1pym_update_sites` DISABLE KEYS */;
INSERT INTO `l1pym_update_sites` VALUES (1,'Joomla! Core','collection','https://update.joomla.org/core/sts/list_sts.xml',1,1543498737,''),(5,'Accredited Joomla! Translations','collection','https://update.joomla.org/language/translationlist_3.xml',1,0,''),(7,'Joomla! Update Component Update Site','extension','https://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,0,''),(8,'Weblinks Update Site','extension','https://raw.githubusercontent.com/joomla-extensions/weblinks/master/manifest.xml',1,0,''),(15,'at[tec] Update Server','extension','http://www.attec.at/joomla-updates/plg_system_less_update.xml',1,0,''),(16,'Alledia Framework','extension','https://deploy.ostraining.com/client/update/free/stable/lib_allediaframework',1,0,''),(20,'WebInstaller Update Site','extension','http://appscdn.joomla.org/webapps/jedapps/webinstaller.xml',1,0,''),(27,'Shmanic Updator','collection','http://update.shmanic.com/joomla/collection.xml',1,0,''),(30,'WebInstaller Update Site','extension','https://appscdn.joomla.org/webapps/jedapps/webinstaller.xml',1,0,''),(31,'OSSystem','extension','https://deploy.ostraining.com/client/update/free/stable/plg_system_ossystem',1,1543498737,''),(32,'OSMap','extension','https://deploy.ostraining.com/client/update/free/stable/com_osmap',1,1543498738,''),(35,'JCE Editor Package','collection','https://www.joomlacontenteditor.net/index.php?option=com_updates&view=update&format=xml&file=pkg_jce.xml',1,1543498738,'');
/*!40000 ALTER TABLE `l1pym_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_update_sites_extensions`
--

DROP TABLE IF EXISTS `l1pym_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_update_sites_extensions`
--

LOCK TABLES `l1pym_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `l1pym_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `l1pym_update_sites_extensions` VALUES (1,700),(5,802),(5,10013),(5,10050),(7,28),(8,801),(15,10046),(16,10047),(16,10081),(20,10051),(27,10066),(30,10051),(31,10042),(32,10040),(35,10059);
/*!40000 ALTER TABLE `l1pym_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_updates`
--

DROP TABLE IF EXISTS `l1pym_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_updates`
--

LOCK TABLES `l1pym_updates` WRITE;
/*!40000 ALTER TABLE `l1pym_updates` DISABLE KEYS */;
INSERT INTO `l1pym_updates` VALUES (1,31,10042,'OSSystem','OSSystem','ossystem','plugin','system',0,'1.3.0','','https://deploy.ostraining.com/client/update/free/stable/plg_system_ossystem','https://github.com/OSTraining/OSSystem/releases/tag/v1.3.0',''),(2,1,700,'Joomla','','joomla','file','',0,'3.9.1','','https://update.joomla.org/core/sts/extension_sts.xml','',''),(3,32,10040,'OSMap','OSMap','com_osmap','component','',1,'4.2.19','','https://deploy.ostraining.com/client/update/free/stable/com_osmap','https://github.com/OSTraining/OSMap/releases/tag/v4.2.19',''),(4,35,10059,'JCE Editor Core','','pkg_jce','package','',0,'2.6.33','','https://www.joomlacontenteditor.net/index.php?option=com_updates&view=update&format=xml&file=pkg_jce.xml','https://www.joomlacontenteditor.net/news/jce-pro-2-6-33-released','');
/*!40000 ALTER TABLE `l1pym_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_user_keys`
--

DROP TABLE IF EXISTS `l1pym_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_user_keys`
--

LOCK TABLES `l1pym_user_keys` WRITE;
/*!40000 ALTER TABLE `l1pym_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_user_notes`
--

DROP TABLE IF EXISTS `l1pym_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_user_notes`
--

LOCK TABLES `l1pym_user_notes` WRITE;
/*!40000 ALTER TABLE `l1pym_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_user_profiles`
--

DROP TABLE IF EXISTS `l1pym_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_user_profiles`
--

LOCK TABLES `l1pym_user_profiles` WRITE;
/*!40000 ALTER TABLE `l1pym_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_user_usergroup_map`
--

DROP TABLE IF EXISTS `l1pym_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_user_usergroup_map`
--

LOCK TABLES `l1pym_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `l1pym_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `l1pym_user_usergroup_map` VALUES (50,2),(50,8);
/*!40000 ALTER TABLE `l1pym_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_usergroups`
--

DROP TABLE IF EXISTS `l1pym_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_usergroups`
--

LOCK TABLES `l1pym_usergroups` WRITE;
/*!40000 ALTER TABLE `l1pym_usergroups` DISABLE KEYS */;
INSERT INTO `l1pym_usergroups` VALUES (1,0,1,16,'Public'),(2,1,4,11,'Registered'),(3,2,5,10,'Author'),(4,3,6,9,'Editor'),(5,4,7,8,'Publisher'),(6,1,2,3,'Manager'),(8,1,12,15,'Super Users');
/*!40000 ALTER TABLE `l1pym_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_users`
--

DROP TABLE IF EXISTS `l1pym_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `idx_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_users`
--

LOCK TABLES `l1pym_users` WRITE;
/*!40000 ALTER TABLE `l1pym_users` DISABLE KEYS */;
INSERT INTO `l1pym_users` VALUES (50,'Amministratore Sistema','admin','gcampanile1@esriitalia.it','$2y$10$QZcL79I0vumBCSSviMEXcOG0FceglMj/uUd/TLltCZcxpQUrN5qgq',0,0,'2017-03-01 13:11:07','2018-11-29 14:15:13','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\",\"auth_type\":\"LDAP\",\"auth_domain\":\"LDAP\"}','0000-00-00 00:00:00',0,'','',0);
/*!40000 ALTER TABLE `l1pym_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_utf8_conversion`
--

DROP TABLE IF EXISTS `l1pym_utf8_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_utf8_conversion`
--

LOCK TABLES `l1pym_utf8_conversion` WRITE;
/*!40000 ALTER TABLE `l1pym_utf8_conversion` DISABLE KEYS */;
INSERT INTO `l1pym_utf8_conversion` VALUES (2);
/*!40000 ALTER TABLE `l1pym_utf8_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_viewlevels`
--

DROP TABLE IF EXISTS `l1pym_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_viewlevels`
--

LOCK TABLES `l1pym_viewlevels` WRITE;
/*!40000 ALTER TABLE `l1pym_viewlevels` DISABLE KEYS */;
INSERT INTO `l1pym_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',1,'[6,2,8]'),(3,'Special',2,'[6,3,8]'),(4,'Administrator',0,'[8]');
/*!40000 ALTER TABLE `l1pym_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_weblinks`
--

DROP TABLE IF EXISTS `l1pym_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_weblinks`
--

LOCK TABLES `l1pym_weblinks` WRITE;
/*!40000 ALTER TABLE `l1pym_weblinks` DISABLE KEYS */;
INSERT INTO `l1pym_weblinks` VALUES (1,9,'Icons','icons','http://www.yootheme.com/icons','',4,-2,0,'0000-00-00 00:00:00',1,1,'{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}','*','2012-01-23 15:41:46',42,'','0000-00-00 00:00:00',0,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,''),(2,9,'YOOtheme','yootheme','http://www.yootheme.com','',1,-2,0,'0000-00-00 00:00:00',2,1,'{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}','*','2012-01-23 15:42:03',42,'','0000-00-00 00:00:00',0,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,''),(3,9,'ZOO','zoo','http://www.yootheme.com/zoo','',0,1,0,'0000-00-00 00:00:00',3,1,'{\"target\":\"\",\"width\":\"\",\"height\":\"\",\"count_clicks\":\"\"}','*','2012-01-23 15:42:18',42,'','0000-00-00 00:00:00',0,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'');
/*!40000 ALTER TABLE `l1pym_weblinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_wf_profiles`
--

DROP TABLE IF EXISTS `l1pym_wf_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `users` text NOT NULL,
  `types` text,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) DEFAULT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_wf_profiles`
--

LOCK TABLES `l1pym_wf_profiles` WRITE;
/*!40000 ALTER TABLE `l1pym_wf_profiles` DISABLE KEYS */;
INSERT INTO `l1pym_wf_profiles` VALUES (1,'Default','Default Profile for all users','','3,4,5,6,7,8','',0,NULL,'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,blockquote,formatselect,styleselect,removeformat,cleanup;fontselect,fontsizeselect,forecolor,backcolor,spacer,clipboard,indent,outdent,lists,sub,sup,textcase,charmap,hr;directionality,fullscreen,preview,source,print,searchreplace,spacer,table;visualaid,visualchars,nonbreaking,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article','contextmenu,browser,inlinepopups,media,help,clipboard,searchreplace,directionality,fullscreen,preview,source,table,textcase,print,style,nonbreaking,visualchars,xhtmlxtras,imgmanager,link,spellchecker,article,anchor,lists,charmap,formatselect,styleselect,fontselect,fontsizeselect,fontcolor',1,1,0,'0000-00-00 00:00:00','{\"lists\":{\"buttons\":[\"numlist\",\"bullist\"]}}'),(2,'Front End','Sample Front-end Profile','','3,4,5','',1,NULL,'help,newdocument,undo,redo,spacer,bold,italic,underline,strikethrough,justifyfull,justifycenter,justifyleft,justifyright,spacer,formatselect,styleselect;clipboard,searchreplace,indent,outdent,lists,cleanup,charmap,removeformat,hr,sub,sup,textcase,nonbreaking,visualchars;fullscreen,preview,print,visualaid,style,xhtmlxtras,anchor,unlink,link,imgmanager,spellchecker,article','contextmenu,inlinepopups,help,clipboard,searchreplace,fullscreen,preview,print,style,textcase,nonbreaking,visualchars,xhtmlxtras,imgmanager,link,spellchecker,article,anchor,lists,charmap,formatselect,styleselect',0,2,0,'0000-00-00 00:00:00','{\"lists\":{\"buttons\":[\"numlist\",\"bullist\"]}}');
/*!40000 ALTER TABLE `l1pym_wf_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_widgetkit_widget`
--

DROP TABLE IF EXISTS `l1pym_widgetkit_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_widgetkit_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_widgetkit_widget`
--

LOCK TABLES `l1pym_widgetkit_widget` WRITE;
/*!40000 ALTER TABLE `l1pym_widgetkit_widget` DISABLE KEYS */;
INSERT INTO `l1pym_widgetkit_widget` VALUES (24,'gallery','wall','Demo Wall Zoom','{\"type\":\"gallery\",\"id\":24,\"name\":\"Demo Wall Zoom\",\"settings\":{\"style\":\"wall\",\"width\":200,\"height\":150,\"effect\":\"zoom\",\"margin\":\"\",\"corners\":\"\",\"lightbox\":1,\"lightbox_caption\":1,\"spotlight_effect\":\"\"},\"style\":\"wall\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image1.jpg\":\"Model 1\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image2.jpg\":\"Model 2\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image3.jpg\":\"Model 3\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image4.jpg\":\"Model 4\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image5.jpg\":\"Model 5\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image6.jpg\":\"Model 6\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/zoom\\/image6.jpg\":\"\"}}','2011-07-07 15:41:12','2011-07-29 10:38:06'),(25,'gallery','wall','Demo Wall Polaroid','{\"type\":\"gallery\",\"id\":25,\"name\":\"Demo Wall Polaroid\",\"settings\":{\"style\":\"wall\",\"width\":200,\"height\":150,\"effect\":\"polaroid\",\"margin\":\"\",\"corners\":\"\",\"lightbox\":1,\"lightbox_caption\":1,\"spotlight_effect\":\"\"},\"style\":\"wall\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image1.jpg\":\"Tony\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image2.jpg\":\"Susan\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image3.jpg\":\"Jennifer\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image4.jpg\":\"Kim\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image5.jpg\":\"Vanessa\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image6.jpg\":\"Clark\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/polaroid\\/image6.jpg\":\"\"}}','2011-07-07 15:44:32','2011-07-29 10:43:01'),(10,'slideshow','default','Demo Default','{\"type\":\"slideshow\",\"id\":10,\"name\":\"Demo Default\",\"settings\":{\"style\":\"default\",\"autoplay\":1,\"interval\":5000,\"width\":600,\"height\":300,\"duration\":500,\"index\":0,\"order\":\"default\",\"navigation\":1,\"buttons\":1,\"slices\":15,\"animated\":\"randomFx\",\"caption_animation_duration\":500},\"style\":\"default\",\"items\":{\"4dd00c3ee01f3\":{\"title\":\"Slide 1\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/image1.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 01\\\" \\/><\\/a>\",\"caption\":\"\"},\"4dd00c473c0f2\":{\"title\":\"Slide 2\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/image2.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 02\\\" \\/><\\/a>\",\"caption\":\"This is a HTML caption with a <a href=\\\"#\\\">link<\\/a>.\"},\"4dd00c4eb7982\":{\"title\":\"Slide 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/image3.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 03\\\" \\/><\\/a>\",\"caption\":\"This is another HTML caption with a <a href=\\\"#\\\">link<\\/a>.\"},\"4de3f1aa49f9a\":{\"title\":\"Slide 4\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/image4.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 04\\\" \\/><\\/a>\",\"caption\":\"\"},\"4de3f1ab9f6c9\":{\"title\":\"Slide 5\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/image5.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 05\\\" \\/><\\/a>\",\"caption\":\"\"}}}','2011-05-15 17:24:01','2011-09-05 14:17:41'),(19,'gallery','default','Demo Slideshow','{\"type\":\"gallery\",\"id\":19,\"name\":\"Demo Slideshow\",\"settings\":{\"style\":\"default\",\"width\":600,\"height\":300,\"order\":\"default\",\"autoplay\":0,\"interval\":5000,\"duration\":500,\"index\":0,\"navigation\":1,\"buttons\":1,\"slices\":15,\"animated\":\"randomFx\",\"caption_animation_duration\":500,\"lightbox\":0},\"style\":\"default\",\"paths\":[\"\\/yootheme\\/widgetkit\\/slideshow\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/slideshow\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image2.jpg\":\"This is a HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image3.jpg\":\"This is another HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image5.jpg\":\"\"},\"links\":{\"\\/yootheme\\/widgetkit\\/slideshow\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/slideshow\\/image5.jpg\":\"\"}}','2011-06-29 17:52:08','2011-09-12 15:47:24'),(23,'gallery','wall','Demo Wall Spotlight','{\"type\":\"gallery\",\"id\":23,\"name\":\"Demo Wall Spotlight\",\"settings\":{\"style\":\"wall\",\"width\":200,\"height\":150,\"effect\":\"spotlight\",\"margin\":\"margin\",\"corners\":\"round\",\"lightbox\":1,\"lightbox_caption\":1,\"spotlight_effect\":\"\"},\"style\":\"wall\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image6.jpg\":\"\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/image6.jpg\":\"\"}}','2011-07-03 16:53:00','2011-07-28 16:18:08'),(34,'slideshow','tabs_bar','Demo Tabs Bar','{\"type\":\"slideshow\",\"id\":34,\"name\":\"Demo Tabs Bar\",\"settings\":{\"style\":\"tabs_bar\",\"autoplay\":0,\"interval\":5000,\"width\":\"auto\",\"height\":\"auto\",\"duration\":500,\"index\":0,\"order\":\"default\",\"navigation\":\"left\",\"animated\":\"scroll\"},\"style\":\"tabs_bar\",\"items\":{\"4e511fb86001b\":{\"title\":\"Tab One\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image1.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 01\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\",\"caption\":\"\"},\"4e511fd616557\":{\"title\":\"Tab Two\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image2.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 02\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e511fd6eeb3b\":{\"title\":\"Tab Three\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image3.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 03\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}}}','2011-08-21 15:09:51','2011-09-12 12:38:06'),(26,'map','default','Demo Default','{\"type\":\"map\",\"id\":26,\"name\":\"Demo Default\",\"settings\":{\"style\":\"default\",\"width\":\"auto\",\"height\":500,\"mapTypeId\":\"roadmap\",\"zoom\":13,\"mapCtrl\":1,\"typeCtrl\":1,\"popup\":2,\"directions\":1,\"styler_invert_lightness\":0,\"styler_hue\":\"\",\"styler_saturation\":0,\"styler_lightness\":0,\"styler_gamma\":0},\"style\":\"default\",\"items\":{\"4e16d63a2bc97\":{\"title\":\"Museum of Modern Art\",\"location\":\"Museum of Modern Art, New York, NY 10019, USA\",\"lat\":\"40.7613983\",\"lng\":\"-73.9776179\",\"icon\":\"red-dot\",\"popup\":\"<h3>Museum of Modern Art<\\/h3>\\r\\n11 W 53rd St\\r\\n<br \\/>New York, NY 10019\\r\\n<br \\/>(212) 708-9400\\r\\n<br \\/><a href=\\\"http:\\/\\/www.moma.org\\\">moma.org<\\/a>\"},\"4e16d65531670\":{\"title\":\"Madison Square Garden\",\"location\":\"Penn Station, New York, NY 10001, USA\",\"lat\":\"40.75058\",\"lng\":\"-73.99358\",\"icon\":\"red-dot\",\"popup\":\"<h3>Madison Square Garden<\\/h3>\\r\\n2 Penn Plz # 15\\r\\n<br \\/>New York, NY 10121\\r\\n<br \\/>Get Directions\\r\\n<br \\/>(212) 465-6000\\r\\n<br \\/><a href=\\\"http:\\/\\/www.msg.com\\\">msg.com<\\/a>\"},\"4e16d5e1740d8\":{\"title\":\"Rockefeller Center\",\"location\":\"Rockefeller Plaza, Rockefeller Center, New York, NY 10112, USA\",\"lat\":\"40.7584384\",\"lng\":\"-73.9789121\",\"icon\":\"red-dot\",\"popup\":\"<h3>Rockefeller Center<\\/h3>\\r\\n25 W 51st St\\r\\n<br \\/>New York, NY 10019\\r\\n<br \\/>(212) 262-1600\\r\\n<br \\/><a href=\\\"http:\\/\\/www.rockefellercenterhotel.com\\\">rockefellercenterhotel.com<\\/a>\"},\"4e16d6476a880\":{\"title\":\"Empire State Building\",\"location\":\"Empire State Bldg, 350 5th Ave, New York, NY 10001, USA\",\"lat\":\"40.748379\",\"lng\":\"-73.98555999999999\",\"icon\":\"red-dot\",\"popup\":\"<h3>Empire State Building<\\/h3>\\r\\n350 5th Ave # 3210\\r\\n<br \\/>New York, NY 10118\\r\\n<br \\/>(212) 736-3100\\r\\n<br \\/><a href=\\\"http:\\/\\/www.esbnyc.com\\\">esbnyc.com<\\/a>\"}}}','2011-07-08 10:05:25','2011-07-31 15:23:06'),(28,'map','default','Demo Black','{\"type\":\"map\",\"id\":28,\"name\":\"Demo Black\",\"settings\":{\"style\":\"default\",\"width\":\"auto\",\"height\":300,\"mapTypeId\":\"roadmap\",\"zoom\":13,\"mapCtrl\":1,\"typeCtrl\":0,\"popup\":1,\"directions\":0,\"styler_invert_lightness\":1,\"styler_hue\":\"#ff3300\",\"styler_saturation\":-50,\"styler_lightness\":0,\"styler_gamma\":0.91},\"style\":\"default\",\"items\":{\"4e19a7ec5f75a\":{\"title\":\"London\",\"location\":\"Westminster, London, UK\",\"lat\":\"51.5001524\",\"lng\":\"-0.1262362\",\"icon\":\"purple-dot\",\"popup\":\"\"}}}','2011-07-10 13:25:58','2011-07-12 08:24:47'),(27,'gallery','slider','Demo Slider Center','{\"type\":\"gallery\",\"id\":27,\"name\":\"Demo Slider Center\",\"settings\":{\"style\":\"slider\",\"width\":300,\"height\":200,\"total_width\":600,\"spacing\":3,\"center\":1,\"sticky\":0,\"duration\":400,\"lightbox\":1,\"lightbox_caption\":1,\"spotlight\":1,\"spotlight_effect\":\"bottom\"},\"style\":\"slider\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image1.jpg\":\"This is a caption for the first image.\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image2.jpg\":\"This is a caption for the second image.\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image3.jpg\":\"This is a caption for the third image.\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image4.jpg\":\"This is a caption for the fourth image.\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider2\\/image4.jpg\":\"\"}}','2011-07-08 15:28:38','2011-07-29 08:28:24'),(29,'map','default','Demo Minimal','{\"type\":\"map\",\"id\":29,\"name\":\"Demo Minimal\",\"settings\":{\"style\":\"default\",\"width\":400,\"height\":200,\"mapTypeId\":\"roadmap\",\"zoom\":13,\"mapCtrl\":0,\"typeCtrl\":0,\"popup\":0,\"directions\":0,\"styler_invert_lightness\":0,\"styler_hue\":\"\",\"styler_saturation\":0,\"styler_lightness\":0,\"styler_gamma\":0},\"style\":\"default\",\"items\":{\"4e1ac310cf33e\":{\"title\":\"Hamburg\",\"location\":\"Hamburg, Germany\",\"lat\":\"53.553813\",\"lng\":\"9.991586\",\"icon\":\"red-dot\",\"popup\":\"\"}}}','2011-07-11 09:33:05','2011-07-31 15:08:57'),(30,'accordion','default','Demo Default','{\"type\":\"accordion\",\"id\":30,\"name\":\"Demo Default\",\"settings\":{\"style\":\"default\",\"collapseall\":1,\"matchheight\":1,\"index\":0,\"duration\":500,\"width\":500},\"style\":\"default\",\"items\":{\"4e1ac6fe6a20d\":{\"title\":\"Slide 1\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/accordion\\/image1.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 01\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e1ac708561be\":{\"title\":\"Slide 2\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/accordion\\/image2.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 02\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e1ac70cb840e\":{\"title\":\"Slide 3\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/accordion\\/image3.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 03\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e1ac711bbabe\":{\"title\":\"Slide 4\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/accordion\\/image4.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 04\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}}}','2011-07-11 09:49:12','2011-08-23 15:05:56'),(31,'gallery','slider','Demo Slider Left','{\"type\":\"gallery\",\"id\":31,\"name\":\"Demo Slider Left\",\"settings\":{\"style\":\"slider\",\"width\":300,\"height\":200,\"total_width\":600,\"spacing\":3,\"center\":0,\"sticky\":0,\"duration\":400,\"lightbox\":0,\"lightbox_caption\":1,\"spotlight\":0,\"spotlight_effect\":\"\"},\"style\":\"slider\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image4.jpg\":\"\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/slider1\\/image4.jpg\":\"\"}}','2011-07-12 18:23:44','2011-07-29 07:48:55'),(32,'slideset','default','Demo Slide','{\"type\":\"slideset\",\"id\":32,\"name\":\"Demo Slide\",\"settings\":{\"style\":\"default\",\"width\":\"auto\",\"height\":\"auto\",\"effect\":\"slide\",\"index\":0,\"autoplay\":1,\"interval\":5000,\"items_per_set\":4,\"navigation\":1,\"buttons\":0,\"title\":1,\"duration\":300},\"style\":\"default\",\"items\":{\"4e30070bb3f2c\":{\"title\":\"Radio\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image1.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 01\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071628817\":{\"title\":\"Camera\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image2.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 02\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071b515e1\":{\"title\":\"Calendar\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image3.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 03\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300720a131e\":{\"title\":\"Volume\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image4.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 04\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300725404e2\":{\"title\":\"Chat\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image5.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 05\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 2\"},\"4e301094b3b19\":{\"title\":\"Tunes\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image6.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 06\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e301099469eb\":{\"title\":\"E-Mail\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image7.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 07\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109dc7253\":{\"title\":\"Google+\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image8.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 08\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109faa62d\":{\"title\":\"Player\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image9.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 09\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e3010a16c585\":{\"title\":\"Like\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image10.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 10\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e329ee00dfeb\":{\"title\":\"Twitter\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image11.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"},\"4e329ee198f40\":{\"title\":\"Weather\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image12.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"}}}','2011-07-27 12:40:13','2011-09-05 17:13:42'),(33,'slideset','default','Demo Zoom','{\"type\":\"slideset\",\"id\":33,\"name\":\"Demo Zoom\",\"settings\":{\"style\":\"default\",\"width\":\"auto\",\"height\":\"auto\",\"effect\":\"zoom\",\"index\":0,\"autoplay\":1,\"interval\":7000,\"items_per_set\":\"set\",\"navigation\":1,\"buttons\":0,\"title\":0,\"duration\":300},\"style\":\"default\",\"items\":{\"4e30070bb3f2c\":{\"title\":\"Icon 1\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image1.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 01\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071628817\":{\"title\":\"Icon 2\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image2.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 02\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071b515e1\":{\"title\":\"Icon 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image3.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 03\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300720a131e\":{\"title\":\"Icon 4\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image4.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 04\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300725404e2\":{\"title\":\"Item 5\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image5.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 05\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 2\"},\"4e301094b3b19\":{\"title\":\"Icon 6\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image6.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 06\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e301099469eb\":{\"title\":\"Icon 7\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image7.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 07\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109dc7253\":{\"title\":\"Icon 8\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image8.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 08\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109faa62d\":{\"title\":\"Icon 9\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image9.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 09\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e3010a16c585\":{\"title\":\"Icon 10\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image10.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 10\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e329ee00dfeb\":{\"title\":\"Icon 11\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image11.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"},\"4e329ee198f40\":{\"title\":\"Icon 12\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image12.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"}}}','2011-07-29 11:53:34','2011-09-05 17:12:13'),(35,'slideshow','tabs','Demo Tabs','{\"type\":\"slideshow\",\"id\":35,\"name\":\"Demo Tabs\",\"settings\":{\"style\":\"tabs\",\"autoplay\":0,\"interval\":5000,\"width\":\"auto\",\"height\":\"auto\",\"duration\":500,\"index\":0,\"order\":\"default\",\"navigation\":\"left\",\"animated\":\"scroll\"},\"style\":\"tabs\",\"items\":{\"4e511fb86001b\":{\"title\":\"Tab One\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image4.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 04\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\",\"caption\":\"\"},\"4e511fd616557\":{\"title\":\"Tab Two\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image5.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 05\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e511fd6eeb3b\":{\"title\":\"Tab Three\",\"content\":\"<img class=\\\"align-left\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image6.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 06\\\" \\/>\\r\\n<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}}}','2011-08-22 13:43:01','2011-09-09 15:54:58'),(36,'slideshow','list','Demo List','{\"type\":\"slideshow\",\"id\":36,\"name\":\"Demo List\",\"settings\":{\"style\":\"list\",\"autoplay\":0,\"interval\":5000,\"width\":\"auto\",\"height\":\"auto\",\"duration\":500,\"index\":0,\"order\":\"default\",\"navigation\":200,\"animated\":\"scroll\"},\"style\":\"list\",\"items\":{\"4e511fb86001b\":{\"title\":\"Item One\",\"content\":\"<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image9.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 09\\\" \\/>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\",\"caption\":\"\"},\"4e511fd616557\":{\"title\":\"Item Two\",\"content\":\"<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image8.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 08\\\" \\/>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"},\"4e511fd6eeb3b\":{\"title\":\"Item Three\",\"content\":\"<h3 class=\\\"remove-margin-t\\\">Headline<\\/h3>\\r\\n<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/icons\\/image7.png\\\" width=\\\"115\\\" height=\\\"105\\\" alt=\\\"Icon 07\\\" \\/>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\"}}}','2011-08-23 09:54:41','2011-09-05 12:36:22'),(37,'slideshow','showcase_box','Demo Showcase Box','{\"type\":\"slideshow\",\"id\":37,\"name\":\"Demo Showcase Box\",\"settings\":{\"style\":\"showcase_box\",\"autoplay\":0,\"interval\":5000,\"width\":600,\"height\":270,\"duration\":500,\"index\":0,\"order\":\"default\",\"buttons\":0,\"slices\":20,\"animated\":\"scroll\",\"caption_animation_duration\":500,\"effect\":\"slide\",\"slideset_buttons\":1,\"items_per_set\":4,\"slideset_effect_duration\":400},\"style\":\"showcase_box\",\"items\":{\"4dd00c3ee01f3\":{\"title\":\"Slide 1\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image1.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 01\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image1_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 01\\\" \\/> Item 1\"},\"4dd00c473c0f2\":{\"title\":\"Slide 2\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image2.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 02\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image2_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 02\\\" \\/> Item 2\"},\"4dd00c4eb7982\":{\"title\":\"Slide 3\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image3.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 03\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image3_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 03\\\" \\/> Item 3\"},\"4de3f1aa49f9a\":{\"title\":\"Slide 4\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image4.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 04\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image4_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 04\\\" \\/> Item 4\"},\"4de3f1ab9f6c9\":{\"title\":\"Slide 5\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image5.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 05\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image5_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 05\\\" \\/> Item 5\"},\"4e65eda9682e1\":{\"title\":\"Slide 6\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image6.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 06\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image6_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 06\\\" \\/> Item 6\",\"caption\":\"\"},\"4e65edadd0d97\":{\"title\":\"Slide 7\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image7.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 07\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image7_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 07\\\" \\/> Item 7\",\"caption\":\"\"},\"4e65edb02bf73\":{\"title\":\"Slide 8\",\"content\":\"<img class=\\\"align-right\\\" src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image8.png\\\" width=\\\"210\\\" height=\\\"220\\\" alt=\\\"Image 08\\\" \\/>\\r\\n<h2 class=\\\"remove-margin-t\\\">Headline<\\/h2>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<\\/p>\\r\\n<a href=\\\"#\\\" class=\\\"button-more\\\">Read more<\\/a>\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image8_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 08\\\" \\/> Item 8\",\"caption\":\"\"}}}','2011-08-23 15:51:42','2011-09-29 15:17:56'),(39,'gallery','showcase_box','Demo Showcase Box','{\"type\":\"gallery\",\"id\":39,\"name\":\"Demo Showcase Box\",\"settings\":{\"style\":\"showcase_box\",\"width\":600,\"height\":\"auto\",\"order\":\"default\",\"thumb_width\":85,\"thumb_height\":55,\"autoplay\":1,\"interval\":5000,\"duration\":400,\"index\":0,\"buttons\":0,\"slices\":15,\"animated\":\"randomFx\",\"caption_animation_duration\":500,\"effect\":\"zoom\",\"slideset_buttons\":1,\"items_per_set\":4,\"slideset_effect_duration\":300},\"style\":\"showcase_box\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image2.jpg\":\"This is a HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image3.jpg\":\"This is another HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image6.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image7.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image8.jpg\":\"\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image1.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image2.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image3.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image4.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image5.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image6.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image7.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase1\\/image8.jpg\":\"\"}}','2011-09-07 16:58:35','2011-09-12 15:46:18'),(40,'gallery','showcase','Demo Showcase','{\"type\":\"gallery\",\"id\":40,\"name\":\"Demo Showcase\",\"settings\":{\"style\":\"showcase\",\"width\":600,\"height\":\"auto\",\"order\":\"default\",\"thumb_width\":80,\"thumb_height\":45,\"autoplay\":0,\"interval\":5000,\"duration\":500,\"index\":0,\"buttons\":0,\"slices\":15,\"animated\":\"randomSimple\",\"caption_animation_duration\":500,\"effect\":\"zoom\",\"slideset_buttons\":1,\"items_per_set\":5,\"slideset_effect_duration\":300},\"style\":\"showcase\",\"paths\":[\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\"],\"captions\":{\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image01.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image02.jpg\":\"This is a HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image03.jpg\":\"This is another HTML caption with a <a href=\\\"#\\\">link<\\/a>.\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image04.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image05.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image06.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image07.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image08.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image09.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image10.jpg\":\"\"},\"links\":{\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image01.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image02.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image03.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image04.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image05.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image06.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image07.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image08.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image09.jpg\":\"\",\"\\/yootheme\\/widgetkit\\/gallery\\/showcase2\\/image10.jpg\":\"\"}}','2011-09-09 15:18:41','2011-09-12 15:47:48'),(41,'slideshow','showcase_buttons','Demo Showcase Buttons','{\"type\":\"slideshow\",\"id\":41,\"name\":\"Demo Showcase Buttons\",\"settings\":{\"style\":\"showcase_buttons\",\"autoplay\":0,\"interval\":5000,\"width\":600,\"height\":300,\"duration\":500,\"index\":0,\"order\":\"default\",\"buttons\":1,\"slices\":20,\"animated\":\"randomFx\",\"caption_animation_duration\":500,\"effect\":\"zoom\",\"slideset_buttons\":0,\"items_per_set\":4,\"slideset_effect_duration\":400},\"style\":\"showcase_buttons\",\"items\":{\"4dd00c3ee01f3\":{\"title\":\"Slide 1\",\"content\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase2\\/image1.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 01\\\" \\/>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image1_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 01\\\" \\/> Item 1\"},\"4dd00c473c0f2\":{\"title\":\"Slide 2\",\"content\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase2\\/image2.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 02\\\" \\/>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image2_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 02\\\" \\/> Item 2\"},\"4dd00c4eb7982\":{\"title\":\"Slide 3\",\"content\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase2\\/image3.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 03\\\" \\/>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image3_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 03\\\" \\/> Item 3\"},\"4de3f1aa49f9a\":{\"title\":\"Slide 4\",\"content\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase2\\/image4.jpg\\\" width=\\\"600\\\" height=\\\"300\\\" alt=\\\"Image 04\\\" \\/>\",\"caption\":\"\",\"navigation\":\"<img src=\\\"images\\/yootheme\\/widgetkit\\/slideshow\\/showcase1\\/image4_thumb.png\\\" width=\\\"35\\\" height=\\\"35\\\" alt=\\\"Image 04\\\" \\/> Item 4\"}}}','2011-09-12 15:52:19','2011-09-13 10:04:58'),(43,'slideset','default','Demo Deck','{\"type\":\"slideset\",\"id\":43,\"name\":\"Demo Deck\",\"settings\":{\"style\":\"default\",\"width\":\"auto\",\"height\":\"auto\",\"effect\":\"deck\",\"index\":0,\"autoplay\":1,\"interval\":9000,\"items_per_set\":4,\"navigation\":0,\"buttons\":1,\"title\":0,\"duration\":300},\"style\":\"default\",\"items\":{\"4e30070bb3f2c\":{\"title\":\"Radio\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image1.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 01\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071628817\":{\"title\":\"Camera\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image2.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 02\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e30071b515e1\":{\"title\":\"Calendar\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image3.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 03\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300720a131e\":{\"title\":\"Volume\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image4.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 04\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 1\"},\"4e300725404e2\":{\"title\":\"Chat\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image5.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 05\\\" \\/><\\/a>\",\"group\":\"\",\"set\":\"Set 2\"},\"4e301094b3b19\":{\"title\":\"Tunes\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image6.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 06\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e301099469eb\":{\"title\":\"E-Mail\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image7.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 07\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109dc7253\":{\"title\":\"Google+\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image8.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 08\\\" \\/><\\/a>\",\"set\":\"Set 2\"},\"4e30109faa62d\":{\"title\":\"Player\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image9.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 09\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e3010a16c585\":{\"title\":\"Like\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image10.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 10\\\" \\/><\\/a>\",\"set\":\"Set 3\"},\"4e329ee00dfeb\":{\"title\":\"Twitter\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image11.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"},\"4e329ee198f40\":{\"title\":\"Weather\",\"set\":\"Set 3\",\"content\":\"<a href=\\\"#\\\"><img src=\\\"images\\/yootheme\\/widgetkit\\/slideset\\/image12.png\\\" width=\\\"115\\\" height=\\\"115\\\" alt=\\\"Icon 12\\\" \\/><\\/a>\"}}}','2011-09-12 18:34:35','2011-09-12 18:39:02'),(46,'slideset','revista','Frontpage Slideset','{\"type\":\"slideset\",\"id\":46,\"name\":\"Frontpage Slideset\",\"settings\":{\"style\":\"revista\",\"width\":\"auto\",\"height\":89,\"effect\":\"zoom\",\"index\":0,\"autoplay\":0,\"interval\":5000,\"items_per_set\":3,\"navigation\":0,\"buttons\":0,\"title\":0,\"duration\":300},\"style\":\"revista\",\"items\":{\"4f15a669391ed\":{\"title\":\"Accesso al catalogo\",\"set\":\"01\",\"content\":\"<div class=\\\"frontpage-slideset\\\"><img class=\\\"border-box\\\" src=\\\"images\\/yootheme\\/demo\\/slideset\\/accesso-al-catalogo.jpg\\\" alt=\\\"accesso-al-catalogo\\\" height=\\\"50\\\" width=\\\"50\\\" \\/>\\r\\n<div class=\\\"slideset-content\\\"><small>Navigatore Geografico<\\/small>\\r\\n<h3><a href=\\\"\\/RNDT\\/ka-map\\/index.php\\\">Accesso al catalogo<\\/a><\\/h3>\\r\\nRicerca Metadati nel RNDT<\\/div>\\r\\n<\\/div>\"},\"4f15a6746fa8a\":{\"title\":\"Gestione Metadati\",\"set\":\"01\",\"content\":\"<div class=\\\"frontpage-slideset\\\"><img class=\\\"border-box\\\" src=\\\"images\\/yootheme\\/demo\\/slideset\\/xml_icon.jpg\\\" alt=\\\"xml icon\\\" height=\\\"50\\\" width=\\\"50\\\" \\/>\\r\\n<div class=\\\"slideset-content\\\"><small>Area riservata per la PA<\\/small>\\r\\n<h3><a href=\\\"\\/RNDT\\/RNDT_v2\\/MDHandler\\/DocumentList.action\\\">Gestione metadati<\\/a><\\/h3>\\r\\nEditor, upload e validazione<\\/div>\\r\\n<\\/div>\"},\"4f15a6833a0e0\":{\"title\":\"Documenti\",\"set\":\"01\",\"content\":\"<div class=\\\"frontpage-slideset\\\"><img class=\\\"border-box\\\" src=\\\"images\\/yootheme\\/demo\\/slideset\\/icona-documenti.jpg\\\" alt=\\\"icona-documenti\\\" height=\\\"50\\\" width=\\\"50\\\" \\/>\\r\\n<div class=\\\"slideset-content\\\"><small>Archivio documentale RNDT<\\/small>\\r\\n<h3><a href=\\\"index.php?option=com_content&amp;view=article&amp;id=37:documenti&amp;catid=12:documenti&amp;Itemid=190\\\">archivio documenti<\\/a><\\/h3>\\r\\nRiferimenti tecnici e normativi<\\/div>\\r\\n<\\/div>\"}}}','2012-01-17 16:49:53','2013-01-04 15:03:10'),(53,'gallery','','','{\"type\":\"gallery\",\"id\":null,\"name\":null,\"settings\":{\"width\":0,\"height\":0},\"style\":null,\"paths\":[],\"captions\":[],\"links\":[]}','2012-03-28 14:54:11','2012-03-28 14:54:11'),(51,'slideset','','','{\"type\":\"slideset\",\"id\":null,\"name\":null,\"settings\":null,\"style\":null,\"items\":[]}','2012-03-02 16:25:16','2012-03-02 16:25:16'),(47,'slideshow','revista_tabs','Frontpage Tabs','{\"type\":\"slideshow\",\"id\":47,\"name\":\"Frontpage Tabs\",\"settings\":{\"style\":\"revista_tabs\",\"autoplay\":0,\"interval\":5000,\"width\":\"auto\",\"height\":182,\"duration\":500,\"index\":0,\"order\":\"default\",\"navigation\":\"left\",\"animated\":\"scroll\"},\"style\":\"revista_tabs\",\"items\":{\"4f169c2e90c70\":{\"title\":\"Weather\",\"content\":\"<div class=\\\"frontpage-weather\\\">\\r\\n\\t<span class=\\\"temp\\\">12\\u00b0<\\/span>\\r\\n\\t<span class=\\\"icon\\\"><img src=\\\"images\\/yootheme\\/icon_cloud.png\\\" alt=\\\"Icon\\\" width=\\\"38\\\" height=\\\"38\\\" \\/><\\/span>\\r\\n\\t<h5>New York<\\/h5>\\r\\n\\t<span class=\\\"high\\\">H: 17\\u00b0<\\/span> <span class=\\\"low\\\">L: 8\\u00b0<\\/span>\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-weather\\\">\\r\\n\\t<span class=\\\"temp\\\">7\\u00b0<\\/span>\\r\\n\\t<span class=\\\"icon\\\"><img src=\\\"images\\/yootheme\\/icon_rain.png\\\" alt=\\\"Icon\\\" width=\\\"38\\\" height=\\\"38\\\" \\/><\\/span>\\r\\n\\t<h5>Washington DC<\\/h5>\\r\\n\\t<span class=\\\"high\\\">H: 11\\u00b0<\\/span> <span class=\\\"low\\\">L: 4\\u00b0<\\/span>\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-weather\\\">\\r\\n\\t<span class=\\\"temp\\\">24\\u00b0<\\/span>\\r\\n\\t<span class=\\\"icon\\\"><img src=\\\"images\\/yootheme\\/icon_sun.png\\\" alt=\\\"Icon\\\" width=\\\"38\\\" height=\\\"38\\\" \\/><\\/span>\\r\\n\\t<h5>Los Angeles<\\/h5>\\r\\n\\t<span class=\\\"high\\\">H: 27\\u00b0<\\/span> <span class=\\\"low\\\">L: 22\\u00b0<\\/span>\\r\\n<\\/div>\",\"caption\":\"\"},\"4f169c59405c3\":{\"title\":\"Stocks\",\"content\":\"<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"down\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">Dow Jones<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>2.578,95<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent red\\\">-0,8%<\\/span>\\t\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"up\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">NASDAQ 100<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>2.425,96<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent green\\\">+1,4%<\\/span>\\t\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"up\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">DAX<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>6.390,07<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent green\\\">+0,6%<\\/span>\\t\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"down\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">TecDAX<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>749,65<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent red\\\">-0,8%<\\/span>\\t\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"down\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">MDAX<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>9.814,86<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent red\\\">-0,9%<\\/span>\\t\\r\\n<\\/div>\\r\\n\\r\\n<div class=\\\"frontpage-stocks\\\">\\r\\n\\t<span class=\\\"up\\\"><\\/span>\\r\\n\\t<span class=\\\"name\\\">SDAX<\\/span>\\r\\n\\t<span class=\\\"points\\\"><strong>4.596,00<\\/strong><\\/span>\\r\\n\\t<span class=\\\"percent green\\\">+1,2%<\\/span>\\t\\r\\n<\\/div>\"},\"4f169c621aff0\":{\"title\":\"Tags\",\"content\":\"<ul class=\\\"tagcloud\\\">\\r\\n\\t<li><a href=\\\"#\\\">News<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Sport<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Economy<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Science<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">History<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">People<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Politics<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Stocks<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Travel<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Technology<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Cars<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Movies<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Smartphones<\\/a><\\/li>\\r\\n<\\/ul>\"}}}','2012-01-18 10:17:42','2012-01-30 13:06:14'),(49,'slideshow','revista_articles','Frontpage Slideshow Articles','{\"type\":\"slideshow\",\"id\":49,\"name\":\"Frontpage Slideshow Articles\",\"settings\":{\"style\":\"revista_articles\",\"autoplay\":1,\"interval\":5000,\"width\":\"auto\",\"height\":260,\"duration\":500,\"index\":0,\"order\":\"default\",\"buttons\":1,\"slices\":20,\"animated\":\"scroll\",\"caption_animation_duration\":500},\"style\":\"revista_articles\",\"items\":{\"4f17db4fd65e8\":{\"title\":\"News 1\",\"content\":\"\",\"caption\":\"\"},\"4f17db610e4a2\":{\"title\":\"News 2\",\"content\":\"\",\"caption\":\"\"},\"4f4e6cca8ce38\":{\"title\":\"News 3\",\"content\":\"\",\"caption\":\"\"},\"4f4e6d05905f4\":{\"title\":\"News 4\",\"content\":\"\",\"caption\":\"\"}}}','2012-01-19 08:58:58','2012-04-05 09:23:20'),(54,'gallery','','','{\"type\":\"gallery\",\"id\":null,\"name\":null,\"settings\":{\"width\":0,\"height\":0},\"style\":null,\"paths\":[],\"captions\":[],\"links\":[]}','2012-10-08 09:10:58','2012-10-08 09:10:58'),(55,'gallery','','','{\"type\":\"gallery\",\"id\":null,\"name\":null,\"settings\":{\"width\":0,\"height\":0},\"style\":null,\"paths\":[],\"captions\":[],\"links\":[]}','2014-06-16 14:48:07','2014-06-16 14:48:07'),(48,'gallery','revista_default','Frontpage Gallery Slideshow','{\"type\":\"gallery\",\"id\":48,\"name\":\"Frontpage Gallery Slideshow\",\"settings\":{\"style\":\"revista_default\",\"width\":618,\"height\":292,\"autoplay\":1,\"order\":\"default\",\"interval\":5000,\"duration\":500,\"index\":0,\"navigation\":1,\"buttons\":1,\"slices\":20,\"animated\":\"scrollRight\",\"caption_animation_duration\":500,\"lightbox\":0},\"style\":\"revista_default\",\"paths\":[\"\\/yootheme\\/demo\\/gallery\"],\"captions\":{\"\\/yootheme\\/demo\\/gallery\\/slideshow2.jpg\":\"<h2>AgID al 3\\u00b0 workshop di \\\"Share-PSI 2.0\\\"<\\/h2>  <p>AgID sar\\u00e0 fra i partecipanti del seminario \\\"Open Data Priorities and Engagement\\\", il 3\\u00b0 workshop del progetto Share-PSI 2.0 dedicato agli open data nel settore pubblico   ...<\\/p><p> <a class=\\\"button-more\\\" href=\\\"index.php?option=com_content&view=article&id=135:agid-al-3-workshop-europeo-di-share-psi-2-0&catid=7&Itemid=225\\\">Leggi tutto<\\/a> <\\/p>\",\"\\/yootheme\\/demo\\/gallery\\/slideshow4.jpg\":\"<h2>ARPA Piemonte nuovo nodo della rete RNDT<\\/h2>  <p>La prima Agenzia Regionale per la Protezione dell\'Ambiente ad alimentare il RNDT con i metadati dei propri dati e servizi attraverso il servizio CSW   ...<\\/p><p> <a class=\\\"button-more\\\" href=\\\"index.php?option=com_content&view=article&id=134:arpa-piemonte-nuovo-nodo-della-rete-rndt&catid=7&Itemid=225\\\">Leggi tutto<\\/a> <\\/p>\",\"\\/yootheme\\/demo\\/gallery\\/slideshow5.jpg\":\"<h2>Sedilo, dal cuore della Sardegna al RNDT<\\/h2>  <p>Il piccolo paese, in provincia di Oristano, \\u00e8 il primo Comune ad alimentare il RNDT con i metadati dei propri dati e servizi attraverso il servizio CSW   ...<\\/p><p> <a class=\\\"button-more\\\" href=\\\"index.php?option=com_content&view=article&id=133:sedilo-or-dal-cuore-della-sardegna-al-rndt&catid=7&Itemid=225\\\">Leggi tutto<\\/a> <\\/p>\",\"\\/yootheme\\/demo\\/gallery\\/slideshow6.jpg\":\"<h2>Anche l\'Emilia Romagna \\\"cade\\\" nella rete RNDT<\\/h2>  <p>Pubblicato nel RNDT un primo consistente gruppo di metadati attraverso l\'harvesting del catalogo regionale  ...<\\/p><p> <a class=\\\"button-more\\\" href=\\\"index.php?option=com_content&view=article&id=131:anche-l-emilia-romagna-cade-nella-rete-rndt&catid=7&Itemid=225\\\">Leggi tutto<\\/a> <\\/p>\"},\"links\":{\"\\/yootheme\\/demo\\/gallery\\/slideshow2.jpg\":\"\",\"\\/yootheme\\/demo\\/gallery\\/slideshow4.jpg\":\"\",\"\\/yootheme\\/demo\\/gallery\\/slideshow5.jpg\":\"\",\"\\/yootheme\\/demo\\/gallery\\/slideshow6.jpg\":\"\"}}','2012-01-18 17:32:35','2015-03-06 11:18:48'),(50,'gallery','','','{\"type\":\"gallery\",\"id\":null,\"name\":null,\"settings\":{\"width\":0,\"height\":0},\"style\":null,\"paths\":[],\"captions\":[],\"links\":[]}','2012-03-01 15:08:00','2012-03-01 15:08:00'),(52,'gallery','','','{\"type\":\"gallery\",\"id\":null,\"name\":null,\"settings\":{\"width\":0,\"height\":0},\"style\":null,\"paths\":[],\"captions\":[],\"links\":[]}','2012-03-02 17:38:01','2012-03-02 17:38:01');
/*!40000 ALTER TABLE `l1pym_widgetkit_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_xmap_items`
--

DROP TABLE IF EXISTS `l1pym_xmap_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_xmap_items` (
  `uid` varchar(100) NOT NULL,
  `itemid` int(11) NOT NULL,
  `view` varchar(10) NOT NULL,
  `sitemap_id` int(11) NOT NULL,
  `properties` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`uid`,`itemid`,`view`,`sitemap_id`),
  KEY `uid` (`uid`,`itemid`),
  KEY `view` (`view`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_xmap_items`
--

LOCK TABLES `l1pym_xmap_items` WRITE;
/*!40000 ALTER TABLE `l1pym_xmap_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `l1pym_xmap_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l1pym_xmap_sitemap`
--

DROP TABLE IF EXISTS `l1pym_xmap_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l1pym_xmap_sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `introtext` text,
  `metadesc` text,
  `metakey` text,
  `attribs` text,
  `selections` text,
  `excluded_items` text,
  `is_default` int(1) DEFAULT '0',
  `state` int(2) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count_xml` int(11) DEFAULT NULL,
  `count_html` int(11) DEFAULT NULL,
  `views_xml` int(11) DEFAULT NULL,
  `views_html` int(11) DEFAULT NULL,
  `lastvisit_xml` int(11) DEFAULT NULL,
  `lastvisit_html` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l1pym_xmap_sitemap`
--

LOCK TABLES `l1pym_xmap_sitemap` WRITE;
/*!40000 ALTER TABLE `l1pym_xmap_sitemap` DISABLE KEYS */;
INSERT INTO `l1pym_xmap_sitemap` VALUES (1,'Mappa del sito','mappa-del-sito','',NULL,NULL,'{\"showintro\":\"1\",\"show_menutitle\":\"1\",\"classname\":\"\",\"columns\":\"\",\"exlinks\":\"img_blue.gif\",\"compress_xml\":\"1\",\"beautify_xml\":\"1\",\"news_publication_name\":\"\"}','{\"mainmenu\":{\"priority\":\"0.5\",\"changefreq\":\"weekly\",\"ordering\":0},\"sidebarmenu\":{\"priority\":\"0.5\",\"changefreq\":\"weekly\",\"ordering\":1},\"inspire\":{\"priority\":\"0.5\",\"changefreq\":\"weekly\",\"ordering\":2},\"portale\":{\"priority\":\"0.5\",\"changefreq\":\"weekly\",\"ordering\":3},\"topmenu\":{\"priority\":\"0.5\",\"changefreq\":\"weekly\",\"ordering\":4}}',NULL,1,1,1,'2012-03-11 21:11:07',0,21,0,1957,0,1426758394);
/*!40000 ALTER TABLE `l1pym_xmap_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mysql_rndt'
--

--
-- Dumping routines for database 'mysql_rndt'
--

--
-- Final view structure for view `l1pym_it_project_view1`
--

/*!50001 DROP VIEW IF EXISTS `l1pym_it_project_view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `l1pym_it_project_view1` AS select `b`.`id` AS `id`,`b`.`parent_id` AS `pid`,`c`.`level` AS `level`,`c`.`title` AS `title`,`c`.`access` AS `access` from (`l1pym_it_projects` `b` join `l1pym_it_projects` `c`) where ((`b`.`lft` between `c`.`lft` and `c`.`rgt`) and (`c`.`level` <> 0)) order by `b`.`lft`,`c`.`lft` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `l1pym_it_project_view2`
--

/*!50001 DROP VIEW IF EXISTS `l1pym_it_project_view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `l1pym_it_project_view2` AS select `l1pym_it_project_view1`.`id` AS `id`,group_concat(`l1pym_it_project_view1`.`title` order by `l1pym_it_project_view1`.`level` ASC separator ' - ') AS `title`,`l1pym_it_project_view1`.`access` AS `access` from `l1pym_it_project_view1` group by `l1pym_it_project_view1`.`id` */;
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

-- Dump completed on 2018-11-29 15:25:36
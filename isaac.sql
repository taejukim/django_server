/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.8-MariaDB-1:10.5.8+maria~focal : Database - isaac_database
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`isaac_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `isaac_database`;

/*Table structure for table `accounts_user` */

DROP TABLE IF EXISTS `accounts_user`;

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `kr_name` varchar(50) DEFAULT NULL,
  `emp_no` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `dept_code` varchar(50) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `is_member` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `accounts_user` */

insert  into `accounts_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`kr_name`,`emp_no`,`department`,`title`,`position`,`dept_code`,`img_src`,`is_member`) values 
(1,'pbkdf2_sha256$216000$D2dVSc4EtPba$u7MleXtTsnHJQb1rOnVooaMo3IOXaPDFtqebz31UCgI=','2021-01-20 06:46:24.000000',1,'admin','','','',1,1,'2021-01-19 07:36:50.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
(2,'pbkdf2_sha256$216000$B1xHOwrgXMjx$tDeiGf4UApafxCHhOzj3jbaPSwCSwyMZDakY4hMxFLc=','2021-01-29 03:23:56.880872',1,'to10523','','','taeju.kim@nhntoast.com',1,1,'2021-01-20 02:45:24.000000','김태주','to10523','QA파트','선임','사원','김태주','https://hrservices.nhnent.com/empPhoto/X2010050118158.jpg',1),
(3,'pbkdf2_sha256$216000$g3jJxhkEG5Rj$e/Xy/B+cmMhFFFdhHm2JlpIfUffaQTZvJPtB8/Xsup0=','2021-01-29 03:25:07.638702',0,'to10544','','','seonju.shin@nhntoast.com',0,1,'2021-01-20 03:09:57.000000','신선주','to10544','클라우드QA팀','책임','팀장','신선주','https://hrservices.nhnent.com/empPhoto/X2010260118338.jpg',1),
(4,'pbkdf2_sha256$216000$pWEY7wnFXxNa$3diiSo5Nzh1Acc/CNO/ftr5OjZOUNfX3Q2GMBsw+gqw=','2021-01-29 03:25:01.738082',0,'to10549','','','jeonga.jeong@nhnsoft.com',0,1,'2021-01-29 03:24:39.000000','정정아','to10549','QA파트','전임','사원','정정아','https://hrservices.nhnent.com/empPhoto/X2011160118497.jpg',1),
(5,'pbkdf2_sha256$216000$YleaCwH1yY0T$JAp04oSmsnqOyJWjaQq28Xn4Pj/YBVQVpIpR9RtOACs=','2021-01-29 03:25:50.000000',0,'to10289','','','youngjun@nhnsoft.com',0,1,'2021-01-29 03:25:50.000000','최영준','to10289','QA파트','사원','사원','최영준','https://hrservices.nhnent.com/empPhoto/X1707170107275.jpg',1);

/*Table structure for table `accounts_user_groups` */

DROP TABLE IF EXISTS `accounts_user_groups`;

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `accounts_user_groups` */

/*Table structure for table `accounts_user_user_permissions` */

DROP TABLE IF EXISTS `accounts_user_user_permissions`;

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

/*Data for the table `accounts_user_user_permissions` */

insert  into `accounts_user_user_permissions`(`id`,`user_id`,`permission_id`) values 
(1,2,1),
(2,2,2),
(3,2,3),
(4,2,4),
(5,2,5),
(6,2,6),
(7,2,7),
(8,2,8),
(9,2,9),
(10,2,10),
(11,2,11),
(12,2,12),
(13,2,13),
(14,2,14),
(15,2,15),
(16,2,16),
(17,2,17),
(18,2,18),
(19,2,19),
(20,2,20),
(21,2,21),
(22,2,22),
(23,2,23),
(24,2,24),
(25,2,25),
(26,2,26),
(27,2,27),
(28,2,28),
(29,2,29),
(30,2,30),
(31,2,31),
(32,2,32),
(33,2,33),
(34,2,34),
(35,2,35),
(36,2,36),
(37,2,37),
(38,2,38),
(39,2,39),
(40,2,40),
(41,2,41),
(42,2,42),
(43,2,43),
(44,2,44),
(45,2,45),
(46,2,46),
(47,2,47),
(48,2,48),
(49,2,49),
(50,2,50),
(51,2,51),
(52,2,52),
(53,2,53),
(54,2,54),
(55,2,55),
(56,2,56),
(57,2,57),
(58,2,58),
(59,2,59),
(60,2,60),
(61,2,61),
(62,2,62),
(63,2,63),
(64,2,64),
(65,2,65),
(66,2,66),
(67,2,67),
(68,2,68),
(69,2,69),
(70,2,70),
(71,2,71),
(72,2,72),
(73,2,73),
(74,2,74),
(75,2,75),
(76,2,76),
(77,2,77),
(78,2,78),
(79,2,79),
(80,2,80),
(81,2,81),
(82,2,82),
(83,2,83),
(84,2,84),
(85,2,85),
(86,2,86),
(87,2,87),
(88,2,88);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add crontab',6,'add_crontabschedule'),
(22,'Can change crontab',6,'change_crontabschedule'),
(23,'Can delete crontab',6,'delete_crontabschedule'),
(24,'Can view crontab',6,'view_crontabschedule'),
(25,'Can add interval',7,'add_intervalschedule'),
(26,'Can change interval',7,'change_intervalschedule'),
(27,'Can delete interval',7,'delete_intervalschedule'),
(28,'Can view interval',7,'view_intervalschedule'),
(29,'Can add periodic task',8,'add_periodictask'),
(30,'Can change periodic task',8,'change_periodictask'),
(31,'Can delete periodic task',8,'delete_periodictask'),
(32,'Can view periodic task',8,'view_periodictask'),
(33,'Can add periodic tasks',9,'add_periodictasks'),
(34,'Can change periodic tasks',9,'change_periodictasks'),
(35,'Can delete periodic tasks',9,'delete_periodictasks'),
(36,'Can view periodic tasks',9,'view_periodictasks'),
(37,'Can add solar event',10,'add_solarschedule'),
(38,'Can change solar event',10,'change_solarschedule'),
(39,'Can delete solar event',10,'delete_solarschedule'),
(40,'Can view solar event',10,'view_solarschedule'),
(41,'Can add clocked',11,'add_clockedschedule'),
(42,'Can change clocked',11,'change_clockedschedule'),
(43,'Can delete clocked',11,'delete_clockedschedule'),
(44,'Can view clocked',11,'view_clockedschedule'),
(45,'Can add task result',12,'add_taskresult'),
(46,'Can change task result',12,'change_taskresult'),
(47,'Can delete task result',12,'delete_taskresult'),
(48,'Can view task result',12,'view_taskresult'),
(49,'Can add chord counter',13,'add_chordcounter'),
(50,'Can change chord counter',13,'change_chordcounter'),
(51,'Can delete chord counter',13,'delete_chordcounter'),
(52,'Can view chord counter',13,'view_chordcounter'),
(53,'Can add user',14,'add_user'),
(54,'Can change user',14,'change_user'),
(55,'Can delete user',14,'delete_user'),
(56,'Can view user',14,'view_user'),
(57,'Can add Function',15,'add_function'),
(58,'Can change Function',15,'change_function'),
(59,'Can delete Function',15,'delete_function'),
(60,'Can view Function',15,'view_function'),
(61,'Can add Region',16,'add_region'),
(62,'Can change Region',16,'change_region'),
(63,'Can delete Region',16,'delete_region'),
(64,'Can view Region',16,'view_region'),
(65,'Can add Service',17,'add_service'),
(66,'Can change Service',17,'change_service'),
(67,'Can delete Service',17,'delete_service'),
(68,'Can view Service',17,'view_service'),
(69,'Can add Testcase History',18,'add_testcase_history'),
(70,'Can change Testcase History',18,'change_testcase_history'),
(71,'Can delete Testcase History',18,'delete_testcase_history'),
(72,'Can view Testcase History',18,'view_testcase_history'),
(73,'Can add Testcase',19,'add_testcase'),
(74,'Can change Testcase',19,'change_testcase'),
(75,'Can delete Testcase',19,'delete_testcase'),
(76,'Can view Testcase',19,'view_testcase'),
(77,'Can add Procedure History',20,'add_procedure_history'),
(78,'Can change Procedure History',20,'change_procedure_history'),
(79,'Can delete Procedure History',20,'delete_procedure_history'),
(80,'Can view Procedure History',20,'view_procedure_history'),
(81,'Can add Procedure',21,'add_procedure'),
(82,'Can change Procedure',21,'change_procedure'),
(83,'Can delete Procedure',21,'delete_procedure'),
(84,'Can view Procedure',21,'view_procedure'),
(85,'Can add UserList',22,'add_userlist'),
(86,'Can change UserList',22,'change_userlist'),
(87,'Can delete UserList',22,'delete_userlist'),
(88,'Can view UserList',22,'view_userlist');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2021-01-19 07:38:17.749980','2','0 0 * * 1 (m/h/dM/MY/d) Asia/Seoul',1,'[{\"added\": {}}]',6,1),
(2,'2021-01-19 07:38:20.042108','2','collect_dooray_task: 0 0 * * 1 (m/h/dM/MY/d) Asia/Seoul',1,'[{\"added\": {}}]',8,1),
(3,'2021-01-19 16:27:00.606479','2','collect_dooray_task: 0 0 * * 1 (m/h/dM/MY/d) Asia/Seoul',2,'[{\"changed\": {\"fields\": [\"Task (registered)\", \"Task (custom)\"]}}]',8,1),
(4,'2021-01-20 03:09:25.096284','2','to10523',2,'[{\"changed\": {\"fields\": [\"Isaac \\ud68c\\uc6d0\"]}}]',14,1),
(5,'2021-01-20 03:10:03.981892','3','to10544',2,'[{\"changed\": {\"fields\": [\"Isaac \\ud68c\\uc6d0\"]}}]',14,1),
(6,'2021-01-20 06:46:36.997623','2','to10523',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"User permissions\"]}}]',14,1),
(7,'2021-01-20 06:50:13.921496','1','admin',2,'[{\"changed\": {\"fields\": [\"Isaac \\ud68c\\uc6d0\"]}}]',14,1),
(8,'2021-01-29 03:05:05.437103','1','SMS',1,'[{\"added\": {}}]',17,2),
(9,'2021-01-29 03:05:14.183363','1','Console',1,'[{\"added\": {}}]',15,2),
(10,'2021-01-29 03:05:39.216105','1','global',1,'[{\"added\": {}}]',16,2),
(11,'2021-01-29 03:05:42.648111','1','sms_console_001',1,'[{\"added\": {}}]',19,2),
(12,'2021-01-29 03:17:51.651411','2','IaaS',1,'[{\"added\": {}}]',17,2),
(13,'2021-01-29 03:24:25.035095','3','to10544',2,'[]',14,2),
(14,'2021-01-29 03:24:55.452864','4','to10549',2,'[{\"changed\": {\"fields\": [\"Isaac \\ud68c\\uc6d0\"]}}]',14,2),
(15,'2021-01-29 03:37:32.084486','5','to10289',2,'[{\"changed\": {\"fields\": [\"Isaac \\ud68c\\uc6d0\"]}}]',14,2);

/*Table structure for table `django_celery_beat_clockedschedule` */

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;

CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_clockedschedule` */

/*Table structure for table `django_celery_beat_crontabschedule` */

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;

CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_crontabschedule` */

insert  into `django_celery_beat_crontabschedule`(`id`,`minute`,`hour`,`day_of_week`,`day_of_month`,`month_of_year`,`timezone`) values 
(1,'0','4','*','*','*','Asia/Seoul'),
(2,'0','0','1','*','*','Asia/Seoul');

/*Table structure for table `django_celery_beat_intervalschedule` */

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;

CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_intervalschedule` */

/*Table structure for table `django_celery_beat_periodictask` */

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;

CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL CHECK (`total_run_count` >= 0),
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL CHECK (`priority` >= 0),
  `headers` longtext NOT NULL,
  `clocked_id` int(11) DEFAULT NULL,
  `expire_seconds` int(10) unsigned DEFAULT NULL CHECK (`expire_seconds` >= 0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_periodictask` */

insert  into `django_celery_beat_periodictask`(`id`,`name`,`task`,`args`,`kwargs`,`queue`,`exchange`,`routing_key`,`expires`,`enabled`,`last_run_at`,`total_run_count`,`date_changed`,`description`,`crontab_id`,`interval_id`,`solar_id`,`one_off`,`start_time`,`priority`,`headers`,`clocked_id`,`expire_seconds`) values 
(1,'celery.backend_cleanup','celery.backend_cleanup','[]','{}',NULL,NULL,NULL,NULL,1,'2021-01-31 19:00:00.012887',13,'2021-01-31 19:01:40.401251','',1,NULL,NULL,0,NULL,NULL,'{}',NULL,43200),
(2,'collect_dooray_task','apps.dooray.tasks.collect_dooray_task','[]','{}',NULL,NULL,NULL,NULL,1,'2021-01-31 15:00:00.002008',2,'2021-01-31 15:00:40.173326','',2,NULL,NULL,0,NULL,NULL,'{}',NULL,NULL);

/*Table structure for table `django_celery_beat_periodictasks` */

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;

CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_periodictasks` */

insert  into `django_celery_beat_periodictasks`(`ident`,`last_update`) values 
(1,'2021-01-21 02:36:25.462874');

/*Table structure for table `django_celery_beat_solarschedule` */

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;

CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_beat_solarschedule` */

/*Table structure for table `django_celery_results_chordcounter` */

DROP TABLE IF EXISTS `django_celery_results_chordcounter`;

CREATE TABLE `django_celery_results_chordcounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int(10) unsigned NOT NULL CHECK (`count` >= 0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_results_chordcounter` */

/*Table structure for table `django_celery_results_taskresult` */

DROP TABLE IF EXISTS `django_celery_results_taskresult`;

CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext DEFAULT NULL,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  `task_args` longtext DEFAULT NULL,
  `task_kwargs` longtext DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_date_done_49edada6` (`date_done`),
  KEY `django_celery_results_taskresult_status_cbbed23a` (`status`),
  KEY `django_celery_results_taskresult_task_name_90987df3` (`task_name`),
  KEY `django_celery_results_taskresult_worker_f8711389` (`worker`),
  KEY `django_celery_results_taskresult_date_created_099f3424` (`date_created`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_celery_results_taskresult` */

insert  into `django_celery_results_taskresult`(`id`,`task_id`,`status`,`content_type`,`content_encoding`,`result`,`date_done`,`traceback`,`meta`,`task_args`,`task_kwargs`,`task_name`,`worker`,`date_created`) values 
(16,'9f819808-4aa9-424c-99b1-71ab31a8305f','SUCCESS','application/json','utf-8','true','2021-01-31 15:00:18.503616',NULL,'{\"children\": []}','\"()\"','\"{}\"','apps.dooray.tasks.collect_dooray_task','celery@celery_worker','2021-01-31 15:00:00.025956'),
(17,'b1766d83-ae6d-4de3-acf8-9278debc0653','SUCCESS','application/json','utf-8','null','2021-01-31 19:00:00.052772',NULL,'{\"children\": []}','\"()\"','\"{}\"','celery.backend_cleanup','celery@celery_worker','2021-01-31 19:00:00.042639');

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(14,'accounts','user'),
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(11,'django_celery_beat','clockedschedule'),
(6,'django_celery_beat','crontabschedule'),
(7,'django_celery_beat','intervalschedule'),
(8,'django_celery_beat','periodictask'),
(9,'django_celery_beat','periodictasks'),
(10,'django_celery_beat','solarschedule'),
(13,'django_celery_results','chordcounter'),
(12,'django_celery_results','taskresult'),
(22,'dooray','userlist'),
(5,'sessions','session'),
(15,'testcase','function'),
(21,'testcase','procedure'),
(20,'testcase','procedure_history'),
(16,'testcase','region'),
(17,'testcase','service'),
(19,'testcase','testcase'),
(18,'testcase','testcase_history');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2021-01-19 07:35:55.241492'),
(2,'contenttypes','0002_remove_content_type_name','2021-01-19 07:35:55.279888'),
(3,'auth','0001_initial','2021-01-19 07:35:55.338852'),
(4,'auth','0002_alter_permission_name_max_length','2021-01-19 07:35:55.522742'),
(5,'auth','0003_alter_user_email_max_length','2021-01-19 07:35:55.531671'),
(6,'auth','0004_alter_user_username_opts','2021-01-19 07:35:55.541300'),
(7,'auth','0005_alter_user_last_login_null','2021-01-19 07:35:55.548983'),
(8,'auth','0006_require_contenttypes_0002','2021-01-19 07:35:55.551404'),
(9,'auth','0007_alter_validators_add_error_messages','2021-01-19 07:35:55.559078'),
(10,'auth','0008_alter_user_username_max_length','2021-01-19 07:35:55.575919'),
(11,'auth','0009_alter_user_last_name_max_length','2021-01-19 07:35:55.583932'),
(12,'auth','0010_alter_group_name_max_length','2021-01-19 07:35:55.593879'),
(13,'auth','0011_update_proxy_permissions','2021-01-19 07:35:55.602273'),
(14,'auth','0012_alter_user_first_name_max_length','2021-01-19 07:35:55.608595'),
(15,'accounts','0001_initial','2021-01-19 07:35:55.663744'),
(16,'admin','0001_initial','2021-01-19 07:35:55.876427'),
(17,'admin','0002_logentry_remove_auto_add','2021-01-19 07:35:55.958228'),
(18,'admin','0003_logentry_add_action_flag_choices','2021-01-19 07:35:55.967684'),
(19,'django_celery_beat','0001_initial','2021-01-19 07:35:56.038051'),
(20,'django_celery_beat','0002_auto_20161118_0346','2021-01-19 07:35:56.185771'),
(21,'django_celery_beat','0003_auto_20161209_0049','2021-01-19 07:35:56.208163'),
(22,'django_celery_beat','0004_auto_20170221_0000','2021-01-19 07:35:56.214747'),
(23,'django_celery_beat','0005_add_solarschedule_events_choices','2021-01-19 07:35:56.221088'),
(24,'django_celery_beat','0006_auto_20180322_0932','2021-01-19 07:35:56.286029'),
(25,'django_celery_beat','0007_auto_20180521_0826','2021-01-19 07:35:56.322499'),
(26,'django_celery_beat','0008_auto_20180914_1922','2021-01-19 07:35:56.342735'),
(27,'django_celery_beat','0006_auto_20180210_1226','2021-01-19 07:35:56.370967'),
(28,'django_celery_beat','0006_periodictask_priority','2021-01-19 07:35:56.384061'),
(29,'django_celery_beat','0009_periodictask_headers','2021-01-19 07:35:56.403355'),
(30,'django_celery_beat','0010_auto_20190429_0326','2021-01-19 07:35:56.793967'),
(31,'django_celery_beat','0011_auto_20190508_0153','2021-01-19 07:35:56.886444'),
(32,'django_celery_beat','0012_periodictask_expire_seconds','2021-01-19 07:35:56.938608'),
(33,'django_celery_beat','0013_auto_20200609_0727','2021-01-19 07:35:56.964541'),
(34,'django_celery_beat','0014_remove_clockedschedule_enabled','2021-01-19 07:35:56.978180'),
(35,'django_celery_results','0001_initial','2021-01-19 07:35:57.002382'),
(36,'django_celery_results','0002_add_task_name_args_kwargs','2021-01-19 07:35:57.033937'),
(37,'django_celery_results','0003_auto_20181106_1101','2021-01-19 07:35:57.037803'),
(38,'django_celery_results','0004_auto_20190516_0412','2021-01-19 07:35:57.093085'),
(39,'django_celery_results','0005_taskresult_worker','2021-01-19 07:35:57.103622'),
(40,'django_celery_results','0006_taskresult_date_created','2021-01-19 07:35:57.144159'),
(41,'django_celery_results','0007_remove_taskresult_hidden','2021-01-19 07:35:57.171425'),
(42,'django_celery_results','0008_chordcounter','2021-01-19 07:35:57.190626'),
(43,'dooray','0001_initial','2021-01-19 07:35:57.209191'),
(44,'sessions','0001_initial','2021-01-19 07:35:57.225778'),
(45,'testcase','0001_initial','2021-01-19 07:35:57.483032'),
(46,'django_celery_beat','0015_edit_solarschedule_events_choices','2021-01-19 16:26:18.087365');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('5us7jtkijq3fmag12h0uqr2z0tm0eumt','.eJx1kM1OwzAQhN8lZ5TYjhMnPQF3JJA4cKhk-WebOG3syHYQCPHubNqC4MBlrN1vd6zZj0KqNY9yTRCls8Wu4MXN755W5gh-A3ZSfgilCT5Hp8ttpLzSVD4EC6f76-wfg1GlEbf7A-i6PzCqWaes4ND0QAnlwhKiteh5rYAJJjQTtDW80b2yDYNaUCCUkQ5NU1Z5Tej1HFfAGuZF-oB1DpQ0vMfWMUqvZsDefjUdbX604Vuu7PLpGxKOKrqtvYTksgv-QogyqK0lSCwsKuYZfEb2dLdfbU2QWqa7C83SYPL__nPzIFM0iMecl7SrqjHiTV6dgVT60aMv3nOuMMnjGHKoXhihlLYoHe9FOS3DOadyJ_SYIPhBlefnFrdTOJzXt3snSAkTSHhbXHwvdi3hHSGfX0b8mZg:1l5LbP:MXky8sqTrGNz8WBuZaBVztETbEY86LN3nUeqlF7i1vU','2021-02-05 04:41:47.581382'),
('eqh8zw12p0e8nkx1rv9z1qt3kzld28p9','.eJx1kUFPxCAQhf9Lz6alLaXsntS7iSYePGxCYIDC7hYaoEZj_O9Od_egBy-TDN97D2b4qoRcixNrNkl4Xe2rvrr7faYknEzYgD7KMMUaYijJq3qT1Dea66eozfnxpv0T4GR26OZEK8Zbq3o92FED7DQoqTtFRqPtAJZoRnYKWsaoBaYZcK47CQTkoKilGJqLLGvGrNe0GuzNvIgQsS-xJQPdJKckgpwNnh1W6AzB2nZb5RYQF1_ONwh0wDryzbXE7IuP4UJ0TzbDKAck2iwyldmEcmVkpIdVjSOgginUKarh5eHquuqLANzFfy_w8yRyAsSulCXvm8Yl3NK7B5Pr4ALehBueG5zt2cUSm7eOtKRjpG153_P6uEyXyaU_Y0Y2MRzXOjsf7tGco724tw_IJmccSZiPxafPas8I5YR8_wCnj6Jj:1l5KPK:Ghe8SgHDmCvsiBaXWxa_75TB0bhLXIvQE3s4wRGicD0','2021-02-05 03:25:14.475172'),
('m91sh68mh8do698wcdp137rm4d06hozm','.eJx1kTFvwyAQhf-L58rBNsYkU9u9Uit16BAJwYEDSQwWh6tWVf97z0mGduhy0vG99-COr0rppXi1oMsq2GpXddXd7zOj4eTiCuxRx0OqIcWSg6lXSX2jWD8l686PN-2fAK_Rk1sya4RsRtPZfhwswNaC0bY1bHB27GFkVrCtgUYIPoKwAqS0rQYGujd85BSKRZcFKes1L456N80qJupLaljPV8kpq6gnR2f7BVrHqDbtWuUIhEso5xsE3lMd5OqaE4YSUrwQ27HVMOieiHWzzmVysVwZG_h-McMApBCGdIZbeHm4uq76ooB28d8LwnRQmIGwL2XG3WbjM23pPYDDOvpIN9GGpw3N9uxTSZu3ljWsFaxpZNfJ-jgfLpPrcKYMdCkelxp9iPdkLknjxb7-ADpEmkm5jznkz2onGJeMff8ATY-i0g:1l23to:zjaasAXvBq3OtZNiG57Yruga9kORdYuI-LFyptDxt9o','2021-01-27 03:11:12.945196'),
('rkjephxeivsnbc7tdxloosi4xlauzz20','.eJx1kEtPwzAQhP9LzijxI27SnoA7EkgcOFSK1vamcdvYkR8IhPjvbNoe4MBx59sZe_arGqDkaSgJ4-BstatEdfdb02BO6Fdgj-APoTbB5-h0va7UN5rqp2Dx_Hjb_RMwQZrIrS1KNdrObtWoBGA_Sis3bSvbLdcwapCaC5BGjqCN4B2gAsE2W8XbrtMCKTRlyCVR1mss64zzMvhAcw6cKSFJOsXBw4yk7Qtgy_bFMmv2xfSjIZxdPl-h4YKg6fqW5CUkl13wV8JgNWwsI2JxgZhn9JnYywPFSUbUCt1faR4MNf_vPTcfhhQN4SnnJe2aZop0k3dnMNV-8pRL95wbavI8hRyaN8E4Y4px3nPV18flcOkJ7rzWBDyW-uTme7KmMF6867ETpkTfH_BjcfGz2m1Y2zP2_QNuXJtn:1l5KYr:vwNcbu3q90AQrXZMUDuz2JBvm2UEKyu8fhNzMc4TCA4','2021-02-05 03:35:05.344197'),
('x3txb9qtlpt04y5br15adjtirxbtq174','e30:1l5KQ1:KbPngeunpTRNTh5pERVgGXnOlSdDj0nRrK5X2egCgYA','2021-02-12 03:25:57.963004');

/*Table structure for table `dooray_userlist` */

DROP TABLE IF EXISTS `dooray_userlist`;

CREATE TABLE `dooray_userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dooray_userlist` */

insert  into `dooray_userlist`(`id`,`name`,`member_id`,`email`) values 
(1,'이재희','2011006295128013793','jaehee.lee@nhntoast.com'),
(2,'정연주','2058114665130603459','yeonju@nhntoast.com'),
(3,'신현일','1640773101648464217','hyunil.shin@nhn.com'),
(4,'韩日','1991436887037558414','han_ri1@nhn-st.com'),
(5,'장선향','2848120583266758227','sunhyang.jang@nhntoast.com'),
(6,'이연주','2113198491709868997','yeonju.lee@nhntoast.com'),
(7,'김인선','2797386199252765091','inseon.kim@nhntoast.com'),
(8,'김명지','2787238695889671970','myeongji.kim@nhn.com'),
(9,'김태주','2848120595012570364','taeju.kim@nhntoast.com'),
(10,'정승원','1925611484215397972','seungwon.jung@nhntoast.com'),
(11,'신선주','2863341754586475250','seonju.shin@nhntoast.com'),
(12,'권혜조','2315401836189197461','hyejo.kwon@nhntoast.com'),
(13,'김주영','1966794277214736451','juyoung.kim@nhntoast.com'),
(14,'김동원','2660402987618926789','dongwon.kim@nhntoast.com'),
(15,'정정아','2878562122910828090','jeonga.jeong@nhntoast.com'),
(16,'최영준','1995785970595096394','youngjun@nhntoast.com'),
(17,'정인권','2315401598704161888','inkwon.chung@nhn.com'),
(18,'엄세진','1390209123151787147','sejin.eom@nhn.com'),
(19,'정기효','1387695629192606464','kihyo_jeong@nhn.com'),
(20,'李云星','1601496729365248480','li_yunxing@nhn-st.com'),
(21,'权英杰','2536464896839246718','quan_yingjie@nhn-st.com'),
(22,'朴鹤峰','1570822652176269084','piao_hefeng@nhn-st.com'),
(23,'金成杰','1756015684406967124','jin_chengjie@nhn-st.com'),
(24,'方太鸿','2209580836403717146','fang_taihong@nhn-st.com');

/*Table structure for table `testcase_fuction` */

DROP TABLE IF EXISTS `testcase_fuction`;

CREATE TABLE `testcase_fuction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` varchar(30) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcase_fuction_service_id_d4fcb678_fk_testcase_service_id` (`service_id`),
  CONSTRAINT `testcase_fuction_service_id_d4fcb678_fk_testcase_service_id` FOREIGN KEY (`service_id`) REFERENCES `testcase_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_fuction` */

insert  into `testcase_fuction`(`id`,`function_id`,`function_name`,`service_id`) values 
(1,'console','Console',1);

/*Table structure for table `testcase_procedure` */

DROP TABLE IF EXISTS `testcase_procedure`;

CREATE TABLE `testcase_procedure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_id` int(11) DEFAULT NULL,
  `procedure` longtext NOT NULL,
  `expect_result` longtext NOT NULL,
  `testcase_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcase_procedure_testcase_id_18bf5e78_fk_testcase_` (`testcase_id`),
  CONSTRAINT `testcase_procedure_testcase_id_18bf5e78_fk_testcase_` FOREIGN KEY (`testcase_id`) REFERENCES `testcase_testcase` (`testcase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_procedure` */

/*Table structure for table `testcase_procedure_history` */

DROP TABLE IF EXISTS `testcase_procedure_history`;

CREATE TABLE `testcase_procedure_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_id` int(11) NOT NULL,
  `procedure` longtext NOT NULL,
  `expect_result` longtext NOT NULL,
  `testcase_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcase_procedure_h_testcase_id_7bc9d99a_fk_testcase_` (`testcase_id`),
  CONSTRAINT `testcase_procedure_h_testcase_id_7bc9d99a_fk_testcase_` FOREIGN KEY (`testcase_id`) REFERENCES `testcase_testcase_history` (`testcase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_procedure_history` */

/*Table structure for table `testcase_region` */

DROP TABLE IF EXISTS `testcase_region`;

CREATE TABLE `testcase_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_region` */

insert  into `testcase_region`(`id`,`region`) values 
(1,'global');

/*Table structure for table `testcase_service` */

DROP TABLE IF EXISTS `testcase_service`;

CREATE TABLE `testcase_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(30) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_service` */

insert  into `testcase_service`(`id`,`service_id`,`service_name`) values 
(1,'sms','SMS'),
(2,'iaas','IaaS');

/*Table structure for table `testcase_testcase` */

DROP TABLE IF EXISTS `testcase_testcase`;

CREATE TABLE `testcase_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testcase_id` varchar(100) DEFAULT NULL,
  `summary` varchar(255) NOT NULL,
  `precondition` longtext NOT NULL,
  `priority` varchar(5) NOT NULL,
  `is_auto` tinyint(1) NOT NULL,
  `is_regression` tinyint(1) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testcase_id` (`testcase_id`),
  KEY `testcase_testcase_function_id_e0dfa062_fk_testcase_fuction_id` (`function_id`),
  KEY `testcase_testcase_region_id_e1fbb681_fk_testcase_region_id` (`region_id`),
  CONSTRAINT `testcase_testcase_function_id_e0dfa062_fk_testcase_fuction_id` FOREIGN KEY (`function_id`) REFERENCES `testcase_fuction` (`id`),
  CONSTRAINT `testcase_testcase_region_id_e1fbb681_fk_testcase_region_id` FOREIGN KEY (`region_id`) REFERENCES `testcase_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_testcase` */

insert  into `testcase_testcase`(`id`,`testcase_id`,`summary`,`precondition`,`priority`,`is_auto`,`is_regression`,`autor`,`created`,`updated`,`version`,`function_id`,`region_id`) values 
(1,'sms_console_001','Console UI 확인','로그인','P1',1,0,'taeju.kim','2021-01-29 03:05:42.645020','2021-01-29 03:05:42.645080',1,1,1);

/*Table structure for table `testcase_testcase_history` */

DROP TABLE IF EXISTS `testcase_testcase_history`;

CREATE TABLE `testcase_testcase_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testcase_id` varchar(100) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `precondition` longtext NOT NULL,
  `priority` varchar(5) NOT NULL,
  `is_auto` tinyint(1) NOT NULL,
  `is_regression` tinyint(1) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testcase_id` (`testcase_id`),
  KEY `testcase_testcase_hi_function_id_cb682b60_fk_testcase_` (`function_id`),
  KEY `testcase_testcase_hi_region_id_d2057861_fk_testcase_` (`region_id`),
  CONSTRAINT `testcase_testcase_hi_function_id_cb682b60_fk_testcase_` FOREIGN KEY (`function_id`) REFERENCES `testcase_fuction` (`id`),
  CONSTRAINT `testcase_testcase_hi_region_id_d2057861_fk_testcase_` FOREIGN KEY (`region_id`) REFERENCES `testcase_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `testcase_testcase_history` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

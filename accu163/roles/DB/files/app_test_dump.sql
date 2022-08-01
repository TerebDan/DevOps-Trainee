CREATE DATABASE /*!32312 IF NOT EXISTS*/ `myapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `myapp`;

--
-- Table structure for table `app_test`
--
	
DROP TABLE IF EXISTS `app_test`;
CREATE TABLE `app_test` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
	
--
-- Dumping data for table `app_test`
--
	
LOCK TABLES `app_test` WRITE;
/*!40000 ALTER TABLE `app_test` DISABLE KEYS */;
INSERT INTO `app_test` VALUES (1,'app_test1','I am in the db'),(2,'app_test2','I am in the db'),(3,'app_test3','I am in the db');
/*!40000 ALTER TABLE `app_test` ENABLE KEYS */;
UNLOCK TABLES;

CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON myapp.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

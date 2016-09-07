/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - bcps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bcps` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bcps`;

/*Table structure for table `health_bureau` */

DROP TABLE IF EXISTS `health_bureau`;

CREATE TABLE `health_bureau` (
  `id` varchar(45) NOT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `health_bureau` */

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `higher` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`higher`),
  CONSTRAINT `FK_hospital` FOREIGN KEY (`higher`) REFERENCES `health_bureau` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hospital` */

/*Table structure for table `manufacturer` */

DROP TABLE IF EXISTS `manufacturer`;

CREATE TABLE `manufacturer` (
  `number` int(10) unsigned NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`),
  CONSTRAINT `FK_manufacturer` FOREIGN KEY (`number`) REFERENCES `medicinal` (`manufacturerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `manufacturer` */

/*Table structure for table `medicinal` */

DROP TABLE IF EXISTS `medicinal`;

CREATE TABLE `medicinal` (
  `number` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `standard` varchar(45) DEFAULT NULL,
  `stock_balance` varchar(45) DEFAULT NULL,
  `supplierId` int(10) unsigned DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `NewIndex1` (`supplierId`),
  KEY `NewIndex2` (`manufacturerId`),
  CONSTRAINT `FK_medicinal` FOREIGN KEY (`number`) REFERENCES `order_item` (`mediumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `medicinal` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` varchar(45) NOT NULL,
  `hospitalId` varchar(45) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`hospitalId`),
  CONSTRAINT `FK_order` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` varchar(45) NOT NULL,
  `mediumId` int(10) unsigned DEFAULT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_item` (`order`),
  KEY `NewIndex1` (`mediumId`),
  CONSTRAINT `FK_order_item` FOREIGN KEY (`order`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `number` int(10) unsigned NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`number`),
  CONSTRAINT `FK_supplier` FOREIGN KEY (`number`) REFERENCES `medicinal` (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

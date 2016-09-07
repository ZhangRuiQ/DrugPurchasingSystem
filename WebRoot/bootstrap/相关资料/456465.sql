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
  `passwd` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `health_bureau` */

insert  into `health_bureau`(`id`,`passwd`,`address`,`phone`,`name`) values ('1','123','地址h1','4545h','监管1'),('2','123','地址h1','4545h','监管2'),('3','123','地址h3','4545h','监管3');

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `higher` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`higher`),
  CONSTRAINT `FK_hospital` FOREIGN KEY (`higher`) REFERENCES `health_bureau` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `hospital` */

insert  into `hospital`(`id`,`name`,`passwd`,`address`,`phone`,`grade`,`higher`) values ('1','医疗1','123456','地址Y1','123456','一级','1'),('2','医疗2','123456','地址Y2','123456','一级','1'),('3','医疗3','123456','地址Y3','123456','二级','2');

/*Table structure for table `manufacturer` */

DROP TABLE IF EXISTS `manufacturer`;

CREATE TABLE `manufacturer` (
  `number` int(10) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `manufacturer` */

insert  into `manufacturer`(`number`,`address`,`phone`,`name`) values (1,'地址1','111','名字1');

/*Table structure for table `medicine` */

DROP TABLE IF EXISTS `medicine`;

CREATE TABLE `medicine` (
  `number` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `standard` varchar(45) NOT NULL,
  `stock_balance` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `manufacturerId` int(10) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `NewIndex1` (`manufacturerId`),
  CONSTRAINT `FK_medicine_123` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`number`),
  CONSTRAINT `FK_medicine` FOREIGN KEY (`number`) REFERENCES `order_item` (`medicineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `medicine` */

insert  into `medicine`(`number`,`name`,`type`,`standard`,`stock_balance`,`price`,`status`,`manufacturerId`) values (1,'药品1','类型1','规格1','100',5,'1',1);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` varchar(45) NOT NULL,
  `hospitalId` varchar(45) NOT NULL,
  `order_time` datetime NOT NULL,
  `amount` double NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `return_time` datetime DEFAULT NULL,
  `return_reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`hospitalId`),
  CONSTRAINT `FK_order` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`hospitalId`,`order_time`,`amount`,`status`,`return_time`,`return_reason`) values ('2016021','1','2013-08-11 00:00:00',1000,0,NULL,NULL);

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `id` varchar(45) NOT NULL,
  `medicineId` int(10) unsigned NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `amount` double NOT NULL,
  `order` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_item` (`order`),
  KEY `NewIndex1` (`medicineId`),
  CONSTRAINT `FK_order_item` FOREIGN KEY (`order`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

insert  into `order_item`(`id`,`medicineId`,`number`,`amount`,`order`) values ('1',1,2,100,'2016021');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

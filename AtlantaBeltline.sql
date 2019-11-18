CREATE DATABASE  IF NOT EXISTS `AtlantaBeltline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `AtlantaBeltline`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: AtlantaBeltline
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administrator`
--

DROP TABLE IF EXISTS `Administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Administrator` (
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrator`
--

LOCK TABLES `Administrator` WRITE;
/*!40000 ALTER TABLE `Administrator` DISABLE KEYS */;
INSERT INTO `Administrator` VALUES ('james.smith');
/*!40000 ALTER TABLE `Administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignTo`
--

DROP TABLE IF EXISTS `AssignTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `AssignTo` (
  `StaffUsername` varchar(50) NOT NULL,
  `EventName` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  PRIMARY KEY (`StaffUsername`,`EventName`,`StartDate`,`SiteName`),
  KEY `EventName` (`EventName`,`SiteName`,`StartDate`),
  CONSTRAINT `assignto_ibfk_1` FOREIGN KEY (`StaffUsername`) REFERENCES `staff` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assignto_ibfk_2` FOREIGN KEY (`EventName`, `SiteName`, `StartDate`) REFERENCES `event` (`EventName`, `SiteName`, `StartDate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignTo`
--

LOCK TABLES `AssignTo` WRITE;
/*!40000 ALTER TABLE `AssignTo` DISABLE KEYS */;
INSERT INTO `AssignTo` VALUES ('staff3','Arboretum Walking Tour','2019-02-08','Inman Park'),('michael.smith','Bus Tour','2019-02-01','Inman Park'),('robert.smith','Bus Tour','2019-02-01','Inman Park'),('michael.smith','Bus Tour','2019-02-08','Inman Park'),('robert.smith','Bus Tour','2019-02-08','Inman Park'),('michael.smith','Eastside Trail','2019-02-13','Historic Fourth Ward Park'),('robert.smith','Eastside Trail','2019-02-04','Inman Park'),('staff2','Eastside Trail','2019-02-04','Inman Park'),('staff1','Eastside Trail','2019-03-01','Inman Park'),('michael.smith','Eastside Trail','2019-02-04','Piedmont Park'),('staff1','Eastside Trail','2019-02-04','Piedmont Park'),('staff1','Official Atlanta BeltLine Bike Tour','2019-02-09','Atlanta BeltLine Center'),('robert.smith','Private Bus Tour','2019-02-01','Inman Park'),('staff1','Private Bus Tour','2019-02-01','Inman Park'),('staff1','Westside Trail','2019-02-18','Westview Cemetery'),('staff3','Westside Trail','2019-02-18','Westview Cemetery');
/*!40000 ALTER TABLE `AssignTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Connect`
--

DROP TABLE IF EXISTS `Connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Connect` (
  `TransitType` enum('MARTA','Bus','Bike') NOT NULL,
  `TransitRoute` varchar(10) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  PRIMARY KEY (`TransitType`,`TransitRoute`,`SiteName`),
  KEY `SiteName` (`SiteName`),
  CONSTRAINT `connect_ibfk_1` FOREIGN KEY (`TransitType`, `TransitRoute`) REFERENCES `transit` (`TransitType`, `TransitRoute`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `connect_ibfk_2` FOREIGN KEY (`SiteName`) REFERENCES `site` (`SiteName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Connect`
--

LOCK TABLES `Connect` WRITE;
/*!40000 ALTER TABLE `Connect` DISABLE KEYS */;
INSERT INTO `Connect` VALUES ('MARTA','Blue','Historic Fourth Ward Park'),('Bus','152','Historic Fourth Ward Park'),('Bike','Relay','Historic Fourth Ward Park'),('MARTA','Blue','Inman Park'),('Bus','152','Inman Park'),('MARTA','Blue','Piedmont Park'),('Bus','152','Piedmont Park'),('Bike','Relay','Piedmont Park'),('MARTA','Blue','Westview Cemetery');
/*!40000 ALTER TABLE `Connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employee` (
  `Username` varchar(50) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL,
  `Phone` char(10) NOT NULL,
  `EmployeeAddress` varchar(50) NOT NULL,
  `EmployeeCity` varchar(20) NOT NULL,
  `EmployeeState` char(2) NOT NULL,
  `EmployeeZipcode` char(5) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Phone` (`Phone`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('david.smith','000000005','5124776435','350 Ferst Drive','Atlanta','GA','30332'),('james.smith','000000001','4043721234','123 East Main Street','Rochester','NY','14604'),('manager1','000000006','8045126767','123 East Main Street','Rochester','NY','14604'),('manager2','000000007','9876543210','123 East Main Street','Rochester','NY','14604'),('manager3','000000008','5432167890','350 Ferst Drive','Atlanta','GA','30332'),('manager4','000000009','8053467565','123 East Main Street','Columbus','OH','43215'),('manager5','000000010','8031446782','801 Atlantic Drive','Atlanta','GA','30332'),('maria.garcia','000000004','7890123456','123 East Main Street','Richland','PA','17987'),('michael.smith','000000002','4043726789','350 Ferst Drive','Atlanta','GA','30332'),('robert.smith','000000003','1234567890','123 East Main Street','Columbus','OH','43215'),('staff1','000000011','8024456765','266 Ferst Drive Northwest','Atlanta','GA','30332'),('staff2','000000012','8888888888','266 Ferst Drive Northwest','Atlanta','GA','30332'),('staff3','000000013','3333333333','801 Atlantic Drive','Atlanta','GA','30332');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Event` (
  `EventName` varchar(50) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `EventPrice` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `MinStaffRequired` int(11) NOT NULL,
  PRIMARY KEY (`EventName`,`SiteName`,`StartDate`),
  KEY `SiteName` (`SiteName`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`SiteName`) REFERENCES `site` (`SiteName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES ('Arboretum Walking Tour','Inman Park','2019-02-08','2019-02-11',5,5,'Official Atlanta BeltLine Arboretum Walking Tours provide an up-close view of the Westside Trail and the Atlanta BeltLine Arboretum led by Trees Atlanta Docents. The one and a half hour tours step off at at 10am (Oct thru May), and 9am (June thru September). Departure for all tours is from Rose Circle Park near Brown Middle School. More details at: https://beltline.org/visit/atlanta-beltline-tours/#arboretum-walking',1),('Bus Tour','Inman Park','2019-02-01','2019-02-02',25,6,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources',2),('Bus Tour','Inman Park','2019-02-08','2019-02-10',25,6,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources',2),('Eastside Trail','Historic Fourth Ward Park','2019-02-13','2019-02-14',0,99999,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1),('Eastside Trail','Inman Park','2019-02-04','2019-02-05',0,99999,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1),('Eastside Trail','Inman Park','2019-03-01','2019-03-02',0,99999,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1),('Eastside Trail','Piedmont Park','2019-02-04','2019-02-05',0,99999,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/',1),('Official Atlanta BeltLine Bike Tour','Atlanta BeltLine Center','2019-02-09','2019-02-14',5,5,'These tours will include rest stops highlighting assets and points of interest along the Atlanta BeltLine. Staff will lead the rides, and each group will have a ride sweep to help with any unexpected mechanical difficulties.',1),('Private Bus Tour','Inman Park','2019-02-01','2019-02-02',40,4,'Private tours are available most days, pending bus and tour guide availability. Private tours can accommodate up to 4 guests per tour, and are subject to a tour fee (nonprofit rates are available). As a nonprofit organization with limited resources, we are unable to offer free private tours. We thank you for your support and your understanding as we try to provide as many private group tours as possible. The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources\n',1),('Westside Trail','Westview Cemetery','2019-02-18','2019-02-21',0,99999,'The Westside Trail is a free amenity that offers a bicycle and pedestrian-safe corridor with a 14-foot-wide multi-use trail surrounded by mature trees and grasses thanks to Trees Atlanta’s Arboretum. With 16 points of entry, 14 of which will be ADA-accessible with ramp and stair systems, the trail provides numerous access points for people of all abilities. More details at: https://beltline.org/explore-atlanta-beltline-trails/westside-trail/',1);
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Manager` (
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES ('david.smith'),('manager1'),('manager2'),('manager3'),('manager4'),('manager5'),('maria.garcia');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site`
--

DROP TABLE IF EXISTS `Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Site` (
  `SiteName` varchar(50) NOT NULL,
  `ManagerUsername` varchar(50) NOT NULL,
  `SiteAddress` varchar(50) DEFAULT NULL,
  `SiteZipcode` char(5) NOT NULL,
  `OpenEveryDay` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`SiteName`),
  KEY `ManagerUsername` (`ManagerUsername`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`ManagerUsername`) REFERENCES `manager` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site`
--

LOCK TABLES `Site` WRITE;
/*!40000 ALTER TABLE `Site` DISABLE KEYS */;
INSERT INTO `Site` VALUES ('Atlanta Beltline Center','manager3','112 Krog Street Northeast','30307','No'),('Historic Fourth Ward Park','manager4','680 Dallas Street Northeast','30308','Yes'),('Inman Park','david.smith','','30307','Yes'),('Piedmont Park','manager2','400 Park Drive Northeast','30306','Yes'),('Westview Cemetery','manager5','1680 Westview Drive Southwest','30310','No');
/*!40000 ALTER TABLE `Site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Staff` (
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('michael.smith'),('robert.smith'),('staff1'),('staff2'),('staff3');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TakeTransit`
--

DROP TABLE IF EXISTS `TakeTransit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TakeTransit` (
  `TransitDate` date NOT NULL,
  `TransitType` enum('MARTA','Bus','Bike') NOT NULL,
  `TransitRoute` varchar(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`TransitDate`,`TransitType`,`TransitRoute`,`Username`),
  KEY `TransitType` (`TransitType`,`TransitRoute`),
  KEY `Username` (`Username`),
  CONSTRAINT `taketransit_ibfk_1` FOREIGN KEY (`TransitType`, `TransitRoute`) REFERENCES `transit` (`TransitType`, `TransitRoute`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taketransit_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TakeTransit`
--

LOCK TABLES `TakeTransit` WRITE;
/*!40000 ALTER TABLE `TakeTransit` DISABLE KEYS */;
INSERT INTO `TakeTransit` VALUES ('2019-03-20','MARTA','Blue','manager2'),('2019-03-21','MARTA','Blue','manager2'),('2019-03-21','MARTA','Blue','visitor1'),('2019-03-22','MARTA','Blue','manager2'),('2019-03-20','Bus','152','manager2'),('2019-03-20','Bus','152','maria.hernandez'),('2019-03-22','Bus','152','maria.hernandez'),('2019-03-20','Bike','Relay','manager3'),('2019-03-20','Bike','Relay','maria.hernandez'),('2019-03-23','Bike','Relay','mary.smith');
/*!40000 ALTER TABLE `TakeTransit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!50001 DROP VIEW IF EXISTS `temp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `temp` AS SELECT 
 1 AS `VisitSiteDate`,
 1 AS `VisitEventName`,
 1 AS `SiteName`,
 1 AS `StartDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Transit`
--

DROP TABLE IF EXISTS `Transit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Transit` (
  `TransitType` enum('MARTA','Bus','Bike') NOT NULL,
  `TransitRoute` varchar(10) NOT NULL,
  `TransitPrice` decimal(6,2) NOT NULL,
  PRIMARY KEY (`TransitType`,`TransitRoute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transit`
--

LOCK TABLES `Transit` WRITE;
/*!40000 ALTER TABLE `Transit` DISABLE KEYS */;
INSERT INTO `Transit` VALUES ('MARTA','Blue',2.00),('Bus','152',2.00),('Bike','Relay',1.00);
/*!40000 ALTER TABLE `Transit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Status` enum('Approved','Declined','Pending') NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('asdasd','f10f619d9fa2eeb51da8c3f29b4f28aa','wqeqwe','wqe','Pending'),('asdasf','7e0556824d9b9e6546560bfeae34245f','YIbo','YIbo','Pending'),('ASDUB','bdb20785548596c64e5419a58abab4bb','Yiboas','YIBOISAD','Pending'),('asiuygdsa','f10f619d9fa2eeb51da8c3f29b4f28aa','Yibo','auiwg','Pending'),('asuihdi','bdb20785548596c64e5419a58abab4bb','yisadg','asdb','Pending'),('david.smith','07f4556478cb21b005f82051ef5ca3c8','David','Smith','Approved'),('james.smith','1254737c076cf867dc53d60a0364f38e','James','Smith','Approved'),('manager1','c240642ddef994358c96da82c0361a58','Manager','One','Pending'),('manager2','8df5127cd164b5bc2d2b78410a7eea0c','Manager','Two','Approved'),('manager3','2d3a5db4a2a9717b43698520a8de57d0','Manager','Three','Approved'),('manager4','e1ec6fc941af3ba79a4ac5242dd39735','Manager','Four','Approved'),('manager5','029cb1d27c0b9c551703ccba2591c334','Manager','Five','Approved'),('maria.garcia','cc0c3924b78d426700360b76db8b2403','Maria','Garcia','Approved'),('maria.hernandez','9acd33e5f3c729eeea08bbee68b62605','Maria','Hernandez','Approved'),('maria.rodriguez','08ed5c4b5499407be0a438654984da36','Maria','Rodriguez','Declined'),('mary.smith','b4e4e07c0df7185cb5df959a0074d45b','Mary','Smith','Approved'),('michael.smith','173dafbc79fd0527ee13bcdd75ae37e1','Michael','Smith','Approved'),('qwrqwr','7e0556824d9b9e6546560bfeae34245f','wqeqwe','qwrwq','Pending'),('robert.smith','5bb783f424929272aa2845165cf54727','Robert ','Smith','Approved'),('sadas','7e0556824d9b9e6546560bfeae34245f','sad','asd','Pending'),('staff1','04d4b37015f6ba05077ae49776a76b95','Staff','One','Approved'),('staff2','3c20c4518381a51023bdd5eb2eb66977','Staff','Two','Approved'),('staff3','308a4c22bebf60c77f158b103695d0ec','Staff','Three','Approved'),('user1','4da49c16db42ca04538d629ef0533fe8','User','One','Pending'),('visitor1','377656457556736de417e2f9d7fca8a1','Visitor','One','Approved'),('wqeqwe','7e0556824d9b9e6546560bfeae34245f','eqweqwe','qwewqe','Pending'),('yibo','25d55ad283aa400af464c76d713c07ad','Yibo','Wang','Pending');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserEmail`
--

DROP TABLE IF EXISTS `UserEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `UserEmail` (
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `Username` (`Username`),
  CONSTRAINT `useremail_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserEmail`
--

LOCK TABLES `UserEmail` WRITE;
/*!40000 ALTER TABLE `UserEmail` DISABLE KEYS */;
INSERT INTO `UserEmail` VALUES ('asdasd','saubdas@asd.com'),('asdasf','aisbda@sad.com'),('ASDUB','aysidb@gatech.edu'),('asiuygdsa','yibosad@gatech@com'),('asuihdi','yibisuad@gfas.com'),('david.smith','dsmith@outlook.com'),('james.smith','jsmith@gatech.edu'),('james.smith','jsmith@gmail.com'),('james.smith','jsmith@hotmail.com'),('james.smith','jsmith@outlook.com'),('manager1','m1@beltline.com'),('manager2','m2@beltline.com'),('manager3','m3@beltline.com'),('manager4','m4@beltline.com'),('manager5','m5@beltline.com'),('maria.garcia','mgarcia@gatech.edu'),('maria.garcia','mgarcia@yahoo.com'),('maria.hernandez','mh@gatech.edu'),('maria.hernandez','mh123@gmail.com'),('maria.rodriguez','mrodriguez@gmail.com'),('mary.smith','mary@outlook.com'),('michael.smith','msmith@gmail.com'),('qwrqwr','adasd@dasd.com'),('qwrqwr','adasd@dasd.comasd'),('qwrqwr','adqdasd@dadssd.comasd'),('qwrqwr','adqdasd@dasd.comasd'),('robert.smith','rsmith@hotmail.com'),('sadas','sadasd@sad.com'),('staff1','s1@beltline.com'),('staff2','s2@beltline.com'),('yibo','yibowang@gatech.edu');
/*!40000 ALTER TABLE `UserEmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisitEvent`
--

DROP TABLE IF EXISTS `VisitEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VisitEvent` (
  `VisitEventDate` date NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `VisitorUsername` varchar(50) NOT NULL,
  `VisitEventName` varchar(50) NOT NULL,
  PRIMARY KEY (`VisitorUsername`,`VisitEventDate`,`VisitEventName`,`SiteName`,`StartDate`),
  KEY `VisitEventName` (`VisitEventName`,`SiteName`,`StartDate`),
  CONSTRAINT `visitevent_ibfk_1` FOREIGN KEY (`VisitEventName`, `SiteName`, `StartDate`) REFERENCES `event` (`EventName`, `SiteName`, `StartDate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitevent_ibfk_2` FOREIGN KEY (`VisitorUsername`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitEvent`
--

LOCK TABLES `VisitEvent` WRITE;
/*!40000 ALTER TABLE `VisitEvent` DISABLE KEYS */;
INSERT INTO `VisitEvent` VALUES ('2019-02-10','Inman Park','2019-02-08','mary.smith','Arboretum Walking Tour'),('2019-02-02','Inman Park','2019-02-01','manager2','Bus Tour'),('2019-02-01','Inman Park','2019-02-01','manager4','Bus Tour'),('2019-02-02','Inman Park','2019-02-01','manager5','Bus Tour'),('2019-02-02','Inman Park','2019-02-01','maria.garcia','Bus Tour'),('2019-02-01','Inman Park','2019-02-01','mary.smith','Bus Tour'),('2019-02-02','Inman Park','2019-02-01','staff2','Bus Tour'),('2019-02-13','Historic Fourth Ward Park','2019-02-13','mary.smith','Eastside Trail'),('2019-02-14','Historic Fourth Ward Park','2019-02-13','mary.smith','Eastside Trail'),('2019-02-14','Historic Fourth Ward Park','2019-02-13','visitor1','Eastside Trail'),('2019-02-04','Piedmont Park','2019-02-04','mary.smith','Eastside Trail'),('2019-02-10','Atlanta BeltLine Center','2019-02-09','mary.smith','Official Atlanta BeltLine Bike Tour'),('2019-02-10','Atlanta BeltLine Center','2019-02-09','visitor1','Official Atlanta BeltLine Bike Tour'),('2019-02-01','Inman Park','2019-02-01','mary.smith','Private Bus Tour'),('2019-02-02','Inman Park','2019-02-01','mary.smith','Private Bus Tour'),('2019-02-19','Westview Cemetery','2019-02-18','mary.smith','Westside Trail'),('2019-02-19','Westview Cemetery','2019-02-18','visitor1','Westside Trail');
/*!40000 ALTER TABLE `VisitEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visitor`
--

DROP TABLE IF EXISTS `Visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Visitor` (
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visitor`
--

LOCK TABLES `Visitor` WRITE;
/*!40000 ALTER TABLE `Visitor` DISABLE KEYS */;
INSERT INTO `Visitor` VALUES ('manager2'),('manager4'),('manager5'),('maria.garcia'),('maria.rodriguez'),('mary.smith'),('michael.smith'),('staff2'),('staff3'),('visitor1');
/*!40000 ALTER TABLE `Visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisitSite`
--

DROP TABLE IF EXISTS `VisitSite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VisitSite` (
  `VisitSiteDate` date NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `VisitorUsername` varchar(50) NOT NULL,
  PRIMARY KEY (`VisitSiteDate`,`SiteName`,`VisitorUsername`),
  KEY `SiteName` (`SiteName`),
  KEY `VisitorUsername` (`VisitorUsername`),
  CONSTRAINT `visitsite_ibfk_1` FOREIGN KEY (`SiteName`) REFERENCES `site` (`SiteName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitsite_ibfk_2` FOREIGN KEY (`VisitorUsername`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitSite`
--

LOCK TABLES `VisitSite` WRITE;
/*!40000 ALTER TABLE `VisitSite` DISABLE KEYS */;
INSERT INTO `VisitSite` VALUES ('2019-02-01','Atlanta Beltline Center','mary.smith'),('2019-02-09','Atlanta Beltline Center','visitor1'),('2019-02-10','Atlanta Beltline Center','mary.smith'),('2019-02-13','Atlanta Beltline Center','visitor1'),('2019-02-02','Historic Fourth Ward Park','mary.smith'),('2019-02-11','Historic Fourth Ward Park','visitor1'),('2019-02-01','Inman Park','mary.smith'),('2019-02-01','Inman Park','visitor1'),('2019-02-02','Inman Park','mary.smith'),('2019-02-03','Inman Park','mary.smith'),('2019-02-01','Piedmont Park','visitor1'),('2019-02-02','Piedmont Park','mary.smith'),('2019-02-11','Piedmont Park','visitor1'),('2019-02-06','Westview Cemetery','visitor1');
/*!40000 ALTER TABLE `VisitSite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'AtlantaBeltline'
--

--
-- Dumping routines for database 'AtlantaBeltline'
--

--
-- Final view structure for view `temp`
--

/*!50001 DROP VIEW IF EXISTS `temp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `temp` AS select `vs`.`VisitSiteDate` AS `VisitSiteDate`,`ve`.`VisitEventName` AS `VisitEventName`,`vs`.`SiteName` AS `SiteName`,`ve`.`StartDate` AS `StartDate` from (`visitsite` `vs` left join `visitevent` `ve` on(((`vs`.`VisitorUsername` = `ve`.`VisitorUsername`) and (`vs`.`SiteName` = `ve`.`SiteName`) and (`vs`.`VisitSiteDate` = `ve`.`VisitEventDate`)))) */;
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

-- Dump completed on 2019-04-21 23:28:41

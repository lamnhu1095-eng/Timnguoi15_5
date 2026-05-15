-- MySQL dump 10.13  Distrib 8.0.46, for macos15 (x86_64)
--
-- Host: localhost    Database: DaNangSafeMap
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `chatmessages`
--

DROP TABLE IF EXISTS `chatmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatmessages` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoomId` int NOT NULL,
  `SenderId` int NOT NULL,
  `Message` text NOT NULL,
  `SentAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsRead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_Chat_Room` (`RoomId`),
  KEY `FK_Chat_Sender` (`SenderId`),
  CONSTRAINT `FK_Chat_Room` FOREIGN KEY (`RoomId`) REFERENCES `chatrooms` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Chat_Sender` FOREIGN KEY (`SenderId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmessages`
--

LOCK TABLES `chatmessages` WRITE;
/*!40000 ALTER TABLE `chatmessages` DISABLE KEYS */;
INSERT INTO `chatmessages` VALUES (1,1,21,'alo','2026-04-28 20:29:06',1),(2,1,21,'nnnn','2026-04-28 20:53:13',1),(3,2,21,'nnn','2026-04-29 11:41:49',1),(4,2,21,'nnn','2026-04-29 11:42:10',1),(5,2,21,'alo','2026-04-30 10:21:34',1),(6,3,22,'[ANON]hello','2026-05-03 00:44:55',1),(7,3,22,'[ANON]hello','2026-05-03 00:44:55',1),(8,3,5,'hh','2026-05-03 00:45:18',1),(9,3,5,'hh','2026-05-03 00:45:18',1),(10,4,22,'[ANON]alo','2026-05-03 01:02:18',1),(11,4,22,'[ANON]alo','2026-05-03 01:02:18',1),(12,2,5,'alo','2026-05-03 01:13:56',1),(13,2,5,'alo','2026-05-03 01:14:02',1),(14,5,23,'mmm','2026-05-03 01:15:57',1),(15,5,23,'mmm','2026-05-03 01:18:31',1),(16,5,5,'mkmk','2026-05-03 01:23:55',1),(17,3,5,'n','2026-05-03 01:26:57',1),(18,3,5,'jj','2026-05-03 01:27:00',1),(19,3,5,'kk','2026-05-03 01:27:03',1),(20,5,23,'ỏ','2026-05-03 10:11:26',1),(21,5,23,'ỏoooooooooooo','2026-05-03 10:11:32',1),(22,5,23,'oooooooooooo','2026-05-03 10:12:34',1),(23,5,23,'h h h h h h h h h','2026-05-03 10:13:20',1),(24,5,5,'hhhhhhhhhhhh','2026-05-03 10:54:30',1),(25,5,5,'olalala','2026-05-03 11:00:05',1),(26,5,5,'holoalo','2026-05-03 11:14:52',1),(27,5,5,'holoalo','2026-05-03 11:14:56',1),(28,6,5,'[ANON]tôi thấy hoa vàng trên cỏ xanh','2026-05-03 11:20:28',1),(29,6,23,'bạn thấy ở đâu vậy','2026-05-03 11:21:00',1),(30,6,5,'[ANON]xanh','2026-05-03 11:21:29',0),(31,6,5,'[ANON]tôi thấy ảnh đang đi bộ','2026-05-03 11:22:38',0),(32,6,5,'[ANON]tôi thấy ng đó giống như là loà lag là là','2026-05-03 11:23:33',0),(33,6,5,'[ANON]tôi thấy ng đó giống như là loà lag là là','2026-05-03 11:35:03',0),(34,6,5,'[ANON]tôi thấy ng đó giống như là','2026-05-03 11:35:15',0),(35,6,5,'[ANON]oke','2026-05-03 11:35:22',0),(36,6,5,'[ANON]lalalalalalala','2026-05-03 11:35:28',0),(37,6,5,'[ANON]xanh','2026-05-03 11:35:50',0),(38,5,5,'hhhhhhhhhhhhhhhhhhh','2026-05-03 11:48:35',1),(39,4,5,'helo','2026-05-03 20:14:00',1),(40,4,5,'how are you','2026-05-03 20:16:55',1),(41,4,5,'oke','2026-05-03 20:17:34',1),(42,4,22,'bna','2026-05-03 20:18:13',1),(43,5,5,'hello','2026-05-04 14:57:53',1),(44,5,5,'ủa','2026-05-04 15:02:31',1),(45,5,5,'bạn đang làm gì đó','2026-05-04 15:05:42',1),(46,5,23,'[ANON]tôi đang ở nhà','2026-05-04 15:06:03',1),(47,6,5,'[ANON]jjjjjjjjjj','2026-05-04 22:00:48',0),(48,2,21,'[ANON]kkkkkkkkk','2026-05-04 22:01:48',1),(49,2,5,'oke','2026-05-04 22:02:11',1);
/*!40000 ALTER TABLE `chatmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatrooms`
--

DROP TABLE IF EXISTS `chatrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatrooms` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `IsGroup` tinyint(1) DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatrooms`
--

LOCK TABLES `chatrooms` WRITE;
/*!40000 ALTER TABLE `chatrooms` DISABLE KEYS */;
INSERT INTO `chatrooms` VALUES (1,'MP_25_U_21',0,'2026-04-28 20:29:03'),(2,'MP_26_U_21',0,'2026-04-28 20:55:18'),(3,'MP_25_U_22',0,'2026-05-03 00:44:49'),(4,'MP_26_U_22',0,'2026-05-03 00:58:08'),(5,'MP_25_U_23',0,'2026-05-03 01:15:54'),(6,'MP_27_U_5',0,'2026-05-03 11:20:13');
/*!40000 ALTER TABLE `chatrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clues`
--

DROP TABLE IF EXISTS `clues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MissingPersonId` int NOT NULL,
  `UserId` int DEFAULT NULL,
  `Description` text NOT NULL,
  `Location` varchar(500) DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Clue_Person` (`MissingPersonId`),
  KEY `FK_Clue_User` (`UserId`),
  CONSTRAINT `FK_Clue_Person` FOREIGN KEY (`MissingPersonId`) REFERENCES `missingpersons` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clues`
--

LOCK TABLES `clues` WRITE;
/*!40000 ALTER TABLE `clues` DISABLE KEYS */;
INSERT INTO `clues` VALUES (11,9,7,'Tôi thấy một cụ già tương tự mô tả đang ngồi nghỉ ở gần bến xe buýt gần cầu Rồng, khoảng 8 giờ sáng.','Bến xe buýt cầu Rồng, Đà Nẵng',NULL,'2025-04-20 08:45:00'),(12,9,8,'Cháu tôi thấy cụ đang đi bộ về hướng chợ Cồn lúc 9 giờ sáng, dáng đi chậm chạp và có vẻ mất phương hướng.','Đường Hùng Vương, gần chợ Cồn',NULL,'2025-04-20 10:00:00'),(13,10,6,'Tôi thấy bé đứng khóc gần quầy bán trái cây trong chợ Hàn, đã nhờ bảo vệ chợ hỗ trợ.','Chợ Hàn, khu vực bán trái cây',NULL,'2025-04-18 09:35:00'),(14,10,9,'Bé đã được bảo vệ chợ Hàn tìm thấy và đang chờ tại phòng bảo vệ tầng 1.','Phòng bảo vệ chợ Hàn',NULL,'2025-04-18 09:50:00'),(15,11,9,'Tôi thấy một người giống mô tả đang ngồi ở quán cà phê khu vực Phạm Văn Đồng, khoảng 11 giờ đêm hôm đó.','Đường Phạm Văn Đồng, gần biển Mỹ Khê',NULL,'2025-04-20 07:00:00'),(16,11,7,'Camera an ninh khu vực bãi biển Mỹ Khê có thể đã ghi lại hình ảnh. Bạn nên liên hệ ban quản lý để xem lại.','Bãi biển Mỹ Khê',NULL,'2025-04-20 09:30:00'),(17,13,6,'Em thấy bạn này ở quán net đường Lê Duẩn, đang chơi game, hình như bỏ học.','Quán net đường Lê Duẩn, Hải Châu',NULL,'2025-04-15 14:00:00'),(18,15,7,'Bé trai mặc áo xanh có xe ô tô đang ngồi khóc gần khu vui chơi thiếu nhi trong công viên. Tôi đang ở gần đó hỗ trợ bé.','Khu vui chơi thiếu nhi, Công viên 29/3',NULL,'2025-04-24 17:45:00'),(19,15,8,'Tôi nghe tiếng bé khóc gọi \"ba mẹ ơi\" gần cổng phụ công viên phía đường Điện Biên Phủ.','Cổng công viên 29/3 phía Điện Biên Phủ',NULL,'2025-04-24 18:00:00'),(20,16,6,'Tôi thấy bạn nữ giống mô tả đi xe buýt số 1 về hướng trung tâm thành phố tối hôm đó.','Trạm xe buýt gần ĐH Đà Nẵng',NULL,'2025-04-23 21:00:00'),(21,25,21,'SEEN_AT:2026-04-27 20:32|PHONE:|CONTENT:nnn','vincom ',NULL,'2026-04-28 20:33:25'),(22,25,21,'SEEN_AT:2026-04-27 20:32|PHONE:|CONTENT:nnn','vincom ',NULL,'2026-04-28 20:33:29'),(23,25,21,'SEEN_AT:2026-04-27 20:33|PHONE:|CONTENT:nnnn','vincom ',NULL,'2026-04-28 20:33:55'),(24,25,21,'SEEN_AT:2026-04-28 20:44|PHONE:|CONTENT:mm','vincom ',NULL,'2026-04-28 20:45:26'),(25,25,21,'SEEN_AT:2026-04-28 20:52|PHONE:|CONTENT:mnmn','vincom ',NULL,'2026-04-28 20:52:48'),(26,26,21,'SEEN_AT:2026-04-28 20:57|PHONE:|CONTENT:nmnm','Đường Trần Can, Phường Thanh Khê, Thành phố Đà Nẵng, 84236, Việt Nam',NULL,'2026-04-28 20:57:57'),(27,26,21,'SEEN_AT:2026-04-28 21:01|PHONE:|CONTENT:jmnn','vincom ',NULL,'2026-04-28 21:02:15'),(28,26,21,'SEEN_AT:2026-04-28 21:07|PHONE:|CONTENT:mmm','vincom ',NULL,'2026-04-28 21:07:30'),(29,26,NULL,'SEEN_AT:2026-04-29 10:00|PHONE:|CONTENT:mnkk','Đường Trần Can, Phường Thanh Khê, Thành phố Đà Nẵng, 84236, Việt Nam',NULL,'2026-04-29 10:06:38'),(30,26,NULL,'SEEN_AT:2026-04-29 10:00|PHONE:|CONTENT:mmm','vincom ',NULL,'2026-04-29 10:41:16'),(31,26,21,'SEEN_AT:2026-04-29 10:50|PHONE:|CONTENT:mm','Đường Trần Can, Phường Thanh Khê, Thành phố Đà Nẵng, 84236, Việt Nam',NULL,'2026-04-29 10:50:56'),(32,26,21,'SEEN_AT:2026-04-29 11:27|PHONE:|CONTENT:dsds','vincom ',NULL,'2026-04-29 11:28:00'),(33,26,21,'SEEN_AT:2026-04-29 11:01|PHONE:|CONTENT:hôhho','vincom ',NULL,'2026-04-29 11:32:48'),(34,26,21,'SEEN_AT:2026-04-29 11:30|PHONE:|CONTENT:jjjjjj','cầu rồng',NULL,'2026-04-29 11:35:06'),(35,26,21,'SEEN_AT:2026-04-09 11:35|PHONE:|CONTENT:ddđ','vincom ',NULL,'2026-04-29 11:35:46'),(36,25,NULL,'SEEN_AT:2026-05-03 01:20|PHONE:|CONTENT:cao cao','Trao đổi tài sản số, 60/28, Kiệt 47 Lý Thái Tổ, Thạc Gián, Phường Thanh Khê, Thành phố Đà Nẵng, 50207, Việt Nam','/images/clues/d3c0c92f-cd92-49a9-a24a-a77fffe3843c.png','2026-05-03 01:29:23'),(37,25,NULL,'SEEN_AT:2026-05-03 09:44|PHONE:|CONTENT:cao cao','Trường Mầm non Dạ Lan Hương, 83, Đường Hoàng Văn Thụ, Phước Ninh, Phường Hải Châu, Thành phố Đà Nẵng, 02363, Việt Nam',NULL,'2026-05-03 09:44:59'),(38,25,23,'SEEN_AT:2026-05-01 15:06|PHONE:|CONTENT:gầy gầy','Bệnh viện Quân y 17, Đường Nguyễn Hữu Thọ, Phường Hòa Cường, Thành phố Đà Nẵng, 02363, Việt Nam',NULL,'2026-05-04 15:06:46'),(39,27,5,'SEEN_AT:2026-05-04 22:00|PHONE:|CONTENT:gggggg','bách khoa',NULL,'2026-05-04 22:00:32'),(40,25,NULL,'SEEN_AT:2026-05-14 10:56|PHONE:|CONTENT:ff','189, Đường Nguyễn Hoàng, Thạc Gián, Phường Hải Châu, Thành phố Đà Nẵng, 50207, Việt Nam',NULL,'2026-05-15 10:56:46'),(41,25,NULL,'SEEN_AT:2026-05-14 10:59|PHONE:|CONTENT:cao','sssss',NULL,'2026-05-15 10:59:49');
/*!40000 ALTER TABLE `clues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Latitude` decimal(10,8) NOT NULL,
  `Longitude` decimal(11,8) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missingperson_tags`
--

DROP TABLE IF EXISTS `missingperson_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missingperson_tags` (
  `MissingPersonId` int NOT NULL,
  `TagId` int NOT NULL,
  PRIMARY KEY (`MissingPersonId`,`TagId`),
  KEY `FK_TagMapping_Tag` (`TagId`),
  CONSTRAINT `FK_TagMapping_Missing` FOREIGN KEY (`MissingPersonId`) REFERENCES `missingpersons` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_TagMapping_Tag` FOREIGN KEY (`TagId`) REFERENCES `tags` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missingperson_tags`
--

LOCK TABLES `missingperson_tags` WRITE;
/*!40000 ALTER TABLE `missingperson_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `missingperson_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missingpersons`
--

DROP TABLE IF EXISTS `missingpersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missingpersons` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Description` text,
  `LastSeenLocation` varchar(500) NOT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `Status` int DEFAULT '1' COMMENT '1: Đang tìm, 2: Đã thấy, 3: Đóng',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `DeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Missing_User` (`UserId`),
  CONSTRAINT `FK_Missing_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missingpersons`
--

LOCK TABLES `missingpersons` WRITE;
/*!40000 ALTER TABLE `missingpersons` DISABLE KEYS */;
INSERT INTO `missingpersons` VALUES (9,6,'Nguyễn Văn Thành','Cụ ông 75 tuổi, tóc bạc, đi cà thọt, mặc áo sơ mi kẻ xanh trắng và quần tây đen. Cụ bị lẫn, có thể không nhớ đường về. Rất mong ai biết thông tin hãy liên hệ gấp.','Khu vực cầu Sông Hàn, đường Trần Phú, Đà Nẵng',16.06780000,108.22350000,'https://randomuser.me/api/portraits/men/75.jpg',1,'2025-04-20 07:30:00',NULL),(10,7,'Trần Bảo Nhi','Bé gái 6 tuổi, cao khoảng 1.1m, tóc đen ngắn, mặc váy hoa hồng. Bé bị lạc khi đi chợ cùng mẹ vào buổi sáng. Bé tên Nhi, hay khóc khi gặp người lạ.','Chợ Hàn, đường Trần Phú, Hải Châu, Đà Nẵng',16.06520000,108.22310000,'https://randomuser.me/api/portraits/women/12.jpg',2,'2025-04-18 09:15:00',NULL),(11,8,'Lê Hoàng Nam','Nam thanh niên 22 tuổi, cao 1.72m, gầy, tóc cắt ngắn. Mặc áo phông màu trắng có in logo, quần short đen, đeo balo màu xám. Lần cuối được nhìn thấy tại khu vực bãi biển Mỹ Khê vào tối ngày 19/4.','Bãi biển Mỹ Khê, Đà Nẵng',16.03950000,108.24570000,'https://randomuser.me/api/portraits/men/22.jpg',1,'2025-04-19 22:00:00',NULL),(12,6,'Phạm Thị Hoa','Phụ nữ 55 tuổi, dáng người đậm, tóc ngắn ngang vai, hay mặc áo bà ba. Bà bị bệnh tâm thần nhẹ và thường đi lang thang. Gia đình rất lo lắng.','Khu phố Đa Phước, Hải Châu, Đà Nẵng',16.04230000,108.21860000,NULL,1,'2025-04-22 14:00:00',NULL),(13,9,'Võ Thanh Tùng','Nam sinh 16 tuổi, học THPT Phan Châu Trinh. Cao khoảng 1.65m, mặc đồng phục trắng xanh. Đi học buổi sáng nhưng tới trưa không về. Điện thoại không liên lạc được.','Trường THPT Phan Châu Trinh, Đà Nẵng',16.06130000,108.21970000,'https://randomuser.me/api/portraits/men/16.jpg',2,'2025-04-15 12:00:00',NULL),(14,7,'Đỗ Văn Bình','Cụ ông 80 tuổi, đi xe lăn, thường mặc quần áo màu tối. Cụ bị mất tích trong khu vực bệnh viện. Đã được tìm thấy và đưa về gia đình an toàn.','Bệnh viện Đà Nẵng, đường Hải Phòng',16.06490000,108.21550000,NULL,3,'2025-04-10 10:00:00',NULL),(15,8,'Nguyễn Minh Khoa','Bé trai 4 tuổi, mặc áo thun xanh dương có in xe ô tô, quần short kaki. Bé bị lạc tại công viên 29/3 vào chiều tối. Bé hay gọi \"ba ơi, mẹ ơi\" khi khóc.','Công viên 29/3, Đà Nẵng',16.05820000,108.21420000,'https://randomuser.me/api/portraits/men/4.jpg',1,'2025-04-24 17:30:00',NULL),(16,10,'Huỳnh Thị Thảo','Nữ sinh viên 20 tuổi, cao 1.58m, tóc dài đen, gầy. Mặc áo khoác đen, quần jeans xanh. Cuối cùng được nhìn thấy tại khu ký túc xá ĐH Đà Nẵng. Gia đình và bạn bè rất lo lắng.','Ký túc xá Đại học Đà Nẵng, Ngũ Hành Sơn',16.03260000,108.22780000,'https://randomuser.me/api/portraits/women/20.jpg',1,'2025-04-23 20:00:00',NULL),(17,6,'Nguyễn Văn Thành','Cụ ông 75 tuổi, tóc bạc, đi cà thọt, mặc áo sơ mi kẻ xanh trắng và quần tây đen. Cụ bị lẫn, có thể không nhớ đường về. Rất mong ai biết thông tin hãy liên hệ gấp.','Khu vực cầu Sông Hàn, đường Trần Phú, Đà Nẵng',16.06780000,108.22350000,'https://randomuser.me/api/portraits/men/75.jpg',1,'2025-04-20 07:30:00',NULL),(18,7,'Trần Bảo Nhi','Bé gái 6 tuổi, cao khoảng 1.1m, tóc đen ngắn, mặc váy hoa hồng. Bé bị lạc khi đi chợ cùng mẹ vào buổi sáng. Bé tên Nhi, hay khóc khi gặp người lạ.','Chợ Hàn, đường Trần Phú, Hải Châu, Đà Nẵng',16.06520000,108.22310000,'https://randomuser.me/api/portraits/women/12.jpg',2,'2025-04-18 09:15:00',NULL),(19,8,'Lê Hoàng Nam','Nam thanh niên 22 tuổi, cao 1.72m, gầy, tóc cắt ngắn. Mặc áo phông màu trắng có in logo, quần short đen, đeo balo màu xám. Lần cuối được nhìn thấy tại khu vực bãi biển Mỹ Khê vào tối ngày 19/4.','Bãi biển Mỹ Khê, Đà Nẵng',16.03950000,108.24570000,'https://randomuser.me/api/portraits/men/22.jpg',1,'2025-04-19 22:00:00',NULL),(20,6,'Phạm Thị Hoa','Phụ nữ 55 tuổi, dáng người đậm, tóc ngắn ngang vai, hay mặc áo bà ba. Bà bị bệnh tâm thần nhẹ và thường đi lang thang. Gia đình rất lo lắng.','Khu phố Đa Phước, Hải Châu, Đà Nẵng',16.04230000,108.21860000,NULL,1,'2025-04-22 14:00:00',NULL),(21,9,'Võ Thanh Tùng','Nam sinh 16 tuổi, học THPT Phan Châu Trinh. Cao khoảng 1.65m, mặc đồng phục trắng xanh. Đi học buổi sáng nhưng tới trưa không về. Điện thoại không liên lạc được.','Trường THPT Phan Châu Trinh, Đà Nẵng',16.06130000,108.21970000,'https://randomuser.me/api/portraits/men/16.jpg',2,'2025-04-15 12:00:00',NULL),(22,7,'Đỗ Văn Bình','Cụ ông 80 tuổi, đi xe lăn, thường mặc quần áo màu tối. Cụ bị mất tích trong khu vực bệnh viện. Đã được tìm thấy và đưa về gia đình an toàn.','Bệnh viện Đà Nẵng, đường Hải Phòng',16.06490000,108.21550000,NULL,3,'2025-04-10 10:00:00',NULL),(23,8,'Nguyễn Minh Khoa','Bé trai 4 tuổi, mặc áo thun xanh dương có in xe ô tô, quần short kaki. Bé bị lạc tại công viên 29/3 vào chiều tối. Bé hay gọi \"ba ơi, mẹ ơi\" khi khóc.','Công viên 29/3, Đà Nẵng',16.05820000,108.21420000,'https://randomuser.me/api/portraits/men/4.jpg',1,'2025-04-24 17:30:00',NULL),(24,10,'Huỳnh Thị Thảo','Nữ sinh viên 20 tuổi, cao 1.58m, tóc dài đen, gầy. Mặc áo khoác đen, quần jeans xanh. Cuối cùng được nhìn thấy tại khu ký túc xá ĐH Đà Nẵng. Gia đình và bạn bè rất lo lắng.','Ký túc xá Đại học Đà Nẵng, Ngũ Hành Sơn',16.03260000,108.22780000,'https://randomuser.me/api/portraits/women/20.jpg',1,'2025-04-23 20:00:00',NULL),(25,5,'Phan Nguyệt','TUOI:4|GIOITINH:Nữ|CHIEUCAO:100|DACBIET:tóc mái ngố|LIENHE:0977773214|NOIDUNG:','Cầu rồng',NULL,NULL,'/images/missing/8d844448-b730-47b6-b993-6198cd2dd21a.jpg',1,'2026-04-28 18:17:10',NULL),(26,5,'Đặng Duy','TUOI:21|GIOITINH:Nam|CHIEUCAO:170|DACBIET:tóc đỏ|LIENHE:0922233331|NOIDUNG:','Vincom',16.07135900,108.23025900,'/images/missing/72c131fa-7321-48eb-b413-f5569b9160c6.png',1,'2026-04-28 19:32:43',NULL),(27,23,'Phan Quan','TUOI:17|GIOITINH:Nam|CHIEUCAO:178|DACBIET:tóc nâu|LIENHE:0966333222|NOIDUNG:','Đường Số 3, Khu công nghiệp Hòa Khánh, Hòa Khánh Bắc, Phường Liên Chiểu, Thành phố Đà Nẵng, 51000, Việt Nam',16.07501200,108.14126000,'/images/missing/4d7a238b-d29e-409b-8c3b-8dad6691cd85.webp',4,'2026-05-03 11:18:58','2026-05-15 16:22:10');
/*!40000 ALTER TABLE `missingpersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderation_logs`
--

DROP TABLE IF EXISTS `moderation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderation_logs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TargetId` int NOT NULL COMMENT 'Id của Article hoặc Alert',
  `TargetType` varchar(50) NOT NULL COMMENT 'Article / SecurityAlert',
  `ModeratorId` int NOT NULL,
  `Action` varchar(50) NOT NULL COMMENT 'Approve, Reject, Delete',
  `Notes` text,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Log_User` (`ModeratorId`),
  CONSTRAINT `FK_Log_User` FOREIGN KEY (`ModeratorId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderation_logs`
--

LOCK TABLES `moderation_logs` WRITE;
/*!40000 ALTER TABLE `moderation_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderation_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `IsRead` tinyint(1) DEFAULT '0',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `Link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Noti_User` (`UserId`),
  CONSTRAINT `FK_Noti_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-28 21:07:30','/MissingPerson/Details/26#clues'),(2,5,'clue','🔍 Manh mối mới!','Người ẩn danh vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 10:06:39','/MissingPerson/Details/26#clues'),(3,5,'clue','🔍 Manh mối mới!','Người ẩn danh vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 10:41:16','/MissingPerson/Details/26#clues'),(4,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 10:50:56','/MissingPerson/Details/26#clues'),(5,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 11:28:01','/MissingPerson/Details/26#clues'),(6,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 11:32:48','/MissingPerson/Details/26#clues'),(7,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 11:35:06','/MissingPerson/Details/26#clues'),(8,5,'clue','🔍 Manh mối mới!','Thiên Ý Phan vừa gửi manh mối cho bài đăng “Đặng Duy”',1,'2026-04-29 11:35:47','/MissingPerson/Details/26#clues'),(9,5,'chat','💬 Tin nhắn mới!','Thiên Ý Phan vừa nhắn tin về bài đăng “Đặng Duy”',1,'2026-04-29 11:41:49','/MissingPerson/Details/26'),(10,5,'chat','💬 Tin nhắn mới!','Thiên Ý Phan vừa nhắn tin về bài đăng “Đặng Duy”',1,'2026-04-29 11:42:10','/MissingPerson/Details/26'),(11,5,'chat','💬 Tin nhắn mới!','Thiên Ý Phan vừa nhắn tin về bài đăng “Đặng Duy”',1,'2026-04-30 10:21:34','/MissingPerson/Details/26'),(12,5,'chat','💬 Tin nhắn mới!','Thiên Anh Lư trữ tài liệu vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 00:44:55','/MissingPerson/Details/25'),(13,5,'chat','💬 Tin nhắn mới!','Thiên Anh Lư trữ tài liệu vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 00:44:55','/MissingPerson/Details/25'),(14,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 01:15:57','/MissingPerson/Details/25'),(15,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 01:18:31','/MissingPerson/Details/25'),(16,5,'clue','Manh mối mới','Người ẩn danh vừa gửi manh mối cho bài đăng “Phan Nguyệt”',1,'2026-05-03 01:29:23','/MissingPerson/Details/25#clues'),(17,5,'clue','Manh mối mới','Người ẩn danh vừa gửi manh mối cho bài đăng “Phan Nguyệt”',1,'2026-05-03 09:44:59','/MissingPerson/Details/25#clues'),(18,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 10:11:26','/MissingPerson/Details/25'),(19,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 10:11:32','/MissingPerson/Details/25'),(20,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 10:12:34','/MissingPerson/Details/25'),(21,5,'chat','Tin nhắn mới','Lam Phương vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-03 10:13:20','/MissingPerson/Details/25'),(22,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',1,'2026-05-03 11:20:28','/MissingPerson/Details/27'),(23,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:21:29','/MissingPerson/Details/27'),(24,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:22:38','/MissingPerson/Details/27'),(25,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:23:33','/MissingPerson/Details/27'),(26,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:35:04','/MissingPerson/Details/27'),(27,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:35:15','/MissingPerson/Details/27'),(28,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:35:22','/MissingPerson/Details/27'),(29,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:35:28','/MissingPerson/Details/27'),(30,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-03 11:35:50','/MissingPerson/Details/27'),(31,5,'chat','Tin nhắn mới','Thiên Anh Lư trữ tài liệu vừa nhắn tin về bài đăng “Đặng Duy”',1,'2026-05-03 20:18:13','/MissingPerson/Details/26'),(32,23,'chat','Tin nhắn mới','Như Như vừa phản hồi về bài đăng “Phan Nguyệt”',1,'2026-05-04 15:05:42','/MissingPerson/Details/25#chat'),(33,5,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Nguyệt”',1,'2026-05-04 15:06:03','/MissingPerson/Details/25#chat'),(34,5,'clue','Manh mối mới','Lam Phương vừa gửi manh mối cho bài đăng “Phan Nguyệt”',1,'2026-05-04 15:06:46','/MissingPerson/Details/25#clues'),(35,23,'clue','Manh mối mới','Như Như vừa gửi manh mối cho bài đăng “Phan Quan”',0,'2026-05-04 22:00:32','/MissingPerson/Details/27#clues'),(36,23,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Phan Quan”',0,'2026-05-04 22:00:48','/MissingPerson/Details/27#chat'),(37,5,'chat','Tin nhắn mới','Người ẩn danh vừa nhắn tin về bài đăng “Đặng Duy”',1,'2026-05-04 22:01:48','/MissingPerson/Details/26#chat'),(38,21,'chat','Tin nhắn mới','Như Như vừa phản hồi về bài đăng “Đặng Duy”',1,'2026-05-04 22:02:11','/MissingPerson/Details/26#chat'),(39,5,'clue','Manh mối mới','Người ẩn danh vừa gửi manh mối cho bài đăng “Phan Nguyệt”',0,'2026-05-15 10:56:47','/MissingPerson/Details/25#clues'),(40,5,'clue','Manh mối mới','Người ẩn danh vừa gửi manh mối cho bài đăng “Phan Nguyệt”',0,'2026-05-15 10:59:49','/MissingPerson/Details/25#clues'),(41,23,'AdminAction','Bài đăng của bạn đã bị gỡ xuống','Bài đăng tìm người \"Phan Quan\" của bạn đã bị gỡ xuống do vi phạm quy định cộng đồng sau khi nhận được báo cáo từ người dùng. Nếu bạn cho rằng đây là nhầm lẫn, vui lòng liên hệ quản trị viên.',0,'2026-05-15 16:22:10',NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReporterId` int DEFAULT NULL,
  `TargetId` int NOT NULL,
  `TargetType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` int DEFAULT '1' COMMENT '1: Chờ xử lý, 2: Đã xử lý',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `Details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`),
  KEY `FK_Report_User` (`ReporterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,NULL,27,'MissingPerson','Ngôn từ kích động',2,'2026-05-03 14:36:59',''),(2,5,27,'MissingPerson','Khác',2,'2026-05-04 15:00:57','oke');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_Tag_Slug` (`Slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` enum('Nam','Nữ','Khác') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PasswordHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NULL nếu đăng nhập bằng Google',
  `GoogleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AuthProvider` enum('Local','Google') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Local',
  `Role` enum('Admin','User') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastLoginAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `GoogleId` (`GoogleId`),
  KEY `idx_users_email` (`Email`),
  KEY `idx_users_googleid` (`GoogleId`),
  KEY `idx_users_role` (`Role`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Như Như',NULL,NULL,NULL,'https://lh3.googleusercontent.com/a/ACg8ocJl9ccsvttoGXSJtW7ehOZeEmr1jp33I50X1ydNb8mXT8BRXpsP-Q=s96-c','lamnhu1095@gmail.com',NULL,'114417069544811473772','Google','User',1,'2026-04-26 19:35:41','2026-05-15 10:57:31'),(6,'Nguyễn Văn An','1990-05-15','Nam','123 Trần Phú, Hải Châu, Đà Nẵng',NULL,'nguyenvanan@gmail.com','$2a$11$K5J2pZ1xQ8vR3mN9wL7uEeD4hG6yT0bC2kM8nP1qS5rV9uX3jF7iA',NULL,'Local','User',1,'2025-01-10 08:00:00','2025-04-20 10:30:00'),(7,'Trần Thị Bích','1985-08-22','Nữ','45 Lê Duẩn, Hải Châu, Đà Nẵng',NULL,'tranthbich@gmail.com','$2a$11$K5J2pZ1xQ8vR3mN9wL7uEeD4hG6yT0bC2kM8nP1qS5rV9uX3jF7iA',NULL,'Local','User',1,'2025-02-14 09:00:00','2025-04-21 11:00:00'),(8,'Lê Quốc Hùng','1978-12-30','Nam','78 Nguyễn Văn Linh, Thanh Khê, Đà Nẵng',NULL,'lequochung@gmail.com','$2a$11$K5J2pZ1xQ8vR3mN9wL7uEeD4hG6yT0bC2kM8nP1qS5rV9uX3jF7iA',NULL,'Local','User',1,'2025-03-01 07:30:00','2025-04-22 09:15:00'),(9,'Phạm Thị Lan','1995-03-10','Nữ','22 Hùng Vương, Hải Châu, Đà Nẵng',NULL,'phamthilan@gmail.com','$2a$11$K5J2pZ1xQ8vR3mN9wL7uEeD4hG6yT0bC2kM8nP1qS5rV9uX3jF7iA',NULL,'Local','User',1,'2025-03-15 14:00:00','2025-04-23 08:45:00'),(10,'Hoàng Minh Tuấn','2000-07-04','Nam','56 Điện Biên Phủ, Thanh Khê, Đà Nẵng',NULL,'hoangminhtuan@gmail.com','$2a$11$K5J2pZ1xQ8vR3mN9wL7uEeD4hG6yT0bC2kM8nP1qS5rV9uX3jF7iA',NULL,'Local','Admin',1,'2025-01-01 00:00:00','2025-04-25 20:00:00'),(21,'Thiên Ý Phan',NULL,NULL,NULL,'https://lh3.googleusercontent.com/a/ACg8ocJa_4t5dip8jSzSy0PclkijD53IfL8I2P7JyhFtem_U7BibtUk=s96-c','thieny1095@gmail.com',NULL,'116673922846548058712','Google','User',1,'2026-04-28 20:28:51','2026-05-04 22:01:38'),(22,'Thiên Anh Lư trữ tài liệu',NULL,NULL,NULL,'https://lh3.googleusercontent.com/a/ACg8ocICMwDttSkW7O6W_NfiRpNw0qcK3FmhlEbdSb70wqz6Ii2A4SU=s96-c','thienanh1095@gmail.com',NULL,'117559093235588552385','Google','User',1,'2026-05-03 00:44:39','2026-05-04 15:01:46'),(23,'Lam Phương',NULL,NULL,NULL,NULL,'phanlamphuong74@gmail.com',NULL,'114324237988035019124','Google','User',1,'2026-05-03 01:15:46','2026-05-09 04:00:26'),(24,'Admin Nhu',NULL,NULL,NULL,NULL,'nhunhu@gmail.com','$2a$11$5TRWfy9PSJ8/9UAfc0EsSOmH2hs.NGXlb0hIePK3VP5yc.tpx0hwi',NULL,'Local','Admin',1,'2026-05-03 22:32:57','2026-05-15 16:22:01'),(25,'Lam Như Phan',NULL,NULL,NULL,'https://lh3.googleusercontent.com/a/ACg8ocLzP2vRvgcvexLI99t5M0syiUyUSOhpvfs8Rinm9p3ikNvoz7I=s96-c','nhuphan1095@gmail.com',NULL,'115627897205824429922','Google','User',1,'2026-05-15 16:08:52','2026-05-15 16:08:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15 16:53:50

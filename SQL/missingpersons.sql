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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
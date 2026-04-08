CREATE TABLE `reports` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReporterId` int NOT NULL,
  `TargetId` int NOT NULL,
  `TargetType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` int DEFAULT '1' COMMENT '1: Chờ xử lý, 2: Đã xử lý',
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Report_User` (`ReporterId`),
  CONSTRAINT `FK_Report_User` FOREIGN KEY (`ReporterId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
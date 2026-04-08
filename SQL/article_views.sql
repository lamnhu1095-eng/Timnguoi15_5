CREATE TABLE `article_views` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ArticleId` int NOT NULL,
  `UserId` int DEFAULT NULL,
  `IpAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ViewedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_View_Art` (`ArticleId`),
  CONSTRAINT `FK_View_Art` FOREIGN KEY (`ArticleId`) REFERENCES `articles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
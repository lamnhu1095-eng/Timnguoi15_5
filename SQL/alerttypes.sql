CREATE TABLE `alerttypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SeverityLevel` tinyint NOT NULL DEFAULT '2',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `AlertCategoryId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Type_Category` (`AlertCategoryId`),
  CONSTRAINT `FK_Type_Category` FOREIGN KEY (`AlertCategoryId`) REFERENCES `alert_categories` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
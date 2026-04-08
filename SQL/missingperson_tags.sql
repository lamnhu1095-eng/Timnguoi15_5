CREATE TABLE `missingperson_tags` (
  `MissingPersonId` int NOT NULL,
  `TagId` int NOT NULL,
  PRIMARY KEY (`MissingPersonId`,`TagId`),
  KEY `FK_TagMapping_Tag` (`TagId`),
  CONSTRAINT `FK_TagMapping_Missing` FOREIGN KEY (`MissingPersonId`) REFERENCES `missingpersons` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_TagMapping_Tag` FOREIGN KEY (`TagId`) REFERENCES `tags` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
CREATE TABLE `clues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MissingPersonId` int NOT NULL,
  `UserId` int NOT NULL,
  `Description` text NOT NULL,
  `Location` varchar(500) DEFAULT NULL,
  `ImageUrl` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Clue_Person` (`MissingPersonId`),
  KEY `FK_Clue_User` (`UserId`),
  CONSTRAINT `FK_Clue_Person` FOREIGN KEY (`MissingPersonId`) REFERENCES `missingpersons` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Clue_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
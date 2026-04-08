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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
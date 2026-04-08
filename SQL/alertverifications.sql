CREATE TABLE `alertverifications` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AlertId` int NOT NULL,
  `UserId` int NOT NULL,
  `Action` enum('Confirm','Deny') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uq_alert_user_vote` (`AlertId`,`UserId`),
  KEY `fk_verif_user` (`UserId`),
  CONSTRAINT `fk_verif_alert` FOREIGN KEY (`AlertId`) REFERENCES `securityalerts` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `fk_verif_user` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
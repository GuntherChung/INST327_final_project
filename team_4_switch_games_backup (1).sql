CREATE DATABASE  IF NOT EXISTS `switch_games` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `switch_games`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: switch_games
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `counted_series`
--

DROP TABLE IF EXISTS `counted_series`;
/*!50001 DROP VIEW IF EXISTS `counted_series`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `counted_series` AS SELECT 
 1 AS `series_name`,
 1 AS `total_games`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `esrb_model`
--

DROP TABLE IF EXISTS `esrb_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `esrb_model` (
  `esrb_rating` varchar(10) NOT NULL,
  `esrb_description` varchar(45) NOT NULL,
  PRIMARY KEY (`esrb_rating`),
  UNIQUE KEY `esrb_rating_UNIQUE` (`esrb_rating`),
  UNIQUE KEY `esrb_description_UNIQUE` (`esrb_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esrb_model`
--

LOCK TABLES `esrb_model` WRITE;
/*!40000 ALTER TABLE `esrb_model` DISABLE KEYS */;
INSERT INTO `esrb_model` VALUES ('E10+','Content is suitable for ages 10 and up.'),('T','Content is suitable for ages 13 and up.'),('M','Content is suitable for ages 17 and up.'),('E','Content is suitable for all ages.'),('RP','Rating is still pending.');
/*!40000 ALTER TABLE `esrb_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_classifications`
--

DROP TABLE IF EXISTS `game_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_classifications` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `modes_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `series_id` int NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  KEY `fk_Game Classifications_Genre1_idx` (`genre_id`),
  KEY `fk_Game Classifications_Series1_idx` (`series_id`),
  KEY `fk_Game Classifications_Games1_idx` (`game_id`),
  KEY `fk_Game Classifications_Modes1_idx` (`modes_id`),
  CONSTRAINT `fk_Game Classifications_Games1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_Game Classifications_Genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `fk_Game Classifications_Modes1` FOREIGN KEY (`modes_id`) REFERENCES `modes` (`modes_id`),
  CONSTRAINT `fk_Game Classifications_Series1` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_classifications`
--

LOCK TABLES `game_classifications` WRITE;
/*!40000 ALTER TABLE `game_classifications` DISABLE KEYS */;
INSERT INTO `game_classifications` VALUES (1,2,4,40),(2,1,1,1),(3,3,3,2),(4,3,2,40),(5,3,5,40),(6,1,6,40),(7,1,9,40),(8,3,7,3),(9,3,5,23),(10,3,8,12),(11,3,4,4),(12,3,10,5),(13,1,11,6),(14,1,12,7),(15,3,4,8),(16,3,13,9),(17,1,11,10),(18,3,14,11),(19,3,14,11),(20,3,9,40),(21,3,10,40),(22,3,15,40),(23,3,16,40),(24,3,2,12),(25,3,14,40),(26,3,7,37),(27,3,2,37),(28,3,7,37),(29,1,5,12),(30,1,3,40),(31,3,5,14),(32,3,5,15),(33,3,16,16),(34,3,13,13),(35,3,13,13),(36,3,4,17),(37,3,16,18),(38,3,8,19),(39,1,11,20),(40,1,5,21),(41,1,5,22),(42,3,7,23),(43,2,8,40),(44,3,3,40),(45,3,17,24),(46,1,5,25),(47,1,10,26),(48,3,18,27),(49,3,11,22),(50,1,11,22),(51,1,19,22),(52,3,11,22),(53,3,11,22),(54,3,11,22),(55,3,11,22),(56,3,3,40),(57,3,2,22),(58,1,14,40),(59,1,11,28),(60,1,11,29),(61,3,10,40),(62,3,16,40),(63,3,20,30),(64,1,2,37),(65,3,7,23),(66,2,7,23),(67,3,7,23),(68,3,5,23),(69,3,4,23),(70,3,2,31),(71,3,21,32),(72,3,10,38),(73,3,21,33),(74,1,22,40),(75,3,2,39),(76,3,5,40),(77,1,8,40),(78,3,8,34),(79,1,5,12),(81,3,10,40),(82,1,11,35),(83,3,7,36);
/*!40000 ALTER TABLE `game_classifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `game_name` varchar(100) NOT NULL,
  `date_released` date NOT NULL,
  `developer` varchar(45) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  UNIQUE KEY `game_name_UNIQUE` (`game_name`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'1-2-Switch','2017-03-03','Nintendo','Nintendo'),(2,'Angelique Luminarise','2021-05-20','Ruby Party','KOEI Tecmo'),(3,'Animal Crossing: New Horizons','2020-03-20','Nintendo','Nintendo'),(4,'ARMS','2017-06-16','Nintendo','Nintendo'),(5,'Astral Chain','2019-08-30','PlatinumGames','Nintendo'),(6,'Astro Duel Deluxe','2017-05-30','Panic Button','Panic Button'),(7,'Boost Beast','2017-07-20','Arzest','Arc System Works'),(8,'BoxBoy! + BoxGirl!','2019-04-26','HAL Laboratory','Nintendo'),(9,'Bowser\'s Fury','2021-02-12','Nintendo','Nintendo'),(10,'Cadence of Hyrule','2019-06-13','Brace Yourself Games','Nintendo'),(11,'Clubhouse Games: 51 Worldwide Classics','2020-06-05','Ndcube','Nintendo'),(12,'Dr. Kawashima\'s Brain Training for Nintendo Switch','2019-12-27','Nintendo','Nintendo'),(13,'Danganronpa S: Ultimate Summer Camp','2021-12-03','Spike Chunsoft','Spike Chunsoft'),(14,'Deadly Premonition 2: A Blessing in Disguise','2020-07-10','Toybox Inc.','Rising Star Games'),(15,'Disney Tsum Tsum Festival','2019-11-08','B.B. Studio','Bandai Namco Entertainment'),(16,'Fast RMX','2017-03-03','Shin\'en Multimedia','Shin\'en Multimedia'),(17,'Fire Emblem: Three Houses','2019-07-26','Intelligent Systems','Nintendo'),(18,'Fitness Boxing','2019-01-04','Imagineer','Nintendo'),(19,'Fitness Boxing 2: Rhythm & Exercise','2020-12-04','Imagineer','Nintendo'),(20,'Flip Wars','2017-07-06','Over Fence Co. Ltd.','Nintendo'),(21,'Good Job!','2020-03-26','Paladin Studios','Nintendo'),(22,'Game Builder Garage','2021-06-11','Nintendo','Nintendo'),(23,'Golf Story','2017-09-28','Sidebar Games','Sidebar Games'),(24,'Hyrule Warriors: Age of Calamity','2020-11-20','Omega Force','Nintendo'),(25,'Jump Rope Challenge','2020-06-15','Nintendo','Nintendo'),(26,'Kirby and the Forgotten Land','2022-03-25','HAL Laboratory','Nintendo'),(27,'Kirby Fighters 2','2020-09-23','HAL Laboratory','Nintendo'),(28,'Kirby Star Allies','2018-03-16','HAL Laboratory','Nintendo'),(29,'The Legend of Zelda: Link\'s Awakening','2019-09-20','Grezzo','Nintendo'),(30,'Little Friends: Dogs & Cats','2019-05-27','Imagineer','Sold Out'),(31,'Luigi\'s Mansion 3','2019-10-31','Next Level Games','Nintendo'),(32,'Mario + Rabbids Kingdom Battle','2017-08-29','Ubisoft Milan','Ubisoft'),(33,'Mario Golf: Super Rush','2021-06-25','Camelot Software Planning','Nintendo'),(34,'Mario Kart 8 Deluxe','2017-04-28','Nintendo','Nintendo'),(35,'Mario Kart Live: Home Circuit','2020-10-16','Velan Studios','Nintendo'),(36,'Mario Party Superstars','2021-10-29','NDcube','Nintendo'),(37,'Mario Tennis Aces','2018-06-22','Camelot Software Planning','Nintendo'),(38,'Marvel Ultimate Alliance 3: The Black Order','2019-07-19','Team Ninja','Nintendo'),(39,'Mercenaries Saga Chronicles','2018-02-08','Rideon','PM Studios'),(40,'Metroid Dread','2021-10-08','MercurySteam','Nintendo'),(41,'New Pokemon Snap','2021-04-30','Bandai Namco Studios','Nintendo'),(42,'New Super Mario Bros. U Deluxe','2019-01-11','Nintendo','Nintendo'),(43,'Ninjala','2020-06-24','GungHo Online Entertainment','GungHo Online Entertainment'),(44,'Nintendo Labo','2018-04-20','Nintendo','Nintendo'),(45,'Pac-Man 99','2021-04-07','Arika','Bandai Namco Entertainment'),(46,'Paper Mario: The Origami King','2020-07-17','Intelligent Systems','Nintendo'),(47,'Picross S','2017-09-28','Jupiter','Jupiter'),(48,'Pikmin 3 Deluxe','2020-10-30','Eighting','Nintendo'),(49,'Pokemon Brilliant Diamond and Shining Pearl','2021-11-19','ILCA','Nintendo'),(50,'Pokemon Legends: Arceus','2022-01-28','Game Freak','Nintendo'),(51,'Pokemon Mystery Dungeon: Rescue Team DX','2020-03-06','Spike Chunsoft','Nintendo'),(52,'Pokemon Shield','2019-11-15','Game Freak','Nintendo'),(53,'Pokemon Sword','2019-11-15','Game Freak','Nintendo'),(54,'Pokemon: Let\'s Go, Eevee!','2018-11-16','Game Freak','Nintendo'),(55,'Pokemon: Let\'s Go, Pikachu!','2018-11-16','Game Freak','Nintendo'),(56,'Pretty Princess Party','2020-12-03','Nippon Columbia','Nippon Columbia'),(57,'Pokken Tournament DX','2017-09-22','Bandai Namco','Nintendo'),(58,'Ring Fit Adventure','2019-10-18','Nintendo','Nintendo'),(59,'Rune Factory 5','2022-03-22','Hakama','Xseed Games'),(60,'Shin Megami Tensei V','2021-11-12','Atlus','Sega'),(61,'Snipperclips - Cut it out, together!','2017-03-03','SFB Games','Nintendo'),(62,'Soccer Slammers','2018-06-14','Atooi','Atooi'),(63,'Splatoon 2','2017-07-21','Nintendo','Nintendo'),(64,'Super Kirby Clash','2019-09-04','HAL Laboratory','Nintendo'),(65,'Super Mario 3D All-Stars','2020-09-18','Nintendo','Nintendo'),(66,'Super Mario Bros. 35','2020-10-01','Arika','Nintendo'),(67,'Super Mario Maker 2','2019-06-28','Nintendo','Nintendo'),(68,'Super Mario Odyssey','2017-10-27','Nintendo','Nintendo'),(69,'Super Mario Party','2018-10-05','NDcube','Nintendo'),(70,'Super Smash Bros. Ultimate','2018-12-07','Bandai Namco','Nintendo'),(71,'Taiko no Tatsujin: Drum \'n\' Fun!','2018-11-02','Bandai Namco','Bandai Namco Entertainment'),(72,'Tetris 99','2019-02-13','Arika','Nintendo'),(73,'Touhou Spell Bubble','2020-10-29','Taito','Taito'),(74,'Triangle Strategy','2022-03-04','Square Enix','Nintendo'),(75,'Ultra Street Fighter II: The Final Challengers','2017-05-26','Capcom','Capcom'),(76,'Vitamin Connection','2020-02-20','WayForward','WayForward'),(77,'Vroom in the Night Sky','2017-04-05','Poisoft','Poisoft'),(78,'WarioWare: Get It Together!','2021-09-10','Nintendo','Nintendo'),(79,'The Legend of Zelda: Breath of the Wild','2017-03-03','Nintendo','Nintendo'),(81,'The Stretchers','2019-11-08','Tarsier Studios','Nintendo'),(82,'Xenoblade Chronicles 2','2017-12-01','Monolith Soft','Nintendo'),(83,'Yoshi\'s Crafted World','2019-03-28','Good-Feel','Nintendo');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `games_developed`
--

DROP TABLE IF EXISTS `games_developed`;
/*!50001 DROP VIEW IF EXISTS `games_developed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `games_developed` AS SELECT 
 1 AS `games_developed`,
 1 AS `developer`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `general_info`
--

DROP TABLE IF EXISTS `general_info`;
/*!50001 DROP VIEW IF EXISTS `general_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `general_info` AS SELECT 
 1 AS `game_name`,
 1 AS `developer`,
 1 AS `genre_name`,
 1 AS `mode_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) NOT NULL,
  `genre_description` varchar(300) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_id_UNIQUE` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Otome','a story-based video game that is targeted towards women.'),(2,'Fighting','a video game genre that involves combat between two (or more) players.'),(3,'Simulation','generally designed to closely simulate real world activities.'),(4,'Party','games that are played at social gatherings to facilitate interaction and provide entertainment and recreation.'),(5,'Action-adventure','a video game genre that combines core elements from both the action game and adventure game genres.'),(6,'Shoot \'em up','2d shooter. a sub-genre of shooter video games,'),(7,'Platform','a video game genre and subgenre of action games in which the core objective is to move the player character between points in a rendered environment.'),(8,'Action','a video game genre that emphasizes physical challenges, including handâ€“eye coordination and reaction-time.'),(9,'Tile-matching','A tile-matching video game is a type of puzzle video game'),(10,'Puzzle','a broad genre of video games that emphasize puzzle solving.'),(11,'Role-playing','a video game genre where the player controls the actions of a character (or several party members) immersed in some well-defined world, usually involving some form of character development by way of recording statistics.'),(12,'Survival horror','a subgenre of action-adventure and horror video games that focuses on survival of the character as the game tries to frighten players with either horror graphics or scary ambience.'),(13,'Racing','a video game genre in which the player participates in a racing competition.'),(14,'Fitness','a video games that are also a form of exercise.'),(15,'Programming','a video game that incorporates elements of computer programming'),(16,'Sports','a video game that simulates the practice of sports.'),(17,'Maze','A game in which the entire playing field is a maze.'),(18,'Strategy','a major video game genre that emphasizes thinking and planning over direct instant action in order to achieve victory.'),(19,'Roguelike','a subgenre of role-playing video games characterized by a dungeon crawl.'),(20,'Shooter','a subgenre of action video games where the focus is almost entirely on the defeat of the character\'s enemies using the weapons given to the player. '),(21,'Rhythm','a genre of music-themed action video game that challenges a player\'s sense of rhythm.'),(22,'Tactical Role-playing','a video game genre that combines core elements of role-playing video games with those of tactical (turn-based or real-time) strategy video games. ');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modes`
--

DROP TABLE IF EXISTS `modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modes` (
  `modes_id` int NOT NULL AUTO_INCREMENT,
  `mode_type` varchar(45) NOT NULL,
  `mode_description` varchar(100) NOT NULL,
  PRIMARY KEY (`modes_id`),
  UNIQUE KEY `modes_id_UNIQUE` (`modes_id`),
  UNIQUE KEY `mode_type_UNIQUE` (`mode_type`),
  UNIQUE KEY `mode_description_UNIQUE` (`mode_description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modes`
--

LOCK TABLES `modes` WRITE;
/*!40000 ALTER TABLE `modes` DISABLE KEYS */;
INSERT INTO `modes` VALUES (1,'Single-player','Games where you are the only player.'),(2,'Multiplayer','Games where you can only play with others.'),(3,'Single-player, Multiplayer','Games where you can choose to play by yourself or with others.');
/*!40000 ALTER TABLE `modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rated_t_scores`
--

DROP TABLE IF EXISTS `rated_t_scores`;
/*!50001 DROP VIEW IF EXISTS `rated_t_scores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rated_t_scores` AS SELECT 
 1 AS `game_id`,
 1 AS `game_name`,
 1 AS `esrb_rating`,
 1 AS `metacritic_score`,
 1 AS `user_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `metacritic_score` int DEFAULT NULL,
  `user_score` float DEFAULT NULL,
  `esrb_rating` varchar(10) DEFAULT NULL,
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  KEY `fk_Scores_Games1_idx` (`game_id`),
  KEY `fk_Scores_ESRB Model1_idx` (`esrb_rating`),
  CONSTRAINT `fk_Scores_ESRB Model1` FOREIGN KEY (`esrb_rating`) REFERENCES `esrb_model` (`esrb_rating`),
  CONSTRAINT `fk_Scores_Games1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,58,4.8,'E10+'),(2,NULL,NULL,NULL),(3,90,5.5,'E'),(4,77,7.1,'E10+'),(5,87,8.9,'T'),(6,59,6.6,'E10+'),(7,48,5.5,'E'),(8,81,7.9,'E'),(9,89,8.7,'E'),(10,85,8,'E'),(11,82,7.8,'E'),(12,64,5.9,NULL),(13,54,7.2,'M'),(14,56,5.4,'M'),(15,63,5,'E'),(16,81,7.9,'E'),(17,89,8.7,'T'),(18,66,6.7,'T'),(19,66,6.2,'E'),(20,53,6,'T'),(21,78,7.7,'E'),(22,77,7.8,'E'),(23,78,8.2,'E'),(24,79,8.1,'T'),(25,NULL,7.4,'E'),(26,85,9,'E10+'),(27,65,7.9,'E'),(28,73,7.5,'E10+'),(29,87,8.4,'E'),(30,53,4.8,'E'),(31,86,8.5,'E'),(32,85,8.4,'E10+'),(33,70,5.6,'E'),(34,92,8.6,'E'),(35,75,7.3,'E'),(36,80,8.3,'E'),(37,75,7.1,'E'),(38,73,7.3,'T'),(39,68,7.7,'T'),(40,88,8.7,'T'),(41,79,7,'E'),(42,80,7,'E'),(43,68,6.5,'E10+'),(44,77,7,'E'),(45,76,7.9,'E'),(46,80,7,'E'),(47,67,7.4,'E'),(48,85,8.4,'E10+'),(49,NULL,6.5,'E'),(50,83,8.2,'E'),(51,68,8.2,'E'),(52,80,4.6,'E'),(53,80,4.6,'E'),(54,80,6.2,'E'),(55,79,6.1,'E'),(56,NULL,NULL,'E'),(57,79,7.6,'E10+'),(58,83,8.7,'E10+'),(59,68,6.8,'T'),(60,84,7.5,'M'),(61,80,8.2,'E'),(62,58,5.4,'E'),(63,83,8.5,'E10+'),(64,74,7.4,'E'),(65,82,6.3,'E'),(66,75,7.5,'E'),(67,88,8.5,'E'),(68,97,8.9,'E10+'),(69,76,7.2,'E'),(70,93,8.6,'E10+'),(71,78,8.1,'E'),(72,83,8.3,'E'),(73,77,6.6,'E'),(74,83,8.2,'T'),(75,66,6.6,'T'),(76,80,7.4,'E'),(77,17,3.2,'E'),(78,76,7.8,'E10+'),(79,97,8.7,'E10+'),(81,75,7.2,'E'),(82,83,8.7,'T'),(83,79,8,'E');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` int NOT NULL AUTO_INCREMENT,
  `series_name` varchar(45) NOT NULL,
  `series_description` varchar(300) NOT NULL,
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `publisher_id_UNIQUE` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Angelique','Angelique is Japanese otome game series, and a media franchise based on this game series.'),(2,'Animal Crossing','Animal Crossing is a social simulation video game series developed and published by Nintendo.'),(3,'Boxboy!','BoxBoy! is a series of puzzle-platform games developed by HAL Laboratory and published by Nintendo. The series centres around Qbby, a square-shaped character who can produce a string of connected boxes.'),(4,'Clubhouse Games','Clubhouse Games is a compilation video game developed by Agenda and published by Nintendo for the Nintendo DS, consisting of board, card, and tabletop games from around the world.'),(5,'Brain Age','Brain Age, known as Dr Kawashima\'s Brain Training in PAL regions, is a series of video games developed and published by Nintendo, based on the work of Ryuta Kawashima.'),(6,'Danganronpa','Danganronpa is a Japanese video game franchise created by Kazutaka Kodaka and developed and owned by Spike Chunsoft.'),(7,'Deadly Premonition','Deadly Premonition is an open world survival horror video game developed by Access Games.'),(8,'Disney Tsum Tsum','Disney Tsum Tsum is a puzzle game that focuses on Disney, Pixar, and Star Wars characters rendered as Tsum Tsum toys.'),(9,'Fast','Fast is a series of racing video games developed by German game developer Shin\'en Multimedia'),(10,'Fire Emblem','Fire Emblem is a fantasy tactical role-playing game franchise developed by Intelligent Systems and published by Nintendo.'),(11,'Fitness Boxing','Fitness Boxing is an exergaming video game developed by former Rocket Company members who are currently in Imagineer and published by Nintendo exclusively for the Nintendo Switch.'),(12,'The Legend of Zelda','The Legend of Zelda is a high fantasy action-adventure video game franchise created by Japanese game designers Shigeru Miyamoto and Takashi Tezuka.'),(13,'Mario Kart','Mario Kart is a series of racing games developed and published by Nintendo.'),(14,'Luigi','Luigi is a video game series of platform games and puzzle games that is a spin-off of the Mario franchise published and produced by Nintendo. The series revolves around Luigi, Mario\'s brother.'),(15,'Mario','Mario is a media franchise, published and produced by video game company Nintendo, created by Japanese game designer Shigeru Miyamoto and starring the fictional character Mario.'),(16,'Mario Golf','Mario Gold is a video game sports series and part of the Mario franchise.'),(17,'Mario Party','Mario Party is a party video game series featuring characters from the Mario franchise in which up to four local players or computer-controlled characters compete in a board game interspersed with minigames.'),(18,'Mario Tennis','Mario Tennis is a video game sports series and part of the Mario franchise.'),(19,'Marvel Ultimate Allience','Marvel Ultimate Alliance is set within the fictional Marvel Universe and features many of the superheroes, supervillains, and supporting characters that appear in publications by Marvel Comics.'),(20,'Mercenaries Saga','Mercenaries Saga Chronicles consists of a collection of the three entries in the Mercenary Saga games; Mercenaries Saga: Will of the White Lions, Mercenaries Saga 2: Order of the Silver Eagle and Mercenaries Saga 3: Gray Wolves of War.'),(21,'Metroid','Metroid is an action-adventure game franchise created by Nintendo. The player controls bounty hunter Samus Aran, who protects the galaxy from Space Pirates and other malevolent forces and their attempts to harness the power of the parasitic Metroid creatures.'),(22,'PokÃ©mon','PokÃ©mon is a series of video games developed by Game Freak and published by Nintendo and The PokÃ©mon Company under the PokÃ©mon media franchise.'),(23,'Super Mario','Super Mario is a 2D and 3D platform game series created by Nintendo based on and starring the fictional plumber Mario.'),(24,'Pac-Man','Pac-Man is a Japanese video game franchise created by Toru Iwatani but published, developed and owned by Bandai Namco Entertainment'),(25,'Paper Mario','Paper Mario is a video game series and part of the Mario franchise, developed by Intelligent Systems and produced by Nintendo. It combines elements from the role-playing, action-adventure, and puzzle genres.'),(26,'Picross S','Picross S is a series of nonogram puzzle game developed and published by Jupiter for the Nintendo Switch game console.'),(27,'Pikmin','Pikmin is a strategy and puzzle video game series created by Shigeru Miyamoto and published and owned by Nintendo.'),(28,'Rune Factory','Rune Factory is a franchise of fantasy role-playing simulation games created by Yoshifumi Hashimoto, and primarily published by Marvelous.'),(29,'Megami Tensei','Megami Tensei consists of multiple subseries and covers multiple role-playing genres including tactical role-playing, action role-playing, and massively multiplayer online role-playing.'),(30,'Splatoon','Splatoon is a third-person shooter video game franchise created by Hisashi Nogami, and developed and owned by Nintendo.'),(31,'Super Smash Bros','Super Smash Bros. is a crossover fighting game series published by Nintendo, and primarily features characters from various Nintendo franchises.'),(32,'Taiko no Tatsujin','Taiko no Tatsujin is a series of rhythm games created by Namco. In the games, players simulate playing a taiko drum in time with music.'),(33,'Touhou Project','The Touhou Project, also known simply as Touhou, is a bullet hell shoot \'em up video game series created by one-man independent Japanese doujin soft developer Team Shanghai Alice.'),(34,'Wario','Wario is a video game series, a spin-off of the Mario franchise. It comprises various video games created by Nintendo, starring the character Wario.'),(35,'Xenoblade Chronicles ','Xenoblade Chronicles is a series of action role-playing games developed by Monolith Soft and published by Nintendo.'),(36,'Yoshi','The series revolves around Yoshi, a green dinosaur character.'),(37,'Kirby','The series revolves around Kirby, a pink alien child with a big appetite.'),(38,'Tetris','TetrisÂ games involves seven differently shaped and colored blocks that fall from the top of the board.'),(39,'Street Fighter','Street FighterÂ is a long-running series of fighting games developed byÂ Capcom.'),(40,'N/A','Game does not belong to a series.');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sorted_metacritic`
--

DROP TABLE IF EXISTS `sorted_metacritic`;
/*!50001 DROP VIEW IF EXISTS `sorted_metacritic`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sorted_metacritic` AS SELECT 
 1 AS `game_name`,
 1 AS `metacritic_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sp_games`
--

DROP TABLE IF EXISTS `sp_games`;
/*!50001 DROP VIEW IF EXISTS `sp_games`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sp_games` AS SELECT 
 1 AS `game_id`,
 1 AS `game_name`,
 1 AS `date_released`,
 1 AS `mode_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `units_sold`
--

DROP TABLE IF EXISTS `units_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units_sold` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `units_sold` int DEFAULT NULL,
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  KEY `fk_Units Sold_Games1_idx` (`game_id`),
  CONSTRAINT `fk_Units Sold_Games1` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units_sold`
--

LOCK TABLES `units_sold` WRITE;
/*!40000 ALTER TABLE `units_sold` DISABLE KEYS */;
INSERT INTO `units_sold` VALUES (1,3180000),(2,12000),(3,37620000),(4,2100000),(5,1080000),(6,NULL),(7,NULL),(8,NULL),(9,5590000),(10,NULL),(11,3140000),(12,NULL),(13,5000000),(14,50000),(15,35000),(16,100000),(17,2870000),(18,900000),(19,800000),(20,NULL),(21,NULL),(22,1000000),(23,3000000),(24,4000000),(25,NULL),(26,110000),(27,41000000),(28,3150000),(29,6500000),(30,NULL),(31,3300000),(32,2000000),(33,1340000),(34,50000000),(35,1270000),(36,5430000),(37,32000000),(38,2080000),(39,NULL),(40,2740000),(41,2190000),(42,12700000),(43,240000),(44,1390000),(45,43000000),(46,3120000),(47,291000),(48,2040000),(49,13970000),(50,61000),(51,1260000),(52,23900000),(53,23900000),(54,NULL),(55,NULL),(56,NULL),(57,2130000),(58,13530000),(59,102000),(60,1000000),(61,NULL),(62,NULL),(63,17630000),(64,41070000),(65,9010000),(66,2000000),(67,7150000),(68,23000000),(69,17900000),(70,27400000),(71,1000000),(72,35840000),(73,NULL),(74,800000),(75,500000),(76,2000),(77,NULL),(78,1240000),(79,24130000),(81,NULL),(82,2050000),(83,2090000);
/*!40000 ALTER TABLE `units_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `counted_series`
--

/*!50001 DROP VIEW IF EXISTS `counted_series`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `counted_series` AS select `series`.`series_name` AS `series_name`,count(`game_classifications`.`series_id`) AS `total_games` from (`game_classifications` join `series` on((`game_classifications`.`series_id` = `series`.`series_id`))) group by `game_classifications`.`series_id` order by `total_games` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `games_developed`
--

/*!50001 DROP VIEW IF EXISTS `games_developed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `games_developed` AS select count(`games`.`game_id`) AS `games_developed`,`games`.`developer` AS `developer` from `games` group by `games`.`developer` order by `games_developed` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `general_info`
--

/*!50001 DROP VIEW IF EXISTS `general_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `general_info` AS select `games`.`game_name` AS `game_name`,`games`.`developer` AS `developer`,`genre`.`genre_name` AS `genre_name`,`modes`.`mode_type` AS `mode_type` from (((`games` join `game_classifications` on((`games`.`game_id` = `game_classifications`.`game_id`))) join `genre` on((`game_classifications`.`genre_id` = `genre`.`genre_id`))) join `modes` on((`game_classifications`.`modes_id` = `modes`.`modes_id`))) order by `games`.`game_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rated_t_scores`
--

/*!50001 DROP VIEW IF EXISTS `rated_t_scores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rated_t_scores` AS select `ratings`.`game_id` AS `game_id`,`games`.`game_name` AS `game_name`,`ratings`.`esrb_rating` AS `esrb_rating`,`ratings`.`metacritic_score` AS `metacritic_score`,`ratings`.`user_score` AS `user_score` from (`ratings` join `games` on((`ratings`.`game_id` = `games`.`game_id`))) where `ratings`.`game_id` in (select `ratings`.`game_id` from `ratings` where (`ratings`.`esrb_rating` = 'T')) order by `ratings`.`game_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sorted_metacritic`
--

/*!50001 DROP VIEW IF EXISTS `sorted_metacritic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sorted_metacritic` AS select `games`.`game_name` AS `game_name`,`ratings`.`metacritic_score` AS `metacritic_score` from (`games` join `ratings` on((`games`.`game_id` = `ratings`.`game_id`))) where (`ratings`.`metacritic_score` is not null) order by `ratings`.`metacritic_score` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sp_games`
--

/*!50001 DROP VIEW IF EXISTS `sp_games`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sp_games` AS select `game_classifications`.`game_id` AS `game_id`,`games`.`game_name` AS `game_name`,`games`.`date_released` AS `date_released`,`modes`.`mode_type` AS `mode_type` from ((`modes` join `game_classifications` on((`modes`.`modes_id` = `game_classifications`.`modes_id`))) join `games` on((`game_classifications`.`game_id` = `games`.`game_id`))) where (`modes`.`modes_id` = 1) order by `games`.`date_released` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10 16:44:48

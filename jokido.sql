-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jokido
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yomeujeaqtgtegobkffawoaotoejgwplvctf` (`ownerId`),
  CONSTRAINT `fk_mrtzylbrkondbpxpjkipyfikykddjbaooncr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yomeujeaqtgtegobkffawoaotoejgwplvctf` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jofyqgrfhlcyjyecemllhitxyzlxiwsziwik` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_oyezstafoscvqcrnblsfewstzwqerrsejows` (`dateRead`),
  KEY `fk_tocyxzkrwdrbdiyumpwkbftkejetdtlmgqfw` (`pluginId`),
  CONSTRAINT `fk_tocyxzkrwdrbdiyumpwkbftkejetdtlmgqfw` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vfajousqzsmbopfxwwodngijbfkdohjghxjo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jvcwyblltgyywyiujdcrsztiwabbsfzkskpl` (`sessionId`,`volumeId`),
  KEY `idx_fhtjlktgriarpyynaunsrrchzttoqhgvztbg` (`volumeId`),
  CONSTRAINT `fk_jwaxocdqjlonfgglaanbplolhormqgckfmjl` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sqqgckpkazlsxnnnxhunmmwscfwozvofxlwc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jmdsqryncvnlfeewoazzjlakdphxziumqbdo` (`filename`,`folderId`),
  KEY `idx_hvgnqqfqubgahhmanbeiyymuzwdgsuywnejk` (`folderId`),
  KEY `idx_pifdkjznktkytujbzitryiriwzutpfhugaqz` (`volumeId`),
  KEY `fk_bjtqlvkfczxhzkzrnkvnuezmegvxqjiocwgy` (`uploaderId`),
  CONSTRAINT `fk_bjtqlvkfczxhzkzrnkvnuezmegvxqjiocwgy` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_bwmulxqhcedrzgcodrqkvsstghxbutmvjalj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mmbsgljyybaxlwqcjomhemoobebbhtgztrvn` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tmtyegkfhpkhjybxultgywgalxhtpsrgtumg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (12,1,1,1,'logo.png','image',NULL,706,706,184653,NULL,NULL,NULL,'2023-09-13 11:40:14','2023-09-13 11:40:14','2023-09-13 11:40:14');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ixskbbngvjttpmohxvlqtdqryslgniqvkcwh` (`groupId`),
  KEY `fk_vplquridcptkatvljbwdtvtxoitaubecowxu` (`parentId`),
  CONSTRAINT `fk_abogwtrgebfoskeniyymoxlrsxxangszgdbu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_njbckrifwviyqzwsvfayacfvsbknhhoedpmb` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vplquridcptkatvljbwdtvtxoitaubecowxu` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fvqtidbygtvwdiiqgrdvtrmcxsvdtpqmidip` (`name`),
  KEY `idx_npoxzfvfurfbrfezwbyokgjgztaxggkzmilr` (`handle`),
  KEY `idx_tcwbhvhhptuunzmrjuqkpiaesucpwzpllwve` (`structureId`),
  KEY `idx_ihvrxnufuhgvqsnadtqvtjycwjcgfkyzukdx` (`fieldLayoutId`),
  KEY `idx_dxsufemhfnqlunjqmbtjlvdhmijgfepwkmcu` (`dateDeleted`),
  CONSTRAINT `fk_gvmavcacldtxukzybwmnwwjaohicluqwcxoz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iaxpmeqxdkfpxgftiupzttolmqnylfdmyjkh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_doaxlysjsiuuwzvxhqaxxvltsulravptuhnj` (`groupId`,`siteId`),
  KEY `idx_sbtenhmjgcfqychnhcbfobucbmggkjbglfhm` (`siteId`),
  CONSTRAINT `fk_ewteahjavhthaizcjtgiloyquxpsyesvcfsd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mqhnzlqmqnemvojyshwrmstgeeentemjcsyg` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_qzkzmoigrzbzhvvmhdzatmnhskbkhxbvexjh` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_rspfchlewyudluotaqnslxzmbtavwvbpktcp` (`siteId`),
  KEY `fk_rpimidimsekezodblunvgrortdngiygamkdg` (`userId`),
  CONSTRAINT `fk_bkyurmozgeclfqxegdzqjoxhirtjfvqxtmul` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rpimidimsekezodblunvgrortdngiygamkdg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_rspfchlewyudluotaqnslxzmbtavwvbpktcp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (1,1,'fullName','2023-09-13 11:38:39',0,1),(3,1,'uri','2023-09-13 11:06:49',0,1),(4,1,'uri','2023-09-13 11:06:49',0,1),(5,1,'uri','2023-09-13 11:06:49',0,1),(6,1,'uri','2023-09-13 11:06:49',0,1),(7,1,'uri','2023-09-13 11:06:49',0,1),(8,1,'uri','2023-09-13 11:06:49',0,1),(9,1,'uri','2023-09-13 11:06:49',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_zuoqagsqrhzgobkajqjslmvuvouglohhthyf` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zngrvhxrpdameslqbxgpfernvutjcdalxulz` (`siteId`),
  KEY `fk_tfqynovnvsekghxoimabzgjsfhrjawurhytz` (`fieldId`),
  KEY `fk_jbzysvjvvfojfjabktypvwmnziheyzbqhvld` (`userId`),
  CONSTRAINT `fk_jbzysvjvvfojfjabktypvwmnziheyzbqhvld` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tfqynovnvsekghxoimabzgjsfhrjawurhytz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xikxqulkodgbaejaunnbuudfxmrnytajlitg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zngrvhxrpdameslqbxgpfernvutjcdalxulz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_heroTitle_aeuodnmz` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ervzyobkbrdehjdqrkzrvipszjfldhjuxodt` (`elementId`,`siteId`),
  KEY `idx_omhjsdbfvyofdrroojemyyprmewnlfvtkogz` (`siteId`),
  KEY `idx_njyktzjhxacypdopwvwykhmnlqntmtcduudc` (`title`),
  CONSTRAINT `fk_fwphxjkxigixdkxtuojmmilgdrfvbzdlvsag` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kkriohiucgvbujujbzzclyfrfandcetdllge` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-09-13 09:01:49','2023-09-13 11:38:39','695e58da-0a20-4258-9f41-41003ed170a3',NULL),(2,2,1,NULL,'2023-09-13 09:39:33','2023-09-13 09:39:33','edea13a2-ffb3-4ff7-8791-7e221fcf6f43',NULL),(3,3,1,'Homepage','2023-09-13 09:41:15','2023-09-13 11:06:49','dcf4117f-39eb-4d7a-9b25-50b68e95a90a',NULL),(4,4,1,'Homepage','2023-09-13 09:41:15','2023-09-13 11:06:49','184ca45e-7ca5-4d93-a123-c4c59f23b564',NULL),(5,5,1,'Homepage','2023-09-13 09:41:15','2023-09-13 11:06:49','b1593d5b-d3a8-45d7-90ed-be8483a6ba4a',NULL),(6,6,1,'Homepage','2023-09-13 09:41:15','2023-09-13 11:06:49','fbaac54c-f076-4f6d-bbad-041b5cc7d5b1',NULL),(7,7,1,'Homepage','2023-09-13 11:06:07','2023-09-13 11:06:49','a3874c27-fc84-42d8-9076-e783bbe798ae',NULL),(8,8,1,'Homepage','2023-09-13 11:06:07','2023-09-13 11:06:49','3015ce47-59f4-46ae-8c4e-1e74bf055163',NULL),(9,9,1,'Homepage','2023-09-13 11:06:07','2023-09-13 11:06:49','b1ebb0b6-d951-4ea9-86cf-aafd3bb94636',NULL),(10,10,1,'Homepage','2023-09-13 11:06:49','2023-09-13 11:06:49','efa357e4-0485-4812-84c9-874edd61ac91',NULL),(11,11,1,'Homepage','2023-09-13 11:06:49','2023-09-13 11:06:49','e600cc75-c656-4593-bf3a-d47d9b318500',NULL),(12,12,1,'Logo','2023-09-13 11:40:13','2023-09-13 11:40:13','8e7ec1ca-616e-46ad-89be-846bd89db151',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_prbgfuncufpsrleuyosmnneuumfxqdwscxhr` (`userId`),
  CONSTRAINT `fk_prbgfuncufpsrleuyosmnneuumfxqdwscxhr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wkvnkcygnrnwzivhqsccuisztqwosijjcbnt` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_dwkvtpifrimsscbxpdokwppfmpeohiombbrq` (`creatorId`,`provisional`),
  KEY `idx_ldxjwcvwfrkxhdmogxgzjrfzduqqvrpsrfhb` (`saved`),
  KEY `fk_jyylzrqrexcvctmttuayxwonwpthbrfwpxrt` (`canonicalId`),
  CONSTRAINT `fk_fzvodmcwrwdkcehdcwqlhojzqtjjekbndgdi` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jyylzrqrexcvctmttuayxwonwpthbrfwpxrt` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_fjukgvfjigkxutixroqqjiwpbdzcikjjbakc` (`elementId`,`timestamp`,`userId`),
  KEY `fk_fdctwknwisuzdfqazwdcoetrqdchqznbcybm` (`userId`),
  KEY `fk_lpdfcertuxtppmeuryfheituctuogojjnwty` (`siteId`),
  KEY `fk_tbfgwzdxdpcxvfuwmjkxephfpzisxqfaecpn` (`draftId`),
  CONSTRAINT `fk_fdctwknwisuzdfqazwdcoetrqdchqznbcybm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lpdfcertuxtppmeuryfheituctuogojjnwty` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tbfgwzdxdpcxvfuwmjkxephfpzisxqfaecpn` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vyxwyqhuezhclxoaxqwsxjtyifdyozdddqzk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qhlqbomkvxdxnosmamewvxafjjvqehststsb` (`dateDeleted`),
  KEY `idx_ofrintxyzrgmsackroridejfvvsorlbsabbd` (`fieldLayoutId`),
  KEY `idx_ootzsdpbtwrnhowhjbpkwnpagkziletjbkov` (`type`),
  KEY `idx_eibtkbttphsdchdfrufefrrdvhsaydbbxnro` (`enabled`),
  KEY `idx_ssgmbhslsucyyrewlqytozqptsyssrwqhwms` (`canonicalId`),
  KEY `idx_qtsbzisayrngdrynxwuzffbwckfxiuugveom` (`archived`,`dateCreated`),
  KEY `idx_ttrqncdcbrnwjlvgrebodnptjfqudipxjsti` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_czkasonpzpfbijdzmfdksusevsboxdiqmtuf` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_qiminrkagugavzhwukogkdkpvnrbgjjxpntf` (`draftId`),
  KEY `fk_yyocleoyaqlbvjpjikgqvsuclnzztdbdehaz` (`revisionId`),
  CONSTRAINT `fk_hcfgikktvvkuzmjhdrqjmlshdgsuntqhsfhh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_iciakbhixpviiosndaumndudbfuwqchmlada` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qiminrkagugavzhwukogkdkpvnrbgjjxpntf` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyocleoyaqlbvjpjikgqvsuclnzztdbdehaz` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-09-13 09:01:49','2023-09-13 11:38:39',NULL,NULL,'a3c9ee94-c149-4a94-b4b3-27164896d653'),(2,NULL,NULL,NULL,NULL,'craft\\elements\\GlobalSet',1,0,'2023-09-13 09:39:33','2023-09-13 09:39:33',NULL,NULL,'bad5d7b3-7ad2-4f90-b319-afaf265b24c7'),(3,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-09-13 09:41:15','2023-09-13 11:06:49',NULL,NULL,'50ff4bee-fcef-4367-bc1a-fae2c8fb1fc6'),(4,3,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-09-13 09:41:15','2023-09-13 09:41:15',NULL,NULL,'2207ba33-230e-4d6c-8d45-bda73675e81a'),(5,3,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-09-13 09:41:15','2023-09-13 09:41:15',NULL,NULL,'c234c8ec-cec4-4138-be8a-5c4993581598'),(6,3,NULL,3,1,'craft\\elements\\Entry',1,0,'2023-09-13 09:41:15','2023-09-13 09:41:15',NULL,NULL,'5869cd99-53bd-4491-85f5-574040308093'),(7,3,NULL,4,1,'craft\\elements\\Entry',1,0,'2023-09-13 11:06:07','2023-09-13 11:06:07',NULL,NULL,'e7ed1de3-8374-4685-8043-7b92fbe23bbc'),(8,3,NULL,5,1,'craft\\elements\\Entry',1,0,'2023-09-13 11:06:07','2023-09-13 11:06:07',NULL,NULL,'511fb5fa-9ccd-442b-b923-4f1a3b51823b'),(9,3,NULL,6,1,'craft\\elements\\Entry',1,0,'2023-09-13 11:06:07','2023-09-13 11:06:07',NULL,NULL,'1c4c2b9e-4977-4f45-a376-e982bbc2cded'),(10,3,NULL,7,1,'craft\\elements\\Entry',1,0,'2023-09-13 11:06:49','2023-09-13 11:06:49',NULL,NULL,'8a241dad-4f34-495f-8f02-522d041f6d3a'),(11,3,NULL,8,1,'craft\\elements\\Entry',1,0,'2023-09-13 11:06:49','2023-09-13 11:06:49',NULL,NULL,'8c39ec34-341b-43bb-9513-04ac2327fc48'),(12,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-09-13 11:40:13','2023-09-13 11:40:13',NULL,NULL,'ab97d7ba-05be-4ad8-bd08-47cee4ac1949');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dmesjnrxeskmrgkexjkbguwarwujiocyzfft` (`elementId`,`siteId`),
  KEY `idx_gxscvprjnpwkskoynvusloputniwkwgzbrwk` (`siteId`),
  KEY `idx_ysoujpaskgqlgzyuezkntsgmqlzrhouilwck` (`slug`,`siteId`),
  KEY `idx_igoslopspfmhjerjkusfottkdjeeugxrvnnz` (`enabled`),
  KEY `idx_uaprkyrqitsoesjhllakwbaaqqrujwmbgcsc` (`uri`,`siteId`),
  CONSTRAINT `fk_dmwitgosyldszytsoociiimmgddcrirzmacp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnackbbxwqnhbzsbppqsggipxlprncbpedfn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-09-13 09:01:49','2023-09-13 09:01:49','254b72a3-4680-4741-80cf-e54eaeeba3b1'),(2,2,1,NULL,NULL,1,'2023-09-13 09:39:33','2023-09-13 09:39:33','ae22f265-2d25-468a-98c7-bc3ce385db13'),(3,3,1,'homepage','__home__',1,'2023-09-13 09:41:15','2023-09-13 11:06:49','e3ae1e93-ddb9-4c88-befc-8281839fb408'),(4,4,1,'homepage','__home__',1,'2023-09-13 09:41:15','2023-09-13 11:06:49','62d57899-8e4c-40e3-9b6e-d61667d2fa22'),(5,5,1,'homepage','__home__',1,'2023-09-13 09:41:15','2023-09-13 11:06:49','f2f8a0f7-9d16-4b2c-a3fa-377fbb219705'),(6,6,1,'homepage','__home__',1,'2023-09-13 09:41:15','2023-09-13 11:06:49','684f52ef-1197-4dbb-95d5-1238b7364181'),(7,7,1,'homepage','__home__',1,'2023-09-13 11:06:07','2023-09-13 11:06:49','c8e0f567-6a73-4b8e-baaa-ca4241857499'),(8,8,1,'homepage','__home__',1,'2023-09-13 11:06:07','2023-09-13 11:06:49','57898b08-fda7-452c-af0d-f0418a5c81e2'),(9,9,1,'homepage','__home__',1,'2023-09-13 11:06:07','2023-09-13 11:06:49','85f1111a-31f1-461d-8e7c-ef7daba14592'),(10,10,1,'homepage','__home__',1,'2023-09-13 11:06:49','2023-09-13 11:06:49','91913a57-c70a-47a6-b83e-7ff29dddbcb8'),(11,11,1,'homepage','__home__',1,'2023-09-13 11:06:49','2023-09-13 11:06:49','85332a8f-b8ed-47fa-a4e1-4eb46e91b52f'),(12,12,1,NULL,NULL,1,'2023-09-13 11:40:13','2023-09-13 11:40:13','0180efcd-5949-4087-ae88-f2b4a4365173');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bmffligukixamopasytxqpeimikbrnxknvzz` (`postDate`),
  KEY `idx_beuwiwaabpsfiythpxkctitpqhrfrnaoimlv` (`expiryDate`),
  KEY `idx_nfkevhsnunhpopvqcghhgfimodwfxwnnmfas` (`authorId`),
  KEY `idx_ntcivddikxiiisaceedeuxasqgvirhtlutgs` (`sectionId`),
  KEY `idx_hkzustrsabbjiohmxjjlpaimuzpbqzftkkbn` (`typeId`),
  KEY `fk_dvodmolkishsragsbtafiisxlufppudohdwl` (`parentId`),
  CONSTRAINT `fk_asgpgnjljgonntygujkfdzhwvxxvejffpvyx` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dvodmolkishsragsbtafiisxlufppudohdwl` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_idezwgmvgrvdjpjpteozrreyfrkaficwrruh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_leuucwhkfoctiuzrrxvxkonykrfkhvibjnsn` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ltdtiavwbtfcycundrwolchkamlszxhabhya` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (3,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 09:41:15','2023-09-13 09:41:15'),(4,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 09:41:15','2023-09-13 09:41:15'),(5,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 09:41:15','2023-09-13 09:41:15'),(6,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 09:41:15','2023-09-13 09:41:15'),(7,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 11:06:07','2023-09-13 11:06:07'),(8,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 11:06:07','2023-09-13 11:06:07'),(9,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 11:06:07','2023-09-13 11:06:07'),(10,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 11:06:49','2023-09-13 11:06:49'),(11,1,NULL,1,NULL,'2023-09-13 09:41:00',NULL,NULL,'2023-09-13 11:06:49','2023-09-13 11:06:49');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qxogeverduvznpuujkhqewygjhepabblsfhh` (`name`,`sectionId`),
  KEY `idx_sjotuzkzejgsvcdosebbpexyifmwflvbuyav` (`handle`,`sectionId`),
  KEY `idx_grhwlvnmllzchoyvqdxdtgtldssytdyfgcqz` (`sectionId`),
  KEY `idx_ozixbkoirpvedrqnuinsjgxuoqongtgiamnx` (`fieldLayoutId`),
  KEY `idx_fwddtiefdoilhwlunqxnrsbzacjfvylmxxby` (`dateDeleted`),
  CONSTRAINT `fk_fswlhdroceeqetlubrxhtubsiuvyyytkktkz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_szqkdywckdbgbqswdhrztthzunmqvqrbtwnk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',1,'site',NULL,NULL,'site',NULL,1,1,'2023-09-13 09:40:29','2023-09-13 11:06:07',NULL,'7f6521f6-c89b-4510-afa9-adce0f67f81e');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kuzmwriqbajbvwgtgyuadtlmgnpirchvhtvh` (`name`),
  KEY `idx_trzluqlkixyekfnlodbzshjgjzpafthpvror` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-09-13 09:01:49','2023-09-13 09:01:49',NULL,'1eea3746-ea4f-453f-8444-636d86fc8576'),(2,'Homepage','2023-09-13 11:25:39','2023-09-13 11:25:39',NULL,'094060d6-9a31-40f7-a077-278d10193d0d');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ctahqtnyeawlatgedeguelxwfjykudsfsoyt` (`layoutId`,`fieldId`),
  KEY `idx_cwwdgnyywjakzhhtrbsvtfaycatzitcrmgze` (`sortOrder`),
  KEY `idx_nndaxxlpcbzllonkxfndfjnfngxqwdjisdlq` (`tabId`),
  KEY `idx_jamwshxltybxcdzlomcnjdglrmqlrjwrndcy` (`fieldId`),
  CONSTRAINT `fk_amsvyrocciayuhzmmezdjrddcloqqxpqfeck` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkwbqwrqttwbdszwwfvitexqmehohaksiijy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mijtzldvnxpthnqqqxypzrbztknrcmhizjhx` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hcofpghewdwmcuaokwdybvzbcwrzbojoznfe` (`dateDeleted`),
  KEY `idx_tvzazffnifcjynscaubklpvficffvmmhwjua` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-09-13 09:40:29','2023-09-13 09:40:29',NULL,'d496e428-f29e-49bd-af93-715743ceb513'),(2,'craft\\elements\\Asset','2023-09-13 11:25:13','2023-09-13 11:25:13',NULL,'8301e109-0dbf-44c4-9e8c-5ca64d2ae504');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wwkbwabrmllfihcujwushxevsfrsrgasebvw` (`sortOrder`),
  KEY `idx_aolrtbbiokswygosecmcwvzrnphiqjmysclb` (`layoutId`),
  CONSTRAINT `fk_syfrzgfhdwhyokntkxlfaxwxtrntjvwqaynn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (3,1,'Inhoud','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"fda7fd31-7800-433a-b455-1f3a509957e8\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-09-13 11:06:07','2023-09-13 11:06:07','22fd9e3f-f5aa-4b05-9dc8-d3454a525bd1'),(4,2,'Inhoud','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"97a6c797-f1d5-4e5b-a888-db0c0af18d68\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-09-13 11:25:13','2023-09-13 11:25:13','2531e26e-8996-4140-acfb-d0ff168f29e5');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_podnordhhlnzahtlwrhcxpoxuagowcvibtla` (`handle`,`context`),
  KEY `idx_pxulqxsdyuyfuiiqhmbfgrtnjdyvpkxkpwbf` (`groupId`),
  KEY `idx_qddujspnhtxpsimweuwomngpgsgtmmfrmlii` (`context`),
  CONSTRAINT `fk_odialvcjavmfpftwvegfyylffgozlnrbzmej` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,2,'Hero Title','heroTitle','global','aeuodnmz',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-09-13 11:25:51','2023-09-13 11:25:51','927209b4-6136-43b6-889f-388be3e85cbf');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_okhlkdqsfehmivxtrpftsfpmkeorsqjfhsvx` (`name`),
  KEY `idx_njivqqpxdaocsdzafergemusibbnqtpvfvkb` (`handle`),
  KEY `idx_chzdfvtkfbcllmwwqoviylqjoepqbbnjubim` (`fieldLayoutId`),
  KEY `idx_vyoqufaxryueqipzjxpjkosfdoipivnpvtso` (`sortOrder`),
  CONSTRAINT `fk_bkefaitnvjgzzrryotqdzqadnzvilhqryork` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_etrmtslzevdmvwbrsnjbtijoanqgjkwmkeky` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (2,'Home','home',NULL,1,'2023-09-13 09:39:33','2023-09-13 09:39:33','19797ed3-eb56-48d3-b932-ccc68cc23cb3');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_glctvxisyzmqdbfftshtbvocdxmqvtxnmxtr` (`accessToken`),
  UNIQUE KEY `idx_nqixabayxzphbohynfwahhugiqltzoebhzid` (`name`),
  KEY `fk_nuyrdrfxziftkwqrpuidmlliqksoymlnmgxm` (`schemaId`),
  CONSTRAINT `fk_nuyrdrfxziftkwqrpuidmlliqksoymlnmgxm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rvpfbwyzpxjldpjsirptqxebhptybxspmttt` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xyefroxlwulgqeomrzmjfvbsjvxiedccofom` (`name`),
  KEY `idx_zowxcdiclpzmgwrydgpgmqgdsuetqzzxefmu` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.5.4','4.5.3.0',0,'wibqjftgubjv','3@fhkcliwzcu','2023-09-13 09:01:49','2023-09-13 11:35:33','803c33d9-8789-4e2f-b99a-b518c0d147dd');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ejcwithcoqtmnchnagyejorkdeaunadaoavs` (`primaryOwnerId`),
  KEY `idx_pghlzmlwlmraafuoxnejkgjxtxuiwytlwqdf` (`fieldId`),
  KEY `idx_ppkwmftrlrjhzomydpjcnpnlupotufilbcff` (`typeId`),
  CONSTRAINT `fk_bxanfgjlrjlxgfmspshzzujqbsdztvjqwslk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_humbbpqhzkttketfohtixdlkzojotcjymdrv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jfcczfyxsoronoisrbkyjajvxxxldsykscsq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rngibxosktshzrlqmahprcqgnpqmcittxgxu` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_fnrapzcthbeknidmfpybhdravtqwxbznsdxr` (`ownerId`),
  CONSTRAINT `fk_aulznqnthauxfowwrurcexogigiavdupiula` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fnrapzcthbeknidmfpybhdravtqwxbznsdxr` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jsirtgmoxfcbmdiwepihzhdkfvppzdzdeihj` (`name`,`fieldId`),
  KEY `idx_mknpkubhosbpzzvrvzzwdoullropeslpvnqj` (`handle`,`fieldId`),
  KEY `idx_uzbqgdgwfwffozquztckxdzyamgtlcdpypkp` (`fieldId`),
  KEY `idx_dnsezbywmaxhltposwsvypuzodjicagfqafo` (`fieldLayoutId`),
  CONSTRAINT `fk_ipmgvunplrsfmrbvvxprvwaqrlkdtbmymctg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_msiikmmothfvhfmtajployabbdjbqqvnieti` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_abvrvmwqkwanuikfomebquhpyvqkgidrfvkn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','55f8f684-3833-40c1-b2e2-b3f3f2d40f5b'),(2,'craft','m210121_145800_asset_indexing_changes','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','794ac968-a023-4820-a31c-cf8ad2252479'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','49b91614-f6ed-4e17-8100-325145160997'),(4,'craft','m210724_180756_rename_source_cols','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','90b5072b-7d28-4aa3-b542-6ebde37f06cd'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','83244db9-4e0e-45eb-906e-c10502e0e1aa'),(6,'craft','m210817_014201_universal_users','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','528ee315-60dd-4fde-b77a-5b33cbe66658'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','e7c20ee6-693a-4235-bfd1-a7b14974ab5f'),(8,'craft','m211115_135500_image_transformers','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','84a49330-73d5-457d-b00c-e29420b38fc6'),(9,'craft','m211201_131000_filesystems','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','31111111-9e16-4a60-a75a-41bd080351cd'),(10,'craft','m220103_043103_tab_conditions','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','53389cd4-3db8-45ac-977c-7b5dd1dcf620'),(11,'craft','m220104_003433_asset_alt_text','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','1a4ad438-82d8-4581-8491-54c83cb4c88e'),(12,'craft','m220123_213619_update_permissions','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','92326b97-929e-49fb-90ed-4666f6089884'),(13,'craft','m220126_003432_addresses','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','d8078cb4-e8dc-4a94-bce4-929e6c55e8dd'),(14,'craft','m220209_095604_add_indexes','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','450a80ee-d869-463a-9fea-e7be04174f5b'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','fdbafd02-894b-4cdf-b481-7be76e366663'),(16,'craft','m220214_000000_truncate_sessions','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','612a6a48-2381-4da2-88b1-f2a44e641be5'),(17,'craft','m220222_122159_full_names','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','3470180c-8bc6-413f-863c-8c905385057a'),(18,'craft','m220223_180559_nullable_address_owner','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','53d1671b-b5df-4928-a0e7-a911a4f1ec0d'),(19,'craft','m220225_165000_transform_filesystems','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','ae648160-dcc1-4577-8abb-754959bdac37'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','2b8e6ddc-4dcf-419a-907f-1aa9825287be'),(21,'craft','m220314_211928_field_layout_element_uids','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','014f5ba9-9024-4485-a161-772d4a4ea4df'),(22,'craft','m220316_123800_transform_fs_subpath','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','16b3674c-899b-419b-a8ba-372311e02988'),(23,'craft','m220317_174250_release_all_jobs','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','e67f02ef-7cc8-4e26-84da-d096d40ef201'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','f2444167-3f8a-4083-b76c-1b0a0a3ac2ef'),(25,'craft','m220413_024536_site_enabled_string','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','7728d412-9f66-4b27-abac-7a396e9333e7'),(26,'craft','m221027_160703_add_image_transform_fill','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','9645e1f8-d31b-4b9e-8c0a-49b2ce39ec7e'),(27,'craft','m221028_130548_add_canonical_id_index','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','7a42ba6f-feb6-4827-a0bb-1f0eb8519e87'),(28,'craft','m221118_003031_drop_element_fks','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','270ea466-2f46-45df-bffd-6f82db323671'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','d71ce72b-d1fb-41f3-9ba9-5326c211da18'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','da135d92-065d-4e99-9952-a70c3237a963'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','eace8c22-e69b-4b50-bc6c-a8e1e2b6e510'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','8002b4ce-3ce4-42be-987f-55276bb79fc8'),(33,'craft','m230710_162700_element_activity','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','d9d65d51-c82f-46cb-871e-ac88af197e03'),(34,'craft','m230820_162023_fix_cache_id_type','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','e49e3825-c8e3-48e7-a26a-b10547fddf96'),(35,'craft','m230826_094050_fix_session_id_type','2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 09:01:50','0d204ea9-f399-4c08-80e3-ef43fa8af8f0');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xcpvbonyafrhidfbgzslxvlnumqlqwnozluc` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1694604933'),('email.fromEmail','\"jokido@jbjokido.be\"'),('email.fromName','\"Jokido\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elementCondition','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.autocomplete','false'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.autocorrect','true'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.class','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.disabled','false'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.elementCondition','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.id','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.instructions','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.label','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.max','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.min','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.name','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.orientation','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.placeholder','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.readonly','false'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.requirable','false'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.size','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.step','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.tip','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.title','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.uid','\"fda7fd31-7800-433a-b455-1f3a509957e8\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.userCondition','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.warning','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.elements.0.width','100'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.name','\"Inhoud\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.uid','\"22fd9e3f-f5aa-4b05-9dc8-d3454a525bd1\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.fieldLayouts.d496e428-f29e-49bd-af93-715743ceb513.tabs.0.userCondition','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.handle','\"home\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.hasTitleField','true'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.name','\"Home\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.section','\"10996d6a-066c-4e8f-9151-07a4d512d294\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.showStatusField','true'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.slugTranslationKeyFormat','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.slugTranslationMethod','\"site\"'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.sortOrder','1'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.titleFormat','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.titleTranslationKeyFormat','null'),('entryTypes.7f6521f6-c89b-4510-afa9-adce0f67f81e.titleTranslationMethod','\"site\"'),('fieldGroups.094060d6-9a31-40f7-a077-278d10193d0d.name','\"Homepage\"'),('fieldGroups.1eea3746-ea4f-453f-8444-636d86fc8576.name','\"Common\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.columnSuffix','\"aeuodnmz\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.contentColumnType','\"text\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.fieldGroup','\"094060d6-9a31-40f7-a077-278d10193d0d\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.handle','\"heroTitle\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.instructions','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.name','\"Hero Title\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.searchable','false'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.byteLimit','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.charLimit','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.code','false'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.columnType','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.initialRows','4'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.multiline','false'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.placeholder','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.settings.uiMode','\"normal\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.translationKeyFormat','null'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.translationMethod','\"none\"'),('fields.927209b4-6136-43b6-889f-388be3e85cbf.type','\"craft\\\\fields\\\\PlainText\"'),('fs.uploads.hasUrls','true'),('fs.uploads.name','\"Uploads\"'),('fs.uploads.settings.path','\"$ASSETS_BASE_PATH\"'),('fs.uploads.type','\"craft\\\\fs\\\\Local\"'),('fs.uploads.url','\"$ASSETS_BASE_URL\"'),('globalSets.19797ed3-eb56-48d3-b932-ccc68cc23cb3.handle','\"home\"'),('globalSets.19797ed3-eb56-48d3-b932-ccc68cc23cb3.name','\"Home\"'),('globalSets.19797ed3-eb56-48d3-b932-ccc68cc23cb3.sortOrder','1'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.094060d6-9a31-40f7-a077-278d10193d0d','\"Homepage\"'),('meta.__names__.10996d6a-066c-4e8f-9151-07a4d512d294','\"Home\"'),('meta.__names__.19797ed3-eb56-48d3-b932-ccc68cc23cb3','\"Home\"'),('meta.__names__.1eea3746-ea4f-453f-8444-636d86fc8576','\"Common\"'),('meta.__names__.6594f204-05cd-41a0-a20a-26e1e2c46157','\"Jokido\"'),('meta.__names__.7f6521f6-c89b-4510-afa9-adce0f67f81e','\"Home\"'),('meta.__names__.927209b4-6136-43b6-889f-388be3e85cbf','\"Hero Title\"'),('meta.__names__.bd1e2832-cdcd-433c-98d5-de4b648a9218','\"Uploads\"'),('meta.__names__.e720509c-a7f5-4364-88f9-03cae61b365b','\"Jokido\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.defaultPlacement','\"end\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.enableVersioning','true'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.handle','\"home\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.name','\"Home\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.propagationMethod','\"all\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.siteSettings.e720509c-a7f5-4364-88f9-03cae61b365b.enabledByDefault','true'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.siteSettings.e720509c-a7f5-4364-88f9-03cae61b365b.hasUrls','true'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.siteSettings.e720509c-a7f5-4364-88f9-03cae61b365b.template','\"home.twig\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.siteSettings.e720509c-a7f5-4364-88f9-03cae61b365b.uriFormat','\"__home__\"'),('sections.10996d6a-066c-4e8f-9151-07a4d512d294.type','\"single\"'),('siteGroups.6594f204-05cd-41a0-a20a-26e1e2c46157.name','\"Jokido\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.enabled','true'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.handle','\"default\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.hasUrls','true'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.language','\"en\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.name','\"Jokido\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.primary','true'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.siteGroup','\"6594f204-05cd-41a0-a20a-26e1e2c46157\"'),('sites.e720509c-a7f5-4364-88f9-03cae61b365b.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Jokido\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"Europe/Brussels\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elementCondition','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.autocapitalize','true'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.autocomplete','false'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.autocorrect','true'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.class','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.disabled','false'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.elementCondition','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.id','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.instructions','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.label','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.max','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.min','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.name','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.orientation','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.placeholder','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.readonly','false'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.requirable','false'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.size','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.step','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.tip','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.title','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.uid','\"97a6c797-f1d5-4e5b-a888-db0c0af18d68\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.userCondition','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.warning','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.elements.0.width','100'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.name','\"Inhoud\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.uid','\"2531e26e-8996-4140-acfb-d0ff168f29e5\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fieldLayouts.8301e109-0dbf-44c4-9e8c-5ca64d2ae504.tabs.0.userCondition','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.fs','\"uploads\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.handle','\"uploads\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.name','\"Uploads\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.sortOrder','1'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.titleTranslationKeyFormat','null'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.titleTranslationMethod','\"site\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.transformFs','\"\"'),('volumes.bd1e2832-cdcd-433c-98d5-de4b648a9218.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_jlksjiwpkcooboajmmlzredzgsygsqzobjxg` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zxzqcjglmrcidzbwvyqgdeyhasnfgcqknyqq` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_okraxseczywxhbvitjmvyowtkxpprnhjmqgx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_esrzgfyejutlorbreovobuisnxxyatlavvwc` (`sourceId`),
  KEY `idx_xhjryqwpzwemwyexjwlgasckgulwtkzdfcug` (`targetId`),
  KEY `idx_mqemxkordmmbnjlffahbjczbspdmqyvjocbp` (`sourceSiteId`),
  CONSTRAINT `fk_esndjlyimseytptcohqnhodprwhhwnhwhews` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_koqwffnwystmholjikaqvjqiqxkyaajovtta` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ngqnmmmhwvzstpyhfyeuflgspplxnpweiran` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hcrjdratsqcqlejveyiagoupajnyhsskuwok` (`canonicalId`,`num`),
  KEY `fk_qkzigxtstcgioynlgvajneinfjhyrfdsoyma` (`creatorId`),
  CONSTRAINT `fk_qkzigxtstcgioynlgvajneinfjhyrfdsoyma` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vrmkvdhvtjrxfuzpduirhrkqtcogtnxpcpig` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,3,1,3,NULL),(4,3,1,4,NULL),(5,3,1,5,NULL),(6,3,1,6,NULL),(7,3,1,7,NULL),(8,3,1,8,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_enenkocaqflgfgnpygnkwaywrcaoqxygpuav` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' jokido jbjokido be '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,''),(3,'slug',0,1,' homepage '),(3,'title',0,1,' homepage '),(12,'alt',0,1,''),(12,'extension',0,1,' png '),(12,'filename',0,1,' logo png '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' logo ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_imbpyvrnguwgcmrucpgbnvvlcuvdedremgmk` (`handle`),
  KEY `idx_rtckhdpyxtttidsfimhczyfvjvfjfqczhzrl` (`name`),
  KEY `idx_wqqsszxejzhlazycvdqkggrwrwhdkyilryyz` (`structureId`),
  KEY `idx_mwbufskfepiprvovpvkdkoxnxaxetggkbcmc` (`dateDeleted`),
  CONSTRAINT `fk_setnhbyutazizwcdozetgwodnvyakqrbvnlr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all','end',NULL,'2023-09-13 09:40:29','2023-09-13 11:06:07',NULL,'10996d6a-066c-4e8f-9151-07a4d512d294');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cbvcwaaziijxsrbihixbqjihyclflwgvozze` (`sectionId`,`siteId`),
  KEY `idx_zgadhcymjanpznabzfrzwiaegsxtrwubsxkc` (`siteId`),
  CONSTRAINT `fk_pufgwicfgynbaeoalodpmpzszgrfmwirczyz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wvjkvwksajioiygozkhoiswbyhsnaubbphxk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home.twig',1,'2023-09-13 09:40:29','2023-09-13 11:06:49','c866a8cc-408d-438d-b68a-9d42b2eafe2c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yejalakjwcsbfdxxmjllcuwyrzmepzihxuit` (`uid`),
  KEY `idx_zgneuqdjegsnuzdfkjnedzylpbuoxnjlqgvn` (`token`),
  KEY `idx_cdigosuiolklhvzqjzqonsoewmrqhjhhndcp` (`dateUpdated`),
  KEY `idx_nntjsscofjldeobednuzxfmbiiunfzushjpf` (`userId`),
  CONSTRAINT `fk_sfzzqrzjybuwzdvmzkudatdzpgtuifgnvpgd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tjgrcylwopovawbniopkraabmilkaernswbn` (`userId`,`message`),
  CONSTRAINT `fk_ejyvlqqvjsmpvvnvmaxvilvphotijriydgke` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_meumpvylkjymqhkkagiywqiwjipavtvrnpdg` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Jokido','2023-09-13 09:01:49','2023-09-13 09:01:49',NULL,'6594f204-05cd-41a0-a20a-26e1e2c46157');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qptvwrmdvbqjljsetrbznohaavnuibcbxrwb` (`dateDeleted`),
  KEY `idx_mbbrnpwumltmwbjowzlnnntdaaourwwhudwh` (`handle`),
  KEY `idx_xgkckkrtfjxfhafbniqqcmmvepqfymtdromq` (`sortOrder`),
  KEY `fk_pavxhziswlrtqcnofweasmugejyzppcycsmj` (`groupId`),
  CONSTRAINT `fk_pavxhziswlrtqcnofweasmugejyzppcycsmj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','Jokido','default','en',1,'$PRIMARY_SITE_URL',1,'2023-09-13 09:01:49','2023-09-13 11:32:27',NULL,'e720509c-a7f5-4364-88f9-03cae61b365b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yxvsktsjbctuxmmaduhkjrilkuymhiacjrpc` (`structureId`,`elementId`),
  KEY `idx_ysimmekfzxctozdgsxlbnbbsfdpvdvisjisf` (`root`),
  KEY `idx_vkuqaomrnuuolyccmxjqegrwvdetgoymkgvd` (`lft`),
  KEY `idx_rmhojqrscjgezcjonbcybqfpftmhzwwaighq` (`rgt`),
  KEY `idx_syeescjldzpnkytfczvytithskbjtjdzuozi` (`level`),
  KEY `idx_zpgjscugyjeekmuxdrvzuwxbcfkumdeunlot` (`elementId`),
  CONSTRAINT `fk_xjuygrgzxdefekjgwjhhdvbkuerdfabwuria` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_reqnzqgymfyoybpgoinipflvdpbwwustrxqx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nwmkikxoinbjvlarlrkioijkrbzukwqyybhw` (`key`,`language`),
  KEY `idx_zbiczqajwnqvaplhpqthmyhndvevrepydnpi` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jtvvubisspniolomeewuamskqcxdajjoyhzd` (`name`),
  KEY `idx_jyamhozchzlumimhgbvvhipsqtbgnwvmftaj` (`handle`),
  KEY `idx_copgxcebrczmoksuckxmkjneyfrjqnqxeshx` (`dateDeleted`),
  KEY `fk_ufcazpktkqgcsmypazrgzzjvaqxemxhobpfo` (`fieldLayoutId`),
  CONSTRAINT `fk_ufcazpktkqgcsmypazrgzzjvaqxemxhobpfo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ggeiuglqojxwymicbqzdfjafzjgauixvwvtl` (`groupId`),
  CONSTRAINT `fk_ctwyarrxxbrwndmrhtvbrxfjtggdbtvkvifu` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_snjmeyumvpzqwefbkjrwuadhtveomvxmaxrq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xtyhheccqqditqsszzfosktcuqllwzzkmrja` (`token`),
  KEY `idx_rpjbfpuhvrjifojmsbtbpsnhfeipcdardlfz` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mchqqsmmbifmtwcspwaiflorwhrkepungrxi` (`handle`),
  KEY `idx_eghbignjjgwvtqlgtjmhbrvdfcwpchimpdcz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pgdqqieiygcksntdahvdhlbhitsiltbxvuxf` (`groupId`,`userId`),
  KEY `idx_vipcxdweqzyvprwocafzwvtnzmwsoxwmqtsq` (`userId`),
  CONSTRAINT `fk_pkxjlpnkvowpdcbwisubmfihfedtbbwtqccw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfqpjsqmvjoqarhpuhocdkrvtyvtrevxtpvl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_soekllvwfzzswuymetmjcyviyxqgywdrsxcx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dqrnplebwapgnmkevlsclipdxcaanubvkdwl` (`permissionId`,`groupId`),
  KEY `idx_lvtbpaangewupqryiynctldjsmyalftqvfgf` (`groupId`),
  CONSTRAINT `fk_siakedmkjwwmdzfilwxjudbohknxifxywgcb` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tyyxjyfagqzmafknjycoecmounfpubiqukxl` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zayyzitwgwsdkhsnclxktseuytndxitjqfyy` (`permissionId`,`userId`),
  KEY `idx_kirbaxtnnhsazzgmoqnfgujjqrdffkiqrmgx` (`userId`),
  CONSTRAINT `fk_fvrjwirrkaffkzpskucmnnbndncwwsrwgwwv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lewnpvunkdjondligpydijeecuqscvrggysf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_faotxwadbltigveiwdacctcfgjpsuvtqdobt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lypnbdtbkdylmiqtnepbhuvmmdgmlkquqisc` (`active`),
  KEY `idx_nrlmmaaxkhvfzimqxzklzesdokzkdtvphufg` (`locked`),
  KEY `idx_ncyzgdmcvcuejyaybjniqtogbluugwxhhjcq` (`pending`),
  KEY `idx_uaknsiwwkbshcldffqtlsellmsvfzkdlmhma` (`suspended`),
  KEY `idx_kmycdesierkqiedkmxzzurplcxmhegckirmd` (`verificationCode`),
  KEY `idx_kwnaclztrnwaekbolnshgkusvqcszwpvxxag` (`email`),
  KEY `idx_wyzbtvxqlijwbqoiebkpcikfhuqitjumiipg` (`username`),
  KEY `fk_rrcxjtzjatqcgviwkcelzbtrlwacynsrisdm` (`photoId`),
  CONSTRAINT `fk_lvefpaomwqdwldqsvkojyaoipvbpuxsyfdpu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rrcxjtzjatqcgviwkcelzbtrlwacynsrisdm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'jokido@jbjokido.be','$2y$13$K28csT4r8lNwNuHZJgTWyuvG24A3woLfjyGq6YYVUVscwb1VmRQZW','2023-09-13 11:33:59',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-09-13 09:01:50','2023-09-13 09:01:50','2023-09-13 11:38:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_efkvdfehrzkvowevxtjfhmsbmcqmbtjhsfqk` (`name`,`parentId`,`volumeId`),
  KEY `idx_exeqvefcayqmdgddfkigcmvdaxabayfclcap` (`parentId`),
  KEY `idx_oshzwxvbvflcryurtkqghxmwnfmncqkbwrlh` (`volumeId`),
  CONSTRAINT `fk_agewrlqjqtwegkpnipbbdrawasvjobvfkdhf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kimptqxbgviexwixsqpxgxrcncxkalhqphjq` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Uploads','','2023-09-13 11:25:13','2023-09-13 11:25:13','7d9d54ac-561a-4576-83d7-97c998691a97'),(2,NULL,NULL,'Tijdelijk bestandssysteem',NULL,'2023-09-13 11:38:03','2023-09-13 11:38:03','f4792eac-a318-480f-9714-11d084342f4a'),(3,2,NULL,'user_1','user_1/','2023-09-13 11:38:03','2023-09-13 11:38:03','7c21bfe2-8f66-4178-9a44-667012f9c42f');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wojaiukituxahguqtgdiwuffushcyqavudwx` (`name`),
  KEY `idx_oayrqmxkvqhasxejwmjarxkqyduwgknzdgdy` (`handle`),
  KEY `idx_ivbdsyhmhxhwxtnmvqxvbhplkqufdpbslrlw` (`fieldLayoutId`),
  KEY `idx_pwlzvlfaxayonddeuttezwlcfgfagsikqaql` (`dateDeleted`),
  CONSTRAINT `fk_smytohyirllqqepcjcfbyedmvycobwrxudyt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Uploads','uploads','uploads','','','site',NULL,1,'2023-09-13 11:25:13','2023-09-13 11:25:13',NULL,'bd1e2832-cdcd-433c-98d5-de4b648a9218');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgbokvogbtzkcepuyavxeovwzgbvubigixrw` (`userId`),
  CONSTRAINT `fk_ngwchbjkbrkgsqyeuvhjqepecbnrjcyopktz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-09-13 09:03:19','2023-09-13 09:03:19','3684382d-e5e4-4ef7-a2bd-76aab14931b4'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-09-13 09:03:19','2023-09-13 09:03:19','b1e01b94-9c99-4f00-8c6f-788b710e5eb0'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-09-13 09:03:19','2023-09-13 09:03:19','32176069-d47b-4d33-b4b2-1a940430ecf9'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-09-13 09:03:19','2023-09-13 09:03:19','3c22261c-0a0d-4481-ae54-92a2b5486454');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-04 17:25:53

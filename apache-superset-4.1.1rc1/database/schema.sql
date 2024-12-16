-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: broan
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cause_and_remedy`
--

DROP TABLE IF EXISTS `cause_and_remedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cause_and_remedy` (
  `Fault` varchar(64) DEFAULT NULL,
  `Cause` text,
  `Remedy` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!50001 DROP VIEW IF EXISTS `checklist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `checklist` AS SELECT 
 1 AS `Eventid`,
 1 AS `Location`,
 1 AS `Fault`,
 1 AS `Failure_Probability`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `checklist_2`
--

DROP TABLE IF EXISTS `checklist_2`;
/*!50001 DROP VIEW IF EXISTS `checklist_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `checklist_2` AS SELECT 
 1 AS `Eventid`,
 1 AS `Location`,
 1 AS `Fault`,
 1 AS `Failure_Probability`,
 1 AS `Confidence`,
 1 AS `Cause`,
 1 AS `Remedy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cmb`
--

DROP TABLE IF EXISTS `cmb`;
/*!50001 DROP VIEW IF EXISTS `cmb`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cmb` AS SELECT 
 1 AS `Timestamp`,
 1 AS `Fault_MOTN_017_Group_1`,
 1 AS `Fault_MOTN_018_Group_1`,
 1 AS `Fault_MOTN_231_Group_1`,
 1 AS `Fault_SRVO_023_Group_1`,
 1 AS `Fault_SRVO_046_Group_1`,
 1 AS `Fault_SRVO_248_Group_1`,
 1 AS `Fault_SRVO_024_Group_1`,
 1 AS `Group1_Binary`,
 1 AS `Fault_CPMO_130_Group_2`,
 1 AS `Fault_MOTN_017_Group_2`,
 1 AS `Fault_MOTN_231_Group_2`,
 1 AS `Fault_SRVO_023_Group_2`,
 1 AS `Fault_SRVO_046_Group_2`,
 1 AS `Fault_SRVO_047_Group_2`,
 1 AS `Fault_SRVO_050_Group_2`,
 1 AS `Fault_SRVO_115_Group_2`,
 1 AS `Fault_SRVO_248_Group_2`,
 1 AS `Fault_SRVO_450_Group_2`,
 1 AS `Fault_JOG_013_Stroke_limit_G3_A1_Group_2`,
 1 AS `Fault_SRVO_024_Group_2`,
 1 AS `Group2_Binary`,
 1 AS `Fault_CPMO_130_Group_3`,
 1 AS `Fault_MOTN_017_Group_3`,
 1 AS `Fault_MOTN_231_Group_3`,
 1 AS `Fault_SRVO_023_Group_3`,
 1 AS `Fault_SRVO_035_Group_3`,
 1 AS `Fault_SRVO_046_Group_3`,
 1 AS `Fault_SRVO_047_Group_3`,
 1 AS `Fault_SRVO_050_Group_3`,
 1 AS `Fault_SRVO_115_Group_3`,
 1 AS `Fault_SYST_035_Group_3`,
 1 AS `Fault_SRVO_450_Group_3`,
 1 AS `Fault_JOG_013_Stroke_limit_G1_A5_Group_3`,
 1 AS `Fault_JOG_013_Stroke_limit_G2_A6_Group_3`,
 1 AS `Fault_30104_Group_3`,
 1 AS `Fault_30203_Group_3`,
 1 AS `Fault_30302_Group_3`,
 1 AS `Fault_30382_Group_3`,
 1 AS `Fault_30383_Group_3`,
 1 AS `Fault_SRVO_024_Group_3`,
 1 AS `Group3_Binary`,
 1 AS `Fault_Exit_Conveyor_full_Former`,
 1 AS `Fault_Problem_with_BR_clinch_Former`,
 1 AS `Fault_Problem_with_DS_clinch_Former`,
 1 AS `Fault_Problem_with_U_Former`,
 1 AS `Fault_Problem_with_US_clinch_Former`,
 1 AS `Fault_Problem_with_scroll_band_nest_Former`,
 1 AS `Former_Binary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `etl_log`
--

DROP TABLE IF EXISTS `etl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etl_log` (
  `datetime` datetime DEFAULT NULL,
  `fullfilepath` text,
  `filename` text,
  `rows_in_file` bigint DEFAULT NULL,
  `table_used` text,
  `message` text,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `Hours` timestamp NULL DEFAULT NULL,
  `Calendar_date` date DEFAULT NULL,
  `Severity` varchar(16) DEFAULT NULL,
  `Location` varchar(6) DEFAULT NULL,
  `Failure_Probability` double DEFAULT NULL,
  `Fault_MOTN_017_Group_1` double DEFAULT NULL,
  `Fault_MOTN_018_Group_1` double DEFAULT NULL,
  `Fault_MOTN_231_Group_1` double DEFAULT NULL,
  `Fault_SRVO_023_Group_1` double DEFAULT NULL,
  `Fault_SRVO_046_Group_1` double DEFAULT NULL,
  `Fault_SRVO_248_Group_1` double DEFAULT NULL,
  `Fault_SRVO_024_Group_1` double DEFAULT NULL,
  `Fault_CPMO_130_Group_2` double DEFAULT NULL,
  `Fault_MOTN_017_Group_2` double DEFAULT NULL,
  `Fault_MOTN_231_Group_2` double DEFAULT NULL,
  `Fault_SRVO_023_Group_2` double DEFAULT NULL,
  `Fault_SRVO_046_Group_2` double DEFAULT NULL,
  `Fault_SRVO_047_Group_2` double DEFAULT NULL,
  `Fault_SRVO_050_Group_2` double DEFAULT NULL,
  `Fault_SRVO_115_Group_2` double DEFAULT NULL,
  `Fault_SRVO_248_Group_2` double DEFAULT NULL,
  `Fault_SRVO_450_Group_2` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G3_A1_Group_2` double DEFAULT NULL,
  `Fault_SRVO_024_Group_2` double DEFAULT NULL,
  `Fault_CPMO_130_Group_3` double DEFAULT NULL,
  `Fault_MOTN_017_Group_3` double DEFAULT NULL,
  `Fault_MOTN_231_Group_3` double DEFAULT NULL,
  `Fault_SRVO_023_Group_3` double DEFAULT NULL,
  `Fault_SRVO_035_Group_3` double DEFAULT NULL,
  `Fault_SRVO_046_Group_3` double DEFAULT NULL,
  `Fault_SRVO_047_Group_3` double DEFAULT NULL,
  `Fault_SRVO_050_Group_3` double DEFAULT NULL,
  `Fault_SRVO_115_Group_3` double DEFAULT NULL,
  `Fault_SYST_035_Group_3` double DEFAULT NULL,
  `Fault_SRVO_450_Group_3` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G1_A5_Group_3` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G2_A6_Group_3` double DEFAULT NULL,
  `Fault_30104_Group_3` double DEFAULT NULL,
  `Fault_30203_Group_3` double DEFAULT NULL,
  `Fault_30302_Group_3` double DEFAULT NULL,
  `Fault_30382_Group_3` double DEFAULT NULL,
  `Fault_30383_Group_3` double DEFAULT NULL,
  `Fault_SRVO_024_Group_3` double DEFAULT NULL,
  `Fault_Exit_Conveyor_full_Former` double DEFAULT NULL,
  `Fault_Problem_with_BR_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_DS_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_U_Former` double DEFAULT NULL,
  `Fault_Problem_with_US_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_scroll_band_nest_Former` double DEFAULT NULL,
  `Eventid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Manage` varchar(1024) DEFAULT NULL,
  `Actions` varchar(163) DEFAULT NULL,
  `Comments` varchar(512) DEFAULT NULL,
  `Expert_Remedy` varchar(512) DEFAULT NULL,
  `Status` varchar(16) DEFAULT NULL,
  `Last_Updated` datetime DEFAULT NULL,
  PRIMARY KEY (`Eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `latest_events`
--

DROP TABLE IF EXISTS `latest_events`;
/*!50001 DROP VIEW IF EXISTS `latest_events`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `latest_events` AS SELECT 
 1 AS `Location`,
 1 AS `Hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `latest_events_full`
--

DROP TABLE IF EXISTS `latest_events_full`;
/*!50001 DROP VIEW IF EXISTS `latest_events_full`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `latest_events_full` AS SELECT 
 1 AS `Hours`,
 1 AS `Calendar_date`,
 1 AS `Severity`,
 1 AS `Location`,
 1 AS `Failure_Probability`,
 1 AS `Fault_MOTN_017_Group_1`,
 1 AS `Fault_MOTN_018_Group_1`,
 1 AS `Fault_MOTN_231_Group_1`,
 1 AS `Fault_SRVO_023_Group_1`,
 1 AS `Fault_SRVO_046_Group_1`,
 1 AS `Fault_SRVO_248_Group_1`,
 1 AS `Fault_SRVO_024_Group_1`,
 1 AS `Fault_CPMO_130_Group_2`,
 1 AS `Fault_MOTN_017_Group_2`,
 1 AS `Fault_MOTN_231_Group_2`,
 1 AS `Fault_SRVO_023_Group_2`,
 1 AS `Fault_SRVO_046_Group_2`,
 1 AS `Fault_SRVO_047_Group_2`,
 1 AS `Fault_SRVO_050_Group_2`,
 1 AS `Fault_SRVO_115_Group_2`,
 1 AS `Fault_SRVO_248_Group_2`,
 1 AS `Fault_SRVO_450_Group_2`,
 1 AS `Fault_JOG_013_Stroke_limit_G3_A1_Group_2`,
 1 AS `Fault_SRVO_024_Group_2`,
 1 AS `Fault_CPMO_130_Group_3`,
 1 AS `Fault_MOTN_017_Group_3`,
 1 AS `Fault_MOTN_231_Group_3`,
 1 AS `Fault_SRVO_023_Group_3`,
 1 AS `Fault_SRVO_035_Group_3`,
 1 AS `Fault_SRVO_046_Group_3`,
 1 AS `Fault_SRVO_047_Group_3`,
 1 AS `Fault_SRVO_050_Group_3`,
 1 AS `Fault_SRVO_115_Group_3`,
 1 AS `Fault_SYST_035_Group_3`,
 1 AS `Fault_SRVO_450_Group_3`,
 1 AS `Fault_JOG_013_Stroke_limit_G1_A5_Group_3`,
 1 AS `Fault_JOG_013_Stroke_limit_G2_A6_Group_3`,
 1 AS `Fault_30104_Group_3`,
 1 AS `Fault_30203_Group_3`,
 1 AS `Fault_30302_Group_3`,
 1 AS `Fault_30382_Group_3`,
 1 AS `Fault_30383_Group_3`,
 1 AS `Fault_SRVO_024_Group_3`,
 1 AS `Fault_Exit_Conveyor_full_Former`,
 1 AS `Fault_Problem_with_BR_clinch_Former`,
 1 AS `Fault_Problem_with_DS_clinch_Former`,
 1 AS `Fault_Problem_with_U_Former`,
 1 AS `Fault_Problem_with_US_clinch_Former`,
 1 AS `Fault_Problem_with_scroll_band_nest_Former`,
 1 AS `Eventid`,
 1 AS `Manage`,
 1 AS `Actions`,
 1 AS `Comments`,
 1 AS `Expert_Remedy`,
 1 AS `Status`,
 1 AS `Last_Updated`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `processed_predictions`
--

DROP TABLE IF EXISTS `processed_predictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processed_predictions` (
  `Timestamp` datetime DEFAULT NULL,
  `Fault_MOTN_017_Group_1` double DEFAULT NULL,
  `Fault_MOTN_018_Group_1` double DEFAULT NULL,
  `Fault_MOTN_231_Group_1` double DEFAULT NULL,
  `Fault_SRVO_023_Group_1` double DEFAULT NULL,
  `Fault_SRVO_046_Group_1` double DEFAULT NULL,
  `Fault_SRVO_248_Group_1` double DEFAULT NULL,
  `Fault_SRVO_024_Group_1` double DEFAULT NULL,
  `Fault_CPMO_130_Group_2` double DEFAULT NULL,
  `Fault_MOTN_017_Group_2` double DEFAULT NULL,
  `Fault_MOTN_231_Group_2` double DEFAULT NULL,
  `Fault_SRVO_023_Group_2` double DEFAULT NULL,
  `Fault_SRVO_046_Group_2` double DEFAULT NULL,
  `Fault_SRVO_047_Group_2` double DEFAULT NULL,
  `Fault_SRVO_050_Group_2` double DEFAULT NULL,
  `Fault_SRVO_115_Group_2` double DEFAULT NULL,
  `Fault_SRVO_248_Group_2` double DEFAULT NULL,
  `Fault_SRVO_450_Group_2` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G3_A1_Group_2` double DEFAULT NULL,
  `Fault_SRVO_024_Group_2` double DEFAULT NULL,
  `Fault_CPMO_130_Group_3` double DEFAULT NULL,
  `Fault_MOTN_017_Group_3` double DEFAULT NULL,
  `Fault_MOTN_231_Group_3` double DEFAULT NULL,
  `Fault_SRVO_023_Group_3` double DEFAULT NULL,
  `Fault_SRVO_035_Group_3` double DEFAULT NULL,
  `Fault_SRVO_046_Group_3` double DEFAULT NULL,
  `Fault_SRVO_047_Group_3` double DEFAULT NULL,
  `Fault_SRVO_050_Group_3` double DEFAULT NULL,
  `Fault_SRVO_115_Group_3` double DEFAULT NULL,
  `Fault_SYST_035_Group_3` double DEFAULT NULL,
  `Fault_SRVO_450_Group_3` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G1_A5_Group_3` double DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G2_A6_Group_3` double DEFAULT NULL,
  `Fault_30104_Group_3` double DEFAULT NULL,
  `Fault_30203_Group_3` double DEFAULT NULL,
  `Fault_30302_Group_3` double DEFAULT NULL,
  `Fault_30382_Group_3` double DEFAULT NULL,
  `Fault_30383_Group_3` double DEFAULT NULL,
  `Fault_SRVO_024_Group_3` double DEFAULT NULL,
  `Fault_Exit_Conveyor_full_Former` double DEFAULT NULL,
  `Fault_Problem_with_BR_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_DS_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_U_Former` double DEFAULT NULL,
  `Fault_Problem_with_US_clinch_Former` double DEFAULT NULL,
  `Fault_Problem_with_scroll_band_nest_Former` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_formerlogfile`
--

DROP TABLE IF EXISTS `raw_formerlogfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_formerlogfile` (
  `Dates` datetime DEFAULT NULL,
  `Area` text,
  `Line` text,
  `Machine` text,
  `Station` text,
  `Fault_Number` text,
  `Fault` text,
  `Duration` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_grouplogfile`
--

DROP TABLE IF EXISTS `raw_grouplogfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_grouplogfile` (
  `Dates` datetime DEFAULT NULL,
  `Type` text,
  `Message_Error_Code` text,
  `Error_Message` text,
  `Cause_Code` text,
  `Cause_Message` text,
  `Severity` text,
  `Program` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `raw_powerbi`
--

DROP TABLE IF EXISTS `raw_powerbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_powerbi` (
  `Dates` text,
  `Line` text,
  `Shift` float DEFAULT NULL,
  `hours` float DEFAULT NULL,
  `SKU` text,
  `Family` text,
  `Direct_Staffing` float DEFAULT NULL,
  `Indirect_Staffing` float DEFAULT NULL,
  `Plan` float DEFAULT NULL,
  `Actual` float DEFAULT NULL,
  `Times` float DEFAULT NULL,
  `Downtime` text,
  `Downtime_Minutes` float DEFAULT NULL,
  `Estimated_Downtime` float DEFAULT NULL,
  `Earned_hours` float DEFAULT NULL,
  `Paid_hours` float DEFAULT NULL,
  `Comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refined_logfile`
--

DROP TABLE IF EXISTS `refined_logfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refined_logfile` (
  `Dates` datetime DEFAULT NULL,
  `Fault` text,
  `Fault_Counts` text,
  `Machine` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refined_logfile_with_dummies`
--

DROP TABLE IF EXISTS `refined_logfile_with_dummies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refined_logfile_with_dummies` (
  `Dates` datetime DEFAULT NULL,
  `Fault__Group_1` float DEFAULT NULL,
  `Fault__Group_2` float DEFAULT NULL,
  `Fault__Group_3` float DEFAULT NULL,
  `Fault_10103_Group_1` float DEFAULT NULL,
  `Fault_10304_Group_1` float DEFAULT NULL,
  `Fault_10306_Group_1` float DEFAULT NULL,
  `Fault_10307_Group_1` float DEFAULT NULL,
  `Fault_10512_Group_1` float DEFAULT NULL,
  `Fault_10513_Group_1` float DEFAULT NULL,
  `Fault_10701_Group_1` float DEFAULT NULL,
  `Fault_10702_Group_1` float DEFAULT NULL,
  `Fault_10703_Group_1` float DEFAULT NULL,
  `Fault_10704_Group_1` float DEFAULT NULL,
  `Fault_10801_Group_1` float DEFAULT NULL,
  `Fault_10802_Group_1` float DEFAULT NULL,
  `Fault_10803_Group_1` float DEFAULT NULL,
  `Fault_10805_Group_1` float DEFAULT NULL,
  `Fault_10806_Group_1` float DEFAULT NULL,
  `Fault_10807_Group_1` float DEFAULT NULL,
  `Fault_10809_Group_1` float DEFAULT NULL,
  `Fault_11002_Group_1` float DEFAULT NULL,
  `Fault_20105_Group_2` float DEFAULT NULL,
  `Fault_20107_Group_2` float DEFAULT NULL,
  `Fault_20203_Group_2` float DEFAULT NULL,
  `Fault_20204_Group_2` float DEFAULT NULL,
  `Fault_20205_Group_2` float DEFAULT NULL,
  `Fault_20302_Group_2` float DEFAULT NULL,
  `Fault_20402_Group_2` float DEFAULT NULL,
  `Fault_20403_Group_2` float DEFAULT NULL,
  `Fault_20404_Group_2` float DEFAULT NULL,
  `Fault_20405_Group_2` float DEFAULT NULL,
  `Fault_20502_Group_2` float DEFAULT NULL,
  `Fault_20503_Group_2` float DEFAULT NULL,
  `Fault_21202_Group_2` float DEFAULT NULL,
  `Fault_21203_Group_2` float DEFAULT NULL,
  `Fault_21204_Group_2` float DEFAULT NULL,
  `Fault_21205_Group_2` float DEFAULT NULL,
  `Fault_30102_Group_3` float DEFAULT NULL,
  `Fault_30103_Group_3` float DEFAULT NULL,
  `Fault_30104_Group_3` float DEFAULT NULL,
  `Fault_30202_Group_3` float DEFAULT NULL,
  `Fault_30203_Group_3` float DEFAULT NULL,
  `Fault_30302_Group_3` float DEFAULT NULL,
  `Fault_30304_Group_3` float DEFAULT NULL,
  `Fault_30308_Group_3` float DEFAULT NULL,
  `Fault_30311_Group_3` float DEFAULT NULL,
  `Fault_30313_Group_3` float DEFAULT NULL,
  `Fault_30316_Group_3` float DEFAULT NULL,
  `Fault_30317_Group_3` float DEFAULT NULL,
  `Fault_30320_Group_3` float DEFAULT NULL,
  `Fault_30321_Group_3` float DEFAULT NULL,
  `Fault_30325_Group_3` float DEFAULT NULL,
  `Fault_30326_Group_3` float DEFAULT NULL,
  `Fault_30330_Group_3` float DEFAULT NULL,
  `Fault_30331_Group_3` float DEFAULT NULL,
  `Fault_30332_Group_3` float DEFAULT NULL,
  `Fault_30333_Group_3` float DEFAULT NULL,
  `Fault_30334_Group_3` float DEFAULT NULL,
  `Fault_30335_Group_3` float DEFAULT NULL,
  `Fault_30339_Group_3` float DEFAULT NULL,
  `Fault_30340_Group_3` float DEFAULT NULL,
  `Fault_30341_Group_3` float DEFAULT NULL,
  `Fault_30342_Group_3` float DEFAULT NULL,
  `Fault_30343_Group_3` float DEFAULT NULL,
  `Fault_30345_Group_3` float DEFAULT NULL,
  `Fault_30349_Group_3` float DEFAULT NULL,
  `Fault_30350_Group_3` float DEFAULT NULL,
  `Fault_30351_Group_3` float DEFAULT NULL,
  `Fault_30352_Group_3` float DEFAULT NULL,
  `Fault_30354_Group_3` float DEFAULT NULL,
  `Fault_30360_Group_3` float DEFAULT NULL,
  `Fault_30361_Group_3` float DEFAULT NULL,
  `Fault_30369_Group_3` float DEFAULT NULL,
  `Fault_30376_Group_3` float DEFAULT NULL,
  `Fault_30381_Group_3` float DEFAULT NULL,
  `Fault_30382_Group_3` float DEFAULT NULL,
  `Fault_30383_Group_3` float DEFAULT NULL,
  `Fault_30390_Group_3` float DEFAULT NULL,
  `Fault_30392_Group_3` float DEFAULT NULL,
  `Fault_30603_Group_3` float DEFAULT NULL,
  `Fault_30604_Group_3` float DEFAULT NULL,
  `Fault_30606_Group_3` float DEFAULT NULL,
  `Fault_30703_Group_3` float DEFAULT NULL,
  `Fault_ASBN_002_Group_3` float DEFAULT NULL,
  `Fault_ASBN_008_Group_2` float DEFAULT NULL,
  `Fault_ASBN_008_Group_3` float DEFAULT NULL,
  `Fault_ASBN_009_Group_3` float DEFAULT NULL,
  `Fault_CPMO_095_Group_1` float DEFAULT NULL,
  `Fault_CPMO_130_Group_2` float DEFAULT NULL,
  `Fault_CPMO_130_Group_3` float DEFAULT NULL,
  `Fault_CVIS_037_Group_3` float DEFAULT NULL,
  `Fault_CVIS_085_Group_1` float DEFAULT NULL,
  `Fault_CVIS_098_Group_1` float DEFAULT NULL,
  `Fault_CVIS_135_Group_3` float DEFAULT NULL,
  `Fault_CVIS_141_Group_3` float DEFAULT NULL,
  `Fault_CVIS_143_Group_3` float DEFAULT NULL,
  `Fault_CVIS_160_Group_1` float DEFAULT NULL,
  `Fault_CVIS_218_Group_3` float DEFAULT NULL,
  `Fault_CVIS_222_Group_3` float DEFAULT NULL,
  `Fault_CVIS_247_Group_3` float DEFAULT NULL,
  `Fault_CVIS_355_Group_3` float DEFAULT NULL,
  `Fault_CVIS_534_Group_3` float DEFAULT NULL,
  `Fault_Cycle_Start_Group_1` float DEFAULT NULL,
  `Fault_Cycle_Start_Group_2` float DEFAULT NULL,
  `Fault_Cycle_Start_Group_3` float DEFAULT NULL,
  `Fault_DIAG_005_Group_1` float DEFAULT NULL,
  `Fault_DIAG_005_Group_2` float DEFAULT NULL,
  `Fault_Exit_Conveyor_full_Former` float DEFAULT NULL,
  `Fault_FILE_003_Group_3` float DEFAULT NULL,
  `Fault_FILE_066_Group_1` float DEFAULT NULL,
  `Fault_FILE_066_Group_2` float DEFAULT NULL,
  `Fault_FILE_066_Group_3` float DEFAULT NULL,
  `Fault_FILE_067_Group_1` float DEFAULT NULL,
  `Fault_FILE_067_Group_2` float DEFAULT NULL,
  `Fault_FILE_067_Group_3` float DEFAULT NULL,
  `Fault_FILE_069_Group_1` float DEFAULT NULL,
  `Fault_FILE_069_Group_2` float DEFAULT NULL,
  `Fault_FILE_069_Group_3` float DEFAULT NULL,
  `Fault_FILE_071_Group_1` float DEFAULT NULL,
  `Fault_FILE_071_Group_2` float DEFAULT NULL,
  `Fault_FILE_071_Group_3` float DEFAULT NULL,
  `Fault_Fan_Press_High_Prsr_PS_Group_3` float DEFAULT NULL,
  `Fault_Fan_Press_Hold_Down_Group_3` float DEFAULT NULL,
  `Fault_Fan_Press_Low_Prsr_POS_Group_3` float DEFAULT NULL,
  `Fault_Fan_Runout_Group_3` float DEFAULT NULL,
  `Fault_Fan_Wobble_IL_Group_3` float DEFAULT NULL,
  `Fault_HOST_178_Group_1` float DEFAULT NULL,
  `Fault_HOST_178_Group_2` float DEFAULT NULL,
  `Fault_HOST_178_Group_3` float DEFAULT NULL,
  `Fault_HRTL_054_Group_1` float DEFAULT NULL,
  `Fault_HYPOT_Test_Failure_Group_3` float DEFAULT NULL,
  `Fault_INTP_105_Group_1` float DEFAULT NULL,
  `Fault_INTP_105_Group_2` float DEFAULT NULL,
  `Fault_INTP_105_Group_3` float DEFAULT NULL,
  `Fault_INTP_106_Group_1` float DEFAULT NULL,
  `Fault_INTP_106_Group_2` float DEFAULT NULL,
  `Fault_INTP_106_Group_3` float DEFAULT NULL,
  `Fault_INTP_127_Group_1` float DEFAULT NULL,
  `Fault_INTP_127_Group_2` float DEFAULT NULL,
  `Fault_INTP_127_Group_3` float DEFAULT NULL,
  `Fault_INTP_146_Group_2` float DEFAULT NULL,
  `Fault_INTP_146_Group_3` float DEFAULT NULL,
  `Fault_INTP_203_Group_3` float DEFAULT NULL,
  `Fault_INTP_208_Group_1` float DEFAULT NULL,
  `Fault_INTP_213_Group_1` float DEFAULT NULL,
  `Fault_INTP_213_Group_2` float DEFAULT NULL,
  `Fault_INTP_213_Group_3` float DEFAULT NULL,
  `Fault_INTP_222_Group_1` float DEFAULT NULL,
  `Fault_INTP_222_Group_2` float DEFAULT NULL,
  `Fault_INTP_222_Group_3` float DEFAULT NULL,
  `Fault_INTP_237_Group_1` float DEFAULT NULL,
  `Fault_INTP_237_Group_2` float DEFAULT NULL,
  `Fault_INTP_238_Group_2` float DEFAULT NULL,
  `Fault_INTP_250_Group_1` float DEFAULT NULL,
  `Fault_INTP_250_Group_2` float DEFAULT NULL,
  `Fault_INTP_267_Group_1` float DEFAULT NULL,
  `Fault_INTP_267_Group_2` float DEFAULT NULL,
  `Fault_INTP_310_Group_1` float DEFAULT NULL,
  `Fault_INTP_311_Group_1` float DEFAULT NULL,
  `Fault_INTP_311_Group_2` float DEFAULT NULL,
  `Fault_INTP_311_Group_3` float DEFAULT NULL,
  `Fault_INTP_328_Group_1` float DEFAULT NULL,
  `Fault_INTP_366_Group_1` float DEFAULT NULL,
  `Fault_INTP_366_Group_2` float DEFAULT NULL,
  `Fault_INTP_366_Group_3` float DEFAULT NULL,
  `Fault_INTP_447_Group_3` float DEFAULT NULL,
  `Fault_INTP_685_Group_3` float DEFAULT NULL,
  `Fault_INTP_686_Group_1` float DEFAULT NULL,
  `Fault_JOG_007_Press_shift_key_to_jog_Group_1` float DEFAULT NULL,
  `Fault_JOG_007_Press_shift_key_to_jog_Group_2` float DEFAULT NULL,
  `Fault_JOG_007_Press_shift_key_to_jog_Group_3` float DEFAULT NULL,
  `Fault_JOG_008_Turn_on_TP_to_jog_Group_1` float DEFAULT NULL,
  `Fault_JOG_008_Turn_on_TP_to_jog_Group_2` float DEFAULT NULL,
  `Fault_JOG_008_Turn_on_TP_to_jog_Group_3` float DEFAULT NULL,
  `Fault_JOG_009_Hold_deadman_to_jog_Group_1` float DEFAULT NULL,
  `Fault_JOG_009_Hold_deadman_to_jog_Group_2` float DEFAULT NULL,
  `Fault_JOG_009_Hold_deadman_to_jog_Group_3` float DEFAULT NULL,
  `Fault_JOG_010_Jog_pressed_before_shift_Group_1` float DEFAULT NULL,
  `Fault_JOG_010_Jog_pressed_before_shift_Group_2` float DEFAULT NULL,
  `Fault_JOG_010_Jog_pressed_before_shift_Group_3` float DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G1_A5_Group_3` float DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G2_A6_Group_3` float DEFAULT NULL,
  `Fault_JOG_013_Stroke_limit_G3_A1_Group_2` float DEFAULT NULL,
  `Fault_MACR_005_Group_2` float DEFAULT NULL,
  `Fault_MACR_005_Group_3` float DEFAULT NULL,
  `Fault_MACR_006_Group_1` float DEFAULT NULL,
  `Fault_MACR_006_Group_2` float DEFAULT NULL,
  `Fault_MACR_006_Group_3` float DEFAULT NULL,
  `Fault_MACR_013_Group_1` float DEFAULT NULL,
  `Fault_MACR_013_Group_2` float DEFAULT NULL,
  `Fault_MACR_013_Group_3` float DEFAULT NULL,
  `Fault_MACR_016_Group_1` float DEFAULT NULL,
  `Fault_MACR_016_Group_2` float DEFAULT NULL,
  `Fault_MACR_016_Group_3` float DEFAULT NULL,
  `Fault_MCTL_003_Group_1` float DEFAULT NULL,
  `Fault_MCTL_003_Group_2` float DEFAULT NULL,
  `Fault_MCTL_003_Group_3` float DEFAULT NULL,
  `Fault_MCTL_014_Group_1` float DEFAULT NULL,
  `Fault_MCTL_014_Group_2` float DEFAULT NULL,
  `Fault_MCTL_014_Group_3` float DEFAULT NULL,
  `Fault_MEMO_004_Group_3` float DEFAULT NULL,
  `Fault_MEMO_015_Group_2` float DEFAULT NULL,
  `Fault_MEMO_015_Group_3` float DEFAULT NULL,
  `Fault_MEMO_093_Group_3` float DEFAULT NULL,
  `Fault_MN_Group_3` float DEFAULT NULL,
  `Fault_MOTN_017_Group_1` float DEFAULT NULL,
  `Fault_MOTN_017_Group_2` float DEFAULT NULL,
  `Fault_MOTN_017_Group_3` float DEFAULT NULL,
  `Fault_MOTN_018_Group_1` float DEFAULT NULL,
  `Fault_MOTN_205_Group_1` float DEFAULT NULL,
  `Fault_MOTN_205_Group_3` float DEFAULT NULL,
  `Fault_MOTN_209_Group_3` float DEFAULT NULL,
  `Fault_MOTN_231_Group_1` float DEFAULT NULL,
  `Fault_MOTN_231_Group_2` float DEFAULT NULL,
  `Fault_MOTN_231_Group_3` float DEFAULT NULL,
  `Fault_Manual_Reject_Group_3` float DEFAULT NULL,
  `Fault_Motor_Bracket_Inspect_Group_3` float DEFAULT NULL,
  `Fault_Motor_Bracket_Plcmnt_Group_3` float DEFAULT NULL,
  `Fault_Motor_RPM_Group_3` float DEFAULT NULL,
  `Fault_No_L_Former` float DEFAULT NULL,
  `Fault_No_L1_Former` float DEFAULT NULL,
  `Fault_OS___144_System_error_2_Group_3` float DEFAULT NULL,
  `Fault_PRIO_083_Group_2` float DEFAULT NULL,
  `Fault_PRIO_083_Group_3` float DEFAULT NULL,
  `Fault_PRIO_091_Group_2` float DEFAULT NULL,
  `Fault_PRIO_096_Group_1` float DEFAULT NULL,
  `Fault_PRIO_096_Group_2` float DEFAULT NULL,
  `Fault_PRIO_097_Group_1` float DEFAULT NULL,
  `Fault_PRIO_097_Group_2` float DEFAULT NULL,
  `Fault_PRIO_097_Group_3` float DEFAULT NULL,
  `Fault_PRIO_230_Group_1` float DEFAULT NULL,
  `Fault_PRIO_230_Group_2` float DEFAULT NULL,
  `Fault_PRIO_350_Group_3` float DEFAULT NULL,
  `Fault_PROG_046_Group_1` float DEFAULT NULL,
  `Fault_PROG_046_Group_2` float DEFAULT NULL,
  `Fault_PROG_046_Group_3` float DEFAULT NULL,
  `Fault_PROG_048_Group_1` float DEFAULT NULL,
  `Fault_PROG_048_Group_2` float DEFAULT NULL,
  `Fault_PROG_048_Group_3` float DEFAULT NULL,
  `Fault_Problem_with_BR_clinch_Former` float DEFAULT NULL,
  `Fault_Problem_with_DS_clinch_Former` float DEFAULT NULL,
  `Fault_Problem_with_U_Former` float DEFAULT NULL,
  `Fault_Problem_with_US_clinch_Former` float DEFAULT NULL,
  `Fault_Problem_with_scroll_band_nest_Former` float DEFAULT NULL,
  `Fault_Problem_with_â€˜Uâ€™_Former` float DEFAULT NULL,
  `Fault_R_E_S_E_T_Group_1` float DEFAULT NULL,
  `Fault_SRVO_001_Group_2` float DEFAULT NULL,
  `Fault_SRVO_001_Group_3` float DEFAULT NULL,
  `Fault_SRVO_002_Group_1` float DEFAULT NULL,
  `Fault_SRVO_002_Group_2` float DEFAULT NULL,
  `Fault_SRVO_002_Group_3` float DEFAULT NULL,
  `Fault_SRVO_004_Group_1` float DEFAULT NULL,
  `Fault_SRVO_004_Group_2` float DEFAULT NULL,
  `Fault_SRVO_004_Group_3` float DEFAULT NULL,
  `Fault_SRVO_007_Group_1` float DEFAULT NULL,
  `Fault_SRVO_007_Group_2` float DEFAULT NULL,
  `Fault_SRVO_007_Group_3` float DEFAULT NULL,
  `Fault_SRVO_012_Group_1` float DEFAULT NULL,
  `Fault_SRVO_012_Group_2` float DEFAULT NULL,
  `Fault_SRVO_012_Group_3` float DEFAULT NULL,
  `Fault_SRVO_021_Group_2` float DEFAULT NULL,
  `Fault_SRVO_021_Group_3` float DEFAULT NULL,
  `Fault_SRVO_023_Group_1` float DEFAULT NULL,
  `Fault_SRVO_023_Group_2` float DEFAULT NULL,
  `Fault_SRVO_023_Group_3` float DEFAULT NULL,
  `Fault_SRVO_024_Group_1` float DEFAULT NULL,
  `Fault_SRVO_024_Group_2` float DEFAULT NULL,
  `Fault_SRVO_024_Group_3` float DEFAULT NULL,
  `Fault_SRVO_035_Group_3` float DEFAULT NULL,
  `Fault_SRVO_036_Group_2` float DEFAULT NULL,
  `Fault_SRVO_037_Group_1` float DEFAULT NULL,
  `Fault_SRVO_037_Group_2` float DEFAULT NULL,
  `Fault_SRVO_037_Group_3` float DEFAULT NULL,
  `Fault_SRVO_046_Group_1` float DEFAULT NULL,
  `Fault_SRVO_046_Group_2` float DEFAULT NULL,
  `Fault_SRVO_046_Group_3` float DEFAULT NULL,
  `Fault_SRVO_047_Group_2` float DEFAULT NULL,
  `Fault_SRVO_047_Group_3` float DEFAULT NULL,
  `Fault_SRVO_050_Group_1` float DEFAULT NULL,
  `Fault_SRVO_050_Group_2` float DEFAULT NULL,
  `Fault_SRVO_050_Group_3` float DEFAULT NULL,
  `Fault_SRVO_056_Group_2` float DEFAULT NULL,
  `Fault_SRVO_057_Group_2` float DEFAULT NULL,
  `Fault_SRVO_065_Group_2` float DEFAULT NULL,
  `Fault_SRVO_065_Group_3` float DEFAULT NULL,
  `Fault_SRVO_106_Group_1` float DEFAULT NULL,
  `Fault_SRVO_106_Group_2` float DEFAULT NULL,
  `Fault_SRVO_106_Group_3` float DEFAULT NULL,
  `Fault_SRVO_115_Group_2` float DEFAULT NULL,
  `Fault_SRVO_115_Group_3` float DEFAULT NULL,
  `Fault_SRVO_156_Group_2` float DEFAULT NULL,
  `Fault_SRVO_199_Group_1` float DEFAULT NULL,
  `Fault_SRVO_199_Group_2` float DEFAULT NULL,
  `Fault_SRVO_199_Group_3` float DEFAULT NULL,
  `Fault_SRVO_236_Group_1` float DEFAULT NULL,
  `Fault_SRVO_236_Group_2` float DEFAULT NULL,
  `Fault_SRVO_248_Group_1` float DEFAULT NULL,
  `Fault_SRVO_248_Group_2` float DEFAULT NULL,
  `Fault_SRVO_252_Group_2` float DEFAULT NULL,
  `Fault_SRVO_301_Group_1` float DEFAULT NULL,
  `Fault_SRVO_301_Group_2` float DEFAULT NULL,
  `Fault_SRVO_301_Group_3` float DEFAULT NULL,
  `Fault_SRVO_303_Group_2` float DEFAULT NULL,
  `Fault_SRVO_335_Group_3` float DEFAULT NULL,
  `Fault_SRVO_450_Group_2` float DEFAULT NULL,
  `Fault_SRVO_450_Group_3` float DEFAULT NULL,
  `Fault_SSPC_001_Group_1` float DEFAULT NULL,
  `Fault_SSPC_001_Group_2` float DEFAULT NULL,
  `Fault_SSPC_006_Group_1` float DEFAULT NULL,
  `Fault_SSPC_006_Group_2` float DEFAULT NULL,
  `Fault_SYST_001_Group_1` float DEFAULT NULL,
  `Fault_SYST_011_Group_1` float DEFAULT NULL,
  `Fault_SYST_011_Group_2` float DEFAULT NULL,
  `Fault_SYST_011_Group_3` float DEFAULT NULL,
  `Fault_SYST_026_Group_3` float DEFAULT NULL,
  `Fault_SYST_034_Group_1` float DEFAULT NULL,
  `Fault_SYST_034_Group_2` float DEFAULT NULL,
  `Fault_SYST_034_Group_3` float DEFAULT NULL,
  `Fault_SYST_035_Group_1` float DEFAULT NULL,
  `Fault_SYST_035_Group_2` float DEFAULT NULL,
  `Fault_SYST_035_Group_3` float DEFAULT NULL,
  `Fault_SYST_042_Group_1` float DEFAULT NULL,
  `Fault_SYST_042_Group_2` float DEFAULT NULL,
  `Fault_SYST_042_Group_3` float DEFAULT NULL,
  `Fault_SYST_176_Group_1` float DEFAULT NULL,
  `Fault_SYST_176_Group_2` float DEFAULT NULL,
  `Fault_SYST_176_Group_3` float DEFAULT NULL,
  `Fault_SYST_178_Group_1` float DEFAULT NULL,
  `Fault_SYST_178_Group_2` float DEFAULT NULL,
  `Fault_SYST_178_Group_3` float DEFAULT NULL,
  `Fault_SYST_179_Group_1` float DEFAULT NULL,
  `Fault_SYST_179_Group_2` float DEFAULT NULL,
  `Fault_SYST_179_Group_3` float DEFAULT NULL,
  `Fault_SYST_213_Group_3` float DEFAULT NULL,
  `Fault_SYST_222_Group_1` float DEFAULT NULL,
  `Fault_SYST_222_Group_2` float DEFAULT NULL,
  `Fault_SYST_223_Group_3` float DEFAULT NULL,
  `Fault_SYST_302_Group_3` float DEFAULT NULL,
  `Fault_SYST_305_Group_1` float DEFAULT NULL,
  `Fault_SYST_305_Group_2` float DEFAULT NULL,
  `Fault_SYST_305_Group_3` float DEFAULT NULL,
  `Fault_Scroll_band_not_at_wait_Former` float DEFAULT NULL,
  `Fault_TPIF_014_Group_3` float DEFAULT NULL,
  `Fault_TPIF_047_Group_3` float DEFAULT NULL,
  `Fault_TPIF_053_Group_2` float DEFAULT NULL,
  `Fault_TPIF_053_Group_3` float DEFAULT NULL,
  `Fault_TPIF_104_Group_1` float DEFAULT NULL,
  `Fault_TPIF_104_Group_2` float DEFAULT NULL,
  `Fault_TPIF_104_Group_3` float DEFAULT NULL,
  `Fault_TPIF_106_Group_1` float DEFAULT NULL,
  `Fault_TPIF_106_Group_2` float DEFAULT NULL,
  `Fault_TPIF_106_Group_3` float DEFAULT NULL,
  `Fault_TPIF_149_Group_1` float DEFAULT NULL,
  `Fault_TPIF_149_Group_2` float DEFAULT NULL,
  `Fault_TPIF_149_Group_3` float DEFAULT NULL,
  `Fault_TPIF_218_Group_3` float DEFAULT NULL,
  `Fault_TPIF_238_Group_2` float DEFAULT NULL,
  `Fault_TPIF_243_Group_1` float DEFAULT NULL,
  `Fault_TPIF_243_Group_2` float DEFAULT NULL,
  `Fault_TPIF_243_Group_3` float DEFAULT NULL,
  `Fault_Tox_Group_3` float DEFAULT NULL,
  `Fault_UL_Sticker_Missing_Group_3` float DEFAULT NULL,
  `Fault_Walking_beam_not_home_Former` float DEFAULT NULL,
  `Group_Former` float DEFAULT NULL,
  `Group_Group_1` float DEFAULT NULL,
  `Group_Group_2` float DEFAULT NULL,
  `Group_Group_3` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refined_powerbi`
--

DROP TABLE IF EXISTS `refined_powerbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refined_powerbi` (
  `Hours` text,
  `Shift` float DEFAULT NULL,
  `_hours` float DEFAULT NULL,
  `SKU` text,
  `Downtime` text,
  `Downtime_Minutes` float DEFAULT NULL,
  `Estimated_Downtime` float DEFAULT NULL,
  `Comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remedy`
--

DROP TABLE IF EXISTS `remedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remedy` (
  `codes` text,
  `Cause` text,
  `Remedy` text,
  `New_Name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `checklist`
--

/*!50001 DROP VIEW IF EXISTS `checklist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `checklist` AS select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault MOTN 017' AS `Fault`,`events`.`Fault_MOTN_017_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault MOTN 018' AS `Fault`,`events`.`Fault_MOTN_018_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 023' AS `Fault`,`events`.`Fault_SRVO_023_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 046' AS `Fault`,`events`.`Fault_SRVO_046_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 248' AS `Fault`,`events`.`Fault_SRVO_248_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 024' AS `Fault`,`events`.`Fault_SRVO_024_Group_1` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G1') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault CPMO 130' AS `Fault`,`events`.`Fault_CPMO_130_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault MOTN 017' AS `Fault`,`events`.`Fault_MOTN_017_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 047' AS `Fault`,`events`.`Fault_SRVO_047_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 046' AS `Fault`,`events`.`Fault_SRVO_046_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 050' AS `Fault`,`events`.`Fault_SRVO_050_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 115' AS `Fault`,`events`.`Fault_SRVO_115_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 248' AS `Fault`,`events`.`Fault_SRVO_248_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 450' AS `Fault`,`events`.`Fault_SRVO_450_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault JOG 013 A1' AS `Fault`,`events`.`Fault_JOG_013_Stroke_limit_G3_A1_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 024' AS `Fault`,`events`.`Fault_SRVO_024_Group_2` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G2') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault CPMO 130' AS `Fault`,`events`.`Fault_CPMO_130_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault MOTN 017' AS `Fault`,`events`.`Fault_MOTN_017_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 023' AS `Fault`,`events`.`Fault_SRVO_023_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 035' AS `Fault`,`events`.`Fault_SRVO_035_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 046' AS `Fault`,`events`.`Fault_SRVO_046_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 050' AS `Fault`,`events`.`Fault_SRVO_050_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 047' AS `Fault`,`events`.`Fault_SRVO_047_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 115' AS `Fault`,`events`.`Fault_SRVO_115_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 450' AS `Fault`,`events`.`Fault_SRVO_450_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault JOG 013 A5' AS `Fault`,`events`.`Fault_JOG_013_Stroke_limit_G1_A5_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault JOG 013 A6' AS `Fault`,`events`.`Fault_JOG_013_Stroke_limit_G1_A5_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault 30104' AS `Fault`,`events`.`Fault_30104_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault 30203' AS `Fault`,`events`.`Fault_30203_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault 30382' AS `Fault`,`events`.`Fault_30382_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault 30302' AS `Fault`,`events`.`Fault_30302_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault 30383' AS `Fault`,`events`.`Fault_30383_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault SRVO 024' AS `Fault`,`events`.`Fault_SRVO_024_Group_3` AS `Failure_Probability` from `events` where (`events`.`Location` = 'G3') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Exit Conveyor Full' AS `Fault`,`events`.`Fault_Exit_Conveyor_full_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Problem with BR Clinch' AS `Fault`,`events`.`Fault_Problem_with_BR_clinch_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Problem with DS Clinch' AS `Fault`,`events`.`Fault_Problem_with_DS_clinch_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Problem with U' AS `Fault`,`events`.`Fault_Problem_with_U_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Problem with US Clinch' AS `Fault`,`events`.`Fault_Problem_with_US_clinch_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') union all select `events`.`Eventid` AS `Eventid`,`events`.`Location` AS `Location`,'Fault Problem with Scroll Band Nest' AS `Fault`,`events`.`Fault_Problem_with_scroll_band_nest_Former` AS `Failure_Probability` from `events` where (`events`.`Location` = 'Former') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `checklist_2`
--

/*!50001 DROP VIEW IF EXISTS `checklist_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `checklist_2` AS select distinct `cl`.`Eventid` AS `Eventid`,`cl`.`Location` AS `Location`,`cl`.`Fault` AS `Fault`,`cl`.`Failure_Probability` AS `Failure_Probability`,(case when (`cl`.`Failure_Probability` >= 0.5) then 'High' when (`cl`.`Failure_Probability` >= 0.3) then 'Medium' else 'Low' end) AS `Confidence`,`cr`.`Cause` AS `Cause`,`cr`.`Remedy` AS `Remedy` from (`checklist` `cl` left join `cause_and_remedy` `cr` on((`cr`.`Fault` = `cl`.`Fault`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cmb`
--

/*!50001 DROP VIEW IF EXISTS `cmb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cmb` AS select 1 AS `Timestamp`,1 AS `Fault_MOTN_017_Group_1`,1 AS `Fault_MOTN_018_Group_1`,1 AS `Fault_MOTN_231_Group_1`,1 AS `Fault_SRVO_023_Group_1`,1 AS `Fault_SRVO_046_Group_1`,1 AS `Fault_SRVO_248_Group_1`,1 AS `Fault_SRVO_024_Group_1`,1 AS `Group1_Binary`,1 AS `Fault_CPMO_130_Group_2`,1 AS `Fault_MOTN_017_Group_2`,1 AS `Fault_MOTN_231_Group_2`,1 AS `Fault_SRVO_023_Group_2`,1 AS `Fault_SRVO_046_Group_2`,1 AS `Fault_SRVO_047_Group_2`,1 AS `Fault_SRVO_050_Group_2`,1 AS `Fault_SRVO_115_Group_2`,1 AS `Fault_SRVO_248_Group_2`,1 AS `Fault_SRVO_450_Group_2`,1 AS `Fault_JOG_013_Stroke_limit_G3_A1_Group_2`,1 AS `Fault_SRVO_024_Group_2`,1 AS `Group2_Binary`,1 AS `Fault_CPMO_130_Group_3`,1 AS `Fault_MOTN_017_Group_3`,1 AS `Fault_MOTN_231_Group_3`,1 AS `Fault_SRVO_023_Group_3`,1 AS `Fault_SRVO_035_Group_3`,1 AS `Fault_SRVO_046_Group_3`,1 AS `Fault_SRVO_047_Group_3`,1 AS `Fault_SRVO_050_Group_3`,1 AS `Fault_SRVO_115_Group_3`,1 AS `Fault_SYST_035_Group_3`,1 AS `Fault_SRVO_450_Group_3`,1 AS `Fault_JOG_013_Stroke_limit_G1_A5_Group_3`,1 AS `Fault_JOG_013_Stroke_limit_G2_A6_Group_3`,1 AS `Fault_30104_Group_3`,1 AS `Fault_30203_Group_3`,1 AS `Fault_30302_Group_3`,1 AS `Fault_30382_Group_3`,1 AS `Fault_30383_Group_3`,1 AS `Fault_SRVO_024_Group_3`,1 AS `Group3_Binary`,1 AS `Fault_Exit_Conveyor_full_Former`,1 AS `Fault_Problem_with_BR_clinch_Former`,1 AS `Fault_Problem_with_DS_clinch_Former`,1 AS `Fault_Problem_with_U_Former`,1 AS `Fault_Problem_with_US_clinch_Former`,1 AS `Fault_Problem_with_scroll_band_nest_Former`,1 AS `Former_Binary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_events`
--

/*!50001 DROP VIEW IF EXISTS `latest_events`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_events` AS select `events`.`Location` AS `Location`,max(`events`.`Hours`) AS `Hours` from `events` group by `events`.`Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_events_full`
--

/*!50001 DROP VIEW IF EXISTS `latest_events_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_events_full` AS select `events`.`Hours` AS `Hours`,`events`.`Calendar_date` AS `Calendar_date`,`events`.`Severity` AS `Severity`,`events`.`Location` AS `Location`,`events`.`Failure_Probability` AS `Failure_Probability`,`events`.`Fault_MOTN_017_Group_1` AS `Fault_MOTN_017_Group_1`,`events`.`Fault_MOTN_018_Group_1` AS `Fault_MOTN_018_Group_1`,`events`.`Fault_MOTN_231_Group_1` AS `Fault_MOTN_231_Group_1`,`events`.`Fault_SRVO_023_Group_1` AS `Fault_SRVO_023_Group_1`,`events`.`Fault_SRVO_046_Group_1` AS `Fault_SRVO_046_Group_1`,`events`.`Fault_SRVO_248_Group_1` AS `Fault_SRVO_248_Group_1`,`events`.`Fault_SRVO_024_Group_1` AS `Fault_SRVO_024_Group_1`,`events`.`Fault_CPMO_130_Group_2` AS `Fault_CPMO_130_Group_2`,`events`.`Fault_MOTN_017_Group_2` AS `Fault_MOTN_017_Group_2`,`events`.`Fault_MOTN_231_Group_2` AS `Fault_MOTN_231_Group_2`,`events`.`Fault_SRVO_023_Group_2` AS `Fault_SRVO_023_Group_2`,`events`.`Fault_SRVO_046_Group_2` AS `Fault_SRVO_046_Group_2`,`events`.`Fault_SRVO_047_Group_2` AS `Fault_SRVO_047_Group_2`,`events`.`Fault_SRVO_050_Group_2` AS `Fault_SRVO_050_Group_2`,`events`.`Fault_SRVO_115_Group_2` AS `Fault_SRVO_115_Group_2`,`events`.`Fault_SRVO_248_Group_2` AS `Fault_SRVO_248_Group_2`,`events`.`Fault_SRVO_450_Group_2` AS `Fault_SRVO_450_Group_2`,`events`.`Fault_JOG_013_Stroke_limit_G3_A1_Group_2` AS `Fault_JOG_013_Stroke_limit_G3_A1_Group_2`,`events`.`Fault_SRVO_024_Group_2` AS `Fault_SRVO_024_Group_2`,`events`.`Fault_CPMO_130_Group_3` AS `Fault_CPMO_130_Group_3`,`events`.`Fault_MOTN_017_Group_3` AS `Fault_MOTN_017_Group_3`,`events`.`Fault_MOTN_231_Group_3` AS `Fault_MOTN_231_Group_3`,`events`.`Fault_SRVO_023_Group_3` AS `Fault_SRVO_023_Group_3`,`events`.`Fault_SRVO_035_Group_3` AS `Fault_SRVO_035_Group_3`,`events`.`Fault_SRVO_046_Group_3` AS `Fault_SRVO_046_Group_3`,`events`.`Fault_SRVO_047_Group_3` AS `Fault_SRVO_047_Group_3`,`events`.`Fault_SRVO_050_Group_3` AS `Fault_SRVO_050_Group_3`,`events`.`Fault_SRVO_115_Group_3` AS `Fault_SRVO_115_Group_3`,`events`.`Fault_SYST_035_Group_3` AS `Fault_SYST_035_Group_3`,`events`.`Fault_SRVO_450_Group_3` AS `Fault_SRVO_450_Group_3`,`events`.`Fault_JOG_013_Stroke_limit_G1_A5_Group_3` AS `Fault_JOG_013_Stroke_limit_G1_A5_Group_3`,`events`.`Fault_JOG_013_Stroke_limit_G2_A6_Group_3` AS `Fault_JOG_013_Stroke_limit_G2_A6_Group_3`,`events`.`Fault_30104_Group_3` AS `Fault_30104_Group_3`,`events`.`Fault_30203_Group_3` AS `Fault_30203_Group_3`,`events`.`Fault_30302_Group_3` AS `Fault_30302_Group_3`,`events`.`Fault_30382_Group_3` AS `Fault_30382_Group_3`,`events`.`Fault_30383_Group_3` AS `Fault_30383_Group_3`,`events`.`Fault_SRVO_024_Group_3` AS `Fault_SRVO_024_Group_3`,`events`.`Fault_Exit_Conveyor_full_Former` AS `Fault_Exit_Conveyor_full_Former`,`events`.`Fault_Problem_with_BR_clinch_Former` AS `Fault_Problem_with_BR_clinch_Former`,`events`.`Fault_Problem_with_DS_clinch_Former` AS `Fault_Problem_with_DS_clinch_Former`,`events`.`Fault_Problem_with_U_Former` AS `Fault_Problem_with_U_Former`,`events`.`Fault_Problem_with_US_clinch_Former` AS `Fault_Problem_with_US_clinch_Former`,`events`.`Fault_Problem_with_scroll_band_nest_Former` AS `Fault_Problem_with_scroll_band_nest_Former`,`events`.`Eventid` AS `Eventid`,`events`.`Manage` AS `Manage`,`events`.`Actions` AS `Actions`,`events`.`Comments` AS `Comments`,`events`.`Expert_Remedy` AS `Expert_Remedy`,`events`.`Status` AS `Status`,`events`.`Last_Updated` AS `Last_Updated` from (`events` join `latest_events` on(((`events`.`Location` = `latest_events`.`Location`) and (`events`.`Hours` = `latest_events`.`Hours`)))) */;
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

-- Dump completed on 2022-09-06 12:29:47

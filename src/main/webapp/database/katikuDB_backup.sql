--first things first create a database user called prog with password netsh.

/*Log in to MariaDB on the target machine:

mysql -u prog -p
Enter your MariaDB password. #(which is "netsh")
Create a New Database:

CREATE DATABASE katikuDB;

Import the SQL Dump File:

mysql -u prog -p katikuDB < /path/to/this/katikuDB_backup.spl

Enter your MariaDB password. #(which is "netsh")

*/


-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: katikuDB
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Airlines`
--

DROP TABLE IF EXISTS `Airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airlines` (
  `AirlineCode` varchar(3) NOT NULL,
  `AirlineName` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AirlineCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airlines`
--

LOCK TABLES `Airlines` WRITE;
/*!40000 ALTER TABLE `Airlines` DISABLE KEYS */;
INSERT INTO `Airlines` VALUES
('001','Kenya Airways','Kenya','kenyaairways.png'),
('AA','American Airlines','United States','americanairlines.jpg'),
('AF','Air France','France','airfrance.png'),
('BA','British Airways','United Kingdom','britishairways.png');
/*!40000 ALTER TABLE `Airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airports`
--

DROP TABLE IF EXISTS `Airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airports` (
  `AirportCode` varchar(3) NOT NULL,
  `airport_name` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AirportCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airports`
--

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;
INSERT INTO `Airports` VALUES
('001','Jomo Kenyatta International Airport','Nairobi','Kenya'),
('002','John F. Kennedy International Airport','New york','U.S.A'),
('CDG','Charles de Gaulle Airport','Paris','France'),
('JFK','John F. Kennedy International Airport','New York City','United States'),
('LAX','Los Angeles International Airport','Los Angeles','United States'),
('LHR','Heathrow Airport','London','United Kingdom');
/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `exit_date` date NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`),
  CONSTRAINT `Bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cars`
--

DROP TABLE IF EXISTS `Cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `car_make` varchar(50) DEFAULT NULL,
  `car_model` varchar(50) DEFAULT NULL,
  `car_gearbox` varchar(10) DEFAULT NULL,
  `car_year` int(11) DEFAULT NULL,
  `car_color` varchar(20) DEFAULT NULL,
  `car_type` varchar(50) DEFAULT NULL,
  `car_price_per_day` decimal(10,2) DEFAULT NULL,
  `car_availability` tinyint(1) DEFAULT NULL,
  `car_image` varchar(100) DEFAULT NULL,
  `car_seaters` int(11) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `Cars_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `RentalCompany` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cars`
--

LOCK TABLES `Cars` WRITE;
/*!40000 ALTER TABLE `Cars` DISABLE KEYS */;
INSERT INTO `Cars` VALUES
(1,5,'Toyota','Camry','Automatic',2020,'Silver','Sedan',50.00,0,'camry2020.jpg',5),
(2,6,'Honda','Accord','Automatic',2019,'Black','Sedan',55.00,1,'accord2019.jpg',4),
(3,2,'Ford','Explorer','Automatic',2021,'White','SUV',65.00,1,'explorer2021.jpg',7),
(4,2,'Chevrolet','Malibu','Automatic',2018,'Red','Sedan',60.00,1,'malibu2018.jpg',4),
(5,3,'Toyota','Camry','Automatic',2020,'Silver','Sedan',50.00,1,'camry2020.jpg',5),
(6,4,'Honda','Accord','Automatic',2019,'White','Sedan',55.00,0,'accord2019.jpg',4);
/*!40000 ALTER TABLE `Cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightClasses`
--

DROP TABLE IF EXISTS `FlightClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightClasses` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightClasses`
--

LOCK TABLES `FlightClasses` WRITE;
/*!40000 ALTER TABLE `FlightClasses` DISABLE KEYS */;
INSERT INTO `FlightClasses` VALUES
(1,'Economy'),
(2,'First'),
(3,'Premium-economy'),
(4,'Business');
/*!40000 ALTER TABLE `FlightClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flights` (
  `FlightNumber` varchar(10) NOT NULL,
  `AirlineCode` varchar(3) DEFAULT NULL,
  `DepartureAirportCode` varchar(3) DEFAULT NULL,
  `ArrivalAirportCode` varchar(3) DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FlightNumber`),
  KEY `fk_airline` (`AirlineCode`),
  KEY `fk_departure_airport` (`DepartureAirportCode`),
  KEY `fk_arrival_airport` (`ArrivalAirportCode`),
  KEY `fk_class` (`ClassID`),
  CONSTRAINT `fk_airline` FOREIGN KEY (`AirlineCode`) REFERENCES `Airlines` (`AirlineCode`),
  CONSTRAINT `fk_arrival_airport` FOREIGN KEY (`ArrivalAirportCode`) REFERENCES `Airports` (`AirportCode`),
  CONSTRAINT `fk_class` FOREIGN KEY (`ClassID`) REFERENCES `FlightClasses` (`ClassID`),
  CONSTRAINT `fk_departure_airport` FOREIGN KEY (`DepartureAirportCode`) REFERENCES `Airports` (`AirportCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
INSERT INTO `Flights` VALUES
('1','001','001','002','2024-03-27 08:00:00','2024-03-27 15:00:00',1000.00,2),
('AA123','AA','JFK','LAX','2024-04-01 08:00:00','2024-04-01 11:00:00',250.00,1),
('AF789','AF','CDG','JFK','2024-04-01 14:00:00','2024-04-01 17:00:00',400.00,3),
('BA456','BA','LHR','CDG','2024-04-01 10:00:00','2024-04-01 12:00:00',300.00,2);
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES
(1,'Njoro'),
(2,'Eldoret'),
(3,'Kasarani'),
(4,'Kitengela');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalCompany`
--

DROP TABLE IF EXISTS `RentalCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RentalCompany` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_location` varchar(30) DEFAULT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `street_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalCompany`
--

LOCK TABLES `RentalCompany` WRITE;
/*!40000 ALTER TABLE `RentalCompany` DISABLE KEYS */;
INSERT INTO `RentalCompany` VALUES
(1,'Nairobi','blackcarrental.png','Black Car Rental','Westlands'),
(2,'New York City','budget.jpeg','Budget','4th street'),
(3,'New York City','nycautorentals.png','New York Auto Rentals','New York Time Squire'),
(4,'New York City','blackcarrental.png','Black Car Rental','Westlands'),
(5,'New York City','nycautorentals.png','New York Auto Rentals','Westlands'),
(6,'New York City','budget.jpeg','Budget','4th street');
/*!40000 ALTER TABLE `RentalCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_images`
--

DROP TABLE IF EXISTS `Room_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `image_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_images`
--

LOCK TABLES `Room_images` WRITE;
/*!40000 ALTER TABLE `Room_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) NOT NULL,
  `available` int(11) DEFAULT 1,
  `number_of_rooms` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES
(1,'Nest',1,1,'luxarious','Njoro',0,NULL,NULL,NULL),
(2,'Baroda',0,2,'spacious','Kasarani',0,NULL,NULL,NULL),
(3,'Annex',1,2,'boujee','Nandi',0,NULL,NULL,NULL),
(4,'oslo',1,2,'very spacious and luxarious rooms','Nairobi',1000,'37171db0-de6b-4fd2-aad7-b06f50439cdd_oslo.jpg','3a437063-9beb-4a16-bfa8-5d1e89c71a3b_oslo.jpg','450d1932-0773-4624-91dc-61c301ff0fec_oslo.jpg'),
(5,'ohio',1,2,'nice and cozy','magunas',1000,'ac50f588-f71e-4b78-a8fa-fb9cf9826e3c_ohio.jpg','bfdede65-acd5-4ba2-9290-b2eee28c1eb2_ohio.jpg','ce23c37a-b59d-4965-b15f-e3d0ab67ef28_ohio.jpg'),
(6,'wembley',1,1,'very spacious and luxariouds','umoja',2000,'66ff6679-a33e-4876-aab9-b7aa06a48d15_wembley.jpg','83d60a4b-e2ba-4c0a-b9cd-99ad03f2e4f3_wembley.jpg','0cdb3472-d1b3-4f5b-889c-f7374224c166_wembley.jpg'),
(7,'wembley',1,1,'very spacious and luxariouds','umoja',2000,'54a3ab5f-9094-4a55-8ff4-e121ac963bf9_wembley.jpg','a0ee84cd-ec79-4b6f-bd02-d5e7d0c1b5c8_wembley.jpg','fdc8a5d9-4704-4c2e-a094-b07890d93bd0_wembley.jpg'),
(8,'kentu',1,5,'dadadsafdd','naske',10000,'27db5e45-7eca-47f8-b0aa-3e500847619d_kentu.jpg','23276dbf-3df1-4f95-9e87-402ffac2a085_kentu.jpg','6f625304-cbd7-4751-a565-439801d3409e_kentu.jpg'),
(9,'Mamboleo1',1,2,'spacious and luxarious','Njoro',1000,'2023-12-30-182332.jpg','2023-12-30-182343.jpg','2023-12-30-182451.jpg'),
(10,'alrone',1,2,'boujee and exclusive','Nakuru',2000,'2023-12-30-182343.jpg','2023-12-30-182343.jpg','2023-12-30-182355.jpg'),
(11,'alrone',1,2,'boujee and exclusive','Nakuru',2000,'2023-12-30-182343.jpg','2023-12-30-182343.jpg','2023-12-30-182355.jpg'),
(12,'alrone',1,2,'boujee and exclusive','Nakuru',2000,'2023-12-30-182343.jpg','2023-12-30-182343.jpg','2023-12-30-182355.jpg'),
(13,'Malibu',1,1,'for the excussives','london',3000,'2023-12-30-182332.jpg','2023-12-30-182343.jpg','2023-12-30-182451.jpg'),
(14,'mongolian',1,2,'home to many','wakali',200,'2023-12-30-182332.jpg','2023-12-30-182522.jpg','2023-12-30-182451.jpg'),
(15,'sd',1,2,'dd','dd',10,'2023-12-30-182522.jpg','2023-12-30-182451.jpg','2023-12-30-182355.jpg'),
(16,'dddd',1,4,'dfff','df',45,'2023-12-30-182548.jpg','2023-12-30-182451.jpg','2023-12-30-182522.jpg'),
(17,'dddd',1,4,'dfff','df',45,'2023-12-30-182548.jpg','2023-12-30-182451.jpg','2023-12-30-182522.jpg'),
(18,'dddd',1,4,'dfff','df',45,'2023-12-30-182548.jpg','2023-12-30-182451.jpg','2023-12-30-182522.jpg'),
(19,'dd',1,2,'s','s',1,'2023-12-30-182548.jpg','2023-12-30-182522.jpg','2023-12-30-182332.jpg'),
(20,'sally',1,2,'breezing','Mombasa',10000,'IMG_20220314_174418_928.jpg','wallpaperflare.com_wallpaper.jpg','wallpaperflare.com_wallpaper (1).jpg'),
(21,'yobra',1,2,'aljkdjljal','kite',1000,'wallpaperflare.com_wallpaper.jpg','wallpaperflare.com_wallpaper (1).jpg','IMG_20220314_174418_928.jpg'),
(22,'yobra',1,2,'aljkdjljal','kite',1000,'wallpaperflare.com_wallpaper.jpg','wallpaperflare.com_wallpaper (1).jpg','IMG_20220314_174418_928.jpg'),
(23,'JUJU',1,1,'fit','nyeri',2000,'Cream Elegance_ Modern Luxury in Living Room Design _ FH.jpeg','Home Decor Ideas_ Inject the ‘Nowness’ with Designer’s Insights.jpeg','Home entrance decoration wall decoration Home design Home decor furniture design Home entrance deco.jpeg'),
(24,'numberone',1,1,'nice','mwihoko',500,'Cream Elegance_ Modern Luxury in Living Room Design _ FH.jpeg','2023-12-30-182332.jpg','IMG_20220314_174418_928.jpg'),
(25,'aris',1,1,'nice','jet',90,'IMG_20220314_174418_928.jpg','wallpaperflare.com_wallpaper.jpg','2023-12-30-182451.jpg'),
(26,'cbd',0,1,'spacious and luxarious','Kajiado',2000,'Home Decor Ideas_ Inject the ‘Nowness’ with Designer’s Insights.jpeg','Cream Elegance_ Modern Luxury in Living Room Design _ FH.jpeg','Selecting Lighting Fixtures.jpeg'),
(27,'cbd',1,1,'spacious and luxarious','Kajiado',2000,'Home Decor Ideas_ Inject the ‘Nowness’ with Designer’s Insights.jpeg','Cream Elegance_ Modern Luxury in Living Room Design _ FH.jpeg','Selecting Lighting Fixtures.jpeg');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `passkey` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES
(1,'Brian','Waweru','bwaweru408@gmail.com','Yobra','waweru2883'),
(2,'Camila','Aoko','camilaaoko222@gmail.com','camila11','camila11'),
(3,'Brenda','Jerono','brendajerono001@gmail.com','brendaj','brendaj11');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES
(1,1),
(2,2);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_rentals`
--

DROP TABLE IF EXISTS `car_rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_rentals` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `car_id` varchar(255) DEFAULT NULL,
  `pickup_location` varchar(255) DEFAULT NULL,
  `pickup_date` datetime DEFAULT NULL,
  `dropoff_date` datetime DEFAULT NULL,
  `rental_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rental_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `car_rentals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_rentals`
--

LOCK TABLES `car_rentals` WRITE;
/*!40000 ALTER TABLE `car_rentals` DISABLE KEYS */;
INSERT INTO `car_rentals` VALUES
(1,2,'3','New York City','2024-04-22 03:03:00','2024-04-25 03:03:00','2024-04-21 18:47:07'),
(2,2,'1','New York City','2024-04-22 03:03:00','2024-04-25 03:03:00','2024-04-21 18:47:59'),
(3,2,'6','New York City','2024-04-01 08:00:00','2024-04-15 18:08:00','2024-04-21 19:03:11'),
(4,2,'2','New York City','2024-04-22 08:00:00','2024-04-15 08:00:00','2024-04-22 11:33:42'),
(5,1,'5','New York City','2024-04-24 06:00:00','2024-04-26 07:00:00','2024-04-23 23:35:12'),
(6,1,'1','New York City','2024-04-24 08:00:00','2024-04-26 07:00:00','2024-04-24 05:28:25'),
(7,1,'6','New York City','2024-03-24 08:00:00','2024-03-30 09:00:00','2024-04-24 06:18:43');
/*!40000 ALTER TABLE `car_rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightsbooked`
--

DROP TABLE IF EXISTS `flightsbooked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightsbooked` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `FlightNumber` varchar(10) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `departure_city` varchar(255) NOT NULL,
  `departure_country` varchar(255) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_city` varchar(255) NOT NULL,
  `arrival_country` varchar(255) NOT NULL,
  `arrival_time` datetime NOT NULL,
  `flight_class` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `FlightNumber` (`FlightNumber`),
  CONSTRAINT `flightsbooked_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `flightsbooked_ibfk_2` FOREIGN KEY (`FlightNumber`) REFERENCES `Flights` (`FlightNumber`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightsbooked`
--

LOCK TABLES `flightsbooked` WRITE;
/*!40000 ALTER TABLE `flightsbooked` DISABLE KEYS */;
INSERT INTO `flightsbooked` VALUES
(1,2,'AA123','A1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(2,2,'AA123','A2','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(3,2,'AA123','B1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(4,2,'AA123','B1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(5,2,'AA123','B1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(6,2,'AA123','B1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(7,2,'AA123','D2','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(8,1,'AA123','B2','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(9,1,'AA123','C2','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(10,1,'AA123','C2','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00),
(11,4,'AA123','C1','New York City','United States','2024-04-01 08:00:00','Los Angeles','United States','2024-04-01 11:00:00','Economy',250.00);
/*!40000 ALTER TABLE `flightsbooked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `FlightNumber` varchar(10) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `availability` enum('Available','Booked','Occupied') NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`seat_id`),
  KEY `fk_flight_number` (`FlightNumber`),
  CONSTRAINT `fk_flight_number` FOREIGN KEY (`FlightNumber`) REFERENCES `Flights` (`FlightNumber`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES
(1,'AA123','A1','Booked'),
(2,'AA123','A2','Booked'),
(3,'AA123','B1','Booked'),
(4,'AA123','B2','Booked'),
(5,'AA123','C1','Booked'),
(6,'AA123','C2','Booked'),
(7,'AA123','D1','Available'),
(8,'AA123','D2','Booked');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stays_rentals`
--

DROP TABLE IF EXISTS `stays_rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stays_rentals` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `entry_date` date NOT NULL,
  `exit_date` date NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  `travelers` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `booking_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`rental_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_room_id` (`room_id`),
  CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stays_rentals`
--

LOCK TABLES `stays_rentals` WRITE;
/*!40000 ALTER TABLE `stays_rentals` DISABLE KEYS */;
INSERT INTO `stays_rentals` VALUES
(1,2,25,'2024-04-22','2024-04-23',1,'1',90,'2024-04-22 01:52:50'),
(2,2,25,'2024-04-22','2024-04-23',1,'1',90,'2024-04-22 01:53:33'),
(3,2,25,'2024-04-22','2024-04-23',1,'1',90,'2024-04-22 01:59:55'),
(4,2,25,'2024-04-23','2024-04-26',1,'1',90,'2024-04-22 02:08:54'),
(5,2,25,'2024-04-22','2024-04-24',1,'1',90,'2024-04-22 11:28:35'),
(6,1,26,'2024-04-24','2024-04-26',1,'1',2000,'2024-04-24 05:14:53');
/*!40000 ALTER TABLE `stays_rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'brayo','netsh','bwaweru408@gmail.com'),
(2,'wambui','wambui2883','bwaweru4s8@gmail.com'),
(3,'bigpoppa','12345678','brianwaweru157@gmail.com'),
(4,'maish','brianmaina2003','micakariuki@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 12:49:29

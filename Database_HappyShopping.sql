CREATE DATABASE  IF NOT EXISTS `happyshopping` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `happyshopping`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: happyshopping
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `bundle_products`
--

DROP TABLE IF EXISTS `bundle_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundle_products` (
  `bundle_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`bundle_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `bundle_products_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`bundle_id`),
  CONSTRAINT `bundle_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_products`
--

LOCK TABLES `bundle_products` WRITE;
/*!40000 ALTER TABLE `bundle_products` DISABLE KEYS */;
INSERT INTO `bundle_products` VALUES (1,1,1),(1,3,1),(1,5,2),(1,7,1),(1,12,2),(2,6,1),(2,16,1),(3,1,1),(3,2,1),(3,4,1),(3,6,1),(4,16,1),(4,17,1),(4,18,1),(4,19,1),(5,8,1),(5,9,1),(5,11,1),(6,16,1),(6,17,2),(6,18,1),(6,21,1),(6,23,1),(6,24,1),(7,16,2),(7,17,2),(7,18,1),(7,20,1),(7,29,1),(8,1,1),(8,3,1),(8,8,2),(8,9,2);
/*!40000 ALTER TABLE `bundle_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundles`
--

DROP TABLE IF EXISTS `bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bundles` (
  `bundle_id` int NOT NULL,
  `bundle_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `discounted_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`bundle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundles`
--

LOCK TABLES `bundles` WRITE;
/*!40000 ALTER TABLE `bundles` DISABLE KEYS */;
INSERT INTO `bundles` VALUES (1,'Family Feast Bundle','Enjoy a family meal with chicken, pasta, tomatoes, cheese, and bread.',19.99,7),(2,'Combo Delight Bundle','Experience productivity and relaxation with coffee and a notebook.',14.99,15),(3,'Breakfast Bundle','Start your day right with milk, eggs, bread, and coffee.',9.99,15),(4,'Office Starter Pack','Equip your workspace with pens, sticky notes, a notebook, and a stapler.',19.49,20),(5,'Healthy Snack Pack','Stay energized with a mix of fresh fruits: apple, orange, and banana.',2.49,10),(6,'Creativity Bundle','Fuel your creativity with a variety of stationery items.',26.49,25),(7,'Back-to-School Kit','Get ready for school with essential stationery and a healthy snack.',37.99,35),(8,'Picnic Essentials Bundle','Pack your picnic with a variety of items for a delightful day outdoors.',4.99,20);
/*!40000 ALTER TABLE `bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `total` double(8,2) DEFAULT NULL,
  `customer_id` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C_001','Lionel Messi','leomessi@gmail.com','leomessi','leomessi123'),('C_002','Cristiano Ronaldo','cr7@gmail.com','cr7','cr7123'),('C_003','Erling Haaland','haland@gmail.com','haland','haland123'),('C_004','Kylian Mbappe','mbappe@gmail.com','mbappe','mbappe123'),('C_005','Taylor Swift','taylorswift@gmail.com','taylor','taylor123'),('C_006','Selena Gomez','selenagomez@gmail.com','selena','selena123'),('C_007','Adam Levine','adamlevine@gmail.com','adamlev','adamlev123'),('C_008','Adele','adele@gmail.com','adele','adele123'),('C_009','Bruno Mars','bruomars@gmail.com','brunomars','brunomars123'),('C_010','Katy Perry','katyperry@gmail.com','katyperry','katyperry123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `price` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bread','Bread Talk','Grocery','Whole wheat bread, a good source of fiber',2.49,33),(2,'Milk','Dairy Delight','Grocery','Fresh whole milk, rich in vitamins and minerals',1.99,64),(3,'Cheese','Dairy Delight','Grocery','Sharp cheddar cheese, perfect for sandwiches or snacks',3,47),(4,'Egg','Green Farm','Grocery','Large brown eggs, enriched with omega-3 fatty acids',2.5,148),(5,'Pasta','Barilla','Grocery','Penne pasta, versatile for various pasta dishes',1,43),(6,'Coffee','Folgers','Grocery','Ground coffee, medium roast, for a rich and aromatic brew',8,75),(7,'Tomatoe','Organic Farms','Grocery','Campari tomatoes, sweet and flavorful for salads or cooking',2.99,47),(8,'Apple','Organic Farms','Grocery','Fresh red apples',1,100),(9,'Orange','Citrus World','Grocery','Juicy oranges',0.8,100),(10,'Lemon','Citrus World','Grocery','Fresh sour lemon',1.5,100),(11,'Banana','Organic Farms','Grocery','Ripe and fresh bananas, a quick and healthy snack',1.8,20),(12,'Chicken Breast','Fresh Foods','Grocery','Boneless, skinless chicken breasts, lean protein option',5.99,19),(13,'Salmon Fillet','Fresh Foods','Grocery','Wild-caught salmon fillet, a healthy source of omega-3 fatty acids',9.99,25),(14,'Ground Beef','Fresh Foods','Grocery','Ground beef for versatile cooking options like burgers and pasta',6.8,50),(15,'Lamb Chop','Fresh Foods','Grocery','Frenched lamb chops, a gourmet option for special occasions',11.99,24),(16,'Notebook','Paper Goods','Stationery','Hardcover notebook with high-quality paper, ideal for note-taking and journaling',9.99,96),(17,'Pen','Holy Ink','Stationery','Classic retractable ballpoint pen with a comfortable grip',1.99,200),(18,'Stapler','Officemate','Stationery','Desktop stapler with a comfortable grip and a capacity of 25 sheets',7.99,50),(19,'Sticky Notes','Paper Goods','Stationery','Assorted sizes and colors of sticky notes for reminders',2.99,79),(20,'Eraser','WriteWell','Stationery','High-quality eraser for precise erasing',1.29,120),(21,'Paper Clips','Officemate','Stationery','Rust-resistant jumbo-sized paper clips for organizing documents. (box of 100)',0.59,200),(22,'Binder','Paper Goods','Stationery','Durable three-ring binder with clear view cover for easy customization',4.99,100),(23,'Scissors','Fiskars','Stationery','Sharp and durable scissors with ergonomic handles for comfortable use',6.99,50),(24,'Correction Tape','WriteWell','Stationery','Easy-to-use correction tape for neat and clean corrections',2.99,200),(25,'Highlighters','Sharpie','Stationery','Set of vibrant highlighters for color-coding and emphasizing important information',4.49,80),(26,'Glue Stick','Elmer','Stationery','Washable glue stick for a mess-free bonding experience',0.99,200),(27,'Crayons','Crayola','Stationery','Box of colorful crayons for creative expression',2.99,50),(28,'Ruler','WriteWell','Stationery','12-inch clear acrylic ruler with metric and imperial measurements',1.79,100),(29,'Colored Pencils','Prismacolor','Stationery','Set of high-quality colored pencils for artistic creations',8.49,40),(30,'Rubber Bands','Alliance','Stationery','Pack of assorted rubber bands for bundling and organizing',0.99,150);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'happyshopping'
--

--
-- Dumping routines for database 'happyshopping'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-24 14:19:08

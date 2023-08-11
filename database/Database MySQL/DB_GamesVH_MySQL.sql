-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 143.198.197.235    Database: db_gamesvh
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `Fullname` varchar(255) DEFAULT NULL COMMENT 'Họ và tên',
  `Email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `Photo` varchar(255) DEFAULT '19dn5AWG9uCVzTpVWBFCOVvzPRv-ZXJlc',
  `Status` tinyint(1) NOT NULL,
  `Type` varchar(20) NULL,
  `access_token` varchar(255) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `account_Username_IX` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `account_Email_IX` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES 
(1,'cust','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Người dùng','cust@gmail.com','19dn5AWG9uCVzTpVWBFCOVvzPRv-ZXJlc',1,null,'fcb18b8b2c8344f521cda16ed026d9001b9bd3af618551e50541ef5176ef9675'),
(2,'dangkimchi','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Đặng Kim Chi','dangkimchi@gmail.com','1Aw286fMuNytVfHTSD1MLUUpBwMUYU4Az',1,null,'a5b0e1dbf292c08ebf756e2493356a2c3e8c832d2d63e0493d5c491a9f58dd0f'),
(3,'dire','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Quản Lý','dire@gmail.com','1kxbc_r065iD6ZkVINW58EGpMSOaPTPGE',1,null,'e0b6ff5ec58cb6e6f0c0183b43e539c20eac3804c372736567f2b1817b89f10a'),
(4,'hoangtunglam','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Hoàng Tùng Lâm','hoangtunglam@gmail.com','1rwmWHBOzxXqXrnLYJ0G2P1_5KIb2katm',1,null,'a8df78db19fba42e8d8912a76e214ebf6e38186e77ecb678bf0c69ca6639cf3c'),
(5,'lethithuy','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Lê Thị Thúy','lethithuy@gmail.com','1eBiX6_It1A0MRYNVzPGu2WEuCdH-M50g',1,null,'c56b1a1b411363b1e899c18ab29d684bd0f8629f0a9a6f0d489f1b7d9ff97b5b'),
(6,'lethuhien','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Lê Thùy Hiền','lethuhien@gmail.com','15QrawV63fYibvz6UImRCbvzuFs0FahGt',1,null,'d5a0a8a91c1cfa31b22e1cc2c5c9819b8a9b9053be71f61831f6a15a05a4a2f3'),
(7,'nguyenvana','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Nguyễn Văn A','nguyenvana@gmail.com','14vRzLnE4v17lBHF-E8LZ9tdP5xugc6MR',1,null,'ef3a7ed6ef4e8deebfd67b6f775de6b58ecf4ef63ee788f31a06f7cbdc74e12a'),
(8,'nguyenvanbao','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Nguyễn Văn Bảo','nguyenvanbao@gmail.com','1cy3kQHDU-VZbble9r_2bTLcRMcO3LiAx',1,null,'85cc1087e01e599da570c7e45daa6e1526c02f0763a34a0ac9fda5965952b7da'),
(9,'nguyenhongnhan','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Nguyễn Hồng Nhân','nguyenhongnhan@gmail.com','1kfG7FkXauCZNCVYa0ZUfhEIVrUxVNST0',0,null,'02c3da3b3e9a6a41a3ef6ea625c95e1e6ef47f071727c93e07b27c4a31ab4422'),
(10,'phamthuc','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Phạm Thục','phamthuc@gmail.com','1t7ZRl2PsEuDbhWlmDjZwzjjZxoH9LzEH',1,null,'b9b57ff41b0baf84e52c37f8f857a110af103e0e833d83e617e6364383f19ca7'),
(11,'staf','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Nhân Viên','sta@gmail.com','1y8wb4TrSUjmo_5acCdLWSFOMgjLkuob-',1,null,'4d7f0b3f77584e587ac42f779d9fc66b126a59eae40120a1a5e8f6b1b48ce15b'),
(12,'tranthanhthao','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Trần Thanh Thảo','tranthanhthao@gmail.com','1rXGPounLH06GtQcNX5dsK7gdzMQ2GIJi',1,null,'e56cfdaee6a1c8a9ee149d0f1bf364f3aaeac8bda9cc6d53473e65ac708e2a6b'),
(13,'tranvanb','$2a$10$k0VsnUtDVioLZce4zX6hAud8lyLhvTmOcW6bk6aN09YPDX7z7B9ee','Trần Văn B','tranvanb@gmail.com','15EQjB-tMsomENUWJ2lKD4nzrFa1AsMcK',0,null,'c3bca0f411938c7b13cbddfd1bcf4ef84056674fb0ac4c3d5c4ee313a55f257e');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `feedback_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_website` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL  COMMENT 'Nội dung',
  `create_date` datetime NOT NULL COMMENT 'Ngày tạo',
  `account_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_feedbackWebsite_Users` (`account_id`),
  CONSTRAINT `FK_feedbackWebsite_Users` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_website`
--

LOCK TABLES `feedback_website` WRITE;
/*!40000 ALTER TABLE `feedback_website` DISABLE KEYS */;
INSERT INTO `feedback_website` VALUES 
(1,'Website hơi lag','2023-07-02 07:30:00.000000',1),
(2,'Mong web phát triển tính năng so sánh sản phẩm','2023-06-12 07:30:00.000000',1),
(3,'Mong admin sớm fix chức năng xem comment cho điện thoại','2023-05-22 07:30:00.000000',1),
(4,'Hiển thị trên điện thoại chưa được mượt lắm','2023-06-17 07:30:00.000000',1),
(5,'Tốc độ load trang còn hơi chậm','2023-03-14 07:30:00.000000',1),
(6,'Web trông khá ổn nhưng nên mở rộng thêm chức năng','2023-07-18 07:30:00.000000',1),
(7,'Mong web sẽ có thêm nhiều sản phẩm hơn','2023-06-05 07:30:00.000000',2),
(8,'Có vẻ chức năng thêm sản phẩm đang bị lỗi','2023-05-17 07:30:00.000000',2),
(9,'Hãy fix chức năng thêm sản phẩm đi ad ơi','2023-04-13 07:30:00.000000',2),
(10,'Chúc web sớm phát triển và thành công','2023-02-17 07:30:00.000000',3),
(11,'Sevenbee mãi đỉnh','2023-05-21 07:30:00.000000',3),
(12,'ad hãy fix chức năng xem các sản phẩm tương tự trong trang chi tiết sản phẩm đi','2023-06-24 07:30:00.000000',3),
(13,'web đang bị lỗi hiển thị trên trình duyệt firefox mong ad sớm fix','2023-07-02 07:30:00.000000',4),
(14,'web chưa tương thích trên điện thoại','2023-06-25 07:30:00.000000',5),
(15,'Web rất tuyệt vời nhưng vẫn còn một số lỗi nhỏ trên điện thoại mong ad cải thiện','2023-07-15 07:30:00.000000',6);
/*!40000 ALTER TABLE `feedback_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `role_id` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_UserRole_Role` (`role_id`),
  KEY `FK_UserRole_Users` (`account_id`),
  CONSTRAINT `FK_UserRole_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_UserRole_Users` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES 
(1,7,'CUST'),
(2,13,'CUST'),
(3,10,'CUST'),
(4,6,'CUST'),
(5,2,'CUST'),
(6,9,'DIRE'),
(7,5,'STAF'),
(8,12,'STAF'),
(9,8,'CUST'),
(10,4,'CUST'),
(11,3,'DIRE'),
(12,1,'CUST'),
(13,11,'STAF');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Image1` varchar(50) NOT NULL,
  `Image2` varchar(50) NOT NULL,
  `Image3` varchar(50) NOT NULL,
  `Image4` varchar(50) NOT NULL,
  `Image5` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_Product_Banner` FOREIGN KEY (`product_id`) REFERENCES `product` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES 
(1,'anh.png','anh.png','anh.png','anh.png','anh.png',1,1),
(2,'anh.png','anh.png','anh.png','anh.png','anh.png',1,2),
(3,'anh.png','anh.png','anh.png','anh.png','anh.png',1,3),
(4,'anh.png','anh.png','anh.png','anh.png','anh.png',1,4),
(5,'anh.png','anh.png','anh.png','anh.png','anh.png',1,5),
(6,'anh.png','anh.png','anh.png','anh.png','anh.png',1,6);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Content` longtext NOT NULL,
  `account_id` int NOT NULL,
  `create_date` date NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Title` (`Title`),
  UNIQUE KEY `blog_Title_IX` (`Title`),
  KEY `FK_Account_Blog` (`account_id`),
  CONSTRAINT `FK_Account_Blog` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES 
(1,'FIFA 22 sửa lỗi cho thủ môn và trọng tài','<div><h2>Bản vá lỗi lớn đầu tiên của FIFA 22 vừa ra mắt với loạt thay đổi cho các nhân vật trong trò chơi.</h2>\n<p>Theo Gadget 360, FIFA 22 đang có bản vá lỗi lớn đầu tiên với tên Title Update #1, bản sửa lỗi này đi kèm với một loạt thay đổi về lối chơi, chủ yếu là ở vị trí thủ môn.</p>\n<p>Bản cập nhật Title Update #1, đã có sẵn cho những người chơi FIFA 22 trên Stadia và người dùng PC trên Origin hoặc Steam. Dự kiến được tung ra ‘vào một ngày sau đó’ cho các phiên bản PlayStation 4, PlayStation 5, Xbox One và Xbox Series S/X, EA Sports cho biết trên các diễn đàn chính thức của FIFA.</p>\n<p><br>\n<img alt=\"\" src=\"https://images2.thanhnien.vn/Uploaded/nthanhluan/2021_10_08/ff22-1592.png\" style=\"height:534px; width:950px\"><br>\n&nbsp;</p>\n<p>Trong các bài đánh giá&nbsp;FIFA 22, các thủ môn thực sự mạnh mẽ trong trò chơi bóng đá mới của EA Sports. Nhưng chúng dường như cũng có một số phần không hoàn thiện, đó là một vài lỗi khiến người chơi phải bật cười, đôi lúc khó chịu. Bản vá mới sẽ giải quyết chúng.</p>\n<p>Hiệu quả của thủ môn bị giảm đi khi thủ môn lao vào thực hiện các cú sút góc cao được thực hiện từ bên trong vòng cấm, đặc biệt là đối với các cú sút được thực hiện trong phạm vi 11.27 mét của thủ môn. Mặt khác, hiệu quả của thủ môn đã được tăng lên một chút đối với những cú sút có độ khéo léo cao. EA Sports đã thêm các hình ảnh động của thủ môn mới để biến điều đó thành hiện thực. Các thủ môn giờ đây sẽ phản ứng chân thực hơn, các nhà phát triển FIFA 22 tuyên bố.</p>\n<p>Cuối cùng, EA đã sửa một hiệu ứng đồ họa cho việc bắt bóng không chính xác trước các cú đánh đầu. Theo nhiều phản hồi từ người chơi, các thủ môn FIFA 22 có xu hướng hoàn toàn ‘không biết phải làm gì’ trước những pha đánh đầu đơn giản nhất.</p>\n<p>Bên cạnh đó, FIFA 22 cũng mang đến một số thay đổi về lối chơi phòng thủ. Tần suất người chơi tiếp xúc với bóng đang di chuyển khi cố gắng chặn đường đi của bóng đã được cải thiện. Ngoài ra, trong các pha phản công từ phạt góc, các hậu vệ chặn đối thủ ở gần vòng cấm sẽ làm tốt hơn đó.</p>\n<p>Bản vá cũng sẽ cải thiện công tác trọng tài. Những pha bóng tốc độ cao và khi các cầu thủ cố tình va chạm với một thủ môn đang cầm bóng, giờ đây sẽ gây ra nhiều pha phạm lỗi hơn. Còn lại những sự va chạm nhẹ sẽ dẫn đến ít phạm lỗi hơn. Và cuối cùng, những cú xoạc chặn bóng có thời điểm hợp lý sẽ ít bị phạt đền hơn.</p>\n</div>',5,'2022-01-27',1,'1HT6-162KpJM_vd63MHRTLsctJuXjsU7A'),
(2,'Hướng dẫn tạo và sử dụng bản đồ - Map trong Minecraft','<div><h2>Phần 1 - Cách&nbsp;tạo Bản đồ</h2>\r \r <p>Bản đồ trong Minecraft không có gì đặc biệt - chúng hiển thị cho bạn khu vực xung quanh và giúp bạn tìm đường. Tuy nhiên, giống như bất kỳ đối tượng Minecraft nào khác, bản đồ được tạo ra chứ không có sẵn, dù trên PC, Xbox 360, PS4 hay bất kỳ nền tảng nào khác. Bạn sẽ phải sử dụng Bàn chế tạo để tạo bản đồ của mình cũng như tất cả các thành phần cần thiết khác. Nhưng bạn cũng sẽ phải sử dụng lò để chế tạo các bộ phận của la bàn.&nbsp;</p>\r \r <h3><strong>Dụng cụ cần có</strong></h3>\r \r <p>- Bàn chế tạo.<br>\r Xem thêm: Cách tạo Bàn chế tạo&nbsp;<br>\r - Lò<br>\r Xem thêm: Cách tạo Lò.</p>\r \r <h3><br>\r <strong>Các nguyên liệu chính</strong></h3>\r \r <p><strong>- Sugar Cane / Mía</strong><br>\r Số lượng: 9<br>\r Mía có màu xanh lục nhạt và thường được tìm thấy khi mọc ở gần nước.<br>\r <strong>- Iron ore/ Quặng sắt&nbsp;</strong><br>\r Số lượng: 4.<br>\r Sắt được thể hiện bằng những đốm màu cam trên các khối màu xám. Để khai thác quặng sắt một cách hiệu quả, ít nhất bạn cũng cần phải có một cái cuốc đá.</p>\r \r <p><strong>- Redstone</strong>&nbsp;<br>\r Số lượng: 1.&nbsp;<br>\r Đá đỏ được tìm thấy ở lớp 16 trở xuống. Vì vậy, bạn sẽ phải đào sâu khá nhiều để tìm thấy tài nguyên này. Nó giống như những đốm tàn nhang đỏ rực trên đá xám.</p>\r \r <p><strong>- Nhiên liệu&nbsp;</strong><br>\r Bất kỳ loại nhiên liệu nào khi cháy đều có tác dụng. Sử dụng 4 khối gỗ hoặc một khối than / than đá.</p>\r \r <h3><strong>Xử lí các nguyên liệu và tạo Bản đồ</strong><strong>&nbsp;</strong></h3>\r \r <p><strong>Bước 1: Làm chảy Quặng sắt</strong></p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/cach%20t%E1%BA%A1o%20Ban%20do%20Minecraft-%20Chay%20Quang%20sat.png\"></p>\r \r <p>Quặng sắt mà bạn đã thu thập sẽ cần được nấu chảy. Để làm được điều này, chúng ta sẽ sử dụng Lò. Và thực hiện các bước sau<br>\r - Mở lò như bình thường<br>\r - Thêm 4 quặng sắt vào hộp ở trên cùng của cửa sổ lò<br>\r - Thêm nhiên liệu vào hộp dưới cùng<br>\r - Lò sẽ bắt đầu nấu chảy tự động. Sau khi nấu chảy xong, hãy chuyển các thanh sắt vào kho.</p>\r \r <p><br>\r <strong>Bước 2: Tạo la bàn</strong></p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/cach%20t%E1%BA%A1o%20Ban%20do%20Mincrart-%20Lam%20la%20ban.png\"></p>\r \r <p>La bàn là một phần không thể thiếu sẽ đi kèm với bản đồ của bạn.<br>\r - Mở bàn chế tạo<br>\r - Đặt đống Redstone vào giữa lưới trong cửa sổ bảng chế tạo<br>\r - Đặt một thanh sắt ở bên trái, bên phải, lên và xuống của đống Redstone<br>\r - Biểu tượng la bàn sẽ xuất hiện<br>\r - Tạo la bàn. Sau khi bạn đã chế tạo nó, hãy di chuyển la bàn vào kho của bạn.</p>\r \r <p><strong>Bước 3: Tạo các mảnh giấy</strong></p>\r \r <p><strong><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/cach%20tao%20ban%20do%20Minecraft-%20Lam%20Giay.png\"></strong></p>\r \r <p>Để tạo một bản đồ, bạn sẽ cần 9 mảnh giấy. Dưới đây là cách tạo các mảnh giấy từ Sugar Canes.<br>\r - Mở Bàn chế tạo<br>\r - Đặt ba cây Sugar Canes vào các ô vuông dưới cùng bên trái, dưới cùng giữa và dưới cùng bên phải trong bảng chế tạo.<br>\r - Mỗi 3 cây Sugar Cane sẽ tạo ra 3 mảnh giấy<br>\r - Tiếp tục thực hiện như trên để tạo ra 9 mảnh giấy .<br>\r Sau khi bạn hoàn thành, hãy chuyển các mẩu giấy vào kho của bạn.</p>\r \r <p><strong>Bước 4: Tạo Bản đồ</strong></p>\r \r <p><strong><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/Cach%20t%E1%BA%A1o%20b%E1%BA%A3n%20do%20Minecraft%202.png\"></strong></p>\r \r <p>Sau 3 bước trên, bạn đã có đầy đủ nguyên liệu cuối cùng để tạo ra Bản đồ trong Minecraft. Để tạo bản đồ thực hiện như sau:<br>\r - Mở Bàn chế tạo.<br>\r - Đặt la bàn vào tâm của lưới chế tạo<br>\r - Đặt một mảnh giấy vào giữa các ô vuông còn lại (tổng số là 8)<br>\r - Một mảnh giấy tan sẽ xuất hiện - đây là biểu tượng đại diện cho mục bản đồ<br>\r - Chế tạo nó</p>\r \r <p>Sau khi hoàn thành việc tạo sơ đồ, bạn có thể chuyển nó vào kho của mình và bắt đầu sử dụng.</p>\r \r <h2>Phần 2 - Sử dụng Bản đồ</h2>\r \r <p>Thật đáng tiếc là bạn sẽ không có ngay bản đồ cả thế giới Minecraft ngay lập tức dù có Bản đồ đi chăng nữa ! Trên thực tế, bản đồ trống ngay từ đầu - bạn phải tự lấp đầy chúng.&nbsp;<br>\r Vì vậy, làm thế nào để bạn điền vào bản đồ? Chà, nó được lấp đầy bằng việc bạn phải đi vòng quanh thế giới Minecraft và cầm nó. Hãy nhớ rằng bản đồ sẽ không đầy nếu nó không được coi là một mục hoạt động trong khi bạn di chuyển khắp thế giới. Các bước cụ thể như sau:</p>\r \r <h3><strong>Bước 1: Cầm bản đồ</strong></h3>\r \r <p>Đặt bàn đồ ở Hotbar và chọn nó.</p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/su%20dung%20ban%20do%20Minecraft%202.png\"></p>\r \r <h3><strong>Bước 2: Mở &nbsp;bản đồ</strong></h3>\r \r <p>Nhấn&nbsp;<strong>Chuột phải ( với PC)</strong>&nbsp;hoặc chạm và giữ màn hình (đối với bản điện thoại di động). Bạn sẽ thấy bản đồ mở ra. Trên thiết bị di động, bạn cũng có thể nhấn vào Tạo bản đồ nếu bạn thấy tùy chọn này ở cuối màn hình.<br>\r Có thể mất vài phút để bản đồ trống lấp đầy trong lần đầu tiên bạn sử dụng.</p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/mo%20ban%20do%20Minecraft.png\"></p>\r \r <h3><strong>Bước 3: Đọc Bản đồ</strong></h3>\r \r <p>Bản đồ của bạn sẽ bắt đầu điền theo hướng bạn đang nhìn. Hướng Bắc sẽ luôn ở trên cùng của bản đồ.<br>\r Bạn sẽ thấy thế giới bắt đầu xuất hiện trên bản đồ của mình từ góc nhìn từ trên xuống. Bản đồ đầu tiên bạn tạo là bản đại diện 1: 1 của thế giới, vì vậy mỗi pixel trên bản đồ đại diện cho một khối duy nhất trên thế giới.<br>\r Khi bạn vừa đi vừa sử dụng bản đồ, bạn sẽ thấy các cạnh của bản đồ bắt đầu lấp đầy dữ liệu.</p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/su%20dung%20ban%20do%20minecraft(1).jpg\" style=\"height:720px; width:1280px\"></p>\r \r <p>Bản đồ ban đầu của bạn sẽ chỉ lấp đầy khi không gian được sử dụng. Bản đồ không cuộn để hiển thị thêm không gian, vì vậy bạn sẽ cần phải mở rộng bản đồ của mình để xem thêm.</p>\r \r <p>Vị trí của bạn sẽ được ghi chú bằng một hình bầu dục màu trắng trên bản đồ.</p>\r \r <p><img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/su%20dung%20ban%20do%20Minecraft%204.PNG\"></p>\r \r <h2>Phần 3 - Mở rộng thêm Bản đồ</h2>\r \r <p>Bản đồ mà bạn tạo lần đầu tiên đã đặt kích thước Mặc định. Bạn có thể tăng bản đồ của mình lên tổng cộng bốn lần. Bản đồ càng lớn thì cái nhìn về thế giới càng toàn diện. Nói cách khác, kích thước bản đồ càng lớn, bạn càng có thể thu phóng nhiều hơn. Tất cả những gì bạn cần để nâng cấp bảan đồ là nhiều giấy hơn - mỗi cấp độ zoom yêu cầu 8 mảnh giấy bổ sung, tổng cộng là 32.<br>\r Cách để Mở rộng bản đồ như sau:<br>\r - Mở bàn chế tạo&nbsp;<br>\r - Đặt bản đồ ở giữa lưới chế tạo<br>\r - Bao quanh nó bằng 8 mảnh giấy<br>\r - Sau khi bạn hoàn tất, hãy di chuyển bản đồ kết quả vào kho của bạn. Để tăng kích thước bản đồ hơn nữa, hãy lặp lại các bước ở trên.<img alt=\"\" src=\"https://static.thuthuatchoi.com/posts/images/Minecraft/Mo%20rong%20ban%20do%20Minecraft(1).PNG\" style=\"height:552px; width:898px\"></p>\r </div>',5,'2023-01-27',1,'16CMz5-v2oVFJ-v01Hs2Qj9q5_Mt2O7w7'),
(3,'Genshin Impact là gì? Bách khoa toàn thư về Genshin Impact dành cho người mới','<div><h3><strong>Genshin Impact là gì?</strong></h3>\n\n<p><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/genshin%20impact%20la%20gi%202.jpg\" style=\"height:900px; width:1600px\"></p>\n\n<p>Genshin Impact là một tựa game nhập vai miễn phí với hệ thống kèm theo hệ thống chiến đấu theo nhóm. Trò chơi cũng có cơ chế “gacha”, nghĩa là người chơi có thể sử dụng các tiền tệ trong game để sưu tập những nhân vật cũng như vũ khí. Genshin Impact có thể chơi đơn hoặc chơi theo nhóm. Hiện tại, tựa game này đang có mặt trên các nền tảng PC, PS4, PS5, iOS, Android và MiHoyo chưa có bất kỳ kế hoạch nào về việc ra mắt tựa game trên các nền tảng Xbox hay Nintendo Switch.</p>\n\n<p>Đến với Genshin Impact, bạn sẽ hóa thân thành Nhà Lữ Hành đang trong hành trình tìm kiếm người anh/em thất lạc của mình. Đồng hành với bạn trong hành trình tìm lại người thân là một sinh vật bí ẩn mang tên Paimon.</p>\n\n<h3><strong>Hạng Mạo Hiểm và Cấp Thế Giới</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/genshin%20impact%20la%20gi%203.png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Hạng Mạo Hiểm là gì? Nghe có vẻ mới lạ nhưng thực chất đây chính là cấp độ của tài khoản của bạn. Tại thế giới của Genshin Impact, bạn sẽ đóng vai là những nhà lữ hành, mạo hiểm để khám phá những vùng đất mới cũng như con người ở các vùng đất này. Càng du ngoạn mạo hiểm nhiều, Hạng Mạo Hiểm càng tăng. Hiện tại, Hạng Mạo Hiểm cao nhất mà bạn có thể đặt được trong game là 60. Tuy nhiên, Hạng Mạo Hiểm càng cao thì số kinh nghiệm cần có để đạt cấp cao hơn sẽ cần càng nhiều.</p>\n\n<p>Khi đạt đến một mức Hạng Mạo Hiểm nhất định, bạn sẽ cần thực hiện một số nhiệm vụ đặc biệt để có thể nâng Cấp Thế Giới của mình. Khi nâng Cấp Thế Giới, cấp độ của các kẻ địch trong môi trường sẽ cao hơn và khó để hạ gục hơn.</p>\n\n<h3><strong>Hiệp Hội Nhà Mạo Hiểm và Ủy Thác Hàng Ngày</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(1).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Genshin Impact là một tựa game “sống”, nghĩa là các nội dung trong game sẽ được cập nhật liên tục. Vì vậy, sẽ có một cơ chế giúp thế giới của bạn được làm mới lại vào 3h sáng mỗi ngày theo giờ Việt Nam. Tất cả mọi thứ trong thế giới của bạn cũng sẽ được làm mới, bao gồm quái - nguyên vật liệu và nhiều hơn nữa. Các cửa hàng ở các thành phố nhất định cũng sẽ được làm mới, và bạn sẽ có thể mua lại các mặt hàng đã hết số lần mua trước đó.</p>\n\n<p>Ngoài ra, khi bước vào thế giới Genshin Impact bạn sẽ có được những Ủy Thác Hằng Ngày đến từ Hiệp Hội Nhà Mạo Hiểm. Tính năng này sẽ được mở khóa khi Hạng Mạo Hiểm của bạn đạt cấp 12. Mỗi ngày, sẽ có 4 Ủy Thác để bạn thực hiện. Bạn sẽ nhận được điểm Kinh Nghiệm Mạo Hiểm, Nguyên Liệu Đột Phá Nhân Vật cơ bản, Nguyên Thạch, Mora (Vàng), điểm Kinh Nghiệm Yêu Thích.</p>\n\n<p>Sau khi hoàn thành cả 4 Ủy Thác Hằng Ngày và báo cáo lại cho Người Tiếp Đón Hiệp Hội Nhà Mạo Hiểm, bạn sẽ nhận được thêm 500 điểm Kinh Nghiệm Mạo Hiểm. Đây là một lượng lớn điểm Kinh Nghiệm Mạo Hiểm trong thế giới Genshin Impact nên bạn đừng quên làm các Ủy Thác Hằng Ngày để nhanh chóng tăng Hạng Mạo Hiểm nhé.</p>\n\n<h3><strong>Hệ thống nhiệm vụ</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(2).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Có muôn vàn loại nhiệm vụ tại thế giới của Genshin Impact mà bạn có thể nhận và thực hiện. Kiểu nhiệm vụ quan trọng nhất là những nhiệm vụ đến từ mạch truyện chính - Nhiệm Vụ Ma Thần - sẽ được thêm vào dần dần ở mỗi bản cập nhật mới. Dưới đây là hệ thống nhiệm vụ trong Genshin Impact và tầm quan trọng của mỗi loại:</p>\n\n<ul>\n	<li><strong><u>Nhiệm Vụ Ma Thần:</u></strong>&nbsp;Những nhiệm vụ trong cốt truyện chính của Nhà Lữ Hành và Paimon khi họ đi khắp thế giới Teyvat để tìm kiếm người anh/em sinh đôi mất tích.</li>\n	<li><strong><u>Nhiệm Vụ Truyền Thuyết:</u></strong>&nbsp;Những nhiệm vụ liên quan đến xuất thân và tính cách của những nhân vật có thể sử dụng được (những nhân vật mà bạn có thể sưu tầm thông qua hệ thống gacha) hoặc các nhiệm vụ của sự kiện.</li>\n	<li><strong><u>Nhiệm Vụ Thế Giới:</u></strong>&nbsp;Những nhiệm vụ sẽ được mở khóa khi nói chuyện với các NPC ở khắp Teyvat. Những nhiệm vụ này sẽ cung cấp thêm các thông tin về địa điểm và các câu chuyện bên lề.</li>\n	<li><strong><u>Nhiệm Vụ Ủy Thác:</u></strong>&nbsp;Những nhiệm vụ hằng ngày mà người chơi nhận từ Hiệp Hội Nhà Mạo Hiểm và hoàn thành để nhận được các phần thưởng.</li>\n</ul>\n\n<h3><strong>Vision, Vũ khí và Thánh Di Vật</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(3).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Vision là món quà được các vị Thần ban tặng cho những người sống ở Teyvat và những người sở hữu Vision có thể sử dụng được nguyên tố tương ứng với nguyên tố của Vision được ban tặng. Những nhân vật có thể sử dụng được đều sẽ có một nguyên tố cho riêng mình dựa vào Vision mà họ được ban tặng. Tuy nhiên, vẫn sẽ có một số nhân vật không sử dụng được vẫn có Vision của chính họ.</p>\n\n<p>Có nhiều loại Vision khác nhau được chia theo thuộc tính, vũ khí lẫn thành phố của vị thần ban tặng. Có 7 thuộc tính là Phong, Thủy, Băng, Nham, Hỏa, Lôi, Thảo. Sẽ có 5 kiểu vũ khí tiêu biểu là Trọng Kiếm, Kiếm Đơn, Cung, Pháp Khí, Vũ Khí Cán Dài. Và sẽ có 4 thành phố chính gồm Mondstadt, Liyue, Inazuma, Snezhnaya.</p>\n\n<p>Ngoài Vision và các loại vũ khí, Thánh Di Vật cũng là một khái niệm quan trọng trong Genshin Impact. Thánh Di Vật là các vật phẩm sẽ giúp nâng các chỉ số cơ bản của nhân vật lên. Xây dựng hệ thống Thánh Di Vật phù hợp cũng quan trọng như việc nâng cấp cho nhân vật.</p>\n\n<h3><strong>Cung Mệnh và Thiên Phú</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(4).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Mỗi nhân vật trong Genshin Impact sẽ có một bản đồ Cung Mệnh và Thiên Phú độc lập. Cung Mệnh bao gồm 6 cấp bậc, mỗi cấp sẽ tăng các khả năng hiện có của nhân vật khi bạn mở khóa. Để mở khóa Cung Mệnh, bạn sẽ cần Chòm Sao của nhân vật đó - nguyên liệu sẽ rơi khi bạn mở ra được một nhân vật trùng với nhân vật bạn cần tìm Chòm Sao.</p>\n\n<p><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(5).png\" style=\"height:900px; width:1600px\"></p>\n\n<p>Thiên Phú là những khả năng đặc biệt của nhân vật mà bạn có thể nâng cấp lên một cấp độ nhất định. Những Thiên Phú này được chia thành 2 nhóm là Thiên Phú Chiến Đấu và Thiên Phú Cố Định. Mỗi khi bạn nâng cấp một Thiên Phú, nhân vật sẽ mạnh hơn khi chiến đấu.</p>\n\n<h3><strong>Cầu Nguyện và Nguyên Thạch</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(6).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Genshin Impact có hệ thống “gacha”, nghĩa là bạn có thể sưu tập nhân vật ngẫu nhiên thông qua hoạt động Cầu Nguyện. Mỗi 10 lần Cầu Nguyện, người chơi được đảm bảo sẽ nhận được một nhân vật/vũ khí 4 hoặc 5 sao.</p>\n\n<p>Mỗi vài tuần trôi qua, game sẽ có Sự Kiện Cầu Nguyện Nhân Vật (Banner) mới được ra mắt. Các Sự Kiện này có thể có những nhân vật mới hoặc những nhân vật đã được ra mắt trước đó. Để Cầu Nguyện, bạn sẽ cần một thứ gọi là “Mối Duyên.” Bạn có thể nhận được Mối Duyên thông qua các hoạt động trong game hoặc thông qua đổi Nguyên Thạch (160 Nguyên Thạch = 1 Mối Duyên).</p>\n\n<p>Vậy làm sao để kiếm được Nguyên Thạch và Mối Duyên? Như đã nói trước đó, bạn có thể kiếm được Mối Duyên ở nhiều hoạt động tại Genshin Impact. Tuy nhiên, cách nhanh nhất để có chính là trao đổi Nguyên Thạch. Nguyên Thạch thậm chí có thể được mua trong cửa hàng bằng cách nạp hoặc bằng cách hoàn thành các nhiệm vụ và các hoạt động trong game.</p>\n\n<p><strong><u>Những cách để nhận được Nguyên Thạch gồm có:</u></strong></p>\n\n<ul>\n	<li>Hoàn thành các nhiệm vụ.</li>\n	<li>Thưởng đăng nhập hằng ngày.</li>\n	<li>Khám phá các vùng đất mới.</li>\n	<li>Quái Thế Giới và Bí Cảnh.</li>\n	<li>La Hoàn Thâm Cảnh.</li>\n	<li>Hoàn thành Thành Tựu.</li>\n	<li>Nâng cấp Tượng Thần.</li>\n	<li>Hoàn thành các chương của Sổ Tay Thám Hiểm.</li>\n</ul>\n\n<h3><strong>Chế tạo/Thu thập</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(7).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Chế tạo và thu thập các vật phẩm và nguyên liệu là một phần không thể thiếu trong Genshin Impact. Trong lúc khám phá, bạn sẽ bắt gặp những nguyên vật liệu như thực phẩm, cây và những nguyên vật liệu có thể thu thập khác. Bạn hãy thu thập những nguyên vật liệu này vì chúng chắc chắn sẽ cần thiết sau này.</p>\n\n<p>Khi thu thập đủ các nguyên vật liệu cần thiết, bạn có thể nấu thực phẩm hỗ trợ - nâng cấp vũ khí - nâng cấp nhân vật - chế tạo các vật phẩm độc đáo v.v... Mỗi địa điểm mới mà bạn vừa khám phá được cũng sẽ có những vật phẩm và nguyên vật liệu mới để bạn thu thập.</p>\n\n<h3><strong>Bí Cảnh/ Quái Thế Giới/ Địa Mạch Sinh Thành</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(8).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Tại Teyvat, sẽ có những trường hợp mà bạn cần sử dụng đến Nhựa Nguyên Chất để thu thập chiến lợi phẩm ở các Bí Cảnh, Quái Thế Giới và Địa Mạch Sinh Thành. Trước khi giải thích rõ hơn và các khu vực trên, bạn cần biết chính xác Nhựa Nguyên Chất là gì và tại sao nó lại quan trọng trong thế giới Genshin Impact.</p>\n\n<ul>\n	<li><strong>Nhựa Nguyên Chất</strong>: Một loại nguyên liệu trong Genshin Impact được dùng để thu thập chiến lợi phẩm sau khi hoàn thành Bí Cảnh, Quái Thế Giới và Địa Mạch Sinh Thành. Nhựa Nguyên Chất sẽ tự hồi lại theo thời gian và sẽ hồi lại tối đa là 160. Ngoài ra, còn một loại vật phẩm tiêu hao khác được gọi là Nhựa Dễ Vỡ - có thể được thu thập ở một số nơi như Nhật Ký Hành Trình và Thưởng Hạng Mạo Hiểm - có thể dùng để nhận được thêm Nhựa Nguyên Chất.</li>\n	<li><strong>Bí Cảnh</strong>: Trong Genshin Impact, Bí Cảnh là những hầm ngục tối tăm. Bạn có thể tìm thấy Bí Cảnh rải rác xung quanh Teyvat và có thể mở khóa hoặc tiến vào trong trạng thái chơi đơn lẫn chơi nhóm. Các Bí Cảnh có phần thưởng là một lượng lớn Điểm Kinh Nghiệm Mạo Hiểm và Nguyên Thạch cùng nhiều Thánh Di Vật. Tuy nhiên, các Thánh Di Vật cụ thể sẽ chỉ xuất hiện ở các Bí Cảnh cụ thể vào những ngày nhất định trong tuần.</li>\n	<li><strong>Quái Thế Giới</strong>: Trong khi khám phá Teyvat, bạn sẽ bắt gặp những khu vực tương tự như một đấu trường lớn. Ở những nơi đó sẽ có nhiều loại quái đặc biệt mạnh hơn bình thường gọi là Quái Thế Giới. Những con quái này đều cần có cách xử lý riêng biệt dựa vào các yếu tố riêng của chúng. Bạn sẽ cần phải xây dựng một đội hình linh hoạt khi đối đầu với loại quái này.</li>\n	<li><strong>Địa Mạch Sinh Thành</strong>: Đây là một kiểu thử thách sẽ cung cấp cho bạn một lượng Điểm Kinh Nghiệm Mạo Hiểm, vật liệu nâng cấp và Mora khi bạn hoàn thành. Có vô số Địa Mạch Sinh Thành có thể được tìm thấy ở khắp Teyvat. Tuy nhiên, tính năng này chỉ mở khi Hạng Mạo Hiểm của bạn đạt cấp 8.</li>\n</ul>\n\n<h3><strong>Nâng cấp nhân vật</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(9).png\"></strong></p>\n\n<p>Mỗi nhân vật trong Genshin Impact có thể được nâng lên đến cấp 90. Khi bạn lần đầu nhận được một nhân vật, bạn sẽ có thể nâng cấp nhân vật này dễ dàng tới cấp 20 bằng cách sử dụng các nguyên vật liệu và Mora. Tuy nhiên, khi đạt cấp độ càng cao, số vật liệu mà bạn cần sẽ nhiều hơn, trong đó sẽ gồm cả vật liệu mà chỉ có thể thu thập được khi hoàn thành Bí Cảnh hoặc Quái Thế Giới.</p>\n\n<p>Khi đạt đến một cấp độ nhất định (cấp 50), để có thể mở được mức tiếp theo (cấp 60) thì bạn sẽ cần phải thực hiện Đột Phá cấp độ nhân vật bằng cách sử dụng các vật phẩm hiếm. Nếu bạn có nhiều nhân vật khác nhau trong bộ sưu tập, bạn nên xác định đâu là nhân vật chủ chốt để nâng cấp tránh trường hợp cạn kiệt vật phẩm nâng cấp nhân vật.</p>\n\n<h3><strong>Mở khóa và nâng cấp Thất Thiên Thần Tượng</strong></h3>\n\n<p><strong><img alt=\"\" src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/152770/Originals/Genshin%20Impact%20la%20gi%20II%20(10).png\" style=\"height:900px; width:1600px\"></strong></p>\n\n<p>Khi khám phá Teyvat, bạn sẽ bắt gặp những Thất Thiên Thần Tượng. Những bức tượng này sẽ giúp bạn khai phá một khu vực và mở khu vực này trên bản đồ thám hiểm. Vì vậy, hãy chú ý đến những tượng thần này khi tiến vào các khu vực mới vì các tượng thần này đồng thời cũng là những điểm dịch chuyển quan trọng.</p>\n\n<p>Trong lúc thám hiểm, bạn đôi khi sẽ bắt gặp một vật phẩm gọi là Thần Đồng ứng với các khu vực mà bạn thu thập. Chúng là Phong Thần Đồng ở Mondstadt, Nham Thần Đồng ở Liyue, Lôi Thần Đồng ở Inazuma, Thảo Thần Đồng ở Sumeru.</p>\n\n<p>Thu thập những vật phẩm này cũng rất quan trọng vì đây là nguyên liệu chính để nâng cấp Thất Thiên Thần Tượng. Vậy tại sao lại cần nâng cấp Thất Thiên Thần Tượng? Mỗi lần nâng cấp cho tượng thần, bạn sẽ nhận được phần thưởng là Nguyên Thạch, Điểm Kinh Nghiệm Mạo Hiểm, Ấn Nguyên Tố tương ứng và quan trọng nhất chính là thể lực. Thể lực nhận được từ việc nâng cấp Thất Thiên Thần Tượng sẽ được cộng vào thể lực tối đa của bạn. Điều này rất quan trọng trong hành trình khám phá thế giới cũng như chiến đấu và mở rộng khu vực.</p>\n\n<h3><strong>Có thể bạn chưa biết</strong></h3>\n\n<p>Dưới đây là một số thứ mà có thể bạn chưa biết hoặc chưa nghe nhắc đến trong quá trình chơi Genshin Impact:</p>\n\n<ul>\n	<li>Ngoài Thất Thiên Thần Tượng, bạn cũng sẽ tìm thấy một số điểm dịch chuyển khác trên khắp khu vực Teyvat. Hãy nhớ luôn mở khóa điểm dịch chuyển mỗi khi tìm thấy nhé. Mở khóa Thất Thiên Thần Tượng sẽ giúp mở rộng bản đồ và cho phép bạn thấy được vị trí cụ thể của các điểm dịch chuyển này.</li>\n	<li>Sổ tay Nhà Thám Hiểm là một công cụ quan trọng khác mà bạn có thể sử dụng tùy thích. Tính năng này cho phép bạn xem được tiến trình của bạn, chọn khu vực nhận Ủy Thác cho ngày kế tiếp, hiển thị các Bí Cảnh và khu vực các loại quái cần thiết cho quá trình tìm kiếm nguyên liệu nâng cấp.</li>\n	<li>Trong vô số thứ mà bạn sẽ khám phá ở Teyvat, bạn đôi lúc sẽ bắt gặp các câu đố. Hãy tìm lời giải cho các câu đố này và hoàn thành chúng để nhận được những điều bất ngờ cũng như phần thưởng. Đôi khi trong hành trình khám phá Teyvat, bạn sẽ bắt gặp những sinh vật nhỏ bé phát sáng bay lơ lửng gọi là Tinh Linh. Đi theo những Tinh Linh này và chúng sẽ dần bạn đến bức tượng, nơi mà những sinh vật này sẽ dừng chân và thưởng cho bạn kho báu, đôi khi là mở khóa những lối đi mới.</li>\n</ul>\n</div>',5,'2022-01-27',1,'1ok3iqheTeqjNj-wsv6FSSbnwodEFgrBh'),
(4,'Dota 2 Update 7.32e Vietsub Phần 1: Các tính năng mới, Gameplay update và Item updates','<div><p><strong>CÁC TÍNH NĂNG MỚI</strong></p>\n\n<p><strong>ADVANCED BATTLE STATS</strong></p>\n\n<p>Đi sâu hơn vào dữ liệu trong lịch sử Dota của bạn!</p>\n\n<p><img alt=\"\" src=\"https://cdn.gametv.vn/news_media/image/download_0x0_1678174679.png\" style=\"height:573px; width:1122px\"></p>\n\n<p>Tự đánh giá bản thân để cải thiện trình độ với Battle Stats hiện có ở ngay trong profile ingame của bạn. Người đã đăng ký Dota Plus hiện có quyền truy cập vào các phân tích của trò chơi theo thời gian thực với giao diện được tân trang lại hoàn toàn. Tìm hiểu sâu hơn về phong cách chơi của bạn bằng cách sắp xếp toàn bộ lịch sử trận đấu theo hero, role, chế độ chơi và còn nhiều thứ khác nữa.<br>\n&nbsp;<br>\n&nbsp;Muốn cải thiện khả năng last hit? Tổng hợp stat của Creeps sẽ giúp được bạn. Muốn cải thiện kỹ năng chơi support? Số liệu hống kê của vị trí Support giờ đây hiển thị rõ ràng hơn cả một chiếc sentry ward.<br>\n&nbsp;<br>\n<strong>TÙY CHỈNH QUICKCASTING</strong><br>\n&nbsp;<br>\nĐiều khiển mượt mà hơn ngay trong tầm tay của bạn.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.gametv.vn/news_media/image/download(1)_0x0_1678174716.png\" style=\"height:507px; width:1125px\">Người dùng Quickcast hiện có thể chỉ định riêng các kỹ năng hoặc item sử dụng lên một unit nhất định, được kích hoạt bằng cách nhấn rồi thả phím. Xem ngay ở phần `Unit Specific Hotkeys` và `Enable Quickcast` cho khả năng điều khiển các Kỹ năng và Item trong tab Hotkeys trong Setting Menu.</p>\n\n<p><br>\n<strong>CẢI THIỆN DANH SÁCH BẠN BÈ</strong><br>\n&nbsp;<br>\nMang đến cho những người bạn Dota thân thiết nhất của bạn đặc quyền mà họ xứng đáng được nhận.</p>\n\n<p><img alt=\"\" src=\"https://cdn.gametv.vn/news_media/image/download(2)_0x0_1678174758.png\" style=\"height:508px; width:1123px\"></p>\n\n<p>Với tính năng Favorite mới, giờ đây bạn có thể gắn thẻ những người bạn mà bạn chơi cùng nhiều nhất để giữ họ ở những vị trí đầu tiên trong danh sách bạn bè của bạn. Update mới nay sắp xếp danh sách bạn bè của bạn theo thứ tự: Favorite, Playing Dota, Online và Offline. Tính năng tìm kiếm bạn bè giờ cũng đã được nâng cấp để việc bạn tìm được chính xác người đang cần tìm trở nên dễ dàng hơn.</p>\n\n<p><strong>GAMEPLAY UPDATE</strong></p>\n\n<p><strong>THAY ĐỔI CHẾ ĐỘ TURBO</strong><br>\n&nbsp;<br>\n&nbsp;Khi chế độ Turbo ngày càng phổ biến, chúng tôi muốn đảm bảo rằng bản thân có thể làm tất cả những gì có thể cho nhóm người chơi này. Hãy theo dõi nhiều thay đổi hơn trong tương lai khi chúng tôi tiếp tục cải thiện trải nghiệm tổng thể của chế độ chơi.<br>\n&nbsp;<br>\n&nbsp;- Tất cả các lựa chọn hero giờ sẽ là chọn ẩn (kiểu liên minh)<br>\n&nbsp;<br>\n&nbsp;- Loại bỏ giai đoạn penalty trong quá trình chọn tướng. Khi thời gian Draft thông thường kết thúc, bất kỳ người chơi nào chưa chọn tướng sẽ phải chọn bất kỳ hero nào mà họ đã nhá trong quá trình pick. Trong trường hợp người chơi không nhá bất kỳ tướng nào thì họ sẽ được chơi một vị tướng ngẫu nhiên (random).<br>\n&nbsp;<br>\n&nbsp;- Null Talisman, Wraith Band và Bracer sẽ nhân đôi chỉ số cộng thêm sau 12 phút thay vì 25 phút.<br>\n&nbsp;<br>\n&nbsp;- Loại bỏ sát thương cộng thêm cho các công trình từ tất cả các summoned units (đơn vị được triệu hồi bởi người chơi). Tất cả các đơn vị không được triệu hồi (lane creeps, dominated creeps) vẫn sẽ có sát thương lên công trình mạnh mẽ hơn so với chính chúng ở ngoài chế độ Turbo.<br>\n&nbsp;<br>\n&nbsp;- Giờ đây bạn có thể kiếm được 2 sao cho các hero challenges thay vì chỉ 1 sao như trước đây.</p>\n\n<p><img alt=\"\" src=\"https://cdn.gametv.vn/news_media/image/p1dota2turbomode_0x0_1678174769.png\" style=\"height:348px; width:522px\"></p>\n\n<p>Chỉ số để nâng cấp Arcana giờ được cập nhật như sau:<br>\n&nbsp;<br>\n&nbsp;- Earthshaker`s Planetfall Arcana hiện cung cấp đầy đủ chỉ số cho các lần tiêu diệt và hỗ trợ Echo Slam. Hiển thị chuỗi kỹ năng và sát thương theo combo cũng được bật.<br>\n&nbsp;<br>\n&nbsp;- Invoker Dark Artistry Throwback Immortal giờ ghi nhận đầy đủ cho số lần hạ gục của Sun Strike.<br>\n&nbsp;<br>\n&nbsp;- Juggernaut`s Bladeform Legacy Arcana hiện cung cấp đầy đủ chỉ số cho Omnislash Kills.<br>\n&nbsp;<br>\n&nbsp;- Kunkka`s Leviathan Whale Blade of Eminent Revival Immortal hiện ghi nhận đầy đủ số khi sát thương các hero khác bằng Torrent.<br>\n&nbsp;<br>\n&nbsp;- Legion Commander Arcana bây giờ tính Duel Victories.<br>\n&nbsp;<br>\n&nbsp;- Leshrac`s Tormented Staff of Eminent Revival Immortal giờ cung cấp đầy đủ công lao cho việc làm choáng kẻ thù với Split Earth.<br>\n&nbsp;<br>\n&nbsp;- Lion`s Fin King`s Charm of Eminent Revival Immortal giờ ghi nhận đầy đủ số lần hex đối phương.<br>\n&nbsp;<br>\n&nbsp;- Lone Druid`s Cauldron of Xahryx of Eminent Revival Immortal giờ cung cấp đầy đủ credit cho thời gian của Entangling Claws<br>\n&nbsp;<br>\n&nbsp;- Storm Spirit`s The Lightning Orchid of Eminent Revival Immortal hiện cung cấp toàn bộ công lao cho sát thương Ball Lightning.</p>\n\n<p><strong>CÁC CẬP NHẬT CHUNG</strong></p>\n\n<p><strong><img alt=\"\" src=\"https://cdn.gametv.vn/news_media/image/download(3)_0x0_1678174804.png\" style=\"height:226px; width:1132px\"></strong></p>\n\n<p>- Reinforced Units giờ nhận it hơn 10% sát thương từ creep do người chơi điều khiển (ảnh hưởng đến tất cả các đơn vị được triệu hồi như treant, eidolon, v.v., cũng như các dominated creeps, nhưng không phải hero creep như Spirit Bear hoặc Illusions).<br>\n&nbsp;<br>\n&nbsp;- Ranged Creep giờ là Level 5 (ngăn Enigma và những thứ khác có thể nuốt chúng sớm)<br>\n&nbsp;<br>\n&nbsp;- Glyph Tower Bonus Attack targets tăng từ 4 lên 5</p>\n\n<p><strong>ITEM UPDATES</strong></p>\n\n<p><strong>ABYSSAL BLADE</strong><br>\n&nbsp;- Sát thương tấn công cộng thêm tăng từ 25 lên 30</p>\n\n<p><br>\n<strong>BLOODSTONE</strong><br>\n&nbsp;- Thời lượng Bloodpact giảm từ 6 giây xuống 5 giây<br>\n&nbsp;<br>\n<strong>BOOTS OF BEARING</strong><br>\n&nbsp;- Không còn charges nữa<br>\n&nbsp;<br>\n<strong>DIVINE RAPIER</strong><br>\n&nbsp;- Tổng chi phí giảm từ 5950 xuống 5600.<br>\n&nbsp;<br>\n<strong>ENCHANTED MANGO</strong><br>\n&nbsp;- Health Regeneration bonus giảm từ +0,6 xuống +0,4.<br>\n&nbsp;<br>\n<strong>EYE OF SKADI</strong><br>\n&nbsp;- Làm chậm tốc độ di chuyển của Cold Attack so với hero tầm xa tăng từ 40% lên 50%.<br>\n&nbsp;<br>\n<strong>FORCE STAFF</strong><br>\n&nbsp;- Force Mana tiêu hao tăng từ 100 lên 150<br>\n&nbsp;<br>\n<strong>GLEIPNIR</strong><br>\n&nbsp;- Sát thương của Eternal Chains giảm từ 220 xuống 180<br>\n&nbsp;- Bán kính của Eternal Chains giảm từ 450 xuống 400<br>\n&nbsp;<br>\n<strong>GUARDIAN GREAVES</strong><br>\n&nbsp;- Guardian Aura Regen Bonus cho đồng minh thấp máu giảm từ 18,5 xuống 14,5<br>\n&nbsp;- Guardian Aura Armor Bonus cho các đồng minh thấp máu giảm từ 10 xuống 8<br>\n&nbsp;<br>\n<strong>HURRICANE PIKE</strong><br>\n&nbsp;- Mana tiêu tốn của Hurricane Thrust tăng từ 100 lên 150<br>\n&nbsp;<br>\n<strong>MAELSTROM</strong><br>\n&nbsp;- Chain Lightning Damage giảm từ 140 xuống 135&nbsp;<br>\n&nbsp;<br>\n<strong>METEOR HAMMER</strong><br>\n&nbsp;- Thời gian vận chiêu của Meteor Hammer giảm từ 2,5 giây xuống 2 giây (Tổng thời gian cho đến khi tác động giảm từ 3 giây xuống 2,5 giây)<br>\n&nbsp;<br>\n<strong>NULLIFIER</strong><br>\n&nbsp;- Tổng chi phí giảm từ 4725 xuống 4375<br>\n&nbsp;- Sát thương cộng thêm giảm từ 80 xuống 75<br>\n&nbsp;<br>\n<strong>RADIANCE</strong><br>\n&nbsp;- Tổng chi phí giảm từ 5050 xuống 4700.<br>\n&nbsp;- Sát thương cộng thêm giảm từ 60 xuống 55.<br>\n&nbsp;<br>\n<strong>REVENANT`S BROOCH</strong><br>\n&nbsp;- Phantom Province giờ có thêm tốc độ tấn công +60 trong thời gian tồn tại<br>\n&nbsp;- Phantom Province Attacks are now affected by Spell Lifesteal<br>\n&nbsp;<br>\n<strong>SACRED RELIC</strong><br>\n&nbsp;- Giá giảm từ 3750 xuống 3400<br>\n&nbsp;- Sát thương cộng thêm giảm từ 60 xuống 55<br>\n&nbsp;<br>\n<strong>SHADOW BLADE</strong><br>\n&nbsp;Giờ sẽ loại bỏ khả năng tàng hình nếu sát thương cộng thêm được áp dụng trong thời gian đang mờ dần (fade time). Các ví dụ đáng chú ý nhất là Burning Barrage của Clinkz, Sleight of Fist của Ember Spirit, v.v. sẽ tăng thêm sát thương cho mỗi đòn tấn công được thực hiện nếu kỹ năng được sử dụng trong thời gian mờ dần.<br>\n&nbsp;<br>\n<strong>SOLAR CREST</strong><br>\n&nbsp;- Bonus tất cả thuộc tính tăng từ +5 lên +6<br>\n&nbsp;- Tốc độ di chuyển cộng thêm tăng từ +20 lên +25<br>\n&nbsp;<br>\n<strong>WRAITH BAND</strong><br>\n&nbsp;- Tốc độ tấn công cộng thêm giảm từ 6/12 xuống 5/10.<br>\n&nbsp;<br>\n&nbsp;Chúng tôi sẽ đem đến tất tần tật các update về hero ở phần 2 trong vài tiếng nữa!</p>\n\n<p>&nbsp;</p>\n</div>',5,'2023-01-27',1,'1v1QZyqj5tGgwHXTDckc5u4YUFDYb4FCt'),
(5,'Assassin’s Creed Valhalla – Đánh Giá Game','<div><p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121212653/assassins-creed-valhalla-danh-gia-game-5.jpg\"></p>\n\n<p><strong>Assassin’s Creed Valhalla</strong><strong><em>&nbsp;–&nbsp;</em></strong>Kể từ khi ra mắt vào năm 2007 đến nay, dòng game&nbsp;<em>Assassin’s Creed</em>&nbsp;đã luôn là một cái tên đình đám được đông đảo game thủ trên khắp thế giới mong chờ mỗi năm, bởi mỗi phiên bản luôn là một dự án tốn nhiều tiền của nhất của ông lớn nước Pháp.&nbsp;</p>\n\n<p>Dẫu vẫn là một “con gà đẻ trứng vàng” hàng đầu, nhưng trong nhiều năm trở lại đây, mỗi lần&nbsp;trailer&nbsp;<em>Assassin’s Creed</em>&nbsp;mới ra mắt&nbsp;đều vấp phải rất nhiều luồng ý kiến tranh cãi, bởi hướng thiết kế của dòng game đã ngày một trôi xa những gì game thủ nhớ về một tựa&nbsp;<em>Assassin’s Creed</em>&nbsp;từng có.</p>\n\n<p><strong><em>Assassin’s Creed Valhalla</em></strong>, phiên bản mới nhất vừa ra mắt của dòng game đình đám này chính là đỉnh điểm của những tranh cãi mà Ubisoft định hướng cho dòng game này trong tương lai.&nbsp;</p>\n\n<p>Chẳng ai nhận ra một tay sát thủ lăm lăm vũ khí&nbsp;“tả xung, hữu đột” giữa vòng vây kẻ thù trong một trận công thành chiến; chẳng ai nhận ra lý tưởng đấu tranh cho tự do và bình quyền qua những chiến thuyền cướp bóc và tàn phá làng mạc; cũng chẳng ai nhận ra tổ chức bảo vệ hòa bình thế giới được khởi đầu trong&nbsp;<em>Assassin’s Creed Origins</em>&nbsp;lại là những kẻ khát máu yêu thích sự hỗn loạn, hủy diệt…</p>\n\n<p>Những gì mà mọi phiên bản&nbsp;<em>Assassin’s Creed</em>&nbsp;trước đây tạo lập danh tiếng, đều bị Ubisoft “xóa nhòa” trong trailer ra mắt của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>.&nbsp;</p>\n\n<p>Chưa kể từ phiên bản&nbsp;<em>Origins</em>, đến&nbsp;<em>Odyssey</em>&nbsp;và bây giờ là&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>, lối chơi của dòng game đã ngày một nặng tính nhập vai hơn, và liệu chiến lược phát triển này của Ubisoft sẽ đưa dòng game&nbsp;<em>Assassin’s Creed</em>&nbsp;bước sang thời kỳ mới?</p>\n\n<h2>BẠN SẼ GHÉT</h2>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211525/assassins-creed-valhalla-danh-gia-game-11.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<h3><strong>CUỘC VIỄN CHINH CỦA NHỮNG KẺ KHÁT MÁU</strong></h3>\n\n<p>Nếu bạn đọc còn nhớ,&nbsp;<em>Assassin’s Creed IV: Black Flag</em>&nbsp;ra mắt năm 2013 đã khiến giới mộ điệu dậy sóng với hàng loạt làn sóng tranh cãi quanh việc: đây là một tựa game&nbsp;<em>Assassin’s Creed</em>&nbsp;hay&nbsp;một tựa game… cướp biển&nbsp;được gác mác&nbsp;<em>Assassin’s Creed</em>?</p>\n\n<p>Câu hỏi này được đặt ra là hoàn toàn có lý do của nó, bởi thiết kế lối chơi thiên về ám sát lén lút, do thám địa hình, vạch ra chiến lược được thể hiện rất ít trong bản game này.&nbsp;</p>\n\n<p>Ngược lại, trò chơi tập trung phần lớn lối chơi vào thủy chiến và&nbsp;những trận giao tranh đầy máu lửa trên những con thuyền.&nbsp;</p>\n\n<p>Nhiều người khen&nbsp;<em>Black Flag</em>&nbsp;hay, nhưng với những “fan cứng” của&nbsp;<em>Assassin’s Creed</em>, nó là một thứ “dị hợm” và khó chấp nhận bởi cái “họ”&nbsp;<em>Assassin’s Creed</em>&nbsp;mang trên mình.</p>\n\n<p>May mắn thay,&nbsp;<em>Assassin’s Creed Unity</em>&nbsp;và&nbsp;<em>Syndicate</em>&nbsp;sau đó đã sớm đưa dòng game quay trở lại quỹ đạo thiên về hành động lén lút, nhưng… chúng cũng chẳng duy trì được lâu bởi những yếu tố mới liên tục được Ubisoft manh nha “thử nghiệm” trong mỗi phiên bản.&nbsp;</p>\n\n<p>Để rồi đến khi cuộc phiêu lưu đến Ai Cập cổ đại của&nbsp;<em>Assassin’s Creed Origins</em>, người hâm mộ lại phải “reset” não của mình để tiếp nhận một game mới, với yếu tố nhập vai thoang thoảng mùi&nbsp;<em>The Witcher 3</em>.</p>\n\n<p>Việc&nbsp;<em>Assassin’s Creed</em>&nbsp;đánh mất cái “chất” hành động lén lút của mình cho đến bản&nbsp;<em>Odyssey</em>&nbsp;là điều không mấy vui vẻ với người hâm mộ lâu năm nhưng bù lại, dòng game lại thu hút được một lượng lớn người chơi mới không hề ít!&nbsp;</p>\n\n<p>Do đó, việc tìm ra một giải pháp nhằm cân bằng cả hai cộng đồng game thủ cũ – mới này là điều không hề dễ dàng.</p>\n\n<p>Ubisoft không hề giấu ý định muốn biến&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;trở thành một tựa game đặc sệt chất “nhập vai” tương tự như loạt game&nbsp;<em>The Witcher</em>, nhưng bản thân lối chơi của game lại vẫn còn “lưu luyến” những di sản của các phiên bản&nbsp;<em>Assassin’s Creed</em>&nbsp;xa xưa nên sự chuyển đổi “nửa nạc, nửa mỡ” được thể hiện thật khó chịu!</p>\n\n<p>Đầu tiên là việc game được mang lại rất nhiều yếu tố quen thuộc làm nên tên tuổi của&nbsp;<em>Assassin’s Creed</em>&nbsp;đầu tiên, đó là… những băng ghế đá công cộng, những đoàn linh mục hành hương, các kẻ say xỉn dễ gây rối loạn đám đông, những màn lẩn trốn và nghe lén trong khu vực chợ búa sầm uất…&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211315/assassins-creed-valhalla-danh-gia-game-7.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Tất cả, để khơi lại cho người chơi những “cảm giác quen thuộc” mà lối chơi hành động, lén lút hấp dẫn năm nào đã làm nên thương hiệu của dòng game…</p>\n\n<p>NHƯNG…&nbsp;</p>\n\n<p>Với bối cảnh là những cuộc chinh phạt của tộc Viking dũng mãnh, những gì mà&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;muốn người chơi làm là hóa thân thành một tên đồ tể thứ thiệt, tay lăm lăm vũ khí và lao mình vào đám đông cuồng loạn, sát phạt tứ phía!</p>\n\n<p>Cách giải quyết vấn đề đầy cục súc này trở thành “ngôn ngữ chính” cho lối chơi của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>, vì nó rất tiết kiệm thời gian, giải quyết nhiệm vụ gọn gàng và dĩ nhiên là… khá đã tay!&nbsp;</p>\n\n<p>Và theo chiều ngược lại, mảng hành động lén lút trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;lại bị xem nhẹ, đến mức “ép” game thủ nên tránh con đường này bởi tầm nhìn của A.I rất ảo lòi, thiết kế địa hình thiếu tính sắp đặt và cực kỳ sơ sài, chẳng có lấy một yếu tố khuyến khích game thủ tìm ra cách diệt gọn một đồn điền mà không để lại dấu vết.&nbsp;</p>\n\n<p>Và những chi tiết phục vụ cho lối chơi lén lút nói trên như băng ghế, đoàn hành hương, v.v. chỉ thêm vướng tay, vướng chân hơn mà thôi!</p>\n\n<p>Chưa dừng lại ở đó, yếu tố nhập vai sẽ tác động lên việc gây sát thương trên kẻ địch: dựa vào chỉ số, cho dù đó là ám sát hay cận chiến.&nbsp;</p>\n\n<p>Nghĩa là nếu bạn chưa đủ “tuổi” để có thể&nbsp;một nhát “tiễn kẻ thù lên bàn thờ”, thì chúng vẫn điềm nhiên đứng dậy với cổ họng toang hoác một lỗ to tướng và vô tư vẫy gọi đồng đội tới “tẩn” cho bạn xéo cả háng!</p>\n\n<p>Để bù lại cho những chỉ trích về tính cân bằng giữa hành động lén lút và cận chiến tay đôi từ người hâm mộ, các nhà thiết kế&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;còn đề ra một giải pháp “siêu việt”: tùy chọn “Guaranteed Assassination” trong cài đặt lối chơi của game.</p>\n\n<p>Nghe qua thì tính năng này có vẻ thuận tai đấy!&nbsp;</p>\n\n<p>Nó vừa xoa dịu được những game thủ truyền thống yêu lối chơi lén lút, vừa có thể phù hợp với những game thủ mới chỉ mới biết đến&nbsp;<em>Assassin’s Creed</em>&nbsp;qua vài phiên bản gần đây.</p>\n\n<p>Ấy thế mà, “cao kiến” này thực tế lại là một “tối sách” không thể khôi hài hơn, phá hỏng toàn bộ, người viết xin nhấn mạnh là TOÀN BỘ lối chơi của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>.</p>\n\n<p>Cụ thể hơn, do được định hướng thiên hẳn về nhập vai nên cây kỹ năng của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;giờ đây được xây dựng liên kết rất mật thiết với nhau giữa các kỹ năng và chỉ số hỗ trợ, dù vẫn chia làm ba nhánh chính gồm Cận chiến, Ám sát và “Tay dài”.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211302/assassins-creed-valhalla-danh-gia-game-2.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Để tối ưu sức mạnh của nhân vật, các game thủ game nhập vai thường tìm cách “build” cho mình những công thức phối hợp đa dạng, tùy vào cách mà họ muốn nhân vật của mình phát triển.</p>\n\n<p>Chính vì điều đó nên khi chúng ta bật chức năng “Guaranteed Assassination” thì toàn bộ những kỹ năng liên quan đến ám sát và cả nhánh kỹ năng hành động lén lút coi như… phế!&nbsp;</p>\n\n<p>Nghĩa là bây giờ game thủ chỉ cần chăm chăm tăng điểm kỹ năng của mình vào hai nhánh còn lại: Cận chiến hoặc Tay dài mà thôi.&nbsp;</p>\n\n<p>Nếu suy xét kỹ hơn, khi đã chọn lối chơi ám sát lén lút, thì việc tăng điểm vào hai nhánh kỹ năng kia cũng… gần như vô nghĩa!</p>\n\n<p>Bạn có nghĩ rằng mình sẽ tăng điểm vào nhánh Cận chiến, chẳng biết để làm gì, sau đó bỏ công xách dao núp lùm để chơi lén lút hay không?&nbsp;</p>\n\n<p>Với bản thân người viết, đây là điều vô cùng khó hiểu mà&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;vẽ ra.&nbsp;</p>\n\n<p>Đúng là thất sách!</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211609/assassins-creed-valhalla-danh-gia-game-8.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<h3><strong>“LO NỒI CÁ, BỎ NỒI CƠM”</strong></h3>\n\n<p>&nbsp;“Cẩu thả” có lẽ là từ mô tả chính xác nhất cho chất lượng gia công của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;lần này, nếu so sánh với mức độ hoàn thiện của&nbsp;<em>Origins</em>&nbsp;hay&nbsp;<em>Odyssey</em>, bởi game chứa vô vàn lỗi trong suốt toàn bộ chiều dài game.</p>\n\n<p>Lỗi to không thiếu mà lỗi nhỏ thì “ngập tràn bờ đê”!&nbsp;</p>\n\n<p>Có lỗi thì ảnh hướng đến trải nghiệm, có lỗi thì ảnh hưởng luôn tiến độ chơi game… Nhưng tất cả không thể khó chịu bằng sự thiếu đầu tư trong mặt dàn dựng của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>.</p>\n\n<p>Rất nhiều “vật liệu” dựng nên hai phiên bản trước được trưng dụng lại trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;(game thủ hay gọi đùa là “công thức copy-paste” của Ubisoft) mà không hề có một sự nâng cấp hoặc cải tiến nào.&nbsp;</p>\n\n<p>Diễn hoạt nhân vật, động tác chạy, động tác lén lút, NPC, ngựa, cỏ cây hoa lá… tất cả đều được bê “nguyên đai, nguyên kiện” từ các phiên bản trước, thay đổi một ít vân bề mặt (texture) và thế là chúng ta có một phiên bản&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;mới, chỉ khác mỗi lớp áo và cái tên.</p>\n\n<p>Cách thức tổ chức thế giới của game cũng y xì đúc hai phiên bản trước, và dĩ nhiên là về chiều sâu nó còn chẳng được đào thêm một chút nào mà còn bị rút bớt đi.&nbsp;</p>\n\n<p>Thế giới trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;là một thế giới buồn tẻ, sơ sài với những cộng đồng con người lặp đi, lặp lại – điều mà kể cả với những tựa game “open-world” khác của Ubisoft như&nbsp;<em>The Division</em>,&nbsp;<em>Ghost Recon Wildlands</em>/<em>Breakpoint</em>… đều giống nhau mà mãi vẫn không thấy một chút tiến bộ nào dù đã 4-5 năm trôi qua rồi.&nbsp;</p>\n\n<p>Thật đáng thất vọng!</p>\n\n<p>May thay, thay vì lạm dụng những màn thủy chiến vô cùng nhàm chán kế thừa từ “cụ tổ”&nbsp;<em>Black Flag</em>,&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;đã mang đến một “hơi thở mới” là những màn cướp bóc (Raid) bằng những chiến thuyền thân dài (longboat) vượt sông, biển nổi tiếng của người Viking.&nbsp;</p>\n\n<p>Nhưng mà, cho dù ban đầu có thú vị đến mấy, thì với phong cách khai thác nông cạn của Ubisoft, nó cũng chỉ dừng ở mức bề nổi, để “làm màu” chứ chẳng thể khai thác sâu hơn về sau được.&nbsp;</p>\n\n<p>Cho đến hết game, các cuộc cướp bóc này vẫn sẽ chỉ dừng lại ở việc: đến nơi, xuống thuyền và cướp phá, rồi lặp đi, lặp lại…&nbsp;</p>\n\n<p>Kinh khủng hơn chính là những trận công thành được trình chiếu trong trailer.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211600/assassins-creed-valhalla-danh-gia-game-3.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Những tưởng đây sẽ là những phân đoạn đầy máu lửa, hoành tráng và phấn khích hệt như trong bộ phim truyền hình của History Channel truyền cảm hứng cho trò chơi –&nbsp;<em>Vikings</em>, người viết lại tiếp tục… vuốt mặt với vẻ chán chường một lần nữa!</p>\n\n<p>Bạn đã chơi qua tựa game có công thành chiến “cùng nhà Ubisoft” –&nbsp;<em>For Honor</em>&nbsp;chưa?&nbsp;</p>\n\n<p>Tuy chưa thể đạt đến tầm vóc ấn tượng như&nbsp;<em>Middle-Earth: Shadow of War</em>, nhưng ít ra không khí và sự loạn lạc mà&nbsp;<em>For Honor</em>&nbsp;thể hiện vẫn tạm chấp nhận được!&nbsp;</p>\n\n<p>Còn với&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>, chúng ta cứ lấy quy mô của&nbsp;<em>For Honor</em>&nbsp;chia nhỏ xuống, chẳng hạn số lượng lính hai bên đem chia ba, mức độ ác chiến tiếp tục chia ba, mức độ hỗn loạn đem chia ba luôn… là bạn đã có thể tưởng tượng được trận công thành “vô cùng ấn tượng” của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;ra sao rồi đấy!</p>\n\n<p>Thú thật là nếu so sánh với một trận chiến phe phái của&nbsp;<em>Odyssey</em>&nbsp;cách đây 2 năm, thì những trận công thành chiến của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;còn chẳng bằng, nói chi đến tầm cỡ như&nbsp;<em>Middle-Earth: Shadow of War</em>&nbsp;hay&nbsp;<em>For Honor</em>.</p>\n\n<p>Điều mà người chơi làm trong hầu hết các trận công thành chiến này, chính là nhiệm vụ game yêu cầu làm gì thì cứ cắm đầu chạy vào mà làm.&nbsp;</p>\n\n<p>Chẳng cần quan tâm lính lác “tẩn” nhau như thế nào, không cần biết đi đường nào mới là tối ưu, cũng chẳng cần để ý tướng lĩnh bên kia là ai, có chiến thuật và yếu mạnh thế nào, người chơi cứ cắm cổ chạy đến đích (vì cũng chỉ có một lối), mở cửa cho “500 anh em” hô to xông vào, mà thường thì anh em của chúng ta cũng… độn thổ vào trong hết rồi, mở cửa ra cho đúng “quy trình nhiệm vụ” mà thôi!&nbsp;</p>\n\n<p>Sau đó là… xem tiếp phim cắt cảnh, rồi bạn sẽ được trải nghiệm lại mô-típ công thành chiến này thêm vài lần nữa cho đến khi… ngán thì thôi!</p>\n\n<p>Đấy, dù học hỏi và làm tốt từ những tựa game nổi tiếng khác bao nhiêu trong hai phiên bản tiền nhiệm, thì Ubisoft thay vì tiếp tục phát huy và nâng cấp những ưu điểm này cho&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>, lại chỉ để thời gian đầu tư vào những thứ không đâu, kém hiệu quả và còn khiến các mối liên kết trong lối chơi của game trở nên lỏng lẻo.</p>\n\n<p>Sự thất vọng về mặt hoàn thiện game cũng chưa dừng lại ở đó, bởi càng chơi lâu, game thủ sẽ càng nhận ra vô vàn những yếu điểm.&nbsp;</p>\n\n<p>Đồ họa và âm thanh vốn là thế mạnh của dòng game này, ấy thế mà trong phiên bản lần này, rất tiếc lại là một điểm trừ vô duyên.</p>\n\n<p>Mặc dù đón đầu thế hệ console mới mạnh mẽ hơn, nhưng do đặt mục tiêu ra mắt nhiều phiên bản đồng thời trên các hệ máy cũ, nên chất lượng đồ họa không hề được nâng cấp, gần như giậm chân so với hai phiên bản trước đó.&nbsp;</p>\n\n<p>Nếu so sánh một cách kỹ càng hơn,&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;còn xấu hơn không ít so với phiên bản&nbsp;<em>Odyssey</em>&nbsp;ra mắt trước đó tận 2 năm.&nbsp;</p>\n\n<p>Mô hình môi trường, nhà cửa vô cùng thô kệch, hiệu ứng vật lý tệ hại, lỗi diễn hoạt, động tác thiếu uyển chuyển, góc lag, thú cưỡi ngu độn…&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121212351/assassins-creed-valhalla-danh-gia-game-9.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Có chăng, điều còn lại mà người viết vẫn còn cảm thấy hài lòng ở đồ họa của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;chính là hiệu ứng ánh sáng vẫn còn đủ để game thủ sử dụng chức năng chụp ảnh “cùi bắp” của game!</p>\n\n<p>Nếu nhìn sang mảng đồ họa một số tựa game cùng “tầm vóc” mới đây như&nbsp;<em>Horizon Zero Dawn</em>,&nbsp;<em>Red Dead Redemption 2</em>,&nbsp;<em>Death Stra</em><em>n</em><em>ding</em>… thì quả thật khá là đáng thất vọng cho một tựa AAA!</p>\n\n<p>Và đáng tiếc nhất phải là nhạc nền,&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;có rất nhiều bản nhạc nền hay, đầy kích thích và bắt tai!&nbsp;</p>\n\n<p>Nhưng chúng tiếp tục được sử dụng vô tội vạ, cơ chế lên nhạc theo tình huống hoạt động chập chờn, lỗi lặp lại một đoạn nhạc hoặc âm thanh gây ức chế, đôi lúc còn… tịt luôn cả nhạc nền!</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121212018/assassins-creed-valhalla-danh-gia-game-12.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<h3><strong>XÔ ĐỔ HÌNH TƯỢNG HỘI SÁT THỦ THIÊNG LIÊNG</strong></h3>\n\n<p>Như đã nói ở trên, việc kéo dài cốt truyện chính của dòng game&nbsp;<em>Assassin’s Creed</em>&nbsp;đã tạo nên khá nhiều lỗ hổng to tướng lâu nay không thể vá lắp, nay đã hoàn toàn bị Ubisoft ngó lơ, thay vào đó là nâng cao yếu tố “khám phá lịch sử, du lịch tại chỗ” trong các phiên bản sau này.&nbsp;</p>\n\n<p>Điều này dẫn đến sự khiên cưỡng trong việc gán ghép các sự kiện lịch sử, văn hóa bản địa khớp với tinh thần Tự Do – Trật Tự, cốt lõi của cốt truyện.&nbsp;</p>\n\n<p>Đặc biệt là khi bối cảnh lần này lại là Viking, thật sự không hề phù hợp một chút nào!&nbsp;</p>\n\n<p>Những chiến binh phương Bắc này có lối chiến đấu vô cùng cởi mở, bởi họ coi trọng danh dự, đề cao cái tôi trên chiến trường và vinh quang chính là được chết khi chiến đấu, để xứng đáng được bước vào Đại sảnh Valhalla sánh vai cùng các vị thần Bắc Âu lẫy lừng.</p>\n\n<p>Những tính cách nói trên, đi ngược lại tôn chỉ “We work in the Dark, to serve the Light” nổi tiếng của Hiệp hội Sát thủ.&nbsp;</p>\n\n<p>Sự vô lối và cao ngạo của người Viking còn được thể hiện hết sức “mất nết” trong việc họ coi thường Hidden Blade, thứ vũ khí ám sát được xem là biểu tượng của&nbsp;<em>Assassin’s Creed</em>&nbsp;từ thuở sơ khai bằng cách… đeo ngược nó, không thèm giấu giếm (dù về bản chất vẫn là “gian lận trong chiến đấu”).</p>\n\n<p>Nếu suy xét kỹ hơn, người chơi sẽ càng nhận ra mặt trái của đức tin mà Hội Sát thủ đang tôn thờ trong các phiên bản&nbsp;<em>Assassin’s Creed</em>&nbsp;trước đây, tất cả đều sẽ được phơi bày trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>.&nbsp;</p>\n\n<p>Đó là những hành động sáo rỗng nhân danh sự tự do, mà hậu quả để lại chỉ xoay quanh hận thù, đau thương và mất mát.&nbsp;</p>\n\n<p>Nó chẳng thể hiện được một tầm nhìn về tương lai tốt đẹp, dù đã cố gắng chỉ ra những cái xấu xa trong chế độ cầm quyền đương thời.&nbsp;</p>\n\n<p>Điều mà cho đến tận thời điểm bối cảnh của&nbsp;<em>Assassin’s Creed: Rogue</em>&nbsp;trước đây mới được đem ra bàn tán đúng mực, và tiếp tục được đào sâu hơn trong&nbsp;<em>Assassin’s Creed Syndicate</em>.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211922/assassins-creed-valhalla-danh-gia-game-4.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Sự gò bó này trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;được thực thi rất mạnh, cho dù người chơi có nhận ra rằng những điều mình đang làm có vô cùng sai trái và thiếu sự khôn ngoan, thì kết quả sẽ vẫn không đổi, cho dù có chọn phương án trả lời nào đi nữa.&nbsp;</p>\n\n<p>Thứ thay đổi duy nhất chỉ có thể là thái độ của NPC đối với người chơi, sẽ chỉ là một vài câu nói hằn học, một vài cái chau mày thể hiện sự bực tức trong phim cắt cảnh…&nbsp;</p>\n\n<p>Rồi mọi chuyện sẽ đâu vào đấy sau chỉ “một nốt nhạc”, khi tuyến nhiệm vụ kết thúc và NPC lẫn bạn sẽ trao cho nhau những lời chúc mừng đầy chân thành từ tận đáy lòng như chưa có “quần què” gì xảy ra từ trước đến nay vậy!?</p>\n\n<p>Điều phản cảm nhất, mà có lẽ là ở phiên bản trước nó quá sơ sài nên người viết không màng nhắc đến, đó chính là yếu tố xây dựng tình cảm của người chơi với NPC.</p>\n\n<p>Đôi khi, trong một vài lựa chọn hội thoại của nhân vật chính, người chơi sẽ vô tình có một lựa chọn cải thiện tình cảm giữa bạn và NPC.&nbsp;</p>\n\n<p>Tuy nhiên, các tùy chọn hội thoại này như chỉ được thêm vào cho “bằng bạn bằng bè”, bởi với một số nhân vật, người chơi chẳng hề có bất kỳ sự liên kết hoặc xảy ra “phản ứng hóa học” nào nhưng vẫn lòi ra những lựa chọn tương tác vớ vẩn này.</p>\n\n<p>Lố bịch hơn, ngoài duy nhất Randvi có một tuyến nhiệm vụ (ngắn ngủn) để cho người chơi thấy sự đồng điệu giữa hai người, thì còn lại những “nhân tình” mà bạn trải qua trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;đều không hề có bất kỳ liên kết về nhiệm vụ nào để đào sâu vào mối quan hệ đó.&nbsp;</p>\n\n<p>Thứ mà sau đó người chơi “mở khóa” được cũng chỉ dừng lại ở một vài tùy chọn “mua vui” cơ bản như: lên giường, hôn, chia tay, hoặc “cái của nợ gì đó” liên quan tới việc nhầm lẫn tên tuổi của nhân tình!</p>\n\n<p>Những thêm thắt chủ yếu để “làm màu” này chẳng nhằm khắc họa tính cách hay chiều sâu của nhân vật gì cả, mà ngược lại còn đem đến sự báng bổ, biến giới tính thành một phông nền không hơn không kém và cũng cho thấy thái độ thiếu tôn trọng giới tính/tính dục của nhân vật mà chính người chơi điều khiển.</p>\n\n<p>Với hệ thống tình cảm được xây dựng nông cạn như thế này, thì không biết bao giờ các phiên bản&nbsp;<em>Assassin’s Creed</em>&nbsp;sau này mới đạt được tầm cỡ của dòng game&nbsp;<em>The Witcher</em>&nbsp;hay&nbsp;<em>Dragon Age</em>?</p>\n\n<h2>BẠN SẼ THÍCH</h2>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211731/assassins-creed-valhalla-danh-gia-game-6.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<h3><strong>VẪN ĐỦ SỨC GÂY NGHIỆN</strong></h3>\n\n<p>Có một điều thú vị ở các tựa game&nbsp;<em>Assassin’s Creed</em>&nbsp;nói riêng, là dù được áp dụng với cùng một công thức, độ sâu tuy nông cạn nhưng được xây dựng với vô vàn những hoạt động bên lề vẫn đủ sức khiến người viết và rất nhiều người khác phải cắm mặt nhiều giờ liền để “cày”.&nbsp;</p>\n\n<p><strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;cũng không ngoại lệ, dù về số lượng hoạt động bên lề đã được cắt giảm đi tương đối.</p>\n\n<p>Người chơi sẽ vẫn ham hố với những bí ẩn, cài cắm của nhà sản xuất đặt rải rác khắp các bản đồ, đòi hỏi người chơi phải sử dụng một “ít não” để giải đố, thu lấy những phần thưởng mang giá trị sưu tập là chủ yếu!</p>\n\n<p>Điểm mà người chơi thích nhất trong&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;lần này chính là hệ thống trang bị.&nbsp;</p>\n\n<p>Thay vì phát triển theo dạng lượm, nâng cấp đồ với số lượng nhiều như “rác công nghiệp”, thì với phiên bản lần này, mỗi trang bị sẽ bỏ công tìm kiếm hơn rất nhiều, được bố trí sắp đặt theo chiều hướng phát triển của nhân vật và cũng đòi hỏi người chơi phải có sự thống nhất trong cách phối đồ.</p>\n\n<p>Chưa dừng lại ở đó, mảng trang bị cũng yêu cầu người chơi bỏ công tìm kiếm cả những nguyên vật liệu nâng cấp cũng được đặt rải rác và thuận theo cách phát triển của cốt truyện và nhân vật, khiến tiến độ khám phá của game thủ rất đều đặn, liên tục thúc đầy họ đầu tư thời gian vào game.</p>\n\n<p>Một yếu tố mới khác, cũng mang ý nghĩa hỗ trợ song song nhịp phát triển của game cũng như góp phần không nhỏ trong việc cuốn người chơi không ngừng nghỉ chính là việc cho phép game thủ&nbsp;xây dựng một “Đế chế” nhỏ cho riêng mình.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20201121211720/assassins-creed-valhalla-danh-gia-game-1.jpg\" style=\"height:720px; width:1280px\"></p>\n\n<p>Bằng những cuộc cướp bóc, chinh phạt dọc theo cốt truyện game, những chiến lợi phẩm thu được sẽ mang về để xây dựng Đế chế của người chơi ngày một to hơn, phồn thịnh hơn, thu hút nhiều NPC đặc biệt với&nbsp;nhiều ngành nghề, chức nghiệp&nbsp;cốt là để hỗ trợ ngược lại chính người chơi phát triển nhân vật.</p>\n\n<p>Tuy mức độ yếu tố&nbsp;xây dựng nhà cửa, đồn điền&nbsp;này chỉ mới dừng lại ở mức độ khá sơ khai, nhưng lại vừa đủ để bổ trợ cho người chơi tiếp tục dính chặt vào nhịp của&nbsp;<strong><em>Assassin’s Creed Valhalla</em></strong>&nbsp;suốt một thời gian dài.&nbsp;</p>\n\n<p>Có NPC đảm trách việc chế tạo và nâng cấp vũ khí; có NPC đảm trách vị trí chiến lược gia, quân sư mỗi khi bạn ra trận; lại có NPC đảm trách công việc tuyển mộ những chiến binh mạnh mẽ cho quân đoàn phương Bắc của bạn; và rất nhiều NPC khác hỗ trợ mua bán vật phẩm, huấn luyện thú nuôi, bói quẻ đoán số, lô đề hay cờ bạc, xây dựng phòng trưng bày, nâng cấp tàu bè, tăng gia trồng trọt chăn nuôi…</p>\n\n<p>Tất cả đều được sinh ra với một mục đích chính, thúc đầy người chơi lên đường chinh phạt, mang chiến lợi phẩm về “xây tổ ấm” để nhận lại những phần thưởng xứng đáng, đưa bạn dần tiến gần hơn đến với cương vị của một nhà lãnh đạo vĩ đại, hoàn hảo trong chiến đấu và quản lý đất nước (cỡ… một ngôi làng).</p>\n</div>',5,'2023-01-27',1,'1ssNCZJBI6VQVLWcRrT6I7-Dj9yLB05ez'),
(6,'Đánh giá Grand Theft Auto 5 (GTA 5): Đắm mình trong thế giới \"mafia\" của riêng bạn','<div><h3><strong>GTA 5: Tựa game đẳng cấp thế giới</strong></h3>\n\n<p>Grand Theft Auto 5 là một tựa game với cốt truyện thông minh, độc ác và bình luận có liên quan chặt chẽ về nước Mỹ đương thời, hậu khủng hoảng kinh tế. Mọi thứ về nó đều mang tính châm biếm: nó xé toạc thế hệ Millennial, những người nổi tiếng, cực hữu, cực trái, tầng lớp trung lưu, giới truyền thông... Không gì an toàn trước miệng lưỡi sắc bén của Rockstar, kể cả những trò chơi điện tử hiện đại... Trò chơi được phát hành vào tháng 9 năm 2013 trên PlayStation 3 và Xbox 360, tháng 11 năm 2014 trên PlayStation 4 và Xbox One, và vào tháng 4 năm 2015 trên nền tảng&nbsp;game PC&nbsp;Microsoft Windows. Các phiên bản dành cho&nbsp;game console&nbsp;PlayStation 5 và Xbox Series X dự kiến sẽ được phát hành vào cuối năm 2021.</p>\n\n<h3><strong>Đặc trưng của GTA 5</strong></h3>\n\n<p>Khái niệm thế giới mở trong GTA 5 thực sự là một lợi thế khác biệt của series Grand Theft Auto. Rockstar đã thành công trong việc khai thác tối đa mọi tiềm năng của một trò chơi thế giới mở. Đó là lý do tại sao tôi đánh giá GTA 5 sẽ khiến bạn say mê khi khám phá nó.</p>\n\n<p>Người chơi có thể làm bất cứ điều gì họ muốn, và không chỉ tạo ra sự hỗn loạn trên đường cao tốc hoặc bắt người chơi đối phó với cảnh sát. Người chơi còn có thể ghé thăm các câu lạc bộ đêm, đi tàu, bơi dưới đáy biển hoặc bắt máy bay. Hơn nữa, người chơi còn được đưa ra những cách để kiếm tiền thay vì đi cướp, đó là sở hữu cổ phiếu trên sàn chứng khoán.</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-5.png\"></p>\n\n<p>Việc khắc họa tính cách của từng nhân vật chính trong GTA 5 là rất phù hợp. Bên cạnh những câu chuyện của riêng họ, tính cách và phong cách nói chuyện của từng người trông rất khác biệt và đặc biệt. Ví dụ, Franklin với phong cách ăn nói không thể tách rời việc sử dụng các từ homie và nigga...</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-9.png\"></p>\n\n<h3><strong>Cốt truyện&nbsp;</strong></h3>\n\n<p>Không giống như phần trước chỉ có một nhân vật chính, GTA 5 có thêm một điều bất ngờ, ba nhân vật chính với ba bối cảnh câu chuyện khác nhau. Chào mừng bạn đến với Los Santos, ngôi nhà và chiến trường của:</p>\n\n<ul>\n	<li>Michael De Santa: Tên cướp ngân hàng đã giải nghệ</li>\n	<li>Trevor Philips: Tên bán thuốc phiện và buôn lậu vũ khí</li>\n	<li>Franklin Clinton: Tên giang hồ đường phố</li>\n</ul>\n\n<p>Vụ cướp kéo dài 9 năm của Michael và Trevor tại North Yankton cùng với hai thành viên phi hành đoàn khác đã kết thúc trong thảm họa. Bị phục kích bởi lực lượng cảnh sát, Michael đã bị thương phải nhờ Trevor cứu và cuối cùng biến mất một cách bí ẩn. Chín năm sau, hai “đôi uyên ương” này đi đến cùng một kết luận - rằng mỗi người bạn của họ đều đã chết trong thảm kịch.</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-7.png\"></p>\n\n<p>Tuy nhiên, ai có thể ngờ rằng Michael đã tự cứu mình, làm nhân chứng cho FBI và trở nên giàu có. Trong khi đó, ở một góc khác của thành phố, Trevor, người không biết về số phận của Michael, phải chiến đấu và bắt đầu công việc kinh doanh ma tuý của mình từ đầu. Giữa hai nhân vật này có Franklin Clinton, một tay xã hội đen trẻ tuổi vừa chuẩn bị bắt đầu cuộc đời phạm tội của mình. Franklin cuối cùng đã gặp Michael, đối tác tội phạm mà anh ta tìm kiếm. Cuộc gặp gỡ đáng nhớ đầu tiên giữa hai nhân vật kết thúc bằng việc xây dựng một mối quan hệ hợp tác đặc biệt, bắt đầu cho nhiều hoạt động tội phạm hơn. Michael và Franklin cuối cùng quyết định cướp một cửa hàng trang sức để củng cố tài chính.</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5.jpg\" style=\"height:450px; width:800px\"></p>\n\n<p>Vụ cướp đưa Michael trở lại thế giới tội phạm, Franklin ở một cấp độ cao hơn, và Trevor phát hiện ra rằng người bạn thân nhất của mình vẫn chưa chết. Trevor rất ngạc nhiên trước sự thật này, sau đó anh ta chạy trốn đến Los Santos, cố gắng tìm Michael và yêu cầu một lời giải thích. Nỗ lực cuối cùng cũng thành công nhờ sự giúp đỡ của Dave. Thay vì tức giận với những lời nói dối của Michael, Trevor quay trở lại&nbsp;liên minh&nbsp;để thành lập nhóm tội phạm đã chia rẽ trong quá khứ nhưng với sự giúp đỡ của Franklin và Lester, nó đã xảy ra một vấn đề phức tạp. Đụng độ biết bao thế lực tội phạm khác, thậm chí cả chính quyền, bộ ba này phải đối mặt với những lời đe dọa sẵn sàng đòi mạng bất cứ lúc nào. Vậy liệu Trevor, Michael và Franklin có thành công trong việc thực hiện tội ác lớn nhất của họ? Có những trở ngại nào để ngăn cản họ? Sẽ có những loại xung đột nào? Bạn có thể tìm thấy tất cả câu trả lời cho những câu hỏi này bằng cách chơi GTA 5.</p>\n\n<h3><strong>Gameplay</strong></h3>\n\n<p>Game thủ không bị ép buộc phải theo dõi câu chuyện với một nhịp độ nhất định. Có thể khám phá thế giới mở và làm bất cứ điều gì bạn muốn là yếu tố chính của GTA 5. Cho dù bạn muốn cướp một chiếc xe bọc thép, cướp một cửa hàng tiện lợi, đốn hạ người đi bộ hay chỉ đơn giản là lái xe xung quanh, bạn đều có thể làm được.</p>\n\n<p>Tất cả điều này có thể được thực hiện từ góc nhìn thứ ba với tùy chọn cho người dùng PC sử dụng chuột,&nbsp;bàn phím&nbsp;hoặc bộ điều khiển. Do đó, chủ sở hữu phiên bản PC có thể hoán đổi giữa các sơ đồ điều khiển khác nhau cho các khía cạnh khác nhau của trò chơi. Ví dụ: bạn có thể sử dụng chuột và bàn phím khi đang đọ súng với cảnh sát và sau đó chuyển sang bộ điều khiển để thoát khỏi tình huống đó trong ô tô, máy bay, thuyền hoặc tàu lặn.</p>\n\n<p>Như mọi khi, tiền là mục tiêu chính của trò chơi. Nó là thứ thúc đẩy cả ba nhân vật chính và đẩy bạn vào con đường thực hiện các hành vi tội ác. Sau khi có tiền, bạn có thể đầu tư mua lại một số doanh nghiệp, nó sẽ tự động tạo ra tiền cho bạn, cá nhân bạn cũng có thể tham gia để tạo thêm một số doanh thu cho nhân vật của mình. Ngoài ra còn có tùy chọn đầu tư vào thị trường chứng khoán, giống như trong cuộc sống thực, nó thực sự khó khăn. Trừ khi bạn trực tiếp gây ảnh hưởng đến thị trường, chẳng hạn như đầu tư vào công ty xe hơi cụ thể và sau đó thực hiện một số hành động sẽ nâng cao giá trị cổ phiếu của công ty đó.</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-1.png\"></p>\n\n<p>Đôi khi mục tiêu chính không phải là tiền, chỉ cần lái xe vòng quanh Los Santos cũng là một trải nghiệm thú vị. Các loại xe và mẫu xe khác nhau, các tùy biến về tốc độ, hiệu suất và lực kéo đã được nhà phát hành tối ưu hóa rất tốt để game thủ cảm nhận được tính chân thật khi ngồi trên những con xe và lướt vòng quanh Los Santos.</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-2.png\"></p>\n\n<p>Cơ chế bắn súng trong GTA V là một khía cạnh khác của trò chơi được duy trì tốt và được cải thiện đáng kể bằng cách cung cấp cho người chơi tùy chọn chuyển sang chế độ góc nhìn thứ nhất.&nbsp;Đối với những người thích góc nhìn thứ nhất cho bất kỳ loại game bắn súng nào, đây là một bổ sung đáng hoan nghênh và chúng tôi hy vọng Rockstar sẽ tiếp tục triển khai trong các phần sau.</p>\n\n<h3><strong>Tạm kết về GTA 5: Tựa game đẳng cấp thế giới</strong></h3>\n\n<p>Năm 2015, tờ báo ca ngợi&nbsp;GTA 5 là trò chơi điện tử xuất sắc thứ hai trong lịch sử. Trò chơi cũng xếp hạng cao trên một số danh sách do công chúng bình chọn: bao gồm vị trí thứ 8 trong danh sách \"100 trò chơi điện tử xuất sắc nhất mọi thời đại\" của độc giả tạp chí Empire và thứ 5 trong danh sách \"Top 100 trò chơi điện tử\" của khán giả chương trình Good Game.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.sforum.vn/sforum/wp-content/uploads/2021/07/gta-5-8.png\">Anh em nghĩ gì về tựa game GTA 5? Hãy comment chia sẻ ý kiến của anh em bên dưới, hy vọng những anh em game thủ trên cả nước nhất là ở Thành phố Hồ Chí Minh, nơi đại dịch Covid 19 bùng phát nghiêm trọng sẽ có thật nhiều sức khỏe. Và cuối cùng đừng quên điều quan trọng nhất, hãy theo dõi Sforum.vn để cập nhật những bài viết mới nhất về&nbsp;game ps4&nbsp;nha anh em.</p>\n</div>',5,'2023-01-27',1,'1H_s2JVAeUgCuQmlG826q81VLM23PpzGx'),
(7,'Resident Evil 8: Village - Siêu phẩm game kinh dị đồ họa đỉnh cao','<div><h3><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//16-800x450.jpg\" style=\"height:450px; width:800px\"></h3>\n\n<h3><strong>I. Thông tin Resident Evil 8: Village</strong></h3>\n\n<ul>\n	<li><strong>Thể loại:</strong>&nbsp;Hành động,&nbsp;Nhập vai,&nbsp;Phiêu lưu</li>\n	<li><strong>Đồ hoạ:</strong>&nbsp;3D</li>\n	<li><strong>Chế độ:</strong>&nbsp;Online, Offline</li>\n	<li><strong>Độ tuổi:</strong>&nbsp;18 tuổi trở lên&nbsp;</li>\n	<li><strong>Nhà phát hành:</strong>&nbsp;Capcom</li>\n	<li><strong>Hệ điều hành:</strong>&nbsp;Windows&nbsp;10, PlayStation 5, PlayStation 4, Xbox One</li>\n	<li><strong>Ngày ra mắt:</strong>&nbsp;07/05/2021</li>\n	<li><strong>Giá game:</strong>&nbsp;Có phí</li>\n</ul>\n\n<h3><strong>II. Cốt truyện Resident Evil 8: Village</strong></h3>\n\n<p>Ba năm sau những biến cố xảy ra trong&nbsp;Resident Evil 7,&nbsp;Ethan Winters&nbsp;cùng vợ là Mia đã chuyển đến sinh sống tại một thị trấn nhỏ ở Châu Âu. Sau một khoảng thời gian, cả hai đã có với nhau một cô con gái có tên Rosemary.</p>\n\n<p>Tưởng chừng cuộc sống gia đình sẽ mãi bình yên như vậy. Nhưng không, sự bình yên đó đã kết thúc khi&nbsp;Chris Redfield&nbsp;xuất hiện bất ngờ vào một buổi tối. Không một lời giải thích, Redfield cùng người của hắn đã xả súng và giết Mia một cách vô cùng tàn nhẫn.</p>\n\n<p>Trong lúc Ethan vẫn còn đang chưa định hình được chuyện đang xảy ra với gia đình của mình, anh và con gái Rosemary đã bị Redfield làm cho hôn mê và đưa đi.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//8-800x450-1.jpg\" style=\"height:450px; width:800px\"></p>\n\n<p>Sau khi tỉnh lại, Ethan phát hiện dường như đoàn xe áp giải anh đã vừa bị một vụ tai nạn cực kỳ khủng khiếp. Hai người lính áp giải Ethan đã bị một thứ gì đó hạ gục. Dựa trên những dấu vết để lại, cả hai đã bị một sinh vật nào đó tấn công vô cùng tàn nhẫn.</p>\n\n<p>Tuy nhiên, điều mà Ethan quan tâm lúc này chính là con gái của mình đang ở đâu? Sau khoảng thời gian tìm kiếm, Ethan đến được một ngôi làng nhỏ. Điều kỳ lạ chính là mọi người trong làng đã rời đi trước khi anh đến không lâu.</p>\n\n<p>Mất một khoảng thời gian, Ethan mới gặp được một ông lão và có lẽ đây là người duy nhất còn lại ở ngôi làng.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//15-800x400-1.jpg\" style=\"height:400px; width:800px\"></p>\n\n<p>Chưa kịp hỏi bất cứ thông tin gì từ ông lão, cả hai đã bị một đám sinh vật biến dị cực kỳ hung tợn tấn công. Tuy có thể di chuyển bằng hai chân, nhưng đám sinh vật này lại có phần thân dị hợm.</p>\n\n<p>Tương tự như những con sói đói săn mồi, chúng điên cuồng truy đuổi tấn công Ethan và ông lão. Sau khi hạ gục ông lão, Ethan trở thành mục tiêu duy nhất bị đám người sói truy lùng. Sau khi bắt được anh, tên thủ lĩnh đã quyết định bỏ đi, và Ethan vẫn sống sót.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//3-800x450-1.jpg\"></p>\n\n<p>Sau khi đến lâu đài Dimitrescu, Ethan vô tình biết được những thông tin về vùng đất này từ một thương gia địa phương tên là The Duke cung cấp.</p>\n\n<p>Ethan hiện đang ở&nbsp;Transylvania&nbsp;,&nbsp;Romania&nbsp;và đây là một vùng đất bí ẩn, quanh năm lạnh giá. Nơi đây được cai quản bởi một người có tên gọi là Mẹ Miranda, một người mà người dân ở đây vô cùng tôn thờ như một vị thần.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//14-800x450-1.jpg\" style=\"height:450px; width:800px\"></p>\n\n<p>Gần đây, Mẹ Miranda không còn giúp đỡ những người dân quanh khu vực này nữa. Bà cùng các thủ lĩnh của mình đang âm mưu thực hiện một nghi lễ bí ẩn và dường như con gái của Ethan chính là một phần trong nghi lễ đó.</p>\n\n<p>Với quyết tâm ngăn chặn nghi lễ để cứu con gái, Ethan tiếp tục cuộc hành trình tại vùng đất lạnh giá này. Vậy Mẹ Miranda là ai? Bà đang có âm mưu gì? Hành trình giải cứu con gái của Ethan sẽ diễn ra như thế nào? Cùng khám phá ngay trong Resident Evil Village nhé.</p>\n\n<h3><strong>III. Gameplay Resident Evil 8: Village&nbsp;</strong></h3>\n\n<p><strong>1. Lối chơi&nbsp;</strong></p>\n\n<p>Resident Evil 8: Village sở hữu lối chơi tương đồng với phiên bản tiền nhiệm. Dưới góc nhìn thứ nhất, người chơi trở thành Ethan Winters để thực hiện cuộc phiêu lưu khám phá ngôi làng bí ẩn tại Romania, cũng như tìm kiếm và giải cứu cô con gái Rosemary của mình.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//11-800x450-1.jpg\"></p>\n\n<p>Để giúp người chơi xác định phương hướng cũng như những việc cần thực hiện, một chuỗi các nhiệm vụ, mục tiêu lần lượt xuất hiện trong trò chơi. Người chơi cần tương tác với các nhân vật phụ để được hướng dẫn nhiệm vụ cũng như tiếp tục cuộc hành trình.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//13-800x486-1.jpg\"></p>\n\n<p>&nbsp;</p>\n\n<p>Trên hành trình thực hiện nhiệm vụ, người chơi sẽ phải đối đầu với các thử thách từ tìm người, tìm đồ vật, hạ gục mục tiêu đến đánh bại tên thủ lĩnh hùng mạnh. Người chơi có thể sử dụng các loại vũ khí khác nhau trong quá trình chiến đấu.</p>\n\n<p>Tuy nhiên ngoài các vũ khí cận chiến, thì các loại súng, hoặc vũ khí tấn công từ xa trong trò chơi đều được giới hạn lượng đạn nhất định. Chính vì thế người chơi cần có sự cân nhắc để sử dụng vũ khí sao cho hợp lý và hiệu quả nhất.</p>\n\n<p><strong>2. Hệ thống nhân vật phong phú</strong></p>\n\n<p>Nếu như trong Resident Evil 7, hệ thống nhân vật chỉ bao gồm Ethan, Mia, Evelyn và gia đình 4 người nhà Baker thì Resident Evil 8: Village sở hữu hệ thống nhân vật vô cùng phong phú.</p>\n\n<p>Ngoài nhân vật chính là Ethan, trò chơi còn có thêm các nhân vật phụ như Redfield, The Duke, Mẹ Miranda, 4 lãnh chúa ở 4 khu vực là&nbsp;Alcina Dimitrescu, Donna Beneviento, Salvatore Moreau và Karl Heisenberg cùng vô số các nhân vật phụ khác.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//4-800x450.jpg\"></p>\n\n<p>Mỗi nhân vật phụ đều có vai trò nhất định và góp phần trong cốt truyện chính. Người chơi phải tương tác với họ để tìm kiếm thông tin, giao dịch cùng họ để có thêm đạn dược, vũ khí hoặc thậm chí là chiến đấu và tiêu diệt để hoàn thành mục tiêu nhiệm vụ.</p>\n\n<p><strong>3. Trang bị đa dạng&nbsp;</strong></p>\n\n<p>Tương tự phiên bản tiền nhiệm, Resident Evil 8: Village cho phép người chơi sử dụng nhiều loại vũ khí, vật dụng hỗ trợ khác nhau. Người chơi có thể nhặt những món vũ khí cơ bản thông qua khám phá, tìm kiếm hay trao đổi với The Duke để sở hữu vũ khí uy lực mạnh hơn.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//10-800x450-2.jpg\"></p>\n\n<p>Đạn dược là thứ rất quan trọng giúp người chơi có thể tồn tại và chiến đấu trong Resident Evil 8: Village. Giống như các món vũ khí, người chơi có thể nhặt được đạn trong cuộc hành trình hoặc trao đổi với thương nhân The Duke.&nbsp;</p>\n\n<p>Ngoài ra, bằng cách thu thập thuốc súng cùng một số nguyên liệu khác, người chơi hoàn toàn có thể tự tay chế tạo đạn cho mình. Và trong trường hợp thấp máu, những bình thuốc nhặt được hoặc tự chế có thể giúp Ethan hồi phục nhanh chóng.</p>\n\n<p><strong>4. Miranda và những tên thủ lĩnh&nbsp;</strong></p>\n\n<p>Với những thông tin được The Duke cung cấp, người chơi có thể xác định ngay người phụ nữ có tên gọi Mẹ Miranda chính là trùm cuối trong Resident Evil 8: Village. Bên cạnh người phụ nữ bí ẩn này còn có 4 tên lãnh chúa lần lượt là: Alcina Dimitrescu, Donna Beneviento, Salvatore Moreau và Karl Heisenberg.</p>\n\n<p>Các tên lãnh chúa phục vụ dưới trướng của Mẹ Miranda và phụ trách 4 khu vực khác nhau tại vùng đất bí ẩn này. Chúng sở hữu siêu năng lực tà ác khác nhau để thống trị vùng đất của mình và thật ra là chúng cũng chẳng ưa gì nhau.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//7-800x450-1.jpg\"></p>\n\n<p>Nếu Alcina Dimitrescu được biết đến là một quý cô Ma Cà Rồng đang sống cùng 3 cô con gái tại lâu đài Dimitrescu thì Karl Heisenberg là thủ lĩnh của những sinh vật giống người sói với lãnh địa là khu vực nhà máy trong thị trấn.</p>\n\n<p>Còn Donna Beneviento, một cô gái sống tại dinh thự có tên House Beneviento, sở hữu năng lực điều khiển con rối Angie kinh dị. Và cuối cùng là Salvatore Moreau, người quản lý hồ chứa nước trong thị trấn và được mô tả giống như một người nhện.</p>\n\n<p><strong>5. Thế giới mở rộng lớn&nbsp;</strong></p>\n\n<p>Bên cạnh việc thực hiện mục tiêu theo diễn biến của cốt truyện chính, Resident Evil 8: Village cho người chơi thỏa sức khám phá những khu vực khác tại ngôi làng cổ bí ẩn này.</p>\n\n<p>Vô số những khu vực, địa điểm thú vị cũng như cảnh quan tuyệt đẹp đã được nhà phát hành trau chuốt tỉ mỉ, phác hoạ cực kỳ chi tiết để mang đến cho người chơi hình ảnh về một vùng đất Đông Âu tuyết trắng phủ đầy hùng vĩ.&nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//2-800x450-1.jpg\"></p>\n\n<p>Ngoài việc tự do di chuyển, khám phá, người chơi còn có thể thực hiện một số nhiệm vụ phụ đặc biệt để thu thập, mở khoá và nhận được những trang bị, vật phẩm đặc biệt trong trò chơi.&nbsp;</p>\n\n<p><strong>6. Chế độ Mecenaries</strong></p>\n\n<p>Sau lần gần nhất xuất hiện trong&nbsp;Resident Evil 6, chế độ Mecenaries đã chính thức trở lại trong Resident Evil 8: Village. Trong chế độ chơi này, người chơi phải vượt qua những thử thách với số lượng quái vật đông đảo.</p>\n\n<p>Người chơi có thể sử dụng nhiều loại vũ khí khác nhau, với lượng đạn được tăng thêm rất nhiều. Nhiệm vụ của người chơi trong chế độ Mecenaries là tiêu diệt toàn bộ kẻ địch để giành chiến thắng và tiến đến màn chơi tiếp theo.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//12-800x450-1.jpg\"></p>\n\n<h3><strong>IV. Âm thanh và Đồ hoạ&nbsp;</strong></h3>\n\n<p><strong>1. Âm thanh&nbsp;</strong></p>\n\n<p>Nếu phải đánh giá chất lượng âm thanh của Resident Evil 8: Village một cách ngắn gọn và cụ thể nhất thì đó sẽ là sống động và chân thật. Nhà phát hành đã vô cùng tỉ mỉ trong việc lựa chọn và sử dụng âm thanh trong trò chơi.</p>\n\n<p>Các nhân vật trong trò chơi đã được lồng tiếng một cách cực kỳ hoàn hảo bởi những nghệ sĩ lồng tiếng chuyên nghiệp thể hiện rõ tâm trạng, cảm xúc của từng nhân vật qua các giai đoạn của trò chơi.</p>\n\n<p>Bên cạnh đó, phần nhạc nền được lựa chọn hoàn hảo trong từng phân đoạn cũng như diễn biến nội dung. Người chơi có thể cảm nhận những câu chuyện hay nội dung mà nhà phát hành muốn truyền tải rõ ràng và chi tiết hơn.</p>\n\n<p>Ngoài ra, hiệu ứng âm thanh được bố trí và sử dụng khéo léo, phù hợp, mang đến cho người chơi cảm giác đầy chân thật, những trận chiến thêm phần sống động, gây cấn và lôi cuốn hơn rất nhiều.&nbsp;</p>\n\n<p><strong>2. Đồ hoạ&nbsp;</strong></p>\n\n<p>Được đánh giá là một trong những siêu phẩm game của năm 2021, Resident Evil 8: Village tạo nên những khung hình sống động, chi tiết và hoàn hảo nhất. Những nhân vật được phác hoạ tinh tế, khiến người chơi có cảm giác như đang xem một bộ phim bom tấn điện ảnh.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn//GameApp/238675//5-800x450-1.jpg\"></p>\n\n<p>Bối cảnh tại ngôi làng bí ẩn quanh năm lạnh giá được mô tả cực kỳ sống động, hoàn mỹ. Từ kiến trúc nhà cửa, cây cối, các đồ vật hay trang phục của người dân đều mang đậm phong cách Đông Âu.</p>\n\n<p>Và với phần hiệu ứng hình ảnh trong những trận chiến, hiệu ứng tuyết rơi, hay một số kỹ năng chiến đấu, tương tác với bối cảnh được xây dựng vô cùng hoành tráng, đẹp mắt nhưng vẫn giữ được độ chân thật cao. Giúp trò chơi thêm phần hấp dẫn, lôi cuốn và thu hút được người chơi.&nbsp;</p>\n\n<h3><strong>V. Cấu hình chơi Resident Evil 8: Village</strong></h3>\n\n<p>Yêu cầu bộ xử lý và hệ điều hành 64 bit</p>\n\n<ul>\n	<li><strong>Hệ điều hành:</strong>&nbsp;Windows 10 (64 bit)</li>\n	<li><strong>Bộ xử lý:</strong>&nbsp;AMD Ryzen 3 1200 hoặc Intel Core i5-7500</li>\n	<li><strong>Bộ nhớ:</strong>&nbsp;RAM 8GB</li>\n	<li><strong>Đồ họa:</strong>&nbsp;AMD Radeon RX 560 với 4GB VRAM hoặc NVIDIA GeForce GTX 1050 Ti với 4GB VRAM</li>\n	<li><strong>DirectX:</strong>&nbsp;Phiên bản 12</li>\n</ul>\n\n<p>Resident Evil Village chắc chắn sẽ mang đến cho người chơi những trải nghiệm vô cùng thú vị và tuyệt vời nhất, đặc biệt đối với những ai yêu thích dòng game hành động, phiêu lưu thế giới mở. Hãy tải và trải nghiệm ngay để có được những cảm nhận chi tiết hơn về những điều tuyệt vời mà siêu phẩm game hành động, nhập vai Resident Evil 8: Village mang lại nhé.</p>\n</div>',5,'2023-01-27',1,'1yMGIea4QQOMdpIMhu-FVMVBRHA3XjfTT'),
(8,'The Witcher 3: Wild Hunt – Đánh Giá Game','<div><h3><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20181013220552/the-witcher-3-wild-hunt-danh-gia-game-e1585825794945.jpg\" style=\"height:561px; width:1920px\"></h3>\n\n<p><strong>The Witcher 3: Wild Hunt</strong>&nbsp;– Khi nhắc tới đất nước Ba Lan, bạn sẽ nghĩ đến cái gì đầu tiên? Đối với nhiều người, đó có thể là nhạc sỹ tài ba Chopin hay nhà hóa học kiêm vật lý học lừng danh: Maria Curie.</p>\n\n<p>Nhưng đối với giới game thủ, hay tổng thống Mỹ Barrack Obama thì khi nhắc đến Ba Lan, họ có thể sẽ nghĩ ngay đến dòng game nhập vai&nbsp;<em>The Witcher</em>&nbsp;đã và đang “làm mưa làm gió” trên thị trường game bao nhiêu năm qua.</p>\n\n<p>Thật vậy, loạt game về người hùng Witcher mang danh “Geralt xứ Rivia” đã khiến cho đất nước Ba Lan, từ một vùng đất… vô danh trong mắt game thủ, trở thành trung tâm chú ý của cả game giới, đặc biệt là những người đam mê game nhập vai.</p>\n\n<p>Và chẳng có gì ngạc nhiên khi phiên bản thứ ba – cũng là “dấu chốt” cuối cùng cho cuộc phiêu lưu của Geralt – ra mắt những ngày gần đây mang tên&nbsp;<em><strong>The Witcher 3: </strong>Wild Hunt</em>&nbsp;đã làm cho cộng đồng game phải “điên đảo” với nền tảng đồ họa tuyệt mỹ, lối chơi đa dạng và có chiều sâu, cùng một cốt truyện gợi mở “thật tuyệt vời!”</p>\n\n<h2><strong>BẠN SẼ THÍCH</strong></h2>\n\n<p><img alt=\"\" src=\"https://i0.wp.com/d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20150528130224/the-witcher-3-danh-gia-game-01.jpg.jpg?ssl=1\"></p>\n\n<h3><strong>LỐI DẪN TRUYỆN CUỐN HÚT</strong></h3>\n\n<p>Điểm nổi bật nhất của dòng game&nbsp;<em>The Witcher</em>&nbsp;đó là phong cách dẫn truyện, và tất nhiên, ở&nbsp;<strong><em>The Witcher 3: Wild Hunt</em></strong>&nbsp;thì mạch truyện chính của game là thứ được đầu tư chăm chút và kỹ càng nhất.</p>\n\n<p>Tuy vậy, mạch truyện phụ cũng như những nhiệm vụ bên lề xuất hiện trong game không vì thế mà bị lơ là, xao nhãng.</p>\n\n<p><strong><em>The Witcher 3: Wild Hunt</em></strong>&nbsp;không những cuốn hút người chơi vào mạch truyện chính, mà còn thu hút họ vào những tình tiết nhỏ, những nhiệm vụ phụ với nhiều “thủ pháp” khác nhau.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20200420152918/the-witcher-3-wild-hunt-danh-gia-game-5.jpg\" style=\"height:617px; width:1280px\"></p>\n\n<p>Đó có thể là những đoạn cắt cảnh cao trào, hoặc những đoạn đối thoại đòi hỏi người chơi phải tìm hiểu, suy nghĩ và đưa ra những phán xét, lựa chọn của riêng mình.</p>\n\n<p>Đó cũng có thể là một khung cảnh điêu tàn với các nhân vật trong game than khóc ỉ ôi bên cạnh người thân bị lâm vào thế nguy, những mẩu truyện ngắn đầy bí ẩn được chứa đựng trong các mảnh giấy, quyển sách bên vệ đường.</p>\n\n<p>Trước những gì mà game “bày tỏ”, người chơi bên cạnh việc điều khiển cho chàng Geralt “chặt chém” quái vật, thì còn phải ngồi trên ghế, chiêm nghiệm về mọi sự vật, sự việc diễn ra trong thế giới của&nbsp;<em><strong>The Witcher 3: Wild Hunt.</strong></em></p>\n\n<p>Điểm làm người viết thích thú nhất chính là, khác với những trò chơi nhập vai cùng thể loại,&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;đặt người chơi không phải ở vị trí của một người hùng “cứu nhân độ thế”, càng không phải là một nhân vật quyền năng có thể phán xét bất cứ ai, mà chỉ là một gã “thợ săn” đánh thuê bình thường.</p>\n\n<p><img alt=\"\" src=\"https://i0.wp.com/d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20150528130224/the-witcher-3-danh-gia-game-05.jpg.jpg?ssl=1\"></p>\n\n<p>Toàn bộ&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;là những chuỗi câu hỏi xung quanh vấn đề: nếu bạn thực sự đứng ở vai trò của Geralt xứ Rivia, thì bạn sẽ xử sự ra sao trong một thế giới hỗn mang và đầy chết chóc của&nbsp;<em>The Witcher</em>?</p>\n\n<p>Một câu hỏi đơn giản, nhưng để gợi mở nó ra cho người chơi thấy được, cảm thụ được lại là một việc không hề giản đơn một chút nào.</p>\n\n<p>Thật tuyệt vời là&nbsp;<em><strong>The Witcher 3: Wild Hunt,</strong></em>&nbsp;sau chuỗi thành công của&nbsp;<em>The Witcher</em>&nbsp;và&nbsp;<em>The Witcher 2: Assassins of Kings</em>&nbsp;trước đó, đã thực hiện điều này gần như hoàn hảo!</p>\n\n<p><img alt=\"\" src=\"https://i0.wp.com/d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20150528130224/the-witcher-3-danh-gia-game-02.jpg.jpg?ssl=1\"></p>\n\n<h3><strong>NHỮNG CHUỖI NHIỆM VỤ “CÓ MỘT KHÔNG HAI”</strong></h3>\n\n<p>Đi ra ngoài lối mòn là&nbsp;các nhiệm vụ đơn giản, “lượm” cái này, “lấy” cái kia, giết tên địch này, kiếm tên địch kia…&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;mạnh dạn khai phá những phong cách nhiệm vụ mới, tập trung vào việc gợi mở cho người chơi xử lý từng nhiệm vụ một, hơn là dọn cỗ ra sẵn và cho họ tự lựa chọn.</p>\n\n<p>Nhiệm vụ của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>, tuy không đến nỗi quá tự do như các tựa game nhập vai truyền thống ngày xa xưa như&nbsp;<em>Fallout&nbsp;</em>hay<em>&nbsp;Deus Ex</em>, nhưng bù lại, nó có nhiều yếu tố “gợi mở” để game thủ có thể dễ dàng nắm bắt một cách tự nhiên và thoải mái nhất.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20200420152947/the-witcher-3-wild-hunt-danh-gia-game-4.jpg\"></p>\n\n<p>Ví dụ như để đi từ A đến B, Geralt có nhiều cách khác nhau. Mỗi cách được&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;đưa ra theo kiểu gián tiếp bằng những thông tin bên vệ đường, lời thoại nhân vật trong game hay những mẩu giấy, những cuốn sách.</p>\n\n<p>Người chơi cứ liên tục tìm tòi, và vô tình bị cuốn hút vào chuỗi nhiệm vụ với phong cách “quen mà không quen, lạ cũng chẳng lạ” của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>.</p>\n\n<p>Đây là điểm mà người viết thích nhất của trò chơi. Dù&nbsp;<strong><em>The Witcher 3: Wild Hunt</em></strong>&nbsp;là một thế giới mở nhưng chẳng bao giờ mà game làm người chơi phải lâm vào thế chán chường vì chẳng có cái gì để làm, chẳng có nơi đâu để khám phá cả.</p>\n\n<p>Một thế giới rộng lớn, đẹp có, xấu có và lúc nào cũng có nhiều sự kiện, diễn biến thôi thúc người chơi tìm tòi và khám phá.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20200420152626/the-witcher-3-wild-hunt-danh-gia-game-1.jpg\"></p>\n\n<h3><strong>HÌNH ÂM: “KHÔNG THỂ TIN ĐƯỢC”!</strong></h3>\n\n<p><em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;không chỉ có lối chơi hay và cốt truyện lôi cuốn, mà còn có một&nbsp;nền tảng đồ họa thuộc hàng “đỉnh của đỉnh”, với hàng loạt hiệu ứng môi trường cực kỳ bắt mắt.</p>\n\n<p>Từ ánh bình minh tới hoàng hôn đầy nắng vàng, từ những cơn mưa rào tới giông bão đen kịt cả bầu trời, thỉnh thoảng lại lóe lên những tia sét chói lòa, tất cả đều được thể hiện tuyệt vời tới mức “không thể tin được”!</p>\n\n<p>Chưa kể, nếu bạn đọc “có đủ khả năng” bật tính năng HairWorks, trải nghiệm chân thực đó còn tăng thêm gấp bội, khi từng sợi lông, từng cọng tóc của Geralt, của Roach, của các nhân vật chính và phụ, thậm chí cả những con quái vật trong game đều lung linh, huyền ảo, và “suôn mượt” như xài Sunsilk vậy.</p>\n\n<p>Bên cạnh đó, mỗi nhân vật đều có giọng lồng tiếng riêng, bộc lộ tính cách đa dạng với từng trạng thái cảm xúc khác nhau của họ.</p>\n\n<p>Điều này khiến cho người viết cảm thấy rằng, mình đang sống trong&nbsp;một thế giới thật sự, với những “hỉ nộ ái ố” của những người thống khổ sống tại vùng đất phương Bắc chết chóc này.</p>\n\n<p>Âm thanh môi trường của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;cũng là một điểm nhấn khiến cho người chơi đôi lúc phải… rùng mình, khi đụng độ những trường đoạn khó nhằn đáng sợ.</p>\n\n<p>Tiếng gầm rú của những con quái vật, tiếng gió hú ríu rắt trong đêm sương mờ u ám, sự tĩnh lặng đáng sợ trong các hầm ngục, cùng với hình ảnh tuyệt mỹ của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;đã khiến cho người viết cảm giác&nbsp;rằng, mình đang thật sự hóa thân vào vai chàng thợ săn trừ ma diệt quỷ Geralt, trong cuộc hành trình cuối cùng của mình ở vùng đất chết chóc này.</p>\n\n<p><img alt=\"\" src=\"https://i0.wp.com/d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20150528130224/the-witcher-3-danh-gia-game-07.jpg?ssl=1\"></p>\n\n<h3><strong>HỆ THỐNG KỸ NĂNG – TRANG BỊ ĐẦY ẤN TƯỢNG!</strong></h3>\n\n<p>Thêm một yếu tố ấn tượng người viết nữa đó là hệ thống kỹ năng, cũng như trang bị đầy chiều sâu của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>. Đây là yếu tố mà bất cứ tựa game nhập vai nào cũng phải có, và nhìn chung thì trò chơi đã thực hiện gần như hoàn hảo.</p>\n\n<p>Tại sao lại thỏa mãn?</p>\n\n<p>Nó được “hưởng sái” nền tảng mà ba điểm nhấn đã kể ở trên, cách dẫn truyện – dàn xếp nhiệm vụ – hình âm tuyệt hảo, tạo ra.</p>\n\n<p>Dẫn truyện làm dâng lên cảm giác lôi cuốn, sau đó nhiệm vụ (dù phần thưởng có hấp dẫn hay không) kích thích người chơi khám phá, cuối cùng là hình âm phủ lên một chiếc áo – phác họa lên một vùng đất đầy nguy hiểm và chết chóc.</p>\n\n<p>Vì thế, mỗi lần hoàn thành một nhiệm vụ và nhận thưởng, khám phá thêm một vùng đất mới, lượm được một món đồ hay lên cấp độ và được tặng điểm kỹ năng, người chơi đều cảm thấy thỏa mãn tột độ.</p>\n\n<p><em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;làm cho người chơi cảm giác rằng: mình đã vượt qua thử thách khó nhằn, mình “giàu có” với hàng tá đồ vật trong tay, mình “bá đạo” khi được tặng điểm kỹ năng.</p>\n\n<p>Chưa dừng lại ở đó, việc gợi mở người chơi khám phá, rồi xây dựng – trang bị cho nhân vật của mình chỉ mới là bước đầu, là màn “chào mời” cho hệ thống bảng kỹ năng “bá đạo”, cùng hệ thống trang bị vật phẩm đầy chiều sâu của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>.</p>\n\n<p>Nói đến trang bị – vật phẩm,&nbsp;trò chơi có đến hàng trăm loại vật phẩm để cho bạn khám phá.</p>\n\n<p>Bạn có thể lượm chúng bên vệ đường, thực hiện nhiệm vụ để có được, mua chúng từ các “gian thương” hay chính tay mình rèn đúc.</p>\n\n<p>Có đủ cách để người chơi có được trang bị xịn, và dù bạn đi đường nào đi chăng nữa, thì cái chữ “nhàm chán” chắc chắn không bao giờ xuất hiện trong đầu bạn.</p>\n\n<p>Bạn muốn “lượm” đồ xịn bên vệ đường?</p>\n\n<p>Hãy giết chết con thằn lằn khổng lồ đang canh giữ nó trước đi đã nhé!</p>\n\n<p>Bạn muốn thực hiện nhiệm vụ để có chúng?</p>\n\n<p>Vậy thì mời đi theo một “dãy” nhiệm vụ với những cung bậc cảm xúc – hỉ nộ ái ố khác nhau.</p>\n\n<p>Còn nếu bạn muốn tự tay mình rèn đúc?</p>\n\n<p>Mời bạn nghiên cứu, tìm tòi các loại nguyên liệu trong hàng trăm các loại nguyên liệu mà trò chơi đưa ra.</p>\n\n<p>Còn về hệ thống kỹ năng?</p>\n\n<p><em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;đưa ra 3 nhánh kỹ năng chính và 1 nhánh phụ.</p>\n\n<p>Mỗi nhánh chính có đến 20 kỹ năng và cần đến 100 điểm kỹ năng để có thể “học” tất cả.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20200420152617/the-witcher-3-wild-hunt-danh-gia-game-2.jpg\"></p>\n\n<p>Tất nhiên, chẳng có ai “điên” mà cộng điểm kỹ năng vô tội vạ cả, vì ai cũng biết rằng, một tựa game nhập vai với một bảng kỹ năng như thế này chủ yếu để làm cho người chơi có thêm nhiều sự lựa chọn trong lối chơi của mình.</p>\n\n<p>Bằng cách này,&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;khuyến khích người trải nghiệm tự do hoạch định chiến lược của riêng mình, để xây dựng nên một hình tượng Geralt trong mơ của họ.</p>\n\n<p>Tính toán và cân đối điểm mạnh – yếu là điều mà dòng game&nbsp;<em>The Witcher</em>&nbsp;luôn luôn khuyến khích người chơi, ngay từ phiên bản đầu tiên cho đến nay.</p>\n\n<p>Tất nhiên, khi anh hùng Geralt do chính tay mình xây dựng có thể “thổi tung” bất cứ một chướng ngại nào, thì ta đây cũng lấy làm hạnh phúc và “nở mày nở mặt” rồi.</p>\n\n<h2><strong>BẠN SẼ GHÉT</strong></h2>\n\n<p><strong><img alt=\"\" src=\"https://i0.wp.com/d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20150528130224/the-witcher-3-danh-gia-game-06.jpg.jpg?ssl=1\"></strong></p>\n\n<h3><strong>NHIỀU LỖI VỤN VẶT KHÔNG ĐÁNG CÓ</strong></h3>\n\n<p><em><strong>The Witcher 3: Wild Hunt</strong></em>&nbsp;sẽ là một tựa game nhập vai hoàn hảo nhất từ trước đến nay nếu như nó không bị dính “vài tá” lỗi vụn vặt, dù được nhà phát triển&nbsp;CD Projekt RED&nbsp;cực kỳ ưu ái và chăm chút.</p>\n\n<p>Một điều may mắn là, những lỗi này chỉ thực sự gây khó chịu nếu bạn thật sự là một người chơi khó tính nhất.</p>\n\n<p>Đơn cử như A.I máy đôi khi trở nên… ngớ ngẩn đến “phát tội”, là một trong những hạt sạn không đáng có của&nbsp;<em><strong>The Witcher 3: Wild Hunt</strong></em>.</p>\n\n<p>Có nhiều phương án để bạn đánh bại địch thủ.</p>\n\n<p>Một là nhào vào “chém lấy chém để” như thường thấy, và hai là tận dụng sự “ngu ngốc” của A.I mà tiêu diệt chúng.</p>\n\n<p>Điều dễ thấy nhất là việc Geralt chỉ cần đi ra khỏi vùng đất mà kẻ địch đang canh giữ một chút thì chúng hoàn toàn… không đuổi theo nữa.</p>\n\n<p>Việc còn lại của ta chỉ là bắn cung hay sử dụng phép tầm xa để tiêu diệt địch dễ dàng mà không sợ bị trả đòn.</p>\n\n<p><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20200420152557/the-witcher-3-wild-hunt-danh-gia-game-3.jpg\"></p>\n\n<p>Bên cạnh A.I máy không mấy “sáng dạ”, thì một số lỗi như lỗi bắt mục tiêu, lỗi giao diện điều khiển đôi khi không “nghe lệnh” hay việc Geralt, một Witcher huyền thoại, nhảy từ đỉnh đồi xuống đất cách có… 50cm lại mất tới 1/2 bình máu, cũng là một trong nhiều nguyên nhân khiến cho người chơi mất bình tĩnh và chỉ muốn… quăng đi tay cầm của mình.</p>\n\n<p>Hy vọng rằng, nhà phát triển CD Projekt RED&nbsp;sẽ sửa những lỗi này trong các bản vá lỗi tiếp theo, bên cạnh việc cải tiến đồ họa nhiều hơn nữa có thể.</p>\n</div>',5,'2023-01-27',1,'1YBuoqKhOStuAN6D0CAugc4514W8nHnvm'),
(9,'Among Us Là Gì? Game Đỉnh Cao Tư Duy, Bắt Kẻ Giả Mạo','<div><h1><strong><span style=\"font-size:13px\">Game Among Us Là Gì?</span></strong></h1>\n\n<p><strong>Among Us</strong>&nbsp;là một trò chơi đa nền tảng với nhiều người chơi trực tuyến do hãng Inner Sloth lên ý tưởng phát triển và được phát hành ngày 15 tháng 6 năm 2018. Trò chơi sẽ lấy bối cảnh bên ngoài không gian vũ trụ, ở đó những người chơi sẽ đóng một trong hai vai trò: phần lớn là các thành viên phi hành đoàn (<em>Crewmates</em>) và một số ít người chơi vào vai những kẻ giả mạo (<em>Impostors</em>).</p>\n\n<p>Các phi hành đoàn có mục tiêu là tìm ra và loại bỏ những kẻ giả mạo hoặc hoàn thành các nhiệm vụ xung quanh bản đồ, còn phe giả mạo sẽ có mục tiêu là giết các thành viên phi hành đoàn mà không để ai phát hiện. Mặc dù không nhận được nhiều sự chú ý khi mới được ra mắt vào 2018, Among Us lại đột ngột trở thành xu hướng vào năm 2020 sau khi nhiều nhân vật nổi tiếng trên các nền tảng&nbsp;<strong>livestream</strong>&nbsp;như&nbsp;<strong>Twitch</strong>&nbsp;và&nbsp;<strong>YouTube</strong>&nbsp;bắt đầu để ý đến.</p>\n\n<p>Thật đáng mừng khi hiện tượng&nbsp;<em><strong>Game Among Us</strong></em>&nbsp;sẽ được đầu tư chạy đường dài chứ không chết yểu như một số game nổi tiếng khác. Với những thành tích đạt được vô cùng đáng ngưỡng mộ điển hình là 2 giải ‘Best Multiplayer Game’ (Game nhiều người chơi xuất sắc nhất) và giải ‘<em><strong>Best Mobile Game</strong></em>’ (Game nền tảng di động xuất sắc nhất) của năm 2020. Among Us là tựa game tiềm năng và xứng đáng nhất để phát triển của hãng hiện nay.</p>\n\n<p>Nếu 2 giải thưởng trên chưa đủ để thấy độ hot của&nbsp;<strong>Among Us</strong>, hãy quay ngược lại vào thời điểm tháng 6, khi chỉ có 14 kênh trên Twitch dành riêng để&nbsp;<strong>Livestream tựa game</strong>&nbsp;này cùng với lượng người xem trung bình là 174. Tuy nhiên, chỉ khi đến tháng 8, con số này là 500 kênh livestream về<strong>&nbsp;Among Us</strong>&nbsp;mỗi ngày trên nền tảng Twitch và chỉ cần tới nửa cuối tháng 9.</p>\n\n<p>Con số này đã vượt quá 1.000 kênh riêng lẻ làm về game này. Với thời gian gần 31 triệu giờ xem trong tháng 8, tựa game đã trở nên nổi tiếng như một “kẻ khổng lồ” giữa thời đại các game livestream đang vô cùng phát triển. Quay lại hiện tại, số lượng người chơi Among Us cùng một thời điểm đã lên tới con số 300.000. Hãy cùng theo dõi cách mà hiện tượng&nbsp;<strong>Game Among Us</strong>&nbsp;sẽ được đầu tư chạy đường dài ngay bên dưới nhé!</p>\n\n<h2><img alt=\"\" src=\"https://hoanghapc.vn/media/news/2901_Game-Among-Us.jpg\"></h2>\n\n<h3><strong>Hiện Tượng Game Among Us Sẽ Được Đầu Tư Chạy Đường Dài</strong></h3>\n\n<p>Nói về hiện tượng<strong>&nbsp;Game Among Us</strong>&nbsp;sẽ được đầu tư chạy đường dài, nhà sản xuất cho biết trò chơi đã được ra mắt từ tận năm 2018 nhưng vào thời điểm đó số lượng người chơi và biết đến game rất khiêm tốn. Sau đó, các game thủ từ&nbsp;<strong>Hàn Quốc, Brazil và Mexico</strong>&nbsp;đã tìm thấy sự hấp dẫn của trò chơi và nhanh chóng lan truyền đi khắp mạng lưới bạn bè và những streamer mà họ quen biết. Sau đó, trò chơi này ngày càng được chơi nhiều hơn trên nền tảng Twitch trong vài tháng nay và hiện đang là trò chơi phổ biến nhất trên trang web – đánh bại những cái tên đình đám như&nbsp;<strong>Fall Guys, Fortnite và Warzone.</strong></p>\n\n<p>Theo như mong muốn của nhà phát triển, họ sẽ cải thiện bản gốc của&nbsp;<strong>Among Us</strong>&nbsp;thay vì tốn thời gian xây dựng một trò chơi mới. Tuy phần game Among Us 1 được xây dựng trên phần mã lỗi thời và không thể đáp ứng nhu cầu hỗ trợ nhiều tính năng mới của game nhưng khi thấy có rất nhiều người chơi vẫn đang thưởng thức tựa game một cách say mê. Vì lý do đó, họ sẽ phát triển tựa game lên một tầm cao mới để phục vụ người dùng.</p>\n\n<p><em><strong>Hiện tượng Game Among Us sẽ được đầu tư chạy đường dài với nhiều cập nhật từ tháng 10 năm 2020:</strong></em></p>\n\n<p><img alt=\"\" src=\"https://hoanghapc.vn/media/news/2901_Game-Among-Us-1.jpg\"></p>\n\n<h3><strong>Tính năng ẩn bảng nhiệm vụ</strong></h3>\n\n<p>Người chơi có thể kích hoạt khi đang ở trong phòng chờ lobby trước khi bắt đầu mỗi màn chơi. Rõ ràng tính năng này sẽ gia tăng tính căng thẳng của game, vì Phi hành đoàn sẽ không thể biết được liệu Kẻ giả mạo có đang giả vờ làm nhiệm vụ hay không. Chỉ chủ phòng chơi mới có thể chỉnh bảng nhiệm vụ hiện ra khi cả nhóm họp, hay ẩn nó đi hoàn toàn.</p>\n\n<p><img alt=\"\" src=\"https://hoanghapc.vn/media/news/2901_Game-Among-Us-2.jpg\"></p>\n\n<h3><strong>Tính năng bỏ phiếu kín</strong></h3>\n\n<p>Người chơi có thể kích hoạt ở phòng chờ, cho phép những thành viên bỏ phiếu kín. Điều này có ý nghĩa Phi hành đoàn sẽ không thể thấy những người khác bỏ phiếu loại trừ ai. Khi tính năng được kích hoạt, người chơi chỉ có thể thấy được kết quả của cuộc bỏ phiếu (có ai bị loại trừ hoặc không), nhưng sẽ không thể biết được bao nhiêu người đã bỏ phiếu, và ai là người không bỏ phiếu.</p>\n\n<p>Điều này sẽ làm cho việc xác định kẻ chọc phá bằng cách bỏ phiếu lung tung là hoàn toàn không thể. Độ căng thẳng của game cũng sẽ tăng lên khi giờ đây người chơi không thể biết được hành động thực sự trong cuộc họp của các thành viên nữa.</p>\n\n<p><img alt=\"\" src=\"https://hoanghapc.vn/media/news/2901_Game-Among-Us-3.jpg\"></p>\n\n<h3><strong>Chế độ hỗ trợ mù màu</strong></h3>\n\n<p>Hiện tượng Game Among Us sẽ được đầu tư chạy đường dài biểu hiện rõ nhất với chế độ hỗ trợ người chơi mù màu. Trước đây, việc người chơi bị mù màu gặp khó khăn khi phải thực hiện các nhiệm vụ như nối dây khiến họ rất khó để tiếp cận trò chơi. Giờ đây, ngoài các màu sắc thường thấy của dây điện, các mối nối còn có thêm các biểu tượng tương ứng, giúp các game thủ mù màu hoàn thành tốt nhiệm vụ.</p>\n\n<p><em>Và đó là tổng quan về&nbsp;<strong>tựa game vô cùng hấp dẫn Among Us</strong>&nbsp;và cũng như lý do tại sao trò chơi lại hot đến mức như vậy. Nếu bạn đang cần tìm một trò chơi hấp dẫn, phù hợp với nhu cầu chơi nhóm thì đây chắc chắn là lựa chọn hoàn hảo.</em></p>\n</div>',5,'2023-07-12',1,'1yf5-J98feTo_LGniaTfSqk-IEuIsyTaa'),
(10,'Liên Minh Huyền Thoại - Game MOBA phổ biến nhất thế giới','<div><h3><strong>I. Thông tin Liên Minh Huyền Thoại</strong></h3>\n\n<ul>\n	<li><strong>&nbsp;Thể loại</strong>:&nbsp;Moba.</li>\n	<li><strong>Đồ hoạ</strong>: 3D.</li>\n	<li><strong>Chế độ</strong>: Chơi đơn, online.</li>\n	<li><strong>Độ tuổi</strong>: 13 tuổi trở lên.</li>\n	<li><strong>Nhà phát hành</strong>:&nbsp;RIOT GAMES.</li>\n	<li><strong>Nền tảng</strong>:&nbsp;Windows.</li>\n	<li><strong>Ngày ra mắt</strong>: 27/10/2009.</li>\n	<li><strong>Giá game</strong>: Miễn Phí.</li>\n</ul>\n\n<h3><strong>II. Gameplay Liên Minh Huyền Thoại</strong></h3>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/gameplay-800x450.jpg\"></p>\n\n<p><strong>1. Chế độ chơi</strong></p>\n\n<p>Trong Liên Minh Huyền Thoại (League of Legend) người chơi sẽ điều khiển những vị tướng (Champions) để đối đầu với những người chơi team khác theo luật chơi MOBA.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/lmht-fix1-800x472.jpg\"></p>\n\n<p>Người chơi sẽ thu nhặt tài nguyên (vàng) bằng cách kết liễu những đơn vị lính, quái rừng và người chơi khác để có thể lên cấp. Sau khi “tiết kiệm” đủ vàng, người chơi có thể gia tăng sức mạnh của vị tướng mình đang sở hữu bằng cách mua những trang bị thiết yếu tại “Bệ Đá Cổ” – Nơi bắt đầu mỗi trận đấu. Nhiệm vụ của mỗi đội là phá huỷ nhà chính của đối phương trước.&nbsp;</p>\n\n<p>Các bản đồ khác nhau sẽ có cách chơi khác nhau:</p>\n\n<p><strong>Summerift</strong>: Bản đồ truyền thống, đây sẽ là nơi diễn ra các trận đấu Normal, Ranked theo lối chơi phá nhà chính truyền thống.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/lien-minh-huyen-thoai-game-moba-pho-bien-nhat-the-gioi-sr-800x628.jpg\"></p>\n\n<p><strong>ARAM</strong>: Vực gió hú, đây là bản đồ chỉ có duy nhất một đường (Trên cây cầu bắc ngang vực gió hú), ở chế độ này người chơi sẽ được Random tướng (chọn ngẫu nhiên) và giao tranh tại 1 đường duy nhất, trận đấu sẽ kết thúc khi phá được nhà chính đối phương</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/bandoarram-800x502.jpg\"></p>\n\n<p><strong>URF</strong>: Ultra Rapid Fire, đây là chế độ cực kỳ thú vị, người chơi sẽ được thoải mái “spam skill” mà không phải tốn năng lượng, những chiêu thức sẽ được giảm 80% thời gian hồi chiêu. Tại Việt Nam nói riêng và thế giới nói chung, đây là chế độ được ưa thích nhất, mỗi khi chế độ này được mở ra thường có tình trạng nghẽn máy chủ (vì có quá nhiều người chơi cùng một lúc)</p>\n\n<p><strong>One For All</strong>: đúng theo tên gọi, cả 5 người chơi cùng 1 team sẽ chơi cùng một vị tướng, những pha ủi “tối mặt tối mài”, những pha “Hasagi” khiến đối phương lơ lửng trên không trung cho tới khi đi vào lòng đất cũng từ đây.</p>\n\n<p><strong>Chế độ Hexakill</strong>: Khu Rừng Quỷ Dị - 6 người chơi mỗi đội đối đầu với nhau tại bản đồ Khu Rừng Quỷ Dị với Trụ ngoài bị loại bỏ</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/hexakill_lol-800x417.jpg\"></p>\n\n<p><strong>Đấu Trường Chân Lý (TFT):&nbsp;</strong>Đây là một chế độ hoàn toàn mới của Liên Minh Huyền Thoại. Được lấy cảm hứng từ Auto Chess, Đấu Trường Chân Lý thuộc thể loại Auto Battler. Trận đấu sẽ bắt đầu với 8 người chơi, mỗi người sẽ dùng các vị tướng LMHT như là các quân cờ. Kết hợp và sáng tạo đội hình cùng với các trang bị để trở nên mạnh mẽ nhất.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/dtcl-800x419.jpg\"></p>\n\n<p><strong>Chế độ Thảm họa Diệt Vong (Hay Máy Siêu Khủng Khiếp)</strong>. Người chơi chiến đấu với những tướng được Máy điều khiển có bộ chiêu thức vô cùng bá đạo và trùm cuối là Quỷ Vương Teemo. Chế độ có hai độ khó: Thường và Thử thách.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/super_bot-800x569.jpg\"></p>\n\n<p><strong>2. Đa dạng tướng</strong></p>\n\n<p><strong><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/Skinda-800x451.jpg\"></strong></p>\n\n<p>&nbsp;</p>\n\n<p>Tính đến nay đã có hơn 147 vị tướng được thiết kế lối chơi và cốt truyện riêng khác nhau. Điểm cuốn hút của Liên Minh Huyền Thoại một phần cũng vì sự đa dạng các vị tướng, người chơi có thể chơi những vị tướng mang đậm phong cách cá nhân của bản thân.</p>\n\n<p>Các vị tướng khác nhau mang lại độ cuốn hút khác nhau như&nbsp;Yasuo&nbsp;là vị tướng “Quốc Dân” của nhiều game thủ Việt Nam, có rất nhiều câu nói nổi tiếng được sáng tác ra theo vị tướng này như “Lốc Trúng không R không phải hảo hán”, “Không sợ kể địch mạnh, chỉ sợ Yasuo Team mình”. Các vị tướng được Riot thiết kế rất tuyệt vời cũng như lối chơi không vị tướng nào giống vị tướng bằng bộ chiêu thức khác nhau.</p>\n\n<p>Các vị tướng có thể kết hợp thành Combo đẹp mắt như Yasuo - Malphite - Oriana,… là một điểm sáng giúp người chơi nâng cao tinh thần đồng đội hơn, thay vì lao vào cuộc chiến như con thiêu thân thì chờ đợi đồng đội để cùng phối hợp tác chiến tạo nên những pha giao tranh đẹp mắt sẽ tốt hơn.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/yassuo-800x496.jpg\"></p>\n\n<p>Bản đồ Summoner Rift Liên Minh Huyền Thoại được xây dựng theo chuẩn MOBA với 3 đường chính và 1 đường rừng. Các tướng trong Liên Minh tuỳ vào vai trò của mình sẽ chọn được đường tốt nhất phát huy hết sức mạnh, tiềm năng của mình.&nbsp;&nbsp;</p>\n\n<p><strong>Top Lane</strong>: Nơi những đấu sĩ sẽ đối đầu 1v1 với nhau những vị tướng thường được chọn ở vị trí này sẽ là những Đấu Sĩ, Tanker cứng cá biệt hơn là những đơn vị có khả năng đè đường có thể gây khó chịu cho đối phương cực mạnh như Teemo, Vayne,… Top Lane đóng vai trò rất lơn sau thời điểm giữa game vì sẽ là vị trí tiên phong chống chịu cho toàn đội khi giao tranh.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/dausiduongtren-800x463.jpg\"></p>\n\n<p><strong>Mid Lane:</strong>&nbsp;Nơi những pháp sư - những vị trí đóng vai trò cấu rỉa trong giao tranh, những vị tướng có khả năng di chuyển để hỗ trợ đồng đội nhanh chóng (vì Mid Lane nằm ở giữa bản đồ) đây là vị trí có thể tạo đột biến trong trò chơi vì có rất nhiều vị tướng pháp sư có khả năng gánh team cực mạnh như: Veiga, Yasuo,… So với Top Lane thì đây có thể nói là vị trí nổ ra nhiều pha giao tranh nhất, những màn trao đổi chiêu thức, cấu máu cũng như gây đột biến cho trận đầu đối với Mid Lane đóng vai trò không nhỏ.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/phapsuduonggiua-800x463.jpg\"></p>\n\n<p><strong>Jungle:</strong>&nbsp;Vị trí đi rừng, trong bản đồ Summerift rừng đóng vai trò quyết định trong ván đấu, những vị trí đi đường (Mid, Top, Bot) sẽ nhận được hỗ trợ từ người đi rừng hay còn gọi là “Gank”. Nhiệm vụ của người đi rừng là kiểm soát bản đồ, tiến hành ăn những mục tiêu lớn như Rồng, Barron Narstor, Sứ Giả Khe nức,… vị trí rừng cực kỳ quan trọng trong quá trình đi đường vì người đi rừng có thể cho tầm nhìn của đối phương khi họ di chuyển và báo về team thông qua việc cắm mắt; những buff có lợi như Rồng, Barron sẽ mang lại tác động cực lớn đến những Lane khác, đặc biệt người đi rừng còn có một vai trò quan trọng khác là hỗ trợ những vị trí đi đường giao tranh để đạt thắng lợi và đẩy Snow Ball. Nói không ngoa khi nhiều game thủ cho rằng “Thắng bại tại người đi rừng”</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/Jungle-800x450.jpg\"></p>\n\n<p><strong>Bot Lane:</strong>&nbsp;là Lane “đôi”, khác với Mid và Top Lane, Bot Lane có sự xuất hiện của hai vị trí khác là AD và Support. AD (Xạ thủ) đóng vai trò quan trọng nhất trong team vì là nguồn sát thương chính khi giao tranh tổng (Combat) qua những phát đánh tay. Support (hay hỗ trợ) đóng vai trò bảo vệ AD và kiểm soát tầm nhìn bản đồ cho team. Vì đây là Lane có 2 vị tướng đi cùng nên những trận giao tranh lớn nhỏ thường xuất hiện tại đây và Bot Lane đóng vai trò quyết định cho trận đấu.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/adtronglol-800x450.jpg\"></p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/Untitled-1-800x450.jpg\"></p>\n\n<p><strong>3. Có thể mời bạn bè cùng chơi</strong></p>\n\n<p><strong><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/freidn-800x450.jpg\"></strong></p>\n\n<p>Tính đồng đội là không thể thiếu đối với các tựa game MOBA , Liên Minh Huyền Thoại kết nối người chơi lại với nhau, 5 người - 1 mục đích - 1 ý chí. sẽ rất vui khi được chơi chung cùng 4 người bạn và cùng nhau “tấu hài”, những người bạn chơi cùng với nhau sẽ có một sự hiểu ý tốt nhất, việc giành chiến thắng khi chơi cùng những “cạ cứng” sẽ dễ dàng hơn rất nhiều đấy</p>\n\n<p><strong>4. Các tính năng khác trong game</strong></p>\n\n<p>Mỗi vị tướng trong game gắn liền với tiểu sử đầy oanh liệt. Các tiểu sử này gắn kết với nhau tạo thành 1 cốt truyện thống nhất trải dài với cuộc chiến giữa Ionina, Demacia, Noxus,... Liên Minh Huyền Thoại không chỉ thành công nhờ gameplay hấp dẫn của mình mà còn nhờ sự xây dựng hình tượng nhân vật trong lòng game thủ. Hiện tại đã có hơn 148 vị tướng ghi tên mình vào Vũ Trụ Liên Minh Huyền Thoại và trong tương lai chắc chắn con số này sẽ còn tăng nhiều.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/05/content/aatrox_lmht-800x444.jpg\"></p>\n\n<p>Đồng thời hệ thống bảng Ngọc Tái Tổ Hợp cũng được RIOT chăm chút rất tỉ mỉ ở ngay từng nhành nhỏ, mỗi một điểm then chốt đều có thể tạo nên đột biến cho trận đấu, điều này cũng là một điểm thu hút người chơi vì sẽ kích thích óc sáng tạo không ngừng nghỉ để tạo nên meta mới.</p>\n\n<p>Bản đồ Summerift nếu để ý kỹ thì người chơi sẽ được trãi nghiệm qua từng mùa khác nhau, sự kiện khác nhau, bản đồ cũng được thiết kế lại hình ảnh cho phù hợp như Noel, MSI,…</p>\n\n<p>Tính tương tác giữa bản đồ với các nhân tố: Điểm đặc biệt trong Liên Minh Huyền Thoại là bản đồ có thể được thay đổi, từng khối địa hình, bụi cỏ sẽ được dựng lên dựa theo những nguyên tố rồng có trên sân (Đất, Nước, Gió, Lửa)</p>\n\n<p><strong>5. Sự kiện game</strong></p>\n\n<p>Một điều không thể thiếu ở tựa game này là hệ thống giải đấu Esport được RIOT tổ chức hằng năm, qui tụ các đội tuyển mạnh mẽ từ các khu vực trên thế giới như LCK (Hàn Quốc), LEC (Châu Âu), LCS (Bắc Mỹ) sẽ cống hiến những trận đấu mãn nhãn, những pha Combat kịch tính cũng như những chiến thuật sáng tạo đến từ nhiều khu vực trên Thế giới &nbsp;</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/giaidauLMHT-800x450.jpg\"></p>\n\n<h3><strong>III. Đồ Hoạ - Âm Thanh Liên Minh Huyền Thoại</strong></h3>\n\n<p><strong>1. Đồ hoạ 3D</strong></p>\n\n<p>Với lối chơi của tựa game Moba, các nhân vật, bản đồ được thiết kế 3D, từng hiệu ứng hình ảnh như rọi bóng, bụi cỏ, cách di chuyển được miêu tả chân thực nhất, có thể thấy nhà phát hành game đã đầu tư về mặt đồ họa game.</p>\n\n<p>Với những game thủ không có khả năng, điều kiện để sử dụng&nbsp;<strong>Max setting&nbsp; &nbsp;</strong>đồ họa, ta có thể hiệu chỉnh sang mức<strong>&nbsp;Low</strong>&nbsp;dù không chân thực như Max Setting nhưng căn bản vẫn có thể trãi nghiệm những trận đấu toàn vẹn&nbsp;</p>\n\n<p><strong>Ngoại cảnh</strong></p>\n\n<p>Các bản đồ được tạo nên theo phong cách những cốt truyện sự kiện riêng, ta có thể thấy ở những bản đồ như Summerift, Aram, Cướp Cờ, 3v3 điều mang những đặc điểm riêng như: Ở Aram sẽ mang sàn đấu trên cầu Freljod - nơi diễn ra trận đánh ác liệt từ ba bộ tộc do ba người lãnh đạo (Ashe, Lissandra, Sejuani) khung cảnh băng giá, âm u, những vết nức từ đây tạo cho người chơi cảm giác như trên chiến trường thực sự,...</p>\n\n<p>Tại Summerift hiệu ứng bản đồ sẽ thay đổi dựa theo đặc tính của&nbsp;<strong>Rồng Nguyên Tố:</strong></p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/rongnguyento-800x450.jpg\"></p>\n\n<ul>\n	<li>Ở sàn đấu&nbsp;<strong>Rồng lửa</strong>, các bụi cỏ trong khu rừng sẽ bị thiêu rụi hết</li>\n	<li>Ở sàn đấu&nbsp;<strong>Rồng nước</strong>, các bụi có sẽ mọc lên nhiều hơn tại một số vị trí đã qui định.</li>\n	<li>Ở sàn đấu<strong>&nbsp;Rồng Gió</strong>, sẽ xuất hiện 4 vùng gió xoáy tại khu vực rừng, người chơi khi đi ngang vào sẽ được hường Buff tăng tốc độ chạy.</li>\n	<li>Ở sàn đấu&nbsp;<strong>Rồng đất</strong>, các địa hình đồi đá sẽ mọc lên.</li>\n</ul>\n\n<p>=&gt; Những thay đổi này gián tiếp sẽ tạo nên sự đột biến trong chiến thuật trò chơi</p>\n\n<p>Tạo hình nhân vật, trang phục</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/skinKDA-800x467.jpg\"></p>\n\n<p>Hiện nay RIOT đã cho ra hơn&nbsp;<strong>1000&nbsp;</strong>trang phục, mỗi trang phục sẽ có một câu chuyện riêng, một phong các riêng, người chơi có thể lựa chọn những trang phục bắt mắt, phù hợp với lối chơi của mình hơn. Tin mình đi dù trang phục không giúp tăng sức mạnh cho vị tướng, nhưng nó có thể giúp bạn chơi tốt hơn đấy. Các trang phục có thể được mua trong cửa hàng hoặc người chơi có thể thu thập qua các sự kiện.</p>\n\n<p>Với mỗi sự kiện như&nbsp;<strong>True Damage</strong>,&nbsp;<strong>Galaxy</strong>,&nbsp;<strong>KDA</strong>&nbsp;hay thậm chí là&nbsp;<strong>Trang phục Hàng Hiệu&nbsp;</strong>sẽ tạo cho người chơi cảm giác đẳng cấp, xịn xò khi đối đầu với nhau trong Liên Minh Huyền Thoại.</p>\n\n<p><strong>Hiệu ứng</strong></p>\n\n<p><strong><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/lienminh-800x450.jpg\"></strong></p>\n\n<p>Mỗi vị tướng sẽ sở hữu bộ chiêu thức riêng, RIOT đã rất thành công trong khoảng đầu tư các chiêu thức này, như:&nbsp;<strong>Siêu Hùng Giáng Thế</strong>&nbsp;của Galio sẽ tạo nên một vụ nổ lớn khi nhảy xuống một vùng,&nbsp;<strong>Trăn Trối</strong>&nbsp;sẽ miêu tả hình ảnh của một kiếm khách kết liễu đối thủ ngay trên không,&nbsp;<strong>Trời Giáng</strong>&nbsp;của Pantheon sẽ xuất hiện một con rồng đáp xuống vùng,... Người chơi có thể thoải mái kết hợp các vị tướng để tạo thành&nbsp;<strong>Wonbo Combo</strong>&nbsp;đẹp mắt và giành chiến thắng</p>\n\n<p><strong>2. Âm thanh</strong></p>\n\n<p><strong>Voice nhân vật trong Liên Minh</strong></p>\n\n<p>Các vị tướng sẽ được lồng tiếng bởi người thật, từng tiếng thét xung trận, tiến cười chế diễu đối phương,... từ các vị tướng đều được thiết kế chân thực.</p>\n\n<p>Các vị tướng sẽ có những quote (câu nói tiêu biểu riêng), khi nghe tới người chơi sẽ nhớ ngay đến như:&nbsp;<strong>Dead is like the wind, always by my side! Captain Teemo on duty,...</strong>&nbsp;điều này sẽ kích thích người chơi hơn nữa vì đó là những vị tướng của họ.</p>\n\n<p><strong>Hiệu ứng âm thanh</strong></p>\n\n<p>Như đã nói ở trên, các vị tướng có bộ chiêu thức riêng, các chiêu thức cũng có những hiệu ứng âm thanh riêng hỗ trợ người chơi trải nghiệm qua cả 3 chiều.</p>\n\n<p>Một số vị tướng sẽ có hiệu ứng âm thanh gây hoang mang cho người chơi khi tung chiêu như&nbsp;<strong>\"Săn mồi\"</strong>&nbsp;từ Renga, \"Thú săn mồi\" đến từ giày Săn Mồi.</p>\n\n<h3><strong>IV. Cấu hình Liên Minh Huyền Thoại</strong></h3>\n\n<p>Windows</p>\n\n<ul>\n	<li><strong>Hệ Điều Hành</strong>: Windows 7 trở lên</li>\n	<li><strong>RAM</strong>: RAM 4GB</li>\n	<li><strong>Dung lượng ổ cứng</strong>: tối thiểu 12GB</li>\n	<li><strong>Card đồ họa</strong>: Nvidia GeForce 8800 trở lên hoặc AMD Radeon HD 5670 trở lên. Yêu cầu hỗ trợ DirectX 9.0c hoặc cao hơn</li>\n</ul>\n\n<p>Những yếu tố trên đã khiến Liên Minh Huyền Thoại có một sức hút khó có thể cưỡng lại cho các game thủ. Bạn nghĩ Liên Minh Huyền Thoại thế nào? Hãy cùng chia sẽ những kỷ niệm khó quên của bản thân về tựa game này ở phần bình luận nhé.&nbsp;</p>\n</div>',5,'2023-07-05',1,'18qmBajH60u3jR6jNOfUa-mD_sMTAAu7M'),
(11,'Diablo III: Reaper of Souls – Đánh Giá Game','<div><h3><img alt=\"\" src=\"https://d9n64ieh9hz8y.cloudfront.net/wp-content/uploads/20210218102606/diablo-iii-reaper-of-souls-danh-gia-game.jpg\" style=\"height:870px; width:1920px\"></h3>\n\n<p><strong>Reaper of Souls</strong>&nbsp;–&nbsp;Thế giới Sanctuary hẳn đã chẳng còn gì lạ lẫm với game thủ trên toàn thế giới.</p>\n\n<p>Năm 2012, sau gần 11 năm kể từ khi phiên bản&nbsp;<em>Diablo II: Lord of Destruction</em>&nbsp;ra mắt, người chơi mới có dịp trở lại thế giới hỗn mang này với những vị anh hùng mới, một câu chuyện mới qua phiên bản&nbsp;<em>Diablo III</em>.</p>\n\n<p>Mặc dù có những tranh cãi, có những phản ứng đa chiều từ game thủ, nhưng có một sự thật không thể phủ nhận là&nbsp;<em>Diablo</em>&nbsp;vẫn là cái tên đầy sức hút và là một trong những “đứa con” thành công nhất của&nbsp;Blizzard.</p>\n\n<p>Vừa qua, phiên bản mở rộng đầu tiên với cái tên&nbsp;<em><strong>Reaper of Souls</strong>&nbsp;</em>đã được ra mắt, hứa hẹn mang lại những trải nghiệm mới đầy thú vị dành cho game thủ đam mê&nbsp;thể loại game nhập vai hành động “chặt-chém” (hack-n-slash).</p>\n\n<h2><strong>BẠN SẼ THÍCH</strong></h2>\n\n<h3><strong>CHƯƠNG V – MỘT CÂU CHUYỆN MỚI!</strong></h3>\n\n<p>Sau cuộc chiến ở High Heaven (Thiên giới),&nbsp;<em>Diablo</em>&nbsp;lại một lần nữa bị tiêu diệt.</p>\n\n<p>Tuy vậy, linh hồn của hắn vẫn tồn tại trong Hắc Hồn Thạch (Black Soulstone).</p>\n\n<p>Để tránh hậu họa, Tyrael cùng các thành viên của Hội Horadrim (được tái lập lại) đã quyết định giấu hòn đá ở một nơi biệt lập, tránh xa cả thiên thần, quỷ dữ và ngay cả con người.</p>\n\n<p>Và cứ như vậy,&nbsp;<em><strong>Diablo III:&nbsp;<em>Reaper of Souls</em>&nbsp;</strong></em>đưa người chơi đến một vùng đất mới nhưng mà quen – Westmarch.</p>\n\n<p>Nhưng câu chuyện vẫn chưa kết thúc, kế hoạch của Tyrael đã bị ngăn cản bởi Malthael – Tổng lãnh thiên thần Trí tuệ (Archangel of Wisdom) trước đây.</p>\n\n<p>Sau khi từ bỏ Hội đồng thiên thần (Angiris Council), Malthael bất ngờ trở lại với âm mưu thâm độc nhằm chiếm lấy Hắc Hồn Thạch (Black Soulstone).</p>\n\n<p>Liệu các anh hùng Nephalem có ngăn chặn được âm mưu của hắn? Động cơ thật sự sau hành động của Malthael là gì? Tất cả sẽ được giải đáp trong phiên bản&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>&nbsp;này.</p>\n\n<p>Một câu chuyện mới, đồng nghĩa với người chơi sẽ được tiếp tục cuộc du hành của mình, đối đầu với những kẻ thù mới.</p>\n\n<p>Chờ đón họ là vương quốc Westmarch đang rên xiết dưới sự xâm lăng của Malthael và những tay sai dưới trướng.</p>\n\n<p>Từ thủ phủ của Westmarch tới pháo đài Pandemonium, đây chắc chắn là một cuộc du hành đầy khó khăn của các Nephalem.</p>\n\n<h3><strong>HÀNG LOẠT CẢI TIẾN GIÁ TRỊ</strong></h3>\n\n<p>Điều đầu tiên phải đề cập đến là giới hạn cấp độ (level) đã được nâng lên 70. Nâng cấp độ, đồng nghĩa với việc hàng loạt kỹ năng (skill) mới được bổ sung.</p>\n\n<p>Mỗi lớp nhân vật giờ đây có thêm một kỹ năng ở cấp độ 61, các runes của chúng sẽ được “mở khóa” dần dần cho đến cấp độ 70.</p>\n\n<p>Kèm theo đó là các kỹ năng hỗ trợ mới dành cho mỗi lớp nhân vật.</p>\n\n<p>Điều này ảnh hưởng trực tiếp đến việc lựa chọn bộ kỹ năng, qua đó tăng thêm sự đa dạng về các kiểu xây dựng nhân vật hơn so với trước đây.</p>\n\n<p>Kế đến, chắc chắn việc được tự “tăng điểm” mỗi khi lên cấp độ Paragon sẽ thỏa mãn không ít người chơi.</p>\n\n<p>Trước đây,&nbsp;<em>Diablo III</em>&nbsp;vốn bị “ca cẩm” nhiều về việc tự cộng điểm số mỗi khi lên cấp thì với&nbsp;<strong><em>Diablo III:&nbsp;Reaper of Souls</em></strong>, người chơi đã có nhiều lựa chọn hơn trong việc tự tạo ra một nhân vật ưng ý nhất theo ý mình.</p>\n\n<p>Trong 70 cấp độ cố định, trò chơi sẽ tự cộng điểm cho người chơi. Nhưng với hệ thống cấp độ Paragon sau đó, bạn sẽ được tùy ý thay đổi nhân vật theo hướng mình muốn.</p>\n\n<p>Tất nhiên, việc “cộng điểm” này sẽ không chỉ đơn thuần thông qua các chỉ số như Intelligent, Dexterity… cơ bản mà được thực hiện thông qua bảng Paragon riêng biệt.</p>\n\n<p>Nếu như đề cập đến các ưu điểm của&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>, không thể không nhắc đến hệ thống Loot 2.0.</p>\n\n<p>Nói nôm na, các món đồ rơi ra từ việc đánh quái sẽ phù hợp với lớp (class) nhân vật của người chơi hơn so với trước đây. Cấp độ các món đồ rơi ra khi đánh quái cũng được điều chỉnh để phù hợp hơn với cấp độ của nhân vật, các thuộc tính đặc biệt của lớp nhân vật đó.</p>\n\n<p>Không còn cảnh bạn cầm những món đồ với chỉ số “tréo ngoe” như trước đây. Theo lời Wyatt Cheng, các món đồ xuất hiện trong phiên bản này sẽ ít hơn, nhưng chúng sẽ thực sự chất lượng.</p>\n\n<p>Bên cạnh chế độ chơi truyền thống,&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>&nbsp;cũng giới thiệu đến người chơi chế độ chơi Adventure.</p>\n\n<p>Được “mở khóa” sau khi hoàn thành cốt truyện chính (ở bất kỳ độ khó nào), Adventure Mode cho phép người chơi di chuyển tự do, nhận các nhiệm vụ Bounty (săn tiền thưởng) để nhận được những món vật phẩm giá trị.</p>\n\n<p>Chế độ Adventure cũng góp thêm phần thú vị không nhỏ cho công cuộc “giết quái – tìm đồ” của người chơi khi có nhiều phần thưởng hơn khi hoàn thành các “bounties” trong màn.</p>\n\n<p>Đây thực sự là trải nghiệm mới dành cho người chơi nếu như bạn đã quá “ngán” phần chơi theo cốt truyện.</p>\n\n<p>NPC Mystic cũng là một bổ sung đáng giá cho&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>, nhân vật này giúp cho tất cả những món đồ mà người chơi thu lượm được đều có khả năng trở thành trang bị mạnh mẽ.</p>\n\n<p>Nếu như bạn vẫn…không ưa thích một thuộc tính nào đó trên các món đồ của mình, bạn hoàn toàn có thể điều chỉnh chúng sang các thuộc tính khác thông qua NPC Mystic.</p>\n\n<p>Tuy nhiên, “cái giá” mà bạn phải trả để có được chúng không phải là rẻ, kèm theo một chút… may mắn nữa!</p>\n\n<p>Ngoài các cải tiến được nêu trên, Blizzard cũng có những điều chỉnh so với phiên bản gốc. Các thuộc tính của các nhóm quái vật siêu cấp (elite), vô địch (champion) cũng đã được điều chỉnh, thêm vào các con “trùm phụ” mới.</p>\n\n<p>Quả thực,<strong>&nbsp;<em>Diablo III:&nbsp;Reaper of Souls</em>&nbsp;</strong>đã làm cho&nbsp;<em>Diablo III</em>&nbsp;đã trở nên đáng chơi hơn rất nhiều so với trước đây.</p>\n\n<h3><strong>LỚP NHÂN VẬT MỚI: CRUSADER!</strong></h3>\n\n<p>Đây cũng là một trong những động lực chính khiến không ít game thủ phải “móc hầu bao” để sở hữu&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>.</p>\n\n<p>Thậm chí, ngay từ khi được giới thiệu lần đầu tiên, không ít game thủ đã liên tưởng Crusader với Paladin – lớp nhân vật rất được yêu thích của phiên bản&nbsp;<em>Diablo II</em>&nbsp;– vì những điểm tương đồng về cả diện mạo lẫn kỹ năng.</p>\n\n<p>Được mô tả như những chiến binh thần thánh, những “thanh kiếm sắc bén” của giáo hội Zakarum.</p>\n\n<p>Mang trong mình sức mạnh chiến đấu có thể “cuốn phăng” bất cứ kẻ thù nào, với những trang bị tận răng và những chiêu thức đầy uy lực, Crusader là lớp nhân vật thú vị nhất trong phiên bản này.</p>\n\n<p>Việc ra mắt Crusader, đồng nghĩa với việc các lớp nhân vật trước đó của&nbsp;<em>Diablo III</em>&nbsp;phải được cân bằng lại một chút.</p>\n\n<p>Một số kỹ năng của Wizard, Witch Doctor, Monk, Demon Hunter và Barbarian đã được thay đổi, làm lại.</p>\n\n<p>Nhìn chung thì những thay đổi này được đón nhận khá khách quan với những điểm mạnh – yếu rõ ràng.</p>\n\n<p>Điều này gián tiếp làm tăng chất “gay cấn” trong các cuộc đấu giữa người chơi với nhau (PvP).</p>\n\n<p>Người chơi cũng có dịp “đổi gió”, thử sức mình với lớp nhân vật mới một khi đã quá thông thạo với các lớp nhân vật có sẵn.</p>\n\n<h2><strong>BẠN SẼ GHÉT</strong></h2>\n\n<h3><strong>CỐT TRUYỆN QUÁ TẦM THƯỜNG</strong></h3>\n\n<p>Mặc dù bối cảnh về sự trở lại của Malthael là khá triển vọng, nhưng những gì mà Blizzard chọn để tạo nên cốt truyện của&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>&nbsp;lại thực sự tầm thường, thiếu tính bất ngờ, thú vị.</p>\n\n<p>Các tình tiết hầu như đều khá dễ đoán, không gợi lên được sự tò mò, thắc mắc tìm hiểu của người chơi, thậm chí đôi chỗ khá kỳ quặc, vô lý.</p>\n\n<p>Ngoài điểm yếu về việc sắp xếp, bố trí các tình huống trong mạch truyện ra thì hành động của các nhân vật trong&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>&nbsp;cũng không có gì đặc biệt, cá tính của các nhân vật phản diện đều không thể hiện rõ ràng.</p>\n\n<p><em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>&nbsp;sở hữu một nền tảng lối chơi tốt hơn nhiều so với phiên bản gốc.</p>\n\n<p>Tuy vậy, câu chuyện mà game muốn mang lại cho người chơi thực sự không khác gì một bữa cơm “nguội ngắt”.</p>\n\n<h3>LUÔN LUÔN KẾT NỐI TỚI MÁY CHỦ</h3>\n\n<p>Đây chính là điểm mà&nbsp;<em>Diablo III</em>&nbsp;phải nhận nhiều “gạch đá” nhất từ các game thủ.</p>\n\n<p>Họ cho rằng với một game mà trải nghiệm chơi đơn đậm nét như&nbsp;<em>Diablo</em>&nbsp;thì việc bắt buộc phải “online” (trực tuyến) thường xuyên để kết nối với các máy chủ của Blizzard là một việc “dư thừa”!</p>\n\n<p>Không như bản console, bản PC vẫn bắt buộc người chơi đăng nhập thông qua Battle.net và luôn luôn kết nối với máy chủ của Blizzard.</p>\n\n<p>Điều này đã có từ phiên bản đầu tiên và đối với phiên bản&nbsp;<em><strong>Diablo III:&nbsp;Reaper of Souls</strong></em>, nó cũng không có gì thay đổi.</p>\n\n<p>Do đó,&nbsp;khi kết nối internet có vấn đề thì việc thưởng thức game lại biến thành một “cực hình” không dễ để chấp nhận.</p>\n\n<p>Tình trạng giật, chậm hình (lag) xảy ra khá thường xuyên, tệ hơn là mất kết nối tới máy chủ.</p>\n\n<p>Ngoài ra, bạn cũng không thể thưởng thức&nbsp;<em>Diablo III</em>&nbsp;tại những nơi không có kết nối Internet.</p>\n\n<p>Tất nhiên, Blizzard có lý do của họ khi làm việc này, từ việc cập nhật các bản vá, quản lý bản quyền hay tăng thêm các trải nghiệm chơi mạng cho người chơi…</p>\n\n<p>Tuy vậy, sẽ hợp lý hơn nếu Blizzard cho phép người chơi thêm một lựa chọn ngoài việc bắt buộc phải online thường xuyên.</p>\n\n<p>Không ai lại đi bắt buộc khách hàng của mình “ăn” một món nhất định nào cả.</p>\n</div>',5,'2023-07-13',0,'1XG8k-LRdGdEYdRf1IeBsO-ZNbV2WA-1z'),
(12,'CS:GO - Game bắn súng nhiều người chơi nhất trên thế giới','<div><h3><strong>I. Thông tin CS:GO</strong></h3>\n\n<ul>\n	<li><strong>Thể loại</strong>: FPS, hành động</li>\n	<li><strong>Đồ hoạ</strong>: 3D</li>\n	<li><strong>Chế độ</strong>: Multiplayer, coop, online</li>\n	<li><strong>Độ tuổi</strong>: 17 tuổi trở lên</li>\n	<li><strong>Nhà phát hành</strong>:&nbsp;Valve</li>\n	<li><strong>Nền tảng</strong>:&nbsp;Windows,&nbsp;MacOS</li>\n	<li><strong>Ngày ra mắt</strong>: 22/08/2012</li>\n	<li><strong>Giá game</strong>: Miễn Phí</li>\n</ul>\n\n<h3><strong>II. Gameplay CS:GO</strong></h3>\n\n<p>Tương tự như CS 1.6, người chơi tham gia sẽ vào trận chiến giữa 2 phe đặc nhiệm chống khủng bố (counter-terrorist) và khủng bố (terrorist). Nhiệm vụ mỗi đội sẽ là quét sạch đối phương.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/feature-800x448-1.jpg\"></p>\n\n<p>CS:GO có nhiều chế độ chơi như Deathmatch, Arms Race, Demolition, Classic Casual, Classic Competitive và cả chế độ Battle Royale với đa dạng bản đồ trong game. Bạn có thể tìm thấy 2 bản đồ quen thuộc như Italia và Dust 2 trong game, đây cũng là 2 bản đồ được nhiều người chơi nhất.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/map-800x425-1.jpg\"></p>\n\n<p>Bên cạnh đó bạn có thể tìm thêm các màn chơi ở Workshop, đây là nơi cộng đồng người chơi có thể tạo dựng nên 1 bản đồ theo ý thích với luật chơi của riêng mình.&nbsp;</p>\n\n<p>CS:GO cũng có cơ chế phân hạng như các game LOL, DotA 2, thứ hạng càng cao thì người chơi đó càng hay.&nbsp; Người chơi có thể tham gia các trận đấu rank thông qua Classic Competitive, chế độ này tương tự Classic Casual nhưng sẽ có độ căng thẳng cao hơn do kết quả sẽ ảnh hưởng trực tiếp đến xếp hạng của bạn.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/551826753_preview_2015-11-10_00003-800x450-1.jpg\"></p>\n\n<p>Với hệ thống ghép cặp thông minh, bạn sẽ được xếp chung với những người có mức xếp hạng bằng bạn tránh trường hợp bạn gặp ngay Proplayer ngay màn chơi đầu tiên</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/70-800x450-1.png\"></p>\n\n<p>Không chỉ nâng cấp về mặt đồ hoạ mà CS:GO còn cải tiến về hệ thống vũ khí so với các phiên bản cũ, thêm vào những khẩu súng mới MP7, MP9 cực kỳ hiệu với tầm gần.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/mp9-800x473-1.jpg\"></p>\n\n<p>Với phe khủng bố bạn có thể trang bị khẩu Tec-9 với băng đạn tận 32 viên, phe chống khủng bố cũng có thể tân trang cho mình khẩu Five - Seven. Cùng với đó việc xuất hiện boom xăng Molotov Cocktail cũng cho ra đời nhiều chiến thuật khác góp phần làm đa dạng lối chơi của CS:GO.</p>\n\n<p>Ngoài ra bạn cũng có thể tân trang lại vũ khí của mình với hệ thống skin (trang phục của CS:GO) bằng cách mở hòm. Các loại skin cũng được phân loại từ bình thường đến hiếm và giá thành có thể lên đến vài ngàn đô.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/skin1-800x214-1.jpg\"></p>\n\n<p>Không chỉ vậy, CS:GO còn là bộ môn ESport được tổ chức thường niên với hàng loạt giải đấu lớn với sự quy tụ của các đội tuyển chuyên nghiệp. Với sự quan tâm đông đảo của cộng đồng CS:GO đã và tiếp tục đà phát triển của mình.</p>\n\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/2020/04/content/02-1491813833283-800x400-1.jpg\"></p>\n\n<h3><strong>III. Đồ hoạ CS:GO</strong></h3>\n\n<p>CS:GO đã có sự nâng cấp về đồ hoạ rõ rệt so với các phiên bản trước, các chi tiết sắc nét, rõ ràng hơn. Mang lại cho người chơi có cảm giác chân thực với những trận đấu súng đầy kịch tính. Bên cạnh đó CS:GO đã tối ưu rất tốt để hướng đến tất cả người chơi, bạn không cần 1 cấu hình quá mạnh để chiến game với mức low setting 60FPS.&nbsp;</p>\n\n<p>Âm thanh trong CS:GO cũng được chăm chút, bạn có thể nghe được từng tiếng bước chân của kẻ địch trong game 1 cách chân thực. Mỗi loại súng đều có âm thanh riêng, bạn có thể phân biệt được chúng và tiếng súng trong CS:GO nghe rất đã tai với các loại súng bắn tỉa.</p>\n\n<p>CS:GO cũng hỗ trợ Voice Chat để người chơi có thể trao đổi nhanh chiến thuật với nhau, giúp việc giao tiếp dễ dàng hơn.</p>\n\n<h3><strong>IV. Cấu hình CS:GO</strong></h3>\n\n<p><strong>1. Windows</strong></p>\n\n<ul>\n	<li>Hệ điều hành: Windows® 7/Vista/XP trở lên</li>\n	<li>Bộ xử lý: Intel® Core™ 2 Duo E6600 hoặc AMD Phenom™ X3 8750 processor trở lên</li>\n	<li>Bộ nhớ: 2 GB RAM</li>\n	<li>Đồ họa: Có tương thích Direct 9, có hỗ trợ Sharder 3.0, 256MB VRAM trở lên&nbsp;</li>\n	<li>DirectX: Phiên bản 9.0c</li>\n	<li>Lưu trữ: 15 GB.</li>\n</ul>\n\n<p><strong>2. MacOS</strong></p>\n\n<ul>\n	<li>Hệ điều hành: MacOS X 10.11 (El Capitan) trở lên</li>\n	<li>Bộ xử lý: Intel Core Duo Processor (2GHz trở lên)</li>\n	<li>Bộ nhớ: 2 GB RAM</li>\n	<li>Đồ họa: ATI Radeon HD 2400 or better / NVidia 8600M trở lên</li>\n	<li>Lưu trữ: 15 GB.</li>\n</ul>\n\n<p>Mặc dù các đối thủ của CS:GO có dấu hiệu đi xuống thì CS:GO vẫn giữ được độ hot của mình, thậm chí là nhiều lần vượt qua chính kỷ lục của mình với lượng người ổn định ở mức ~900.000 cùng lúc trong tháng 3/2020. Vậy bạn còn chờ gì mà ko thử ngay đi chứ! Đừng quên chia sẻ highlight của bạn với bọn mình nhé.</p>\n</div>',5,'2023-07-01',0,'1TGplk3EE42tvk3YGMBJ1_YH94U2EPT4t');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `category_id` varchar(10) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL COMMENT 'Tên tiếng Việt',
  `Type` varchar(8) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `category_id` (`category_id`),
  UNIQUE KEY `category_category_id_IX` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES 
(1,'GCT','Chiến Thuật','Game'),
(2,'GFPS','FPS','Game'),
(3,'GHD','Hành Động','Game'),
(4,'GKD','Kinh Dị','Game'),
(5,'GLT','Lập Trình','Game'),
(6,'GMMO','MMO','Game'),
(7,'GMOBA','Moba','Game'),
(8,'GMP','Mô Phỏng','Game'),
(9,'GNV','Nhập Vai','Game'),
(10,'GPL','Phiêu Lưu','Game'),
(11,'GK','Khác','Game'),
(12,'PKBP','Bàn Phím','PK'),
(13,'PKC','Chuột','PK'),
(14,'PKTN','Tai Nghe','PK'),
(15,'PKLC','Lót Chuột','PK'),
(16,'PKG','Ghế','PK'),
(17,'PKMH','Màn Hình','PK'),
(18,'PKTC','Tay Cầm','PK'),
(19,'PKK','Khác','PK');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int NOT NULL,
  `account_id` int NOT NULL,
  `Content` varchar(255) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Account_Comment` (`account_id`),
  KEY `FK_Comment_Blogs` (`blog_id`),
  CONSTRAINT `FK_Account_Comment` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`),
  CONSTRAINT `FK_Comment_Blogs` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES 
(1,4,1,'Game tốt','2023-02-02 07:30:00.000000',1),
(2,4,2,'Giật lagggg game tệ','2023-02-02 14:21:00.000000',1),
(3,4,7,'bản cập nhật tốt','2023-02-02 11:15:00.000000',1),
(4,4,4,'Sân cỏ xấu quá, lỗi chuyển động không mượt','2023-02-02 17:30:00.000000',0),
(7,3,5,'Năm nay không biết nó fix cái dynamic potential nửa vời của career mode và phòng thủ siêu ngu chưa','2023-02-02 20:21:00.000000',0),
(9,4,6,'Mình thì chẳng cần gì mới nhiều cả, chỉ cần trong cái manager career nó fix lại cái dynamic potential, để tránh việc mấy cầu thủ trẻ đôn lên đội 1 cuối mùa này thì mùa sau chưa gì đã rớt 5-7 điểm POT vô lí.','2023-02-02 00:00:00.000000',1),
(10,3,1,'Game này khá hay mọi người nên thử','2023-03-02 15:02:00.000000',1),
(11,3,2,'Gacha muôn năm, chảy ke muôn năm','2023-02-12 21:19:00.000000',1),
(12,3,8,'Game cốt truyện phong phú, đa dạng lối chơi mọi người nên chơi thử','2023-05-21 09:30:00.000000',1),
(13,3,4,'Game như lozz nhà phát hành làm game quá dở','2023-06-15 08:42:00.000000',0),
(14,3,7,'Game hơi lag, lời khuyên cho mấy bạn máy yếu là không nên chơi','2023-05-22 06:30:00.000000',1),
(15,3,9,'Đồ họa khá đẹp tôi khá thích game, cảm ơn nhà phát hành đã làm ra tựa game hay như vậy!','2023-04-15 13:21:00.000000',1),
(16,3,12,'Banner mới ra khá là hấp dẫn','2023-02-21 10:15:00.000000',1),
(17,3,10,'Nhà phát hành dở tệ','2023-02-17 14:12:00.000000',0),
(18,2,1,'Bản đồ mới có vẻ khá khó chơi','2023-04-17 22:19:00.000000',1),
(19,2,2,'Tôi đã chơi thử bản đồ mới trông nó khá hay ho!','2023-04-02 17:14:00.000000',1),
(20,2,6,'Bản đồ mới dở tệ tôi không thể tin có được một loại game dở như vậy!','2023-02-17 13:12:00.000000',0),
(21,2,4,'Mong nhà phát hành sớm fix một số lỗi trên bản đồ mới','2023-03-15 04:05:00.000000',1),
(22,2,5,'Các bạn nên chơi thử bản đồ mới đi','2023-05-13 00:00:00.000000',1),
(23,1,1,'Cảm ơn nhà phát cuối cùng lỗi này cũng được sửa!','2023-03-15 01:13:00.000000',1),
(24,1,2,'Game hay','2023-04-01 16:14:00.000000',1),
(25,1,4,'Game tốt','2023-04-05 15:49:00.000000',1),
(26,5,2,'Tôi không nghĩ như vậy!','2023-03-17 17:30:00.000000',1),
(27,5,4,'Game đồ họa khá đẹp tôi đánh giá game 8 điểm','2023-02-17 14:21:00.000000',1),
(28,5,5,'game như lozz','2023-04-10 00:11:00.000000',0),
(29,5,6,'Cốt truyện game tôi thấy không hấp dẫn lắm','2023-05-17 14:21:00.000000',1),
(30,5,7,'Tôi nghĩ nhà phát hành nên đầu tư nhiều hơn cho cốt truyện game','2023-05-22 18:32:00.000000',1),
(31,5,8,'Thấy mọi người chê game nhiều quá ai cho em xin ít review đi','2023-06-08 23:11:00.000000',1),
(32,5,9,'Game nằm ở mức ổn','2023-04-17 11:43:00.000000',1),
(33,6,1,'Game khá hay','2023-03-17 12:20:00.000000',1),
(34,6,2,'Anh độ đưa tôi đến với game này','2023-03-01 11:01:00.000000',1),
(35,6,4,'Game đổi mới khá nhiều so với bản cũ','2023-03-05 09:07:00.000000',1),
(36,6,5,'Game khá thú vị với chuỗi nhiệm vụ đặc sắc','2023-03-17 07:49:00.000000',1),
(37,7,6,'Tôi không nghĩ như vậy!','2023-03-17 20:17:00.000000',1),
(38,7,2,'Tôi đã chơi thử game và giờ vẫn còn thấy sợ!','2023-04-17 20:59:00.000000',1),
(39,7,4,'Game khá hay trong dòng game kinh dị','2023-05-14 12:34:00.000000',1),
(40,8,1,'Game đồ họa khá hay!','2023-04-12 15:12:00.000000',1),
(41,8,2,'Game lag quá','2023-03-17 21:20:00.000000',1),
(42,8,4,'Game khá tệ nhà phát hành không biết làm game','2023-05-12 11:20:00.000000',0),
(43,8,5,'Game khá hấp dẫn nếu ai đam mê cảm giác mạnh thì nên thử','2023-04-11 00:20:00.000000',1),
(44,4,5,'Mặc dù game khá cũ nhưng game vẫn hay so với các game mới hiện tại','2023-03-02 07:30:00.000000',1),
(45,4,6,'Dota vẫn là một cái gì đó các game hiện tại không thể vượt qua được','2023-04-015 09:30:00.000000',1),
(46,4,8,'Game khá cũ các nên cân nhắc trước khi chơi thử','2023-05-03 11:24:00.000000',1),
(47,4,9,'Lối chơi của game khá hấp dẫn','2023-04-02 09:18:00.000000',1),
(48,4,10,'Game hơi lag','2023-03-14 15:30:00.000000',1),
(49,4,12,'Mọi người cho em xin thêm review về game với','2023-04-16 14:28:00.000000',1),
(50,4,13,'Cảm ơn nhà phát hành tôi đã gắn bó với game khá lâu, game rất hay','2023-05-12 20:30:00.000000',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(255) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Amount` int NOT NULL,
  `Value` double NOT NULL,
  `min_spend` double NOT NULL,
  `mfg_date` datetime(6) NOT NULL,
  `exp_date` datetime(6) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Code` (`Code`),
  UNIQUE KEY `coupon_Code_IX` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES 
(1,'Mã giảm giá Mùa Hè','ABDJHGMKET',20,50000,500000,'2023-06-01 00:00:00.000000','2023-06-30 23:59:59.000000',1,'voucher.png','Giảm 50.000 đồng cho đơn hàng trên 500,000 đồng.'),
(2,'Mã giảm giá Thanh Toán Trực Tuyến','QPOXWIVRUT',10000,50000,0,'2023-06-01 00:00:00.000000','2023-06-15 23:59:59.000000',1,'voucher.png','Giảm 50.000 đồng cho thanh toán trực tuyến.'),
(3,'Mã giảm giá Mua 2 Tặng 1','ZYXVUTSRQP',100,10000,0,'2023-06-01 00:00:00.000000','2023-06-30 23:59:59.000000',1,'voucher.png','Giảm 10.000 đồng khi mua từ 2 sản phẩm.'),
(4,'Mã giảm giá Giờ Vàng','HNMLKJGFED',30,30000,100000,'2023-06-15 10:00:00.000000','2023-06-15 11:00:00.000000',1,'voucher.png','Giảm 30.000 đồng trong khung giờ vàng.'),
(5,'Mã giảm giá Thẻ Thành Viên','WVUTSRQPOI',500,100000,1000000,'2023-06-01 00:00:00.000000','2023-12-31 23:59:59.000000',1,'voucher.png','Giảm 100.000 đồng khi sử dụng thẻ thành viên.'),
(6,'Mã giảm giá Sinh Nhật','XCVBNMKLPI',10,50000,100000,'2023-05-31 00:00:00.000000','2023-06-30 23:59:59.000000',1,'voucher.png','Giảm 50.000 đồng cho sinh nhật khách hàng.'),
(7,'Mã giảm giá Năm Mới','LKJHGFDSAZ',15,100000,1000000,'2024-01-01 00:00:00.000000','2024-01-31 23:59:59.000000',1,'voucher.png','Giảm 100.000 đồng cho đơn hàng tháng 1.'),
(8,'Mã giảm giá Sản Phẩm Hot','ASDFGHJKLM',20,30000,500000,'2023-06-01 00:00:00.000000','2023-12-31 23:59:59.000000',1,'voucher.png','Áp dụng cho sản phẩm hot, giảm giá 30.000 đồng.'),
(9,'Mã giảm giá Ngày Quốc Khánh','QWERTYUIOP',50,50000,200000,'2023-09-02 00:00:00.000000','2023-09-03 23:59:59.000000',1,'voucher.png','Giảm 50.000 đồng trong ngày Quốc khánh.'),
(10,'Mã giảm giá Mua 3 Tặng 1','ASDFGHJKL1',30,20000,100000,'2023-06-01 00:00:00.000000','2023-12-31 23:59:59.000000',1,'voucher.png','Giảm 20.000 đồng khi mua từ 3 sản phẩm.'),
(11,'Mã giảm giá Tết Trung Thu','ZXCVBNM123',3000,50000,300000,'2023-09-15 00:00:00.000000','2023-09-16 23:59:59.000000',1,'voucher.png','Giảm 50.000 đồng trong ngày Tết Trung Thu.');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_owner`
--

DROP TABLE IF EXISTS `coupon_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_owner` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `FK_Coupon_owner_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`),
  CONSTRAINT `FK_Coupon_owner_Coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_owner`
--

LOCK TABLES `coupon_owner` WRITE;
/*!40000 ALTER TABLE `coupon_owner` DISABLE KEYS */;
INSERT INTO `coupon_owner` VALUES 
(1,1,10,1),
(2,2,1,1),
(3,3,2,1),
(4,4,3,1),
(5,5,4,1),
(6,6,5,1),
(8,8,7,1),
(9,9,8,1),
(10,10,9,1),
(11,7,1,0),
(12,7,2,0),
(13,7,3,0),
(14,7,4,0),
(15,7,5,1),
(7,7,6,0),
(16,7,7,1),
(17,7,8,1),
(18,1,9,1),
(19,1,1,0),
(20,1,11,1),
(22,1,2,0),
(23,1,3,0),
(24,1,4,0),
(25,1,5,1),
(26,1,6,0),
(27,1,7,1),
(21,1,8,1);
/*!40000 ALTER TABLE `coupon_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `like_date` date NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `product_id` (`product_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `FK_Favorite_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`),
  CONSTRAINT `FK_Favorite_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES 
(1,1,1,'2023-02-02',1),
(2,2,1,'2023-02-02',2),
(3,3,1,'2023-02-02',3),
(4,4,1,'2023-02-02',4),
(6,5,1,'2023-02-02',4);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `Content` varchar(255) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Star` int NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `account_id` (`account_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `FK_FeedBack_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`),
  CONSTRAINT `FK_FeedBack_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES 
(1,6,'Sản phẩm rất tốt, tôi rất hài lòng với chất lượng và hiệu suất của nó.',1,5,'2023-07-12 03:13:28.000000',1),
(2,7,'Đáng giá mỗi đồng.',1,4,'2023-07-12 03:13:28.000000',2),
(3,8,'Phụ kiện gaming chất lượng cao, tôi rất hài lòng.',1,5,'2023-07-12 03:13:28.000000',3),
(4,9,'Sản phẩm không đạt yêu cầu, cần cải thiện.',0,2,'2023-07-12 03:13:28.000000',1),
(5,10,'Sản phẩm hơi đắt nhưng chất lượng rất tốt.',1,4,'2023-07-12 03:13:28.000000',5),
(6,11,'Phụ kiện gaming hữu ích và giá cả hợp lý.',1,4,'2023-07-12 03:13:28.000000',6),
(7,12,'Phụ kiện gaming hữu ích và giá cả hợp lý.',1,4,'2023-07-12 03:13:28.000000',1),
(8,13,'Sản phẩm giao hàng nhanh chóng, rất tốt.',1,5,'2023-07-12 03:13:28.000000',7),
(9,2,'Chất lượng sản phẩm tuyệt vời, giá cả phải chăng.',1,5,'2023-07-12 03:13:28.000000',1),
(10,1,'Phụ kiện gaming chất lượng đáng tin cậy.',1,4,'2023-07-12 03:13:28.000000',9),
(11,1,'Sản phẩm đáng mua, tôi sẽ giới thiệu cho bạn bè.',1,5,'2023-07-12 03:13:28.000000',10),
(12,1,'Sản phẩm tuyệt vời, đáng để sở hữu.',1,5,'2023-07-12 03:13:28.000000',11),
(13,2,'Phụ kiện gaming giúp tôi có trải nghiệm tuyệt vời.',1,4,'2023-07-12 03:13:28.000000',12),
(14,3,'Phụ kiện gaming giúp tôi có trải nghiệm tuyệt vời.',1,4,'2023-07-12 03:13:28.000000',1),
(15,4,'Chất lượng sản phẩm tuyệt vời, giá cả phải chăng.',1,5,'2023-07-12 03:13:28.000000',8),
(16,4,'Sản phẩm rất tốt, tôi rất hài lòng với chất lượng và hiệu suất của nó.',1,5,'2023-07-12 03:13:28.000000',17),
(17,5,'Đáng giá mỗi đồng.',1,4,'2023-07-12 03:13:28.000000',19),
(18,5,'Phụ kiện gaming chất lượng cao, tôi rất hài lòng.',1,5,'2023-07-12 03:13:28.000000',18),
(19,1,'Game chỉ ở mức bình thường.',1,3,'2023-05-22 03:13:28.000000',1),
(20,1,'Tôi rất ứng ý về tựa game này. Tôi đánh giá khá cao về nó, đây là một tựa game đáng để chơi.',1,5,'2022-02-02 03:13:28.000000',8);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(100) NOT NULL,
  `Province` varchar(100) NOT NULL,
  `District` varchar(100) NOT NULL,
  `Ward` varchar(100) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Type` varchar(9) NOT NULL,
  `address_default` tinyint(1) NOT NULL,  /* 1 địa chỉ giao hàng mặc định */
  `account_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Location_Account` (`account_id`),
  CONSTRAINT `FK_Location_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES 
(1,'thôn 6, Phường Nhân Hòa, Thị xã Quế Võ, Tỉnh Bắc Ninh','27','259','9259','0898870044','Văn Phòng', 0, 1),
(2,'thôn 5, Xã Bộc Bố, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1864','0394495986','Nhà Riêng', 1, 2),
(3,'thôn 5, Thị trấn Mường Khương, Huyện Mường Khương, Tỉnh Lào Cai','10','83','2761','0862844774','Văn Phòng', 1, 3),
(4,'Thôn 4, Xã Nhạn Môn, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1861','0867377117','Nhà Riêng', 0, 4),
(5,'thôn 4, Xã Leng Su Sìn, Huyện Mường Nhé, Tỉnh Điện Biên','11','96','3158','0792667733','Văn Phòng', 0, 5),
(6,'thôn 1, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng','4','42','1294','0869562185','Nhà Riêng', 0, 6),
(7,'thôn 6, Phường Nhân Hòa, Thị xã Quế Võ, Tỉnh Bắc Ninh','27','259','9259','0867724554','Văn Phòng', 1, 7),
(8,'thôn 5, Xã Bộc Bố, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1864','0347470039','Nhà Riêng', 1, 8),
(9,'Thôn 4, Xã Nhạn Môn, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1861','0971178822','Văn Phòng', 0, 9),
(10,'thôn 4, Xã Leng Su Sìn, Huyện Mường Nhé, Tỉnh Điện Biên','11','96','3158','0869212130','Nhà Riêng', 0, 10),
(11,'thôn 1, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng','4','42','1294','0867330108','Văn Phòng', 1, 11),
(12,'thôn 6, Phường Nhân Hòa, Thị xã Quế Võ, Tỉnh Bắc Ninh','27','259','9259','0783535500','Nhà Riêng', 1, 12),
(13,'thôn 5, Xã Bộc Bố, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1864','0353837068','Văn Phòng', 1, 13),
(14,'thôn 5, Thị trấn Mường Khương, Huyện Mường Khương, Tỉnh Lào Cai','10','83','2761','0989794411','Nhà Riêng', 1, 1),
(15,'Thôn 4, Xã Nhạn Môn, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1861','0366473573','Văn Phòng', 0, 2),
(16,'thôn 4, Xã Leng Su Sìn, Huyện Mường Nhé, Tỉnh Điện Biên','11','96','3158','0345443039','Nhà Riêng', 0, 3),
(17,'thôn 1, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng','4','42','1294','0908335020','Văn Phòng', 1, 4),
(18,'thôn 6, Phường Nhân Hòa, Thị xã Quế Võ, Tỉnh Bắc Ninh','27','259','9259','0708317575','Nhà Riêng', 1, 5),
(19,'thôn 5, Xã Bộc Bố, Huyện Pác Nặm, Tỉnh Bắc Kạn','6','60','1864','0783536677','Văn Phòng', 1, 6);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_data`
--

DROP TABLE IF EXISTS `order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_data` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) NOT NULL,
  `account_id` int NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `create_date` date DEFAULT (curdate()),
  `Address` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ nhận',
  `payment_type` varchar(6) NOT NULL,
  `shipping_fee` double NOT NULL,
  `coupon_code` varchar(10) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `order_status` enum("Đã hoàn thành", "Đã hủy", "Đang vận chuyển", "Đang chờ xử lý") NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `Qty` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `order_data_order_id_IX` (`order_id`),
  KEY `FK_order_data_Account` (`account_id`),
  CONSTRAINT `FK_order_data_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_data`
--

LOCK TABLES `order_data` WRITE;
/*!40000 ALTER TABLE `order_data` DISABLE KEYS */;
INSERT INTO `order_data` VALUES 
(1,'X1Y2Z3A4B5C1',1,'Phạm Văn M','2020-01-15','456 Lý Thường Kiệt, Quận 1, TP.HCM','cod',25000,NULL,'phamvanm@gmail.com','0123456780','Đã hoàn thành',1,NULL,180000,1),
(2,'D7E6F5G4H2',2,'Nguyễn Thị N','2020-02-20','789 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'nguyenthin@gmail.com','0123456781','Đang vận chuyển',0,NULL,220000,1),
(3,'I2J1K0L3',3,'Trần Văn O','2020-03-25','111 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'tranvano@gmail.com','0123456782','Đã hoàn thành',1,NULL,160000,1),
(4,'M5N4O3P4',4,'Lê Thị P','2020-04-10','222 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'lethip@gmail.com','0123456783','Đang chờ xử lý',0,NULL,190000,1),
(5,'Q1R0S9T5',5,'Nguyễn Văn Q','2020-05-03','333 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',21000,NULL,'nguyenvanq@gmail.com','0123456784','Đã hoàn thành',1,NULL,250000,1),
(6,'U7V6W5X2',6,'Phạm Thị R','2020-06-15','444 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'phamthir@gmail.com','0123456785','Đã hoàn thành',1,NULL,180000,1),
(7,'Y3Z2A1B7',7,'Hoàng Văn S','2020-07-20','555 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'hoangvans@gmail.com','0123456786','Đang vận chuyển',0,NULL,220000,1),
(8,'C6D5E4F8',8,'Nguyễn Thị T','2020-08-25','666 Lê Duẩn, Quận 5, TP.HCM','paypal',18000,NULL,'nguyenthit@gmail.com','0123456787','Đã hoàn thành',1,NULL,160000,1),
(9,'G2H1I0J9',9,'Trần Văn U','2020-09-10','777 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'tranvanu@gmail.com','0123456788','Đang chờ xử lý',0,NULL,190000,1),
(10,'K8L7M6N0',10,'Lê Thị V','2020-10-03','888 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'lethiv@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,1),
(11,'O4P3Q2R1',11,'Nguyễn Văn W','2020-11-15','999 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'nguyenvanw@gmail.com','0123456700','Đã hoàn thành',1,NULL,180000,1),
(12,'S9T8U7V2',12,'Phạm Thị X','2020-12-20','123 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','paypal',35000,NULL,'phamthix@gmail.com','0123456701','Đang vận chuyển',0,NULL,220000,1),
(13,'W5X4Y3Z3',13,'Hoàng Văn Y','2020-01-25','234 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'hoangvany@gmail.com','0123456702','Đã hoàn thành',1,NULL,160000,1),
(14,'A1B0C9D4',1,'Nguyễn Thị Z','2020-02-10','345 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'nguyenthiz@gmail.com','0123456703','Đang chờ xử lý',0,NULL,190000,1),
(15,'E6F5G4H5',2,'Trần Văn A','2020-03-15','456 Đinh Tiên Hoàng, Quận 1, TP.HCM','paypal',21000,NULL,'tranvana@gmail.com','0123456704','Đã hoàn thành',1,NULL,250000,1),
(16,'I2J1K0L6',3,'Lê Thị B','2020-04-03','567 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'lethib@gmail.com','0123456705','Đã hoàn thành',1,NULL,180000,1),
(17,'M5N4O3P7',4,'Nguyễn Văn C','2020-05-15','678 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'nguyenvanc@gmail.com','0123456706','Đang vận chuyển',0,NULL,220000,1),
(18,'Q1R0S9T8',5,'Phạm Thị D','2020-06-20','789 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'phamthid@gmail.com','0123456707','Đã hoàn thành',1,NULL,160000,1),
(19,'U7V6W5X9',6,'Hoàng Văn E','2020-07-25','890 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'hoangvane@gmail.com','0123456708','Đang chờ xử lý',0,NULL,190000,1),
(20,'Y3Z2A1B1',7,'Nguyễn Thị F','2020-08-10','987 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'nguyenthif@gmail.com','0123456709','Đã hoàn thành',1,NULL,250000,1),

(21,'X1Y2Z3A4B5C2',13,'Phạm Văn M','2021-02-15','456 Lý Thường Kiệt, Quận 1, TP.HCM','cod',25000,NULL,'phamvanm@gmail.com','0123456780','Đã hoàn thành',1,NULL,180000,1),
(22,'D7E6F5G4H3',12,'Nguyễn Thị N','2021-01-20','789 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'nguyenthin@gmail.com','0123456781','Đang vận chuyển',0,NULL,220000,1),
(23,'I2J1K0L4',11,'Trần Văn O','2021-02-25','111 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'tranvano@gmail.com','0123456782','Đã hoàn thành',1,NULL,160000,1),
(24,'M5N4O3P5',10,'Lê Thị P','2021-03-10','222 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'lethip@gmail.com','0123456783','Đang chờ xử lý',0,NULL,190000,1),
(25,'Q1R0S9T7',9,'Nguyễn Văn Q','2021-04-03','333 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',21000,NULL,'nguyenvanq@gmail.com','0123456784','Đã hoàn thành',1,NULL,250000,1),
(26,'U7V6W5X6',8,'Phạm Thị R','2021-05-15','444 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'phamthir@gmail.com','0123456785','Đã hoàn thành',1,NULL,180000,1),
(27,'Y3Z2A1B8',7,'Hoàng Văn S','2021-06-20','555 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'hoangvans@gmail.com','0123456786','Đang vận chuyển',0,NULL,220000,1),
(28,'C6D5E4F9',6,'Nguyễn Thị T','2021-07-25','666 Lê Duẩn, Quận 5, TP.HCM','paypal',18000,NULL,'nguyenthit@gmail.com','0123456787','Đã hoàn thành',1,NULL,160000,1),
(29,'G2H1I0J0',5,'Trần Văn U','2021-08-10','777 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'tranvanu@gmail.com','0123456788','Đang chờ xử lý',0,NULL,190000,1),
(30,'K8L7M6N1',4,'Lê Thị V','2021-09-03','888 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'lethiv@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,1),
(31,'O4P3Q2R2',3,'Nguyễn Văn W','2021-10-15','999 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'nguyenvanw@gmail.com','0123456700','Đã hoàn thành',1,NULL,180000,1),
(32,'S9T8U7V3',2,'Phạm Thị X','2021-11-20','123 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','paypal',35000,NULL,'phamthix@gmail.com','0123456701','Đang vận chuyển',0,NULL,220000,1),
(33,'W5X4Y3Z4',1,'Hoàng Văn Y','2021-12-25','234 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'hoangvany@gmail.com','0123456702','Đã hoàn thành',1,NULL,160000,1),
(34,'A1B0C9D5',13,'Nguyễn Thị Z','2021-01-10','345 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'nguyenthiz@gmail.com','0123456703','Đang chờ xử lý',0,NULL,190000,1),
(35,'E6F5G4H6',1,'Trần Văn A','2021-02-15','456 Đinh Tiên Hoàng, Quận 1, TP.HCM','paypal',21000,NULL,'tranvana@gmail.com','0123456704','Đã hoàn thành',1,NULL,250000,1),
(36,'I2J1K0L8',2,'Lê Thị B','2021-03-03','567 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'lethib@gmail.com','0123456705','Đã hoàn thành',1,NULL,180000,1),
(37,'M5N4O3P6',3,'Nguyễn Văn C','2021-04-15','678 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'nguyenvanc@gmail.com','0123456706','Đang vận chuyển',0,NULL,220000,1),
(38,'Q1R0S9T4',4,'Phạm Thị D','2021-05-20','789 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'phamthid@gmail.com','0123456707','Đã hoàn thành',1,NULL,160000,1),
(39,'U7V6W5X3',5,'Hoàng Văn E','2021-06-25','890 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'hoangvane@gmail.com','0123456708','Đang chờ xử lý',0,NULL,190000,1),
(40,'Y3Z2A1B2',6,'Nguyễn Thị F','2021-07-10','987 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'nguyenthif@gmail.com','0123456709','Đã hoàn thành',1,NULL,250000,1),

(41,'H4K9E1L7D2R8P9',1,'Nguyễn Văn A','2022-01-01','12 Nguyễn Du, Quận 1, TP.HCM','momo',23000,NULL,'nguyenvana@gmail.com','0123456789','Đã hoàn thành',1,NULL,100000,1),
(42,'X3G6T2Y1J9Q0S8',2,'Trần Văn B','2022-09-03','99 Lê Lợi, Quận 5, TP.HCM','momo',10000,NULL,'tranvanb@gmail.com','0123456789','Đã hoàn thành',1,NULL,150000,1),
(43,'A5B2C7D1E9F4G7',3,'Phạm Thức','2022-05-05','78 Cách Mạng Tháng 8, Quận 3, TP.HCM','vnpay',15000,NULL,'phamthuc@gmail.com','0123456789','Đã hoàn thành',1,NULL,130000,1),
(44,'N0M6B7V2C5X3Z6',4,'Lê Thu Hiền','2022-07-07','22 Bà Huyện Thanh Quan, Quận 1, TP.HCM','vnpay',23000,NULL,'lethuhien@gmail.com','0123456789','Đã hoàn thành',1,NULL,200000,1),
(45,'F8H5J4K6L2P0Q5',5,'Đặng Kim Chi','2022-07-09','45 Nguyễn Thị Minh Khai, Quận 1, TP.HCM','vnpay',30000,NULL,'dangkimchi@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,1),
(46,'R7T3Y1U6I2O4P4',6,'Nguyễn Văn Bảo','2022-10-11','31 Lê Duẩn, Quận 1, TP.HCM','momo',10000,NULL,'nguyenvanbao@gmail.com','0123456789','Đã hoàn thành',1,NULL,170000,1),
(47,'V9C4X1B6N7M2K2',7,'Nguyễn Văn A','2022-01-13','72 Trần Hưng Đạo, Quận 1, TP.HCM','momo',23000,NULL,'nguyenvana@gmail.com','0123456789','Đã hủy',0,NULL,160000,1),
(48,'S1D8F6G2H3J9K3',8,'Nguyễn Văn A','2022-03-15','14 Tôn Thất Đạm, Quận 1, TP.HCM','paypal',10000,NULL,'nguyenvana@gmail.com','0123456789','Đã hủy',0,NULL,350000,1),
(49,'E7R5T1Y4U2I6O2',9,'Nguyễn Văn Bảo','2022-05-17','102 Lý Tự Trọng, Quận 1, TP.HCM','paypal',23000,NULL,'nguyenvanbao@gmail.com','0123456789','Đã hủy',0,NULL,400000,1),
(50,'G2N7M5B6V1C3X1',10,'Lê Thu Hiền','2022-07-19','63 Phan Đình Phùng, Quận Phú Nhuận, TP.HCM','momo',23000,NULL,'lethuhien@gmail.com','0123456789','Đã hủy',0,NULL,350000,1),
(51,'P0L9K5J2H7G3F0',11,'Phạm Thức','2022-09-21','8 Nguyễn Trãi, Quận 5, TP.HCM','cod',23000,NULL,'phamthuc@gmail.com','0123456789','Đã hoàn thành',1,NULL,100000,1),
(52,'U1I6O3P9Q2S5D1',12,'Lê Thu Hiền','2022-11-23','59 Cao Thắng, Quận 10, TP.HCM','cod',23000,NULL,'lethuhien@gmail.com','0123456789','Đã hoàn thành',1,NULL,130000,1),
(53,'Z8X3C2V1B7N4M2',13,'Trần Văn B','2022-01-25','22 Nguyễn Công Trứ, Quận 1, TP.HCM','cod',13000,NULL,'tranvanb@gmail.com','0123456789','Đã hoàn thành',1,NULL,127000,1),
(54,'I2O9P6Q3S4D1F3',1,'Phạm Thức','2022-03-27','17 Trần Nhật Duật, Quận 1, TP.HCM','momo',23000,NULL,'phamthuc@gmail.com','0123456789','Đã hoàn thành',1,NULL,340000,1),
(55,'Y7U5I2O0P9T4R4',2,'Phạm Thức','2022-05-29','3 Điện Biên Phủ, Quận 1, TP.HCM','vnpay',13000,NULL,'phamthuc@gmail.com','0123456789','Đã hoàn thành',1,NULL,170000,1),
(56,'B6M2N4V7X1C3Z6',3,'Đặng Kim Chi','2022-04-31','61 Nguyễn Cư Trinh, Quận 1, TP.HCM','vnpay',33000,NULL,'dangkimchi@gmail.com','0123456789','Đã hoàn thành',1,NULL,120000,1),
(57,'K4J1H9G7F2D8S8',4,'Nguyễn Văn A','2022-02-01','22 Tôn Thất Tùng, Quận 1, TP.HCM','momo',17000,NULL,'nguyenvana@gmail.com','0123456789','Đã hoàn thành',1,NULL,136000,1),
(58,'Q0P5O2I9U4Y7T7',5,'Đặng Kim Chi','2022-12-03','99 Trần Quang Khải, Quận 1, TP.HCM','cod',23000,NULL,'dangkimchi@gmail.com','0123456789','Đã hoàn thành',1,NULL,400000,1),
(59,'L7K3J5H1G2F9D5',6,'Lê Thu Hiền','2022-11-05','48 Nguyễn Thị Minh Khai, Quận 1, TP.HCM','paypal',33000,NULL,'lethuhien@gmail.com','0123456789','Đã hủy',0,NULL,300000,1),
(60,'C1V9B3N7M5X2Z1',7,'Lê Thu Hiền','2022-03-07','92 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',17000,NULL,'lethuhien@gmail.com','0123456789','Đang chờ xử lý',0,NULL,100000,1),

(61,'A1B2C3D4E5F4',8,'Phạm Văn M','2023-01-15','456 Lý Thường Kiệt, Quận 1, TP.HCM','cod',25000,NULL,'phamvanm@gmail.com','0123456780','Đã hoàn thành',1,NULL,180000,1),
(62,'G7H6I5J4K3',9,'Nguyễn Thị N','2023-02-20','789 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'nguyenthin@gmail.com','0123456781','Đang vận chuyển',0,NULL,220000,1),
(63,'L1M0N9O1',10,'Trần Văn O','2023-03-25','111 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'tranvano@gmail.com','0123456782','Đã hoàn thành',1,NULL,160000,1),
(64,'P5Q4R3S2T1',1,'Lê Thị P','2023-04-10','222 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'lethip@gmail.com','0123456783','Đang chờ xử lý',0,NULL,190000,1),
(65,'U9V8W7X6Y5',2,'Nguyễn Văn Q','2023-05-03','333 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',21000,NULL,'nguyenvanq@gmail.com','0123456784','Đã hoàn thành',1,NULL,250000,1),
(66,'A4B3C2D1E0',3,'Phạm Thị R','2023-06-15','444 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'phamthir@gmail.com','0123456785','Đã hoàn thành',1,NULL,180000,1),
(67,'F9G8H7I6J5',4,'Hoàng Văn S','2023-07-20','555 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'hoangvans@gmail.com','0123456786','Đang vận chuyển',0,NULL,220000,1),
(68,'K4L3M2N1',5,'Nguyễn Thị T','2023-08-25','666 Lê Duẩn, Quận 5, TP.HCM','paypal',18000,NULL,'nguyenthit@gmail.com','0123456787','Đã hoàn thành',1,NULL,160000,1),
(69,'O9P8Q7R6S5',6,'Trần Văn U','2023-09-10','777 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'tranvanu@gmail.com','0123456788','Đang chờ xử lý',0,NULL,190000,1),
(70,'T0U9V8W7',7,'Lê Thị V','2023-07-03','888 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'lethiv@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,1),
(71,'X6Y5Z4A3',8,'Nguyễn Văn W','2023-07-15','999 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'nguyenvanw@gmail.com','0123456700','Đã hoàn thành',1,NULL,180000,1),
(72,'B2C1D0E9',9,'Phạm Thị X','2023-07-20','123 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','paypal',35000,NULL,'phamthix@gmail.com','0123456701','Đang vận chuyển',0,NULL,220000,1),
(73,'F8G7H6I5',10,'Hoàng Văn Y','2023-01-25','234 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'hoangvany@gmail.com','0123456702','Đã hoàn thành',1,NULL,160000,1),
(74,'J4K3L2M1',13,'Nguyễn Thị Z','2023-02-10','345 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'nguyenthiz@gmail.com','0123456703','Đang chờ xử lý',0,NULL,190000,1),
(75,'N9O8P7Q6',11,'Trần Văn A','2023-03-15','456 Đinh Tiên Hoàng, Quận 1, TP.HCM','paypal',21000,NULL,'tranvana@gmail.com','0123456704','Đã hoàn thành',1,NULL,250000,1),
(76,'R5S4T3U2',12,'Lê Thị B','2023-04-03','567 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'lethib@gmail.com','0123456705','Đã hoàn thành',1,NULL,180000,1),
(77,'W1X0Y9Z0',1,'Nguyễn Văn C','2023-05-15','678 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'nguyenvanc@gmail.com','0123456706','Đang vận chuyển',0,NULL,220000,1),
(78,'A8B7C6D5',2,'Phạm Thị D','2023-06-20','789 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'phamthid@gmail.com','0123456707','Đã hoàn thành',1,NULL,160000,1),
(79,'E4F3G2H1',3,'Hoàng Văn E','2023-07-25','890 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'hoangvane@gmail.com','0123456708','Đang chờ xử lý',0,NULL,190000,1),
(80,'I0J9K8L7',4,'Nguyễn Thị F','2023-08-10','987 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'nguyenthif@gmail.com','0123456709','Đã hoàn thành',1,NULL,250000,1),
(81,'M6N5O4P3',5,'Phạm Văn M','2023-07-15','456 Lý Thường Kiệt, Quận 1, TP.HCM','cod',25000,NULL,'phamvanm@gmail.com','0123456780','Đã hoàn thành',1,NULL,180000,1),
(82,'Q2R1S0T9',6,'Nguyễn Thị N','2023-08-20','789 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'nguyenthin@gmail.com','0123456781','Đang vận chuyển',0,NULL,220000,1),
(83,'V8W7X6Y5',7,'Trần Văn O','2023-08-25','111 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'tranvano@gmail.com','0123456782','Đã hoàn thành',1,NULL,160000,1),
(84,'Z4A3B2C1',8,'Lê Thị P','2023-08-10','222 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'lethip@gmail.com','0123456783','Đang chờ xử lý',0,NULL,190000,1),
(85,'D0E9F8G7',9,'Nguyễn Văn Q','2023-01-03','333 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',21000,NULL,'nguyenvanq@gmail.com','0123456784','Đã hoàn thành',1,NULL,250000,1),
(86,'I6J5K4L3',10,'Phạm Thị R','2023-02-15','444 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'phamthir@gmail.com','0123456785','Đã hoàn thành',1,NULL,180000,1),
(87,'M2N1O0P9',1,'Hoàng Văn S','2023-03-20','555 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'hoangvans@gmail.com','0123456786','Đang vận chuyển',0,NULL,220000,1),
(88,'Q7R6S5T4',2,'Nguyễn Thị T','2023-04-25','666 Lê Duẩn, Quận 5, TP.HCM','paypal',18000,NULL,'nguyenthit@gmail.com','0123456787','Đã hoàn thành',1,NULL,160000,1),
(89,'U3V2W1X0',3,'Trần Văn U','2023-05-10','777 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'tranvanu@gmail.com','0123456788','Đang chờ xử lý',0,NULL,190000,1),
(90,'Y9Z8A7B6',4,'Lê Thị V','2023-06-15','888 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'lethiv@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,1),
(91,'C5D4E3F2',5,'Nguyễn Văn W','2023-07-20','999 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'nguyenvanw@gmail.com','0123456700','Đã hoàn thành',1,NULL,180000,1),
(92,'G1H0I9J8',6,'Phạm Thị X','2023-08-25','123 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','paypal',35000,NULL,'phamthix@gmail.com','0123456701','Đang vận chuyển',0,NULL,220000,1),
(93,'K7L6M5N4',7,'Hoàng Văn Y','2023-09-10','234 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'hoangvany@gmail.com','0123456702','Đã hoàn thành',1,NULL,160000,1),
(94,'O3P2Q1R0',8,'Nguyễn Thị Z','2023-08-03','345 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'nguyenthiz@gmail.com','0123456703','Đang chờ xử lý',0,NULL,190000,1),
(95,'S9T8U7V6',9,'Trần Văn A','2023-08-15','456 Đinh Tiên Hoàng, Quận 1, TP.HCM','paypal',21000,NULL,'tranvana@gmail.com','0123456704','Đã hoàn thành',1,NULL,250000,1),
(96,'W5X4Y3Z2',10,'Lê Thị B','2023-09-03','567 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'lethib@gmail.com','0123456705','Đã hoàn thành',1,NULL,180000,1),
(97,'A1B0C9D8',11,'Nguyễn Văn C','2023-01-15','678 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'nguyenvanc@gmail.com','0123456706','Đang vận chuyển',0,NULL,220000,1),
(98,'E7F6G5H4',12,'Phạm Thị D','2023-02-20','789 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'phamthid@gmail.com','0123456707','Đã hoàn thành',1,NULL,160000,1),
(99,'I3J2K1L0',13,'Hoàng Văn E','2023-03-25','890 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'hoangvane@gmail.com','0123456708','Đang chờ xử lý',0,NULL,190000,1),
(100,'M9N8O7P6',1,'Nguyễn Thị F','2023-04-10','987 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'nguyenthif@gmail.com','0123456709','Đã hoàn thành',1,NULL,250000,1),

(101,'B6C5D4E9',2,'Phạm Thị X','2023-05-15','123 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'phamthix@gmail.com','0123456701','Đã hoàn thành',1,NULL,220000,5),
(102,'F2G1H0I12',3,'Hoàng Văn Y','2023-06-20','234 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'hoangvany@gmail.com','0123456702','Đã hoàn thành',1,NULL,160000,6),
(103,'J8K7L6M15',4,'Nguyễn Thị Z','2023-07-25','345 Nguyễn Huệ, Quận 1, TP.HCM','cod',29000,NULL,'nguyenthiz@gmail.com','0123456703','Đã hủy',0,NULL,190000,7),
(104,'N4O3P2Q11',5,'Trần Văn A','2023-08-10','456 Đinh Tiên Hoàng, Quận 1, TP.HCM','paypal',21000,NULL,'tranvana@gmail.com','0123456704','Đã hoàn thành',1,NULL,250000,8),
(105,'R0S9T8U71',6,'Lê Thị B','2023-09-15','567 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'lethib@gmail.com','0123456705','Đã hoàn thành',1,NULL,180000,9),
(106,'V5W4X3Y21',7,'Nguyễn Văn C','2023-07-20','678 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'nguyenvanc@gmail.com','0123456706','Đang vận chuyển',0,NULL,220000,10),
(107,'Z1A0B9C81',8,'Phạm Thị D','2023-06-25','789 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'phamthid@gmail.com','0123456707','Đã hoàn thành',1,NULL,160000,11),
(108,'E7F6G5H61',9,'Hoàng Văn E','2023-05-10','890 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'hoangvane@gmail.com','0123456708','Đã hủy',0,NULL,190000,12),
(109,'I3J2K1L01',10,'Nguyễn Thị F','2023-05-03','987 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'nguyenthif@gmail.com','0123456709','Đã hoàn thành',1,NULL,250000,5),
(110,'M9N8O7P61',1,'Trần Văn A','2023-06-15','456 Lý Thường Kiệt, Quận 1, TP.HCM','cod',25000,NULL,'tranvana@gmail.com','0123456780','Đã hoàn thành',1,NULL,180000,6),
(111,'Q2R1S0T91',2,'Lê Thị B','2023-07-20','789 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','vnpay',35000,NULL,'lethib@gmail.com','0123456781','Đang vận chuyển',0,NULL,220000,7),
(112,'V8W7X6Y51',3,'Nguyễn Văn C','2023-08-25','111 Lê Duẩn, Quận 5, TP.HCM','momo',18000,NULL,'nguyenvanc@gmail.com','0123456782','Đã hoàn thành',1,NULL,160000,8),
(113,'Z4A3B2C11',4,'Phạm Thị D','2023-09-10','222 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'phamthid@gmail.com','0123456783','Đã hủy',0,NULL,190000,9),
(114,'D0E9F8G71',5,'Hoàng Văn E','2023-08-15','333 Đinh Tiên Hoàng, Quận 1, TP.HCM','cod',21000,NULL,'hoangvane@gmail.com','0123456784','Đã hoàn thành',1,NULL,250000,10),
(115,'I6J5K4L31',6,'Nguyễn Thị F','2023-09-20','444 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'nguyenthif@gmail.com','0123456785','Đã hoàn thành',1,NULL,180000,11),
(116,'M2N1O0P91',7,'Trần Văn A','2023-09-25','555 Nguyễn Bỉnh Khiêm, Quận 3, TP.HCM','momo',35000,NULL,'tranvana@gmail.com','0123456786','Đang vận chuyển',0,NULL,220000,12),
(117,'Q7R6S5T41',8,'Lê Thị B','2023-01-10','666 Lê Duẩn, Quận 5, TP.HCM','cod',18000,NULL,'lethib@gmail.com','0123456787','Đã hoàn thành',1,NULL,160000,1),
(118,'U3V2W1X01',9,'Nguyễn Văn C','2023-02-15','777 Nguyễn Huệ, Quận 1, TP.HCM','paypal',29000,NULL,'nguyenvanc@gmail.com','0123456788','Đã hủy',0,NULL,190000,2),
(119,'Y9Z8A7B61',10,'Phạm Thị D','2023-03-20','888 Đinh Tiên Hoàng, Quận 1, TP.HCM','momo',21000,NULL,'phamthid@gmail.com','0123456789','Đã hoàn thành',1,NULL,250000,3),
(120,'C5D4E3F21',11,'Hoàng Văn E','2023-04-25','999 Lý Thường Kiệt, Quận 1, TP.HCM','vnpay',25000,NULL,'hoangvane@gmail.com','0123456700','Đã hoàn thành',1,NULL,180000,4);

/*!40000 ALTER TABLE `order_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Mã chi tiết',
  `order_data_id` bigint DEFAULT NULL COMMENT 'Mã hóa đơn',
  `product_id` int DEFAULT NULL COMMENT 'Mã hàng hóa',
  `Price` double DEFAULT NULL,
  `Qty` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_orderDetail_order_data` (`order_data_id`),
  KEY `FK_orderDetail_Product` (`product_id`),
  CONSTRAINT `FK_orderDetail_order_data` FOREIGN KEY (`order_data_id`) REFERENCES `order_data` (`Id`),
  CONSTRAINT `FK_orderDetail_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES 
(1, 1, 1, 200000, 3),
(2, 2, 15, 1000000, 5),
(3, 3, 17, 2500000, 2),
(4, 4, 4, 300000, 1),
(5, 5, 20, 400000, 1),
(6, 6, 6, 120000, 4),
(7, 7, 21, 2000000, 3),
(8, 8, 8, 450000, 2),
(9, 9, 9, 280000, 1),
(10, 10, 10, 220000, 1),
(11, 11, 1, 200000, 3),
(12, 12, 2, 250000, 2),
(13, 13, 3, 180000, 5),
(14, 14, 4, 300000, 1),
(15, 15, 5, 350000, 2),
(16, 16, 6, 120000, 3),
(17, 17, 7, 150000, 1),
(18, 18, 8, 450000, 4),
(19, 19, 9, 280000, 2),
(20, 20, 10, 220000, 1),
(21, 21, 8, 450000, 2),
(22, 22, 17, 2500000, 3),
(23, 23, 10, 220000, 4),
(24, 24, 25, 4000000, 1),
(25, 25, 1, 200000, 1),
(26, 26, 15, 1000000, 2),
(27, 27, 17, 2500000, 3),
(28, 28, 4, 300000, 1),
(29, 29, 20, 400000, 2),
(30, 30, 6, 120000, 1),
(31, 31, 21, 2000000, 3),
(32, 32, 8, 450000, 4),
(33, 33, 9, 280000, 2),
(34, 34, 10, 220000, 5),
(35, 35, 1, 200000, 1),
(36, 36, 2, 250000, 2),
(37, 37, 3, 180000, 3),
(38, 38, 4, 300000, 4),
(39, 39, 5, 350000, 2),
(40, 40, 6, 120000, 1),
(41, 41, 7, 150000, 3),
(42, 42, 8, 450000, 4),
(43, 43, 9, 280000, 5),
(44, 44, 10, 220000, 1),
(45, 45, 8, 450000, 2),
(46, 46, 17, 2500000, 3),
(47, 47, 10, 220000, 4),
(48, 48, 25, 4000000, 1),
(49, 49, 1, 200000, 3),
(50, 50, 15, 1000000, 1),
(51, 51, 17, 2500000, 2),
(52, 52, 4, 300000, 3),
(53, 53, 20, 400000, 1),
(54, 54, 6, 120000, 2),
(55, 55, 21, 2000000, 3),
(56, 56, 8, 450000, 4),
(57, 57, 9, 280000, 1),
(58, 58, 10, 220000, 2),
(59, 59, 1, 200000, 3),
(60, 60, 2, 250000, 4),
(61, 61, 3, 180000, 1),
(62, 62, 4, 300000, 5),
(63, 63, 5, 350000, 2),
(64, 64, 6, 120000, 3),
(65, 65, 7, 150000, 1),
(66, 66, 8, 450000, 2),
(67, 67, 9, 280000, 3),
(68, 68, 10, 220000, 4),
(69, 69, 8, 450000, 5),
(70, 70, 17, 2500000, 1),
(71, 71, 10, 220000, 2),
(72, 72, 25, 4000000, 3),
(73, 73, 1, 200000, 4),
(74, 74, 15, 1000000, 5),
(75, 75, 17, 2500000, 1),
(76, 76, 4, 300000, 2),
(77, 77, 20, 400000, 3),
(78, 78, 6, 120000, 4),
(79, 79, 21, 2000000, 1),
(80, 80, 8, 450000, 2),
(81, 81, 9, 280000, 3),
(82, 82, 10, 220000, 4),
(83, 83, 1, 200000, 5),
(84, 84, 2, 250000, 1),
(85, 85, 3, 180000, 2),
(86, 86, 4, 300000, 3),
(87, 87, 5, 350000, 4),
(88, 88, 6, 120000, 5),
(89, 89, 7, 150000, 1),
(90, 90, 8, 450000, 2),
(91, 91, 9, 280000, 3),
(92, 92, 10, 220000, 4),
(93, 93, 8, 450000, 5),
(94, 94, 17, 2500000, 1),
(95, 95, 10, 220000, 2),
(96, 96, 25, 4000000, 3),
(97, 97, 1, 200000, 4),
(98, 98, 15, 1000000, 5),
(99, 99, 17, 2500000, 1),
(100, 100, 4, 300000, 2),
(101, 90, 2, 250000, 3),
(102, 91, 15, 1000000, 5),
(103, 92, 17, 2500000, 2),
(104, 93, 4, 300000, 1),
(105, 94, 20, 400000, 1),
(106, 95, 6, 120000, 4),
(107, 96, 21, 2000000, 3),
(108, 97, 8, 450000, 2),
(109, 98, 9, 280000, 1),
(110, 99, 10, 220000, 1),
(111, 100, 1, 200000, 3),
(112, 90, 2, 250000, 2),
(113, 91, 3, 180000, 5),
(114, 92, 4, 300000, 1),
(115, 93, 5, 350000, 2),
(116, 94, 6, 120000, 3),
(117, 95, 7, 150000, 1),
(118, 96, 8, 450000, 4),
(119, 97, 9, 280000, 2),
(120, 98, 10, 220000, 1),
(121, 99, 8, 450000, 2),
(122, 100, 17, 2500000, 3),
(123, 90, 10, 220000, 4),
(124, 91, 25, 4000000, 1),
(125, 92, 1, 200000, 1),
(126, 93, 15, 1000000, 2),
(127, 94, 17, 2500000, 3),
(128, 95, 4, 300000, 1),
(129, 96, 20, 400000, 2),
(130, 97, 6, 120000, 1),
(131, 98, 21, 2000000, 3),
(132, 99, 8, 450000, 4),
(133, 100, 9, 280000, 2),
(134, 90, 10, 220000, 5),
(135, 91, 1, 200000, 1),
(136, 92, 2, 250000, 2),
(137, 93, 3, 180000, 3),
(138, 94, 4, 300000, 4),
(139, 95, 5, 350000, 2),
(140, 96, 6, 120000, 1),
(141, 97, 7, 150000, 3),
(142, 98, 8, 450000, 4),
(143, 99, 9, 280000, 5),
(144, 100, 10, 220000, 1),
(145, 90, 8, 450000, 2),
(146, 91, 17, 2500000, 3),
(147, 92, 10, 220000, 4),
(148, 93, 25, 4000000, 1),
(149, 94, 1, 200000, 3),
(150, 95, 15, 1000000, 1),
(151, 96, 17, 2500000, 2),
(152, 97, 4, 300000, 3),
(153, 98, 20, 400000, 1),
(154, 99, 6, 120000, 2),
(155, 100, 21, 2000000, 3),
(156, 90, 8, 450000, 4),
(157, 91, 9, 280000, 1),
(158, 92, 10, 220000, 2),
(159, 93, 8, 450000, 5),
(160, 94, 17, 2500000, 1),
(161, 95, 10, 220000, 2),
(162, 96, 25, 4000000, 3),
(163, 97, 1, 200000, 4),
(164, 98, 15, 1000000, 5),
(165, 99, 17, 2500000, 1),
(166, 100, 4, 300000, 2),
(167, 90, 20, 400000, 3),
(168, 91, 6, 120000, 4),
(169, 92, 21, 2000000, 1),
(170, 93, 8, 450000, 2),
(171, 94, 9, 280000, 3),
(172, 95, 10, 220000, 4),
(173, 96, 8, 450000, 5),
(174, 97, 17, 2500000, 1),
(175, 98, 10, 220000, 2),
(176, 99, 25, 4000000, 3),
(177, 100, 1, 200000, 4),
(178, 106, 10, 220000, 4),
(179, 107, 8, 450000, 5),
(180, 108, 17, 2500000, 1),
(181, 109, 10, 220000, 2),
(182, 110, 25, 4000000, 3),
(183, 111, 1, 200000, 4),
(184, 112, 15, 1000000, 5),
(185, 113, 17, 2500000, 1),
(186, 114, 4, 300000, 2),
(187, 115, 20, 400000, 3),
(188, 116, 6, 120000, 4),
(189, 117, 21, 2000000, 1),
(190, 118, 8, 450000, 2),
(191, 119, 9, 280000, 3),
(192, 120, 10, 220000, 4),
(193, 121, 8, 450000, 5),
(194, 122, 17, 2500000, 1),
(195, 123, 10, 220000, 2),
(196, 124, 25, 4000000, 3),
(197, 125, 1, 200000, 4),
(198, 126, 15, 1000000, 5),
(199, 127, 17, 2500000, 1),
(200, 128, 4, 300000, 2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL COMMENT 'Tên hàng hóa',
  `Poster` varchar(255) DEFAULT 'Poster.jpg',
  `Thumbnail` varchar(255) DEFAULT 'Thumbnail.jpg',
  `origin_price` double DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `Offer` double DEFAULT NULL,
  `create_date` date DEFAULT (curdate()),
  `Available` bit(1) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `Link` varchar(500) DEFAULT NULL,
  `Details` varchar(500) NOT NULL,
  `Qty` int NOT NULL,
  `category_id` int DEFAULT NULL COMMENT 'Mã loại, FK',
  `Status` tinyint(1) NOT NULL,
  `Type` varchar(8) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `product_Name_IX` (`Name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES 
(1,'Assassin Creed Valhalla','1mJIsmffprnnkPC59R1hwZ0UDpwosFKRY','1hJ2fxznpjZnkUocQshubjSjnNKgVuDwk***1mVSTjEBLOUWoVYCYB41BP6oYaKsi-7FL***1pSgGGBBcKjTCo2GvnbWPc0sn3AoapvX_',220000,200000,0.1,'2021-01-10',_binary '','Ubisoft','https://uploadhaven.com/download/21e3c5f14bc4f127992c6cc914ba6756','Assassin Creed Valhalla là phiên bản mới nhất của dòng game hành động nhập vai lịch sử nổi tiếng Assassin Creed. Trong game, người chơi sẽ hóa thân thành Eivor, một vị vua hoặc nữ hoàng của người Viking, và tham gia vào cuộc chiến giữa người Viking và quân đội của người Anh vào thế kỷ thứ 9.',1,3,1,'Game'),
(2,'Grand Theft Auto V','1RDqFhAl2B-tK6Ms3YvgdZ7JW_pICKF75','15pxvd52E5FBpk8YgQHL8gor5WosR_tcK***1fMF4gj1UVNUDj-sRiOuNSemzQ-KsPSa9***1CznYj-x4JuI7l1jZu9zvS-nZmWmvAgDr',134000,114000,0.15,'2021-02-15',_binary '','Rockstar Games','http://phanmemnet.com/download-gta-5-viet-hoa-full-link-google-drive-grand-theft-auto-v1-50/','Grand Theft Auto V là phiên bản thứ 5 trong loạt game Grand Theft Auto. Trong game, người chơi sẽ được đưa đến thành phố hư cấu Los Santos và có thể tham gia vào các nhiệm vụ để kiếm tiền và trở thành tay mafia lừng danh.',1,3,1,'Game'),
(3,'Resident Evil Village','1cajJn2L55pNEIQ6c6DWYngiZurSxAc6F','1q0fGLd3eO5PnoyQXM__XBdCz9Xhh2Ybb***1VIFRBdvVUjM8cE5_tXXnj4vWYbG9bCX5***1B5OnoJ0tsB_0rIBt1pyyxt837o0l1J_t',170000,150000,0.2,'2021-04-23',_binary '','Capcom','https://khiphach.info/tai-resident-evil-village-full/','Resident Evil Village là phiên bản mới nhất trong loạt game kinh dị Resident Evil. Trong game, người chơi sẽ hóa thân thành Ethan Winters, nhân vật chính của phần 7, và tham gia vào cuộc chiến với những sinh vật kinh dị để cứu người vợ của mình.',1,4,1,'Game'),
(4,'FIFA 22','1g-gzyHzEBLJWFe5aqtleGlYCPFRQ40lA','13Cv-cXYhLouMYJeYUv30J-nsPSi15Vq2***1EJ_1NXaftdgUviR-ZySMrFY6jxeNRih3***1S-duvqKbjlvC5_VhOF_dQkOE4URywtGZ',452000,432000,0.2,'2021-09-27',_binary '','Electronic Arts','https://dtvc.edu.vn/cach-choi-fifa-22-mien-phi-phien-ban-moi-nhat-tren-steam-how-to-play-fifa-22-for-free-on-pc/','FIFA 22 là phiên bản mới nhất của loạt game bóng đá FIFA. Trong game, người chơi sẽ được trải nghiệm các giải đấu bóng đá hàng đầu thế giới và cạnh tranh với các đội bóng khác để giành chiến thắng.',1,1,1,'Game'),
(5,'The Witcher 3: Wild Hunt','1V-2Grxh_tGKfxphm1Ejsjc1Z9GlHRAD7','1FHMAWkvp4PVTJssWpfN13VG-lubKNNVy***1OJj6Q4d8p2AqJrs3f-MqsnI52hOXdh4M***1p9G0y32nu6A0VbrFZIqz8mFKd7YrE1IL',75000,70000,0.1,'2021-03-01',_binary '','Steam','https://uploadhaven.com/download/f26c63c29101c0571e8b945dd01babdc','The Witcher 3: Wild Hunt là một trò chơi nhập vai thế giới mở dựa trên câu chuyện, được thiết lập trong một vũ trụ huyền bí đầy hấp dẫn về lựa chọn có ý nghĩa và hậu quả tác động. Trong The Witcher, bạn vào vai Geralt of Rivia, một thợ săn quái vật chuyên nghiệp được giao nhiệm vụ tìm kiếm một đứa trẻ của tiên tri trong một thế giới mở rộng lớn với những thành phố thương gia, các hòn đảo cướp biển, những đường đèo núi nguy hiểm và những hang động bị lãng quên để khám phá.',1,9,1,'Game'),
(6,'Minecraft','1OalxpwplWpe6PWPASRGv_I5lRlboiolS','1yU23784yb_8Sk1qp15tkL0M3jxFDT3lM***160Z0VLrR7PYPwcPStHci0rGmBgspxQAp***1PHK9ye99InIdGdSh6Zb1rOfhyKVaqFNj',350000,299000,0,'2022-02-15',_binary '','Mojang','https://minefc.com/tai-game/','Game sinh tồn thế giới mở.',1,8,1,'Game'),
(7,'Genshin Impact','1pwkiPgTrh9kXZYaoV4uZVKeC3OSU5LmV','121rdhbko7GxcCdrgQnAeduMlOfnODcZr***1JFVBbLYdvuNbXYeMiActVmBg16zbhXnU***14q0HnMLmBtWpvBC8_54qqCGkSsXv4tzA',250000,200000,0,'2022-02-12',_binary '','Mihoyo','https://genshin.hoyoverse.com/pc-launcher/?utm_source=SEA_google_NZMY_SEM_brand_1022&mhy_trace_channel=ga_channel&new=1&gclid=CjwKCAjw5pShBhB_EiwAvmnNV6GJFce63Vpo1M5LlCEgCJqASjGBBLeVsTKAdQG3NUDasg-bd3KKhhoC3FYQAvD_BwE#/','Game nhập vai phiêu lưu thế giới mở đầy hấp dẫn.',1,10,1,'Game'),
(8,'Among Us','1lTOPGVyzk2bzqVtqlj-lcnCnt0_F2mZH','1ZEk4yPqUkTMz2B5tWAmed8RrbW_TGwBb***1UVszHMZTZaq1_yQywnyAeG1pNWnkwn-D***1MCWKiyU3CcwGJV2FuCBpepzoQsurz9HB',79900,59900,0,'2022-02-08',_binary '','InnerSloth','https://www.memuplay.com/vi/how-to-play-Among-Us-on-pc.html','Game trinh thám nhiệm vụ thực hiện trong tàu vũ trụ.',1,1,1,'Game'),
(9,'League of Legends','1s6ZYCSX0rawKlrEGdiCQeG20-mlwX1Xc','1lonnlTOTY6mhqgJxns3LEnnliMKGMLXD***1gSSohPFuGKmby7XS-jZmASvx2CEOxpWz***1Aw3vZ4oukHIT2AjSrxZF-priJESs18WE',70000,50000,0,'2022-02-06',_binary '','Riot Games','https://lienminh.vnggames.com/dang-ky/redownload/','Game chiến đấu 5v5 eSports phong cách MOBA.',1,7,1,'Game'),
(10,'Diablo III','1ctN3_ClvURuyKPHaIx5cUmVB8pchan8h','14UfUf_uHHXORnWUIhy3JusvoCBk79ZuW***1qJr3vxsiIxZdCk8W7oNTeG1Qm7Z5Uk1Y***1yRANYXu3frkB8VzyhavA3lbe6p2-C_-H',239000,199000,0.2,'2022-02-03',_binary '','Blizzard Entertainment','https://technetvietnam.net/download-diablo-3/','Game nhập vai hành động phiêu lưu.',1,9,1,'Game'),
(11,'Counter Strike: Global Offensive','1me_AF2DyTASofXvvVPk15LZec1gyqvVG','1zuoOKlNxAwXj5k_0DWAEqojZruG7css5***1eXuiCCkwHiFEbIxGyj4r3u5AcB4nHjS7***1EgPyw_m2DbF8V_P3DvukMX8MA9Zo4HEa',339000,300000,0.1,'2022-01-29',_binary '','Valve Corporation','https://hadoantv.com/counter-strike-global-offensive-online/','Game bắn súng trực tuyến FPS.',1,2,1,'Game'),
(12,'Dota 2','1H0cFIf6R9oRqrjqUtZ49BnFOM95XLILy','1pUb6I29Q0UDZ7HIyWwhaah5TbojHIriI***1uZC72VGjUcP7sjsii2EBXEy_xVt0RtEz***1d9RXss03EFQNI5ewuk3MXFR7wQaoo9wA',170000,150000,0,'2022-01-27',_binary '','Valve Corporation','https://dota-2.en.softonic.com/download','Game chiến đấu eSports phong cách MOBA.',1,7,1,'Game'),
(13,'Bàn phím cơ gaming','1XWLzl1ikrws2FCHh0jMxwlAgIEa5vqw9','14BIKnNVa1nes6DXve8LcTHakSbOIvrQf***10g_WCzqoiw_ROv7TA8T9ERf7_ur3LSvJ***1ER9Z25jQz68OlHvPItY9hZeWBZNoYD4H',900000,800000,0.1,'2023-05-30',_binary '','Acer',NULL,'Bàn phím cơ gaming với công nghệ đèn nền RGB, cảm giác gõ chắc chắn và đáp ứng nhanh nhạy.',50,12,1,'PK'),
(14,'Chuột gaming','1R6IIoNAA_hrY0OSaqH7xf6XS_gSopYbz','1rfODLkhj00H4pP5_k83N082i2M88caV6***1OPYinH2d6NJq9jKtFCjuHlNsLHWbCxdE***1lzTp8ksCJuAKBE_U4DHKq6UZeYb4k67p',500000,450000,0.1,'2023-05-29',_binary '','Logitech',NULL,'Chuột gaming với độ nhạy cao, nút bấm đa chức năng và thiết kế ergonomic.',30,13,1,'PK'),
(15,'Tai nghe gaming','1hk-QarfqJs_w0iil0H10uVhjmZutPqa_','1tnc6BUEW23OhnmYI9ySI7mdz3IgmrdTQ***1SdDLjKm-CDKbp1J6A8BjZv-FXhYIavnf***1fSk8oX_Ms0krdp8ab-k63cxJeGWEFdSP',1200000,1000000,0.2,'2023-05-28',_binary '','Logitech',NULL,'Tai nghe gaming chất lượng cao, âm thanh sống động và khả năng chống ồn tốt.',100,14,1,'PK'),
(16,'Bàn di chuột gaming','1MV8etpALQkVt9hm581bUemTnmF8waLHb','1j6hDWE-7D5K_ibNJUbEd5EwtLwprRFTw***1EqYSaS1MBqemYh-BjobaEU4ZCaurpBLU***1G66rQci-PO2Avc4f4J24ZQOvpYDdNys7',150000,120000,0.2,'2023-05-27',_binary '','Razer',NULL,'Bàn di chuột gaming kích thước lớn, bề mặt mịn và chống trượt tốt.',80,19,1,'PK'),
(17,'Ghế gaming','1fyX50Y20WC5awylod4YpC4sbqeZCo5Yx','1q02qkEP7hHZL6ojZkIjHvcXWLvCnuVzI***1OtL8BjJ9aJ1VGVW_vs-OYpApPLsrnBjd***1LXryYjXH325okdBFn81XaG3wk0z6nld1',3000000,2500000,0.2,'2023-05-26',_binary '','DXRacer',NULL,'Ghế gaming bọc da cao cấp, có khung sắt chắc chắn và hỗ trợ đa chiều.',20,16,1,'PK'),
(18,'Màn hình gaming','12Xb6UA3kKPdAvUTZ5-Zy5WEJWc67iAO1','1jwbeiyXqn9nxghOiytCvD_ZeOjFecNsm***1I7_VwHmO_9X3vSqnpXb6C1Z8x6kbCqXx***1XHsDYfmOntgtuHW2R2HcvRejbfraAM-2',8000000,7000000,0.12,'2023-05-25',_binary '','Asus',NULL,'Màn hình gaming kích thước lớn, độ phân giải cao và tần số làm mới nhanh.',10,17,1,'PK'),
(19,'Lót chuột gaming','1u6wcDVcDd1vqlJBizAEVMfyp4pLg4kTO','1XMJ-3LOxCRFrinX-ujNC5gZEAIu3I-kS***1FyVFtIFPb3xT5ybFJRZA3-DG3aouGaPr***1x_KGu-5AtZkOgohF1vZupm3GYs6cnwvS',100000,80000,0.2,'2023-05-24',_binary '','MSI',NULL,'Lót chuột gaming bề mặt nhẵn, chống trượt và giúp tối ưu hoá chính xác di chuyển của chuột.',50,15,1,'PK'),
(20,'Balo gaming','1e9cK0a6U_AGNHegxhxLe8Q5-4UTvojVE','1CHik6z8FFYZMZ7RP9zClYfQ4VYEN2fus***1cwbrgafLSsDrmwwuEfFsnNs8gtwfdfc-***17fIiGmnpbgtjDA_CUCJ3_9XP91mDM4fB',500000,400000,0.2,'2023-05-23',_binary '','FPT',NULL,'Balo gaming thiết kế thoáng khí, nhiều ngăn và chất liệu bền bỉ.',30,19,1,'PK'),
(21,'Ghế đua gaming','1Mf6W2GI3onnYJDG-B7i4Fm27nsWmi117','1sgcGuVa5eAza9Uiuprku-juT8IhKY3v0***1TOme-1j3yrNFWaSfYGr_m2Ts2nZgHov4***1h8tZ4VjOfyNVhXlgwxed6TXz3CRf4bvj',2500000,2000000,0.2,'2023-05-22',_binary '','AKRacing',NULL,'Ghế đua gaming với thiết kế hiện đại, tựa lưng điều chỉnh và tư thế ngồi thoải mái.',20,16,1,'PK'),
(22,'Tay cầm chơi game','18-I65ww37DjiBFsLSDS7sSZqETJn0_aB','1gZYGE-TEtqdbdwqbtUuQc_gyPgLI5vl5***1zxb9o8VWvo5MBXwskuIb2FCaTFPa9CeH***1IDxs0ri2P5r5Rjf3t-hFauEsg7np3pZS',500000,450000,0.1,'2023-05-21',_binary '','XBox',NULL,'Tay cầm chơi game cho máy console, kết nối dễ dàng và trải nghiệm chơi game tốt.',40,18,1,'PK'),
(23,'Ổ cứng di động','1bK4ckzTqEno0Ija-E5FmNw31SdLAirJC','1MpNkHl7zOyxEUFkRHURisjGJxm2zlInU***1RNhA4CqSo73lY9VAnv2mpIrDI5TKsXGV***1MxERl1xwx7cftpHMPbxP5LLWATrwYTCD',1000000,900000,0.1,'2023-05-20',_binary '','KingSton',NULL,'Ổ cứng di động dung lượng lớn, tốc độ truyền dữ liệu nhanh và độ bền cao.',60,19,1,'PK'),
(24,'Bộ bàn ghế gaming','1L4HMylAzqE00VjBuCfXvAAc4Mot6Hwjp','1QhyqtjrfkeDmhIAUnkYkKfr-0R89bwLa***1UYn2HiB_KYPzL38AOLUXA6XEz33qupN9***1CDEgjV-LDaDDUuoR3VD3Zc6MlcjMjtcd',6000000,5500000,0.08,'2023-05-19',_binary '','MSI',NULL,'Bộ bàn ghế gaming gồm bàn và ghế được thiết kế tương thích và thoải mái cho người chơi.',10,19,1,'PK'),
(25,'Ghế massage gaming','1HjFt7w_Oq6aZ9Gj51gFOd81wacjNn-_X','1d6Hk0A4VkU7VN8iorH13rpY75YhtRP6J***1vmKecaQppto3q-jv-qL8CX0xj8qLzW-R***1-MyNN-FKHhDlCtdRX_fKl_A9tgD6HN9f',4500000,4000000,0.11,'2023-05-17',_binary '','KingSport',NULL,'Ghế massage gaming với chế độ rung, massage và thiết kế đẹp mắt.',15,16,1,'PK'),
(26,'Gaming Gear','15K_p5-xHb_BlGE7Q9DcmkwDUUF-8xYO6','1RFRkHqJtZeorm3VNhnl-V7EWshL2ZKTr***1myOald90Cd03m2OkRcDl48o1pauhoO-G***1qTfz7HvsnPAS1j1U2OfXwW3vcbD90yZ1',3000000,2800000,0.07,'2023-05-16',_binary '','MSI',NULL,'Thương hiệu Thrustmaster là cái tên nổi tiếng được rất nhiều khách hàng trên thế giới chọn lựa. .',10,19,1,'PK'),
(27,'Thiết bị phát wifi gaming','1bPRj0YGWJ2rDN65EMU5HdvBeG0-yqJE4','11iYr6LpSPMhgB6GCHMFyOsgVS9XiTFEI***1ac307rrb3sUYgAZLxh0QwW3wFYbAgTc5***1acKvYJjuzCW6jcz2TK2zBZYswEpZruO7',800000,700000,0.12,'2023-05-15',_binary '','TPLink',NULL,'Thiết bị phát wifi gaming mạnh mẽ, ổn định và tốc độ cao.',20,19,1,'PK'),
(28,'Đèn led gaming','1d9E14v_qIv1Xr7JS_zox42ER9y_-13r_','1cjCWFzCPmfuQqeI2l99ulCLGoiqSBu7Z***1ytAMlGD_4KHHssY7Zyswzi0uRWqpJK3R***1se1nDOOWeuIRW2YiUmW_IMNMfXeQrs7R',200000,160000,0.2,'2023-05-14',_binary '','Tapo',NULL,'Đèn led gaming để trang trí không gian chơi game, tạo hiệu ứng ánh sáng đẹp mắt.',50,19,1,'PK'),
(29,'Play Station 5','1A8A_W3CiDNxEpdMqTyz4lityl8oNOp83','1sUx1EpFiWOOcAzR0_kFikw3BqdZUeqa6***1IoWNUd-pUmtbBhp3EKgaTSNBFUn6uWey***1Us3dZHNE5Gj5-zNDxMBiy8SeMptR9Ar5',500000,450000,0.1,'2023-05-13',_binary '','Sony',NULL,'Máy Chơi Game PS5, chính hãng, bảo hành 12 tháng, hỗ trợ trả góp 0% tại HALO Shop. Máy Chơi Game PS5 luôn sẵn hàng.',30,19,1,'PK'),
(30,'Bộ bàn phím và chuột gaming','1ci7nDeUfugn0HDzRj2zRy5nq0JQb0sZz','1NXOsjH0aMGhIMpBajvX56svT-7917JXX***1Vb91pDbAyDzrLSJAhz2HkL1qwNcvhI1p***1v6NIsCyMwNeKi9d4dxxrVVUeDUhxfMQd',1000000,900000,0.1,'2023-05-12',_binary '','Logitech',NULL,'Bộ bàn phím và chuột gaming tương thích, thiết kế đẹp và độ bền cao.',40,19,1,'PK'),
(31,'Tai nghe Bluetooth gaming','1xuhBWj7BE4numZOJiaGF6p4QLIwTo4oZ','1nJvNDckPCvMTxrIPv1p8PaVAIi2dEsH-***11KYxJzYTbJ3fmXIhl1NA87vuNaBGxwb8***1bCSFVS-yriygRPOl21P59B9WblW7k70n',1500000,1300000,0.13,'2023-05-11',_binary '','Razer',NULL,'Tai nghe Bluetooth gaming không dây, kết nối nhanh và âm thanh chất lượng cao.',25,19,1,'PK'),
(32,'SoundCard','19VnkvpfXnFOlk9rP3gVNXoLZl2J87HWS','1PJKhSvwwaFvfOoROeIUGhe7nfG39o4dM***1Ai71XcUhucMFbpH0zeycF6Nul7z_nDcN***17uCHHoZOSWOmpWlRitqXsFIVDlidPmhz',200000,160000,0.2,'2023-05-10',_binary '','MSI',NULL,'Máy Chơi Game PS5, chính hãng, bảo hành 12 tháng, hỗ trợ trả góp 0% tại HALO Shop. Máy Chơi Game PS5 luôn sẵn hàng.',50,19,1,'PK');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Id` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES 
('CUST','Người Dùng'),
('DIRE','Quản Lý'),
('STAF','Nhân Viên');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-13  2:51:36

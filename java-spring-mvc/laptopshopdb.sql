-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laptopshop
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
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
INSERT INTO `cart_detail` VALUES (12,21490000,1,3,9),(27,22490000,3,15,1);
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (3,1,9),(15,1,4);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` bigint NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,22490000,1,2,1),(3,25000000,1,2,2),(4,22490000,2,3,1),(5,19190000,2,3,11),(6,49990000,2,4,7);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,47490000,4,'hcm','Tu','0933115646','PENDING'),(3,41680000,3,'hcm','Tu','0933115646','PENDING'),(4,49990000,3,'hcm','Thanh','0123456789','PENDING');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Thông số kỹ thuật:\r\nCPU	Intel Core i5-13420H 3.4GHz up to 4.6GHz 12MB Smart Cache, 8 Cores 12 Threads\r\nRam	16GB (1x16GB) DDR5 5200MHz (2x SO-DIMM socket, up to 32GB SDRAM)','ACER','1741020957771-26827_laptop_gaming_acer_nitro_v_15_propanel_anv15_51_500a_nh_qnasv_008.jpg','Laptop gaming Acer Nitro V ANV15 51 500A',22490000,20,'i5-13420H RTX 2050 512 GB 16 GB 15.6 inch FHD',0,'GAMING',''),(2,'Hãng sản xuất\r\n\r\nLaptop Dell\r\n\r\nTên sản phẩm   \r\n\r\nDell Gaming G15 5525 R5H085W11GR3050\r\nDòng Laptop\r\n\r\nLaptop | Laptop Dell Gaming | Laptop RTX 30 SERIES | Laptop Gaming \r\n\r\nBộ vi xử lý \r\n\r\nCông nghệ CPU\r\n\r\nAMD Ryzen R5-6600H\r\n\r\nSố nhân\r\n\r\n6\r\n\r\nSố luồng\r\n\r\n12\r\n\r\nTốc độ CPU\r\n\r\n3.30 GHz\r\n\r\nTốc độ tối đa\r\n\r\n 4.50 GHz\r\n\r\nBộ nhớ đệm\r\n\r\n19MB\r\nBộ nhớ trong (RAM)\r\n\r\nRAM\r\n\r\n8GB \r\n\r\nLoại RAM\r\n\r\nDDR5\r\n\r\nTốc độ Bus RAM\r\n\r\n4800MHz\r\n\r\nSố khe cắm\r\n\r\n2 khe\r\n\r\nHỗ trợ RAM tối đa\r\n\r\nnâng cấp tối đa 32GB\r\n\r\nỔ cứng \r\n\r\nDung lượng\r\n\r\n512GB SSD M.2 PCIe PCIE G4X4\r\n\r\nTốc độ vòng quay\r\n\r\n \r\n\r\nKhe cắm SSD mở rộng\r\n\r\n-\r\n\r\nỔ đĩa quang (ODD) \r\n\r\nKhông có\r\n\r\nMàn hình\r\n\r\nKích thước màn hình\r\n\r\n15.6-inch \r\n\r\nĐộ phân giải\r\n\r\nFHD (1920 x 1080)\r\n\r\nTần số quét\r\n\r\n120Hz\r\n\r\nCông nghệ màn hình\r\n\r\n250 nits, WVA, Anti-Glare, LED Backlit, Narrow Border Display\r\n\r\nĐồ Họa (VGA) \r\n\r\nCard màn hình\r\n\r\nNVIDIA® GeForce RTX™ 3050 4GB GDDR6\r\n\r\nKết nối (Network) \r\n\r\nWireless\r\n\r\nKiller Wi-Fi 6 802.11ax \r\n\r\nLAN\r\n\r\n1 x LAN RJ45 Gigabit\r\n\r\nBluetooth\r\n\r\nBluetooth 5.2\r\n\r\nBàn phím , Chuột \r\n\r\nKiểu bàn phím\r\n\r\nBàn phím tiêu chuẩn, bàn phím số, đèn nền bàn phím LED RGB\r\n\r\nChuột\r\n\r\nCảm ứng đa điểm\r\n\r\nGiao tiếp mở rộng \r\n\r\nKết nối USB\r\n\r\n1 x USB Type-C (support DisplayPort)\r\n3 x USB 3.2 & USB 2.0\r\n\r\nKết nối HDMI/VGA\r\n\r\n1 x HDMI\r\n\r\nTai nghe\r\n\r\n1 x Jack Audio 3.5mm\r\n\r\nCamera\r\n\r\nHD Camera\r\n\r\nCard mở rộng\r\n\r\n-\r\n\r\nLOA\r\n\r\n2 Loa\r\n\r\nKiểu Pin\r\n\r\n3Cell 56WHrs\r\n\r\nSạc pin\r\n\r\nĐi kèm\r\n\r\nHệ điều hành (bản quyền) đi kèm \r\n\r\nWindows 11 Home + Office Home & Student\r\n\r\nKích thước (Dài x Rộng x Cao)\r\n\r\n357 x 272 x 21.5 mm\r\n\r\nTrọng Lượng\r\n\r\n2.52 kg\r\n\r\nMàu sắc\r\n\r\nXám Đen\r\nXuất Xứ\r\n\r\nTrung Quốc','DELL','1741022733081-43817_laptop_dell_gaming_g15_5525_.jpg','Laptop Dell Gaming G15 5525 R5H085W11GR3050',25000000,15,'(Ryzen R5-6600H | 8GB | 512GB | RTX™ 3050 4GB | 15.6-inch FHD | Win 11 | Office | Xám Đen)',0,'GAMING',''),(4,'Với hiệu năng bứt phá cùng màn hình sắc nét, Lenovo LOQ 15ARP9 83JC007VVN sẽ nâng tầm trải nghiệm gaming và sáng tạo của bạn. Sản phẩm được trang bị chip AMD Ryzen 5 7235HS, card đồ họa NVIDIA GeForce RTX 3050 6GB, màn hình 144Hz siêu mượt và thiết kế hiện đại. Đây sẽ là bạn đồng hành đáng tin cậy của bạn trên mọi chiến trường ảo.\r\nThiết kế gaming, sẵn sàng chiến đấu\r\nVới tông màu Luna Grey sang trọng, Lenovo LOQ 15ARP9 83JC007VVN toát lên phong thái gaming tinh tế, hiện đại và không kém phần mạnh mẽ. Logo LOQ được bố trí khéo léo ở góc mặt A, vừa tạo điểm nhấn cho thương hiệu, vừa khiến thiết bị thể hiện nét cuốn hút từ cái nhìn đầu tiên.\r\n\r\nĐặc biệt ở chỗ, dù sở hữu cấu hình gaming mạnh mẽ, nhưng Lenovo LOQ 15ARP9 83JC007VVN lại có trọng lượng khá nhẹ, chỉ ~2.38kg. Kích thước của máy cũng tương đối gọn gàng (359.86 x 258.7 x 21.9 mm), giúp bạn dễ dàng mang theo bên mình để chiến game ở bất cứ đâu.\r\nMàn hình 144Hz cho trải nghiệm tuyệt đỉnh\r\nKhông gian hiển thị của Lenovo LOQ 15ARP9 83JC007VVN có kích thước 15.6 inch, độ phân giải Full HD (1920 x 1080 pixels) và tần số quét 144Hz, có thể hiển thị hình ảnh sắc nét, rõ ràng và sống động. Công nghệ Anti-glare giúp giảm chói, hạn chế phản xạ ánh sáng, giúp bạn thoải mái sử dụng laptop ngoài trời.\r\n\r\nTần số quét 144Hz cũng là điểm cộng giúp trải nghiệm gaming mượt mà và phản hồi nhanh chóng. Đặc biệt, nếu bạn yêu thích các tựa game FPS hoặc MOBA thì đây sẽ là lợi thế cực kỳ lớn. Thêm vào đó, màn hình của Lenovo LOQ 15ARP9 còn đạt chuẩn 100% sRGB, cho màu sắc chân thực và sống động, phục vụ tốt nhu cầu sáng tạo nội dung, chỉnh sửa ảnh hoặc thiết kế đồ họa.','LENOVO','1741038464659-lenovo_loq_15arp9.jpg','Laptop Lenovo Gaming LOQ 15ARP9',19490000,50,'R5-7235HS/12GB/512GB/15.6FHD/RTX3050 6GB/Win11',0,'GAMING',''),(5,'Không chỉ ghi điểm bởi ngoại hình tinh tế, ASUS Vivobook 14 OLED A1405ZA-KM264W còn mang những trang bị ấn tượng với chip Intel Core i5 12500H, RAM 16GB và ổ cứng SSD 512GB, đáp ứng tốt các tác vụ hàng ngày. Màn hình 14 inch, độ phân giải 2.8K cùng chuẩn gam màu 100% DCI-P3 đảm bảo mọi thứ được tái hiện sắc nét với màu sắc sống động, mang đến trải nghiệm hấp dẫn.','ASUS','1741038589404-asus_vivobook_14_oled.png','Laptop ASUS Vivobook 14 OLED A14',16570000,25,' i5-12500H/16GB/512GB/14\" 2.8K/Win11',0,'MONG-NHE',''),(6,'Là giải pháp làm việc gọn nhẹ và tinh tế, MacBook Air 13 phiên bản chạy chip M3 có sức mạnh ấn tượng để xử lý hiệu quả cả các tác vụ công việc và giải trí. Vời thời lượng pin 18 giờ, người dùng sẽ thoải mái sử dụng thiết bị mà không cần bận tâm nhiều về vấn đề sạc pin\r\nKế thừa phong cách thiết kế siêu mỏng đặc trưng của dòng MacBook Air, phiên bản MacBook Air M3 2024 bạn đang theo dõi sở hữu màn hình 13 inch gọn nhẹ, có độ mỏng ấn tượng chỉ 1,13 cm và được hoàn thiện từ chất liệu nhôm tái chế bền bỉ, thân thiện với môi trường. Sản phẩm lên kệ với 4 tùy chọn màu sắc lịch lãm gồm: Đêm Xanh Thẳm, Ánh Sao, Xám Không Gian và Bạc','APPLE','1741038728791-macbook_air_13_m3_2024.jpg','MacBook Air 13 M3 2024',26990000,35,'8CPU/8GPU/16GB/256GB',0,'GAMING',''),(7,'Bạn đang tìm kiếm một chiếc laptop vừa mạnh mẽ, vừa tinh tế để tối ưu hóa công việc và giải trí? MacBook Pro 14 2024 chính là sự lựa chọn hoàn hảo dành cho bạn. Với chip Apple M4 Pro mới nhất, thời lượng pin đáng kinh ngạc, màn hình rực rỡ và hệ thống Apple Intelligence, chiếc laptop này sẽ mang lại trải nghiệm vượt ngoài mong đợi.\r\nKhám phá sức mạnh vượt trội với chip M4 Pro – trái tim của MacBook Pro 14 2024. Bộ vi xử lý được thiết kế với 14 lõi CPU, 20 lõi GPU và bộ nhớ thống nhất lên đến 48GB. Nhờ đó, M4 Pro sẽ tăng tốc cho mọi tác vụ của bạn, hỗ trợ đắc lực các tác vụ phức tạp như thiết kế cơ sở dữ liệu và mô hình hóa dữ liệu. Hiệu suất đồ họa xuất sắc giúp tiến trình kết xuất 3D trở nên nhanh vượt trội. Không dừng lại ở đó, sản phẩm còn được trang bị tới 24GB RAM cùng bộ nhớ trong 512GB, cho phép người dùng thoải mái mở hàng loạt ứng dụng như Excel, Slack và rất nhiều tab duyệt web mà không lo giật lag. Sức mạnh này biến MacBook Pro 2024 thành công cụ không thể thiếu cho những người đòi hỏi trải nghiệm chuyên nghiệp trên chiếc laptop của mình.','APPLE','1741038930258-macbook_pro_14_m4_2024.jpg','MacBook Pro 14 M4 Pro 2024',49990000,25,'12CPU/16GPU/24GB/512GB',0,'GAMING',''),(8,'Acer Swift Lite 14 AI SFL14-51M-56HS là sự lựa chọn tuyệt vời cho học sinh, sinh viên, văn phòng trong thời đại công nghệ AI mới. Siêu phẩm laptop AI giá tốt với thiết kế hiện đại mỏng gọn và cấu hình mạnh sẽ mang tới cho người dùng những trải nghiệm thông minh vượt trội, đáp ứng tốt cho mọi nhu cầu từ học tập, làm việc đến giải trí.Gặp gỡ và trải nghiệm Acer Swift Lite 14 AI SFL14-51M-56HS, người dùng sẽ bất ngờ về những gì sản phẩm mang tới. Một thiết bị laptop nhỏ gọn nhưng lại cưc kỳ mạnh mẽ, sẵn sàng cho mọi tác vụ học tập, văn phòng và giải trí tuyệt đỉnh. Laptop được tích hợp CPU Intel® Core™ Ultra 5 125H, 14 lõi, 18 luồng, tần số turbo tối đa đạt 4.5 GHz. Dòng chip Intel mới này có những cải tiến rất sáng giá, CPU tốt hơn và hiệu suất đồ họa GPU mạnh mẽ, tốc độ xử lý AI phần cứng tốt và tối ưu thời dài sử dụng so với thế hệ chip Raptor Lake cũ.','ACER','1741039046977-Acer_Swift_Lite_14_AI.jpg','Laptop Acer Swift Lite 14 AI',18990000,40,'SFL14-51M-56HS Ultra5 125U/16GB/512GB/Win11',0,'MONG-NHE',''),(9,'Laptop Dell Inspiron 15 3530 sở hữu hiệu suất mạnh mẽ đến từ vi xử lý i7 1355U, RAM 16GB và ổ SSD 512GB, đáp ứng nhiều nhu cầu khác nhau của người dùng. Màn hình 15.6 inch, độ phân giải FHD và tần số quét 120Hz mở ra không gian hiển thị rộng rãi, sắc nét, diễn đạt chuyển động mượt mà, hứa hẹn về một trải nghiệm hoàn hảo.\r\n\r\nThiết kế cổ điển, bền bỉ\r\nLaptop Dell đặc trưng với thiết kế cổ điển, không sử dụng quá nhiều họa tiết cầu kỳ hay sự đổi mới trong phong cách. Điều này vẫn được duy trì ở Dell Inspiron 15 3530 khi máy xuất hiện với phiên bản màu Đen Carbon đơn giản nhưng vẫn rất sang trọng. Sản phẩm có kích thước 358.5 x 235.56 x 18.99 mm và trọng lượng 1.6kg, đảm bảo tính linh động cao khi cần di chuyển. Máy sẽ nằm gọn gàng trong balo, cặp sách để theo chân chủ nhân trên mọi hành trình, từ đi học, đi làm đến những chuyến công tác xa xôi. Bản lề cao cấp với góc nâng nhỏ vừa hỗ trợ tản nhiệt, vừa giúp bạn làm việc bàn phím thuận tiện hơn, giảm cảm giác mỏi cổ tay.','DELL','1741039196935-dell_inspiron_15_n3530.png','Laptop Dell Inspiron 15 3530',21490000,20,'i7 1355U/16GB/512GB/15.6\"FHD/Win11/Office HS24/OS365',0,'SINHVIEN-VANPHONG',''),(10,'MSI Thin 15 B13UC 2044VN là người bạn đồng hành lý tưởng cho các game thủ, nổi bật với cấu hình mạnh mẽ và mức giá cạnh tranh, đây là mẫu laptop gaming hấp dẫn mà các bạn game thủ không nên bỏ qua. MSI Thin 15 được trang bị bộ vi xử lý Intel thế hệ mới nhất và 16GB RAM, nhờ đó mà máy dễ dàng xử lý mọi tác vụ từ chơi game với thiết lập cao, từ thiết kế đồ họa, đến lướt web và xem phim.\r\n\r\nThiết kế cơ động và bền bỉ\r\nMSI Thin 15 B13UC 2044VN được thiết kế tập trung vào tính cơ động, mang lại sự tiện lợi tối đa cho người dùng. Với kích thước nhỏ gọn 359 x 254 x 21,7 mm và trọng lượng chỉ 1,86kg, chiếc laptop này dễ dàng theo chân bạn đến bất kỳ đâu. Cho dù bạn đang thư giãn tại quán cà phê, làm việc trong phòng khách, hay tham gia vào các giải đấu game căng thẳng, MSI Thin 15 B13UC 2044VN luôn sẵn sàng đáp ứng nhu cầu của bạn mọi lúc mọi nơi.','MSI','1741039305975-MSI_Thin_15.jpg','Laptop MSI Gaming Thin15',19990000,25,'B13UC-2044VN i7-13620H/16GB/512GB/15.6\"FHD/RTX3050 4GB/Win11_Balo',0,'GAMING',''),(11,'Tin được không, bạn sẽ được sở hữu chiếc laptop gaming đẳng cấp với cấu hình tiên tiến từ bộ vi xử lý Intel thế hệ thứ 12, card đồ họa RTX 40 series mới nhất và thiết kế siêu mỏng nhẹ trong mức giá rẻ đến không ngờ.\r\n\r\nChơi game và sáng tạo thỏa sức\r\nGigabyte Gaming G5 MF-F2VN313SH gây bất ngờ khi trang bị card đồ họa RTX 4050 trong mức giá khá rẻ. Đây là card đồ họa thuộc dòng RTX 4000 series, kiến trúc NVIDIA Ada Lovelace mới nhất với bước nhảy vọt về hiệu suất đồ họa. Công nghệ DLSS 3 do AI hỗ trợ sẽ tái hiện thế giới game ảo sống động như thật với các hiệu ứng dò tia, ánh sáng, đổ bóng hoàn hảo. Trải nghiệm về độ mượt cũng được tăng cường khi fps luôn đạt mức cao và ổn định. Không chỉ chơi game, RTX 4000 series còn có tính năng NVIDIA Studio, mở khóa khả năng tăng tốc của RTX và AI, đưa các dự án sáng tạo của bạn lên một tầm cao mới.','Gigabyte','1741039433015-gigabyte-gaming-g5-kf-e3vn313sh-i5-12500h-den-3.jpg','Laptop Gigabyte Gaming G5 MF',19190000,35,'i5 12450H/16GB/512GB/15.6\"FHD/Geforce RTX4050 6GB/Win11',0,'GAMING','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin thì full quyền','ADMIN'),(2,'User thông thường','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','7179a2a8-4dc0-4e48-97fc-5a18d4e4fac7',1745148263307,1745148297710,2592000,1747740297710,'taothao@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','avatar',_binary '�\�\0t\01740748284282-TusLee.png'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','email',_binary '�\�\0t\0taothao@gmail.com'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','fullName',_binary '�\�\0t\0Tao Thao'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$6a4f0c20-37b2-4da8-8157-95682694e5c4'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$9bfd850e-cedc-4f50-b8ce-7516b1454ccdpsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0taothao@gmail.com'),('f611fdf0-1aaa-431f-ad1c-b5edd9f54677','sum',_binary '�\�\0sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'HCM',NULL,'leanhtupr3@gmail.com','TusLee','1234','0933115646',NULL,NULL),(3,'Tay ','1740748173510-','hoangtrung@gmail.com','Hoang Trung','$2a$10$ijv0VHKAiU9v.S1KEPcV8OmBYT9lUXDb.vjtes.1gYOkCpQazWRk.','0999333555',1,NULL),(4,'Tay Xuyen','1740748284282-TusLee.png','taothao@gmail.com','Tao Thao','$2a$10$bhcZGYZd31DgRJlWZgO/kuL2B7mJ.D44XJFfkm4Dms6KbR914SIwu','0333888222',2,NULL),(5,'Nha Trang','1740749588880-466420689_999329742213616_6393460656287272626_n.jpg','nguyenducthanh@gmail.com','Duc Thanh','$2a$10$v/qPdqjbq1u3uWVxRW2s4uWFtYoF5gvhdb0X/hAyweOO47aIDiwMe','0582369741',2,NULL),(7,NULL,NULL,'leanh@gmail.com','TusLee','$2a$10$Kk7k58sI2qza/e6SL8u/FOeuRgDkFetIcRnxVf0dYRoTWR54YoDiW',NULL,2,NULL),(8,NULL,NULL,'leanhtu@gmail.com','TusLee','$2a$10$8TW.BFli2qVaJf5arxvxNuj3e4KuJyP135KI8VJQ62scGHcpLeNam',NULL,2,NULL),(9,'Thuc han','1741640324005-trieuvan.jpg','trieuvan@gmail.com','Trieu Van','$2a$10$c2rP/vmn154uk8rlYlrF7eJ0G5as7Npr6xtK59C7vMSwCTBmMGbPW','0852741963',1,NULL),(13,'Nguy ','1741641092634-taophi.jpg','taophi@gmail.com','Tao Phi','$2a$10$mKDtLv9yWkuqz.QJVBZWIe1HnOgzqEguvvKkjMi5KFUQk3M34GgvG','0123456987',1,NULL);
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

-- Dump completed on 2025-05-22 13:02:08

-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: bitpromo
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Garibaldo','01706565437','2024-12-31','garibaldo@gmail.com',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'EletroShop','57.240.369/0001-99','marcos-viniciusramos@andrade.org'),(2,'ModaOnline','51.809.637/0001-64','caueaparecida@rodrigues.br'),(3,'Casa e Decoração','26.075.189/0001-75','zpimenta@araujo.com'),(4,'TechStore Brasil','98.750.164/0001-30','zsiqueira@mendonca.br'),(5,'Sapatos & Estilo','13.928.745/0001-67','jsilva@mendes.com'),(6,'Beleza e Bem-Estar','94.036.271/0001-40','nogueiramilena@caldeira.com'),(7,'Livros & Companhia','48.710.692/0001-98','mribeiro@araujo.com'),(8,'Acessórios Chic','58.942.130/0001-23','antony74@aparecida.com'),(9,'Brinquedos e Diversão','78.193.506/0001-51','enricocostela@brito.br'),(10,'PetLove Shop','19.567.402/0001-09','alexia63@mendonca.br'),(13,'GaribaldoEmpresa','67.495.079/0001-40','garibaldoempresa@gmail.com');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(255) NOT NULL,
  `preco` double DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `link` text,
  `categoria` varchar(255) NOT NULL,
  `empresa_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_empresa` (`empresa_id`),
  CONSTRAINT `fk_produto_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Geladeira Frost Free Inverter 450L',3499.99,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-frostfree-inverter-450l','CASA E ELETRODOMÉSTICOS',6),(2,'Fogão 5 Bocas com Mesa de Vidro Temperado',1899.49,'https://placehold.co/600x400?text=Fogão','https://example.com/produto/fogao-5-bocas-vidro-temperado','CASA E ELETRODOMÉSTICOS',5),(3,'Microondas Espelhado 30L',429.9,'https://placehold.co/600x400?text=Microondas','https://example.com/produto/microondas-espelhado-30l','CASA E ELETRODOMÉSTICOS',2),(4,'Geladeira Duplex Inox 500L',2790,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-duplex-inox-500l','CASA E ELETRODOMÉSTICOS',2),(5,'Forno Elétrico Embutido 70L',1550.75,'https://placehold.co/600x400?text=Forno','https://example.com/produto/forno-eletrico-embutido-70l','CASA E ELETRODOMÉSTICOS',8),(6,'Fogão 4 Bocas Automático',975.6,'https://placehold.co/600x400?text=Fogão','https://example.com/produto/fogao-4-bocas-automatico','CASA E ELETRODOMÉSTICOS',8),(7,'Microondas Cook 32L com Grill',540,'https://placehold.co/600x400?text=Microondas','https://example.com/produto/microondas-cook-32l-grill','CASA E ELETRODOMÉSTICOS',3),(8,'Geladeira Side by Side 605L',4999,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-side-by-side-605l','CASA E ELETRODOMÉSTICOS',2),(9,'Fogão Industrial 6 Bocas',2590.99,'https://placehold.co/600x400?text=Fogão','https://example.com/produto/fogao-industrial-6-bocas','CASA E ELETRODOMÉSTICOS',7),(10,'Microondas Compacto 20L',299.99,'https://placehold.co/600x400?text=Microondas','https://example.com/produto/microondas-compacto-20l','CASA E ELETRODOMÉSTICOS',4),(11,'Geladeira Retro 330L',1999,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-retro-330l','CASA E ELETRODOMÉSTICOS',3),(12,'Cooktop Elétrico 4 Queimadores',1200.45,'https://placehold.co/600x400?text=Cooktop','https://example.com/produto/cooktop-eletrico-4-queimadores','CASA E ELETRODOMÉSTICOS',7),(13,'Forno Microondas Inox 40L',680.37,'https://placehold.co/600x400?text=Forno','https://example.com/produto/forno-microondas-inox-40l','CASA E ELETRODOMÉSTICOS',4),(14,'Geladeira com Dispenser de Água Inox 475L',2889.9,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-dispenser-agua-inox-475l','CASA E ELETRODOMÉSTICOS',1),(15,'Fogão Cook Chef 6 Bocas com Grill',2100,'https://placehold.co/600x400?text=Fogão','https://example.com/produto/fogao-cook-chef-6bocas-grill','CASA E ELETRODOMÉSTICOS',1),(16,'Microondas Grill Countertop 28L',399.99,'https://placehold.co/600x400?text=Microondas','https://example.com/produto/microondas-grill-countertop-28l','CASA E ELETRODOMÉSTICOS',10),(17,'Geladeira Frost Free Duplex 420L',3498.9,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-frostfree-duplex-420l','CASA E ELETRODOMÉSTICOS',8),(18,'Fogão Portátil 2 Bocas',599.55,'https://placehold.co/600x400?text=Fogão','https://example.com/produto/fogao-portatil-2-bocas','CASA E ELETRODOMÉSTICOS',9),(19,'Microondas Digital com Função Descongelar 25L',310.75,'https://placehold.co/600x400?text=Microondas','https://example.com/produto/microondas-digital-descongelar-25l','CASA E ELETRODOMÉSTICOS',2),(20,'Geladeira Eco Friendly 400L',3199.89,'https://placehold.co/600x400?text=Geladeira','https://example.com/produto/geladeira-eco-friendly-400l','CASA E ELETRODOMÉSTICOS',3),(21,'Televisor 4K UltraHD VisionX',2999.99,'https://placehold.co/600x400?text=Televisor','http://example.com/produto/1','SMARTPHONES, ELETRÔNICOS E TV',2),(22,'Smartphone TechPro X200',1899.5,'https://placehold.co/600x400?text=Smartphone','http://example.com/produto/2','SMARTPHONES, ELETRÔNICOS E TV',7),(23,'Tablet MegaTab S10',1249.75,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/3','SMARTPHONES, ELETRÔNICOS E TV',8),(24,'Smart TV UltraView OLED',4250,'https://placehold.co/600x400?text=Smart','http://example.com/produto/4','SMARTPHONES, ELETRÔNICOS E TV',2),(25,'Celular Infinity Edge II',2399,'https://placehold.co/600x400?text=Celular','http://example.com/produto/5','SMARTPHONES, ELETRÔNICOS E TV',9),(26,'Tablet LitePad Versa 8',779.99,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/6','SMARTPHONES, ELETRÔNICOS E TV',2),(27,'TV SmartBox 50 FullHD',1599.99,'https://placehold.co/600x400?text=TV','http://example.com/produto/7','SMARTPHONES, ELETRÔNICOS E TV',3),(28,'Smartphone Galaxy Wave',3299.99,'https://placehold.co/600x400?text=Smartphone','http://example.com/produto/8','SMARTPHONES, ELETRÔNICOS E TV',9),(29,'Tablet PowerSlate Z12',2200,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/9','SMARTPHONES, ELETRÔNICOS E TV',1),(30,'TV Curva CinemaPro 55',3985,'https://placehold.co/600x400?text=TV','http://example.com/produto/10','SMARTPHONES, ELETRÔNICOS E TV',9),(31,'Smartphone ZenTech Nova',1750.45,'https://placehold.co/600x400?text=Smartphone','http://example.com/produto/11','SMARTPHONES, ELETRÔNICOS E TV',9),(32,'Tablet FlexiTab Mini 7',549.95,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/12','SMARTPHONES, ELETRÔNICOS E TV',10),(33,'Smart TV VisionGlass 65',4400,'https://placehold.co/600x400?text=Smart','http://example.com/produto/13','SMARTPHONES, ELETRÔNICOS E TV',5),(34,'Celular UltraX Z5 Fusion',2899.9,'https://placehold.co/600x400?text=Celular','http://example.com/produto/14','SMARTPHONES, ELETRÔNICOS E TV',1),(35,'Tablet AirBook Ultra 10',1950,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/15','SMARTPHONES, ELETRÔNICOS E TV',3),(36,'TV LED TrueVision HDR',3075,'https://placehold.co/600x400?text=TV','http://example.com/produto/16','SMARTPHONES, ELETRÔNICOS E TV',9),(37,'Smartphone AlphaMax Plus 5G',2599.5,'https://placehold.co/600x400?text=Smartphone','http://example.com/produto/17','SMARTPHONES, ELETRÔNICOS E TV',3),(38,'Tablet SmartLeaf Pro 11',2450,'https://placehold.co/600x400?text=Tablet','http://example.com/produto/18','SMARTPHONES, ELETRÔNICOS E TV',1),(39,'Smart TV NeonEffect 75',5000,'https://placehold.co/600x400?text=Smart','http://example.com/produto/19','SMARTPHONES, ELETRÔNICOS E TV',10),(40,'Celular ProElite 8',1999.99,'https://placehold.co/600x400?text=Celular','http://example.com/produto/20','SMARTPHONES, ELETRÔNICOS E TV',6),(41,'Conjunto de Panelas Antiaderentes Gourmet',299.99,'https://placehold.co/600x400?text=Conjunto','http://marketplace.com/produto1','CASA E ELETRODOMÉSTICOS',5),(42,'Faqueiro de Aço Inox 42 Peças',189.9,'https://placehold.co/600x400?text=Faqueiro','http://marketplace.com/produto2','CASA E ELETRODOMÉSTICOS',7),(43,'Mixer 3 em 1 Portátil',159.99,'https://placehold.co/600x400?text=Mixer','http://marketplace.com/produto3','CASA E ELETRODOMÉSTICOS',6),(44,'Frigideira Cerâmica 30cm',109.9,'https://placehold.co/600x400?text=Frigideira','http://marketplace.com/produto4','CASA E ELETRODOMÉSTICOS',7),(45,'Jogo de Facas Profissional 8 Peças',249.9,'https://placehold.co/600x400?text=Jogo','http://marketplace.com/produto5','CASA E ELETRODOMÉSTICOS',4),(46,'Batedeira Planetária 5 Litros',359.99,'https://placehold.co/600x400?text=Batedeira','http://marketplace.com/produto6','CASA E ELETRODOMÉSTICOS',5),(47,'Panela de Pressão Elétrica 6L',399.9,'https://placehold.co/600x400?text=Panela','http://marketplace.com/produto7','CASA E ELETRODOMÉSTICOS',7),(48,'Espremedor de Frutas Elétrico',89.99,'https://placehold.co/600x400?text=Espremedor','http://marketplace.com/produto8','CASA E ELETRODOMÉSTICOS',7),(49,'Liquidificador de Alta Potência',279.99,'https://placehold.co/600x400?text=Liquidificador','http://marketplace.com/produto9','CASA E ELETRODOMÉSTICOS',3),(50,'Ralador Multifuncional Compacto',74.99,'https://placehold.co/600x400?text=Ralador','http://marketplace.com/produto10','CASA E ELETRODOMÉSTICOS',4),(51,'Conjunto de Bowls de Vidro com Tampa',129.9,'https://placehold.co/600x400?text=Conjunto','http://marketplace.com/produto11','CASA E ELETRODOMÉSTICOS',1),(52,'Assadeira Antiaderente Retangular',65.9,'https://placehold.co/600x400?text=Assadeira','http://marketplace.com/produto12','CASA E ELETRODOMÉSTICOS',6),(53,'Panela Wok de Ferro Fundido',199.9,'https://placehold.co/600x400?text=Panela','http://marketplace.com/produto13','CASA E ELETRODOMÉSTICOS',10),(54,'Chaleira Elétrica Inox',149.9,'https://placehold.co/600x400?text=Chaleira','http://marketplace.com/produto14','CASA E ELETRODOMÉSTICOS',8),(55,'Cafeteira de Cápsulas Automática',449.99,'https://placehold.co/600x400?text=Cafeteira','http://marketplace.com/produto15','CASA E ELETRODOMÉSTICOS',3),(56,'Espátula de Silicone Resistente',49.99,'https://placehold.co/600x400?text=Espátula','http://marketplace.com/produto16','CASA E ELETRODOMÉSTICOS',1),(57,'Conjunto de Colheres de Medida',39.9,'https://placehold.co/600x400?text=Conjunto','http://marketplace.com/produto17','CASA E ELETRODOMÉSTICOS',7),(58,'Centrífuga de Salada com Cabo',89.9,'https://placehold.co/600x400?text=Centrífuga','http://marketplace.com/produto18','CASA E ELETRODOMÉSTICOS',7),(59,'Máquina de Macarrão Elétrica',389.99,'https://placehold.co/600x400?text=Máquina','http://marketplace.com/produto19','CASA E ELETRODOMÉSTICOS',2),(60,'Jogo de Talheres de Bambu Sustentável',74.9,'https://placehold.co/600x400?text=Jogo','http://marketplace.com/produto20','CASA E ELETRODOMÉSTICOS',10),(61,'Sofá Retrô Curvinha',1899.99,'https://placehold.co/600x400?text=Sofá','https://fakestore.com/sofa-retro-curvinha','CASA E ELETRODOMÉSTICOS',5),(62,'Mesa de Centro Elevada Lúmen',599.49,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-centro-lumen','CASA E ELETRODOMÉSTICOS',10),(63,'Cadeira de Jantar Windsor Classic',349.99,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-windsor-classic','CASA E ELETRODOMÉSTICOS',2),(64,'Sofá Modular Versátil',2599.99,'https://placehold.co/600x400?text=Sofá','https://fakestore.com/sofa-modular-versatil','CASA E ELETRODOMÉSTICOS',6),(65,'Conjunto de Mesas Aninhadas Luxo',799,'https://placehold.co/600x400?text=Conjunto','https://fakestore.com/conjunto-mesas-aninhadas-luxo','CASA E ELETRODOMÉSTICOS',3),(66,'Cadeira de Escritório Ergonômica Pro',729.99,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-escritorio-ergonomica-pro','CASA E ELETRODOMÉSTICOS',2),(67,'Mesa de Jantar Expansível Everest',1799,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-jantar-expansivel-everest','CASA E ELETRODOMÉSTICOS',8),(68,'Banqueta Alta Industrial Design',299,'https://placehold.co/600x400?text=Banqueta','https://fakestore.com/banqueta-alta-industrial','CASA E ELETRODOMÉSTICOS',8),(69,'Sofá-Cama Duetto',2349.99,'https://placehold.co/600x400?text=Sofá-Cama','https://fakestore.com/sofa-cama-duetto','CASA E ELETRODOMÉSTICOS',6),(70,'Poltrona Reclinável Confort Lux',1449.5,'https://placehold.co/600x400?text=Poltrona','https://fakestore.com/poltrona-reclinavel-confort-lux','CASA E ELETRODOMÉSTICOS',10),(71,'Mesa Lateral Escandinava',529.75,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-lateral-escandinava','CASA E ELETRODOMÉSTICOS',8),(72,'Cadeira Gamer Ultra Pro',999.99,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-gamer-ultra-pro','INFORMÁTICA E GAMES',4),(73,'Sofá de Couro Norueguês',3199.95,'https://placehold.co/600x400?text=Sofá','https://fakestore.com/sofa-couro-noruegues','CASA E ELETRODOMÉSTICOS',7),(74,'Cadeira de Baloiço Vintage',699.49,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-baloiço-vintage','CASA E ELETRODOMÉSTICOS',2),(75,'Mesa Bar com Adega',1199,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-bar-adega','CASA E ELETRODOMÉSTICOS',5),(76,'Sofá Seccional Elegante',2599.99,'https://placehold.co/600x400?text=Sofá','https://fakestore.com/sofa-seccional-elegante','CASA E ELETRODOMÉSTICOS',7),(77,'Cadeira Dobrável Espreguiçadeira',199,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-espreguicadeira','CASA E ELETRODOMÉSTICOS',4),(78,'Mesa de Escritório Compacta',479.99,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-escritorio-compacta','CASA E ELETRODOMÉSTICOS',2),(79,'Cadeira de Massagem Shiatsu',4999.99,'https://placehold.co/600x400?text=Cadeira','https://fakestore.com/cadeira-massagem-shiatsu','CASA E ELETRODOMÉSTICOS',3),(80,'Mesa de Vidro Contemporânea',899.99,'https://placehold.co/600x400?text=Mesa','https://fakestore.com/mesa-vidro-contemporanea','CASA E ELETRODOMÉSTICOS',10),(81,'Violão Clássico Acústico Harmonia',750,'https://placehold.co/600x400?text=Violão','https://ficticio.com.br/produtos/violao-harmonia','OUTROS',8),(82,'Teclado Digital Yamaha PSR-E373',1950,'https://placehold.co/600x400?text=Teclado','https://ficticio.com.br/produtos/teclado-yamaha-psr-e373','OUTROS',4),(83,'Violão Eletroacústico Fender FA-125CE',1100,'https://placehold.co/600x400?text=Violão','https://ficticio.com.br/produtos/violao-fender-fa-125ce','OUTROS',10),(84,'Piano Digital Roland FP-30X',4500,'https://placehold.co/600x400?text=Piano','https://ficticio.com.br/produtos/piano-roland-fp-30x','OUTROS',4),(85,'Teclado Controlador MIDI AKAI MPK Mini',650,'https://placehold.co/600x400?text=Teclado','https://ficticio.com.br/produtos/akai-mpk-mini','INFORMÁTICA E GAMES',2),(86,'Ukulele Soprano Acústico Kala',350,'https://placehold.co/600x400?text=Ukulele','https://ficticio.com.br/produtos/ukulele-kala','OUTROS',9),(87,'Guitarra Elétrica Ibanez GRX70QA',1300,'https://placehold.co/600x400?text=Guitarra','https://ficticio.com.br/produtos/guitarra-ibanez-grx70qa','OUTROS',6),(88,'Bateria Eletrônica Yamaha DTX402K',3900,'https://placehold.co/600x400?text=Bateria','https://ficticio.com.br/produtos/bateria-yamaha-dtx402k','OUTROS',9),(89,'Acordeon 48 Baixos Scandalli Air IV',3200,'https://placehold.co/600x400?text=Acordeon','https://ficticio.com.br/produtos/acordeon-scandalli-air','OUTROS',10),(90,'Baixo Elétrico Yamaha TRBX174',1600,'https://placehold.co/600x400?text=Baixo','https://ficticio.com.br/produtos/baixo-yamaha-trbx174','OUTROS',6),(91,'Flauta Transversal Profissional Pearl',2700,'https://placehold.co/600x400?text=Flauta','https://ficticio.com.br/produtos/flauta-pearl-prof','OUTROS',2),(92,'Violino Acústico Stentor Student I',950,'https://placehold.co/600x400?text=Violino','https://ficticio.com.br/produtos/violino-stentor-student','OUTROS',5),(93,'Cavaquinho Acústico Rozini RX207AT',620,'https://placehold.co/600x400?text=Cavaquinho','https://ficticio.com.br/produtos/cavaquinho-rozini-rx207at','OUTROS',7),(94,'Teclado Arranjador Casio CT-X700',1250,'https://placehold.co/600x400?text=Teclado','https://ficticio.com.br/produtos/teclado-casio-ctx700','OUTROS',7),(95,'Pandeiro Profissional Contemporânea 10\"',85,'https://placehold.co/600x400?text=Pandeiro','https://ficticio.com.br/produtos/pandeiro-contemporanea','OUTROS',8),(96,'Banjo Acústico Shelby SBJ-05',890,'https://placehold.co/600x400?text=Banjo','https://ficticio.com.br/produtos/banjo-shelby-sbj05','OUTROS',5),(97,'Trompete Sib Yamaha YTR-2330',2800,'https://placehold.co/600x400?text=Trompete','https://ficticio.com.br/produtos/trompete-yamaha-ytr2330','OUTROS',7),(98,'Harmônica diatônica Hohner Marine Band',220,'https://placehold.co/600x400?text=Harmônica','https://ficticio.com.br/produtos/harmonica-hohner-marine','OUTROS',6),(99,'Trombone de vara Michael WTB447',1600,'https://placehold.co/600x400?text=Trombone','https://ficticio.com.br/produtos/trombone-michael-wtb447','OUTROS',9),(100,'Clarinete em Si bemol Yamaha YCL-255',2900,'https://placehold.co/600x400?text=Clarinete','https://ficticio.com.br/produtos/clarinete-yamaha-ycl255','OUTROS',2);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','USER','EMPRESA') NOT NULL,
  `cliente_id` bigint DEFAULT NULL,
  `empresa_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `fk_user_cliente` (`cliente_id`),
  KEY `fk_user_empresa` (`empresa_id`),
  CONSTRAINT `fk_user_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_user_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'garibaldo@gmail.com','$2a$10$WdEKpe78beamXwqWp.BiOuLPe1LCRHxhfJ2LlEwHDIyfAcs4V2n22','USER',1,NULL),(2,'garibaldoempresa@gmail.com','$2a$10$qBWfGduYvQg94s/GxIel4e8c7623Qu4t0BT.LYH5fqhaoBB4bFSLe','EMPRESA',NULL,13);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_seq`
--

DROP TABLE IF EXISTS `users_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_seq`
--

LOCK TABLES `users_seq` WRITE;
/*!40000 ALTER TABLE `users_seq` DISABLE KEYS */;
INSERT INTO `users_seq` VALUES (101);
/*!40000 ALTER TABLE `users_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 20:52:07

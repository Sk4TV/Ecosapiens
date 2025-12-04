-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_projeto
DROP DATABASE IF EXISTS `banco_projeto`;
CREATE DATABASE IF NOT EXISTS `banco_projeto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `banco_projeto`;

-- Copiando estrutura para tabela banco_projeto.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.usuarios: ~3 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id`, `nome_completo`, `email`, `senha`) VALUES
	(1, 'Ezequiel pingolinha', 'ezequielpipi@email.com', 'd2f399a32b9fdc6b2d11ce94fc855314c755e071ab768890a69005961ce7a4c0'),
	(2, 'testeteste', 'teste@email.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414'),
	(4, 'Hugo Renato', 'hugorenato@email.com', 'de35a70a1c20f12f0aeed2d5666df960679e9af3ce8af3a70e9ea2bed7d2bc17');

-- Copiando estrutura para tabela banco_projeto.visitantes
DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE IF NOT EXISTS `visitantes` (
  `id_mensagem` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `assunto` varchar(100) DEFAULT NULL,
  `mensagem` longtext DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.visitantes: ~5 rows (aproximadamente)
DELETE FROM `visitantes`;
INSERT INTO `visitantes` (`id_mensagem`, `nome_completo`, `email`, `telefone`, `assunto`, `mensagem`) VALUES
	(1, 'Emanuel Gomes', 'emanuelgomes@email.com', NULL, 'Interferência', 'piaohdposuabdpasubdapsdbauisd'),
	(2, 'Emanuel Gomes', 'emanuelgomes@email.com', NULL, 'Interferência', 'piaohdposuabdpasubdapsdbauisd'),
	(3, 'Emanuel Gomes', 'emanuelgomes@email.com', NULL, 'Interferência', 'piaohdposuabdpasubdapsdbauisd'),
	(4, 'Emanuel Gomes', 'slaslaslasla@email.com', '99 999999999', 'dsadasdasdasdasd', 'piaohdposuabdpasubdapsdbauisd'),
	(5, 'Emanuel Gomes', 'emanuelgomes@emaasdsadil.com', '99 999999999', 'Interferência', 'dasdasdasdasdasdasdasdsada');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

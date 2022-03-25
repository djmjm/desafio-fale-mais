-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.11-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para falemais
CREATE DATABASE IF NOT EXISTS `falemais` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `falemais`;

-- Copiando estrutura para tabela falemais.destino
CREATE TABLE IF NOT EXISTS `destino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddd` varchar(3) DEFAULT '000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela falemais.destino: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT IGNORE INTO `destino` (`id`, `ddd`) VALUES
	(1, '051'),
	(2, '011'),
	(3, '033'),
	(4, '041'),
	(5, '081'),
	(6, '044'),
	(7, '031'),
	(8, '021'),
	(9, '099'),
	(10, '091'),
	(11, '052'),
	(12, '064');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;

-- Copiando estrutura para tabela falemais.origem
CREATE TABLE IF NOT EXISTS `origem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddd` varchar(3) DEFAULT '000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela falemais.origem: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `origem` DISABLE KEYS */;
INSERT IGNORE INTO `origem` (`id`, `ddd`) VALUES
	(1, '051'),
	(2, '011'),
	(3, '033'),
	(4, '041'),
	(5, '081'),
	(6, '044'),
	(7, '031'),
	(8, '021'),
	(9, '099'),
	(10, '091'),
	(11, '052'),
	(12, '064');
/*!40000 ALTER TABLE `origem` ENABLE KEYS */;

-- Copiando estrutura para tabela falemais.tarifa
CREATE TABLE IF NOT EXISTS `tarifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orig` int(11) NOT NULL,
  `id_dest` int(11) NOT NULL,
  `valor_minuto` decimal(6,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_orig` (`id_orig`),
  KEY `id_dest` (`id_dest`),
  CONSTRAINT `tarifa_ibfk_1` FOREIGN KEY (`id_orig`) REFERENCES `origem` (`id`),
  CONSTRAINT `tarifa_ibfk_2` FOREIGN KEY (`id_dest`) REFERENCES `destino` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela falemais.tarifa: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `tarifa` DISABLE KEYS */;
INSERT IGNORE INTO `tarifa` (`id`, `id_orig`, `id_dest`, `valor_minuto`) VALUES
	(1, 8, 6, 6.492),
	(2, 9, 7, 12.915),
	(3, 3, 1, 10.607),
	(4, 2, 1, 11.808),
	(5, 12, 3, 11.345),
	(6, 2, 1, 2.090),
	(7, 7, 3, 1.371),
	(8, 6, 10, 11.404),
	(9, 7, 12, 5.745),
	(10, 7, 5, 2.690),
	(11, 1, 5, 2.690),
	(12, 1, 3, 1.371);
/*!40000 ALTER TABLE `tarifa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `chars` int(10) NOT NULL DEFAULT 1,
  `gems` int(20) NOT NULL DEFAULT 0,
  `rolepass` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `license` varchar(50) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `banneds`;
CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) NOT NULL,
  `time` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Individuo',
  `name2` varchar(50) DEFAULT 'Indigente',
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `bank` int(20) NOT NULL DEFAULT 0,
  `blood` int(1) NOT NULL DEFAULT 1,
  `fines` int(20) NOT NULL DEFAULT 0,
  `prison` int(11) NOT NULL DEFAULT 0,
  `tracking` int(30) NOT NULL DEFAULT 0,
  `spending` int(20) NOT NULL DEFAULT 0,
  `cardlimit` int(20) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `chests`;
CREATE TABLE IF NOT EXISTS `chests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 0,
  `perm` varchar(50) NOT NULL,
  `logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO `chests` (`id`, `name`, `weight`, `perm`, `logs`) VALUES
(1, 'Policia', 500, 'Policia', 1),
(2, 'Paramedico', 500, 'Paramedico', 1),
(3, 'BurgerShot', 250, 'BurgerShot', 0),
(4, 'PizzaThis', 250, 'PizzaThis', 0),
(5, 'UwuCoffee', 250, 'UwuCoffee', 0),
(6, 'BeanMachine', 250, 'BeanMachine', 0),
(7, 'Ballas', 250, 'Ballas', 0),
(8, 'Families', 250, 'Families', 0),
(9, 'Vagos', 250, 'Vagos', 0),
(10, 'Aztecas', 250, 'Aztecas', 0),
(11, 'Bloods', 250, 'Bloods', 0),
(12, 'Triads', 250, 'Triads', 0),
(13, 'Razors', 250, 'Razors', 0),
(14, 'Mechanic', 500, 'Mechanic', 0);

DROP TABLE IF EXISTS `entitydata`;
CREATE TABLE IF NOT EXISTS `entitydata` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`dkey`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `organizations`;
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `organizations` (`id`, `name`, `bank`, `premium`) VALUES
(1, 'Police', 0, 0),
(2, 'Paramedic', 0, 0),
(3, 'BurgerShot', 0, 0),
(4, 'PizzaThis', 0, 0),
(5, 'UwuCoffee', 0, 0),
(6, 'BeanMachine', 0, 0),
(7, 'Ballas', 0, 0),
(8, 'Families', 0, 0),
(9, 'Vagos', 0, 0),
(10, 'Aztecas', 0, 0),
(11, 'Bloods', 0, 0),
(12, 'Triads', 0, 0),
(13, 'Razors', 0, 0),
(14, 'Mechanic', 0, 0);

DROP TABLE IF EXISTS `org_transactions`;
CREATE TABLE IF NOT EXISTS `org_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Value` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `entitydata` (`dkey`, `dvalue`) VALUES ('Permissions:Admin', '{\"1\":1}');

DROP TABLE IF EXISTS `fidentity`;
CREATE TABLE IF NOT EXISTS `fidentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `name2` varchar(50) NOT NULL DEFAULT '',
  `port` int(1) NOT NULL DEFAULT 1,
  `blood` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`Passport`,`dkey`),
  KEY `Passport` (`Passport`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `propertys`;
CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) NOT NULL DEFAULT 'Middle',
  `Keys` int(3) NOT NULL DEFAULT 3,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Passport` int(6) NOT NULL DEFAULT 0,
  `Serial` varchar(10) NOT NULL,
  `Vault` int(6) NOT NULL DEFAULT 1,
  `Fridge` int(6) NOT NULL DEFAULT 1,
  `Garage` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `races`;
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Race` int(3) NOT NULL DEFAULT 0,
  `Passport` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(100) NOT NULL DEFAULT 'Individuo Indigente',
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Sultan RS',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `tax` int(20) NOT NULL DEFAULT 0,
  `plate` varchar(10) DEFAULT NULL,
  `rental` int(20) NOT NULL DEFAULT 0,
  `arrest` int(20) NOT NULL DEFAULT 0,
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `health` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `nitro` int(5) NOT NULL DEFAULT 0,
  `work` varchar(5) NOT NULL DEFAULT 'false',
  `doors` longtext NOT NULL,
  `windows` longtext NOT NULL,
  `tyres` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL DEFAULT 200,
  `password` varchar(50) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `dependents`;
CREATE TABLE IF NOT EXISTS `dependents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Dependent` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `fines`;
CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `investments`;
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `taxs`;
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Value` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `organizations`;
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` int(20) NOT NULL DEFAULT 0,
  `premium` int(20) NOT NULL DEFAULT 0,
  `buff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `organizations` (`id`, `name`, `bank`, `premium`) VALUES
(1, 'Police', 0, 0),
(2, 'Paramedic', 0, 0),
(3, 'BurgerShot', 0, 0),
(4, 'PizzaThis', 0, 0),
(5, 'UwuCoffee', 0, 0),
(6, 'BeanMachine', 0, 0),
(7, 'Ballas', 0, 0),
(8, 'Families', 0, 0),
(9, 'Vagos', 0, 0),
(10, 'Aztecas', 0, 0),
(11, 'Bloods', 0, 0),
(12, 'Triads', 0, 0),
(13, 'Razors', 0, 0),
(14, 'Mechanic', 0, 0);

DROP TABLE IF EXISTS `org_transactions`;
CREATE TABLE IF NOT EXISTS `org_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Value` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
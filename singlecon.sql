
--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`) VALUES
(1, 'Talbot'),
(2, 'Sussita'),
(3, 'Jaguar'),
(4, 'Bmw'),
(5, 'Audi'),
(6, 'Tata');

-- --------------------------------------------------------

--
-- Table structure for table `car_worker`
--

CREATE TABLE IF NOT EXISTS `car_worker` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `worker` int(10) unsigned NOT NULL,
  `car` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car` (`car`),
  KEY `worker` (`worker`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `car_worker`
--

INSERT INTO `car_worker` (`id`, `worker`, `car`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 2, 6),
(4, 3, 1),
(5, 2, 2),
(6, 5, 4),
(7, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE IF NOT EXISTS `workers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `name`) VALUES
(1, 'Yossi'),
(2, 'Yadin'),
(3, 'Yagel'),
(4, 'Ester'),
(5, 'Tamar'),
(6, 'Noa');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_worker`
--
ALTER TABLE `car_worker`
  ADD CONSTRAINT `car_worker_ibfk_4` FOREIGN KEY (`worker`) REFERENCES `workers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `car_worker_ibfk_1` FOREIGN KEY (`car`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


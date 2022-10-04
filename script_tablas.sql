CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_viaje` int NOT NULL,
  `estado_de_asignacion` text NOT NULL,
  `id_chofer` int NOT NULL,
  `id_auto` int NOT NULL,
  `id_disponibilidad` int NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `km_de_recorrido` int DEFAULT NULL,
  `fecha_de_inicio` date DEFAULT NULL,
  `fecha_de_fin` date DEFAULT NULL,
  `fecha_de_cancelacion` date DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_viaje_idx` (`id_viaje`),
  KEY `id_chofer_idx` (`id_chofer`),
  KEY `id_auto_idx` (`id_auto`),
  KEY `id_disponibilidad_idx` (`id_disponibilidad`),
  CONSTRAINT `id_auto` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_autos`),
  CONSTRAINT `id_chofer` FOREIGN KEY (`id_chofer`) REFERENCES `chofer` (`id_chofer`),
  CONSTRAINT `id_disponibilidad` FOREIGN KEY (`id_disponibilidad`) REFERENCES `disponibilidad` (`id_disponibilidad`),
  CONSTRAINT `id_viaje` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `autos` (
  `id_autos` int NOT NULL AUTO_INCREMENT,
  `patente` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `seguro` varchar(45) NOT NULL,
  `autoscol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chofer` (
  `id_chofer` int NOT NULL AUTO_INCREMENT,
  `ranking` int DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `licencia_de_conducir` int DEFAULT NULL,
  `vigencia_de_licencia` date DEFAULT NULL,
  PRIMARY KEY (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comision de chofer` (
  `monto_viaje` decimal(10,0) DEFAULT NULL,
  `pago_chofer` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `disponibilidad` (
  `id_disponibilidad` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `estado` text,
  `id_chofer` int NOT NULL,
  `id_auto` int NOT NULL,
  PRIMARY KEY (`id_disponibilidad`),
  KEY `id_chofer_idx` (`id_chofer`),
  KEY `id_auto_idx` (`id_auto`),
  CONSTRAINT `auto` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_autos`),
  CONSTRAINT `chofer` FOREIGN KEY (`id_chofer`) REFERENCES `chofer` (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `medios de pago` (
  `tarjeta_de_credito` tinyint DEFAULT NULL,
  `tarjeta_de_debito` tinyint DEFAULT NULL,
  `efectivo` tinyint DEFAULT NULL,
  `apple_pay` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pago de viaje` (
  `monto_viaje` int NOT NULL,
  `num_tarjeta` int DEFAULT NULL,
  `nom_tarjeta` varchar(45) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`monto_viaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `fecha_de_creacion` datetime DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `medios_de_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `viaje` (
  `id_viaje` int NOT NULL AUTO_INCREMENT,
  `estado` text,
  `id_usuario` int DEFAULT NULL,
  `origen` varchar(45) DEFAULT NULL,
  `destino` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_viaje`),
  KEY `usuario_idx` (`id_usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
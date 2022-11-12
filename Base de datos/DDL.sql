CREATE DATABASE restaurantReservation;
USE restaurantReservation;

CREATE TABLE `parametros` (
 `idParametros` int(11) NOT NULL AUTO_INCREMENT,
 `parametro` varchar(30) NOT NULL,
 PRIMARY KEY (`idParametros`)
);

CREATE TABLE `restaurantes` (
 `idRestaurante` int(11) NOT NULL AUTO_INCREMENT,
 `nombreRestaurante` varchar(60) NOT NULL,
 `telefono` varchar(20) NOT NULL,
 `direccion` varchar(50) NOT NULL,
 `estado` tinyint(1) NOT NULL,
 `departamento` varchar(50) NOT NULL,
 PRIMARY KEY (`idRestaurante`)
);

CREATE TABLE `parametrosrestaurantes` (
 `idParametroRestaurante` int(11) NOT NULL AUTO_INCREMENT,
 `idParametro` int(11) NOT NULL,
 `idRestaurante` int(11) NOT NULL,
 `valor` varchar(70) NOT NULL,
 PRIMARY KEY (`idParametroRestaurante`),
 KEY `FK_parametros_restaurante_parametros` (`idParametro`),
 KEY `FK_parametros_restaurante_restaurantes` (`idRestaurante`),
 CONSTRAINT `FK_parametros_restaurante_parametros` FOREIGN KEY (`idParametro`) REFERENCES `parametros` (`idParametros`),
 CONSTRAINT `FK_parametros_restaurante_restaurantes` FOREIGN KEY (`idRestaurante`) REFERENCES `restaurantes` (`idRestaurante`)
);

CREATE TABLE `roles` (
 `idRoll` int(11) NOT NULL AUTO_INCREMENT,
 `roll` varchar(20) NOT NULL,
 `estado` tinyint(1) NOT NULL,
 PRIMARY KEY (`idRoll`)
);

CREATE TABLE `tipodocumento` (
 `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
 `tipoDocumento` varchar(20) NOT NULL,
 `estado` tinyint(1) NOT NULL,
 PRIMARY KEY (`idTipoDocumento`)
);

CREATE TABLE `usuarios` (
 `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
 `idTipoDocumento` int(11) NOT NULL,
 `idRoll` int(11) NOT NULL,
 `documento` varchar(20) NOT NULL,
 `nombres` varchar(30) NOT NULL,
 `apellidos` varchar(30) NOT NULL,
 `correo` varchar(40) NOT NULL,
 `celular` bigint(11) NOT NULL,
 `password` varchar(264) NOT NULL,
 `estado` tinyint(1) NOT NULL,
 PRIMARY KEY (`idUsuario`),
 KEY `FK_tipo_documento_usuarios` (`idTipoDocumento`),
 KEY `FK_roles_usuarios` (`idRoll`),
 CONSTRAINT `FK_roles_usuarios` FOREIGN KEY (`idRoll`) REFERENCES `roles` (`idRoll`),
 CONSTRAINT `FK_tipo_documento_usuarios` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`)
);

CREATE TABLE `reservas` (
 `idReserva` int(11) NOT NULL AUTO_INCREMENT,
 `idUsuario` int(11) NOT NULL,
 `idRestaurante` int(11) NOT NULL,
 `fechaReserva` date NOT NULL,
 `horaInicioReserva` time NOT NULL,
 `horaFinReserva` time NOT NULL,
 `cantidadPersonas` tinyint(4) NOT NULL,
 `estado` tinyint(1) NOT NULL,
 PRIMARY KEY (`idReserva`),
 KEY `FK_reservas_usuarios` (`idUsuario`),
 KEY `FK_reservas_restaurantes` (`idRestaurante`),
 CONSTRAINT `FK_reservas_restaurantes` FOREIGN KEY (`idRestaurante`) REFERENCES `restaurantes` (`idRestaurante`),
 CONSTRAINT `FK_reservas_usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
);


INSERT INTO `tipodocumento`( `tipoDocumento`, `estado`) VALUES ('C.C','1');
INSERT INTO `tipodocumento`( `tipoDocumento`, `estado`) VALUES ('C.E','1');
INSERT INTO `tipodocumento`( `tipoDocumento`, `estado`) VALUES ('T.I','1');
INSERT INTO `tipodocumento`( `tipoDocumento`, `estado`) VALUES ('NIT','1');

INSERT INTO `roles`(`roll`, `estado`) VALUES ('Administrador','1');
INSERT INTO `roles`(`roll`, `estado`) VALUES ('Gestor','1');
INSERT INTO `roles`(`roll`, `estado`) VALUES ('Mesero','1');
INSERT INTO `roles`(`roll`, `estado`) VALUES ('Recepción','1');
INSERT INTO `roles`(`roll`, `estado`) VALUES ('Usuario','1');

INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','1','123456789','Andres','Vaca','avaca@ucompensar.edu.co','3196613790','1234','1');
INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','1','987654321','Danilo','Cortes','dcortes@ucompensar.edu.co','3196613791','1234','1');
INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','2','123456798','prueba','gestor','pestor@ucompensar.edu.co','3196613792','1234','1');
INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','3','123456987','prueba','mesero','pmesero@ucompensar.edu.co','3196613793','1234','1');
INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','4','123459876','prueba','recepcion','precepcion@ucompensar.edu.co','3196613794','1234','1');
INSERT INTO `usuarios`(`idTipoDocumento`, `idRoll`, `documento`, `nombres`, `apellidos`, `correo`, `celular`, `password`, `estado`) VALUES ('1','5','123498765','prueba','usuario','pusuario@ucompensar.edu.co','3196613795','1234','1');

INSERT INTO `parametros`(`parametro`) VALUES ('Lunes');
INSERT INTO `parametros`(`parametro`) VALUES ('Martes');
INSERT INTO `parametros`(`parametro`) VALUES ('Miercoles');
INSERT INTO `parametros`(`parametro`) VALUES ('Jueves');
INSERT INTO `parametros`(`parametro`) VALUES ('Viernes');
INSERT INTO `parametros`(`parametro`) VALUES ('Sabado');
INSERT INTO `parametros`(`parametro`) VALUES ('Domingo');
INSERT INTO `parametros`(`parametro`) VALUES ('Cant max personas por reserva');
INSERT INTO `parametros`(`parametro`) VALUES ('Cant max reservas al tiempo');
INSERT INTO `parametros`(`parametro`) VALUES ('Hora apertura Reservas');
INSERT INTO `parametros`(`parametro`) VALUES ('Hora cierre Revservas');
INSERT INTO `parametros`(`parametro`) VALUES ('Tiempo reserva en minutos');

INSERT INTO `restaurantes`(`nombreRestaurante`, `telefono`, `direccion`, `estado`) VALUES ('KFC','321654987','cra 68 b #32-25 sur','1','Huila');
INSERT INTO `restaurantes`(`nombreRestaurante`, `telefono`, `direccion`, `estado`) VALUES ('Jennos Pizza','326544987','cra 69 b #32-26 Norte','1','Cundinamarca');
INSERT INTO `restaurantes`(`nombreRestaurante`, `telefono`, `direccion`, `estado`) VALUES ('le chat noir','321659876','Avenida 15 d #58-25','1','Meta');


INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('1','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('2','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('3','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('4','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('5','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('6','1','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('7','1','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('8','1','10');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('9','1','5');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('10','1','08:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('11','1','22:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('12','1','120');

INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('1','2','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('2','2','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('3','2','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('4','2','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('5','2','No disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('6','2','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('7','2','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('8','2','20');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('9','2','6');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('10','2','16:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('11','2','22:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('12','2','60');

INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('1','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('2','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('3','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('4','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('5','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('6','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('7','1','disponible');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('8','1','6');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('9','1','30');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('10','1','06:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('11','1','23:00:00');
INSERT INTO `parametrosrestaurantes`(`idParametro`, `idRestaurante`, `valor`) VALUES ('12','1','90');

INSERT INTO `reservas`(`idUsuario`, `idRestaurante`, `fechaReserva`, `horaInicioReserva`, `horaFinReserva`, `cantidadPersonas`, `estado`) VALUES ('5','1','2022/05/03','13:00:00','15:00:00','3','1');
INSERT INTO `reservas`(`idUsuario`, `idRestaurante`, `fechaReserva`, `horaInicioReserva`, `horaFinReserva`, `cantidadPersonas`, `estado`) VALUES ('5','3','2022/05/04','13:00:00','14:30:00','6','1');
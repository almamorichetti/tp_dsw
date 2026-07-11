SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `take_away`;

CREATE DATABASE `take_away`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `take_away`;

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
`nroDocUse` varchar(20) NOT NULL ,
`tipoDocUse` varchar(20) NOT NULL,
`mailUser` varchar(30) NOT NULL,
 `nomUser` varchar(30) NOT NULL,
 `apeUser` varchar(30) NOT NULL,
 `telefUse` varchar(30) NOT NULL,
  PRIMARY KEY  (`nroDocUse`, `tipoDocUse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `categorias` (
`numCat` int(11) NOT NULL auto_increment,
`descCat` varchar(50) NOT NULL,
PRIMARY KEY(`numCat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `estados` (
`codEst` int(11) NOT NULL auto_increment,
`descEst` varchar(20) NOT NULL,
PRIMARY KEY (`codEst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metodo_pago`(
`id` int(11) NOT NULL auto_increment,
`nom` varchar(20) NOT NULL,
PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pedidos` (
`idPedido` int(11) NOT NULL auto_increment,
 `fechaPedi`DATE NOT NULL DEFAULT (CURRENT_DATE), #no sé si está bien esto 
 `obsPedi` varchar(30) default NULL, 
 #totalPedi este es calculado, no sé bien cómo es
 `nroCuotas`int(11) DEFAULT NULL,
 `valorCuota`decimal (9,3) DEFAULT NULL, 
 `idmdp` int(11) NOT NULL,
 `nroDocUse` varchar(20) NOT NULL ,
`tipoDocUse` varchar(50) NOT NULL,
PRIMARY KEY (`idPedido`),
KEY `idmdp` (`idmdp`),
KEY `nroDocUse` (`nroDocUse`,`tipoDocUse`),
CONSTRAINT `pedido_metodo_pago_fk` FOREIGN KEY (`idmdp`) REFERENCES `metodo_pago` (`id`) ON UPDATE CASCADE,
CONSTRAINT `pedido_cliente_fk` FOREIGN KEY (`nroDocUse`,`tipoDocUse`) REFERENCES `usuarios` (`nroDocUse`,`tipoDocUse`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `quejas`(
`idPedido` int NOT NULL,
`fechaQue` DATE NOT NULL DEFAULT (CURRENT_DATE),
`horaQue` TIME NOT NULL DEFAULT (CURRENT_TIME),
`desQue` VARCHAR(50) NOT NULL,
PRIMARY KEY (`idPedido`,`fechaQue`,`horaQue`),
KEY `queja_pedido_fk` (`idPedido`),
CONSTRAINT `queja_pedido_fk` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pedido_estado` (  #LA CP CAMBIA SI EL PEDIDO SE PUEDE MODIFICAR UNA VEZ REALIZADO
`idPedido`int NOT NULL,
`codEst` int(11) NOT NULL,
`fecha` DATE NOT NULL DEFAULT (CURRENT_DATE),
`hora` TIME NOT NULL DEFAULT (CURRENT_TIME),
PRIMARY KEY (`idPedido`,`codEst`),
KEY `pedido_estado_estado_fk`(`codEst`),
KEY `pedido_estado_pedido_fk` (`idPedido`),
CONSTRAINT `pedido_estado_estado_fk` FOREIGN KEY (`codEst`) REFERENCES `estados` (`codEst`) ON UPDATE CASCADE,
CONSTRAINT `pedido_estado_pedido_fk` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `productos` (
`idProd` INT NOT NULL auto_increment,
`nombre` VARCHAR(20) NOT NULL,
`descProd` VARCHAR(50) NOT NULL,
`stock` INT NOT NULL,
`estado` BOOLEAN NOT NULL DEFAULT TRUE,
`numCat` INT NOT NULL,
PRIMARY KEY (`idProd`),
KEY `producto_cat_fk` (`numCat`),
CONSTRAINT `producto_cat_fk` FOREIGN KEY (`numCat`) REFERENCES `categorias` (`numCat`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `precios` (
`idProd` INT NOT NULL,
`fechaDesde` DATE NOT NULL,
`valor` DECIMAL(9,3)  NOT NULL,
PRIMARY KEY (`idProd`,`fechaDesde`),
KEY `precios_prod_fk` (`idProd`),
CONSTRAINT `precios_prod_fk` FOREIGN KEY (`idProd`) REFERENCES `productos`(`idProd`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE `combo_prod` (
`idCombo` INT NOT NULL,
`idProducto` INT NOT NULL,
`cantProducto` INT NOT NULL,
PRIMARY KEY (`idCombo`,`idProducto`),
KEY `combo_fk` (`idCombo`),
KEY `producto_fk`(`idProducto`),
CONSTRAINT `combo_fk` FOREIGN KEY(`idCombo`) REFERENCES `productos`(`idProd`) ON UPDATE CASCADE,
CONSTRAINT `producto_fk` FOREIGN KEY (`idProducto`) REFERENCES `productos`(`idProd`) ON UPDATE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE `favorito`(
`nroDocUse`VARCHAR(20) NOT NULL,
`tipoDocUse` VARCHAR(20) NOT NULL,
`idProd` INT NOT NULL,
PRIMARY KEY (`nroDocUse`,`tipoDocUse`,`idProd` ),
KEY `favorito_cliente_fk` (`nroDocUse`,`tipoDocUse`),
KEY `favorito_prod_fk` (`idProd`),
CONSTRAINT `favorito_cliente_fk` FOREIGN KEY (`nroDocUse`,`tipoDocUse`) REFERENCES `usuarios` (`nroDocUse`,`tipoDocUse`) ON UPDATE CASCADE,
CONSTRAINT `favorito_prod_fk` FOREIGN KEY (`idProd`) REFERENCES `productos` (`idProd`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	

CREATE TABLE `detalle_pedido` (
`idPedido` INT NOT NULL,
`idProd` INT NOT NULL,
`cantProd` INT NOT NULL,
#subtotal calculado cant x precio de idProd
`precioUnitario` DECIMAL(9,3) NOT NULL, #hay que guardar el precioU de la fecha
PRIMARY KEY (`idPedido`,`idProd`),
KEY `pedido_fk` (`idPedido`),
KEY `producto_fk` (`idProd`),
CONSTRAINT `detalle_pedido_fk` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON UPDATE CASCADE,
CONSTRAINT `detalle_producto_fk` FOREIGN KEY (`idProd`) REFERENCES `productos` (`idProd`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;	
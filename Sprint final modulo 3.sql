 /*creamos el nuevo usuario*/
 CREATE USER 'admintelovendo'@'localhost' IDENTIFIED BY '1234';
 
 /*otorgamos los permisos*/
 GRANT insert, delete, insert, select, update on telovendodb.* to 'admintelovendo'@'localhost';
 
 /*Creamos la base de datos*/
 CREATE SCHEMA `telovendodb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
 
 /*creamos la tabla proveedor donde id_proveedor es la llave primaria*/
 CREATE TABLE proveedor
(
    id_proveedor INT NOT NULL auto_increment,
    representante varchar (50),
    nombre_corporativo varchar(50),
    telefono_principal varchar(12),
    telefono_secundario varchar (12),
    receptor_llamadas varchar(50),
    categoria_producto varchar (50),
    correo_electrónico varchar (100),
    PRIMARY KEY(id_proveedor)

); 
 /*creamos la tabla producto donde id_producto es la llave primaria*/
CREATE TABLE producto
(
    id_producto varchar (12) NOT NULL,
    nombre varchar(50),
    precio int,
    categoria varchar (50),
    color varchar (10),
    PRIMARY KEY(id_producto)
   
); 

 /*creamos la tabla cliente donde id_cliente es la llave primaria*/
CREATE TABLE cliente
(
    id_cliente INT NOT NULL auto_increment,
    nombre varchar(50),
    apellido varchar (50),
    direccion varchar (60),
    PRIMARY KEY(id_cliente)
); 

 /*creamos la tabla pedido donde id_pedido es la llave primaria 
 y se relaciona con la tabla cliente y producto*/
CREATE TABLE pedido
(
    id_pedido INT NOT NULL auto_increment,
    id_cliente INT NOT NULL,
    id_producto varchar (12) NOT NULL,
    fecha datetime,
    PRIMARY KEY(id_pedido)
); 
 /*creamos la tabla compra donde id_pedido es la llave primaria 
 y se relaciona conj la tabla proveedores y productos*/
CREATE TABLE compra
(
    id_compra INT NOT NULL auto_increment,
    id_proveedor INT NOT NULL,
    id_producto varchar (12) NOT NULL,
    fecha datetime,
    PRIMARY KEY(id_compra)
); 
 /*agregamos las llaves foraneas en la tabla pedido */
ALTER TABLE pedido ADD FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE pedido ADD FOREIGN KEY(id_producto) REFERENCES producto(id_producto);

 /*agregamos las llaves foraneas en la tabla compra */
ALTER TABLE compra ADD FOREIGN KEY(id_producto) REFERENCES producto(id_producto);
ALTER TABLE compra ADD FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor);

/*insertamos registros en la tabla cliente*/
INSERT INTO cliente 
VALUES (default, "Johnny", "Bravo","Calle Cartoon 123"),
(default, "Tom", "Elgato","Calle dibujo 178"),
(default, "Jerry", "Elraton","Calle raton 896"),
(default, "Homero", "Simpson","Siempre viva 742"),
(default, "Moe", "Szyslak","Calle taberna 558");

/*insertamos registros en la tabla producto*/
INSERT INTO producto
VALUES ('produc00001', "Control de Riego WiFi 6", 191490, "seguridad y smarthome", "gris"),
('produc00002', "Control de Riego WiFi 6", 191490, "seguridad y smarthome", "gris"),
('produc00003', "Aire Acondicionado Portátil", 174990, "linea blanca", "blanco"),
('produc00004', "Asistentes de Voz Echo", 246990, "seguridad y smarthome", "negro"),
('produc00005', "Kit Cámara seguridad inalámbrica Full HD", 242490, "seguridad y smarthome", "blanco"),
('produc00006', "Impresora 3D de Resina LD-001", 387990, "impresoras y suministros", "negro"),
('produc00007',  "Impresora Tinta Continua EcoTank L121", 13990, "impresoras y suministros", "negro"),
('produc00008',  "Impresora 3D CR-6 SE", 309290, "impresoras y suministros", "negro"),
('produc00009',  "Cerradura inteligente con lector de huella", 151990, "seguridad y smarthome", "gris"),
('produc00010',  "Sensor de Movimiento Zigbee SmartThings", 38790, "seguridad y smarthome", "blanco");

/*Revisamos los datos insertados en tabla producto y cliente*/
select * from producto;
select * from cliente; 

/*insertamos registros en la tabla proveedor*/
INSERT INTO proveedor
VALUES (default, "Homero", "Compañia de homero","+5699996321", "+5699996322", "Moe", "seguridad y smarthome", "conntacto1@correo.com"),
(default, "Marge", "Compañia de Marge","+5698886321", "+5697896322", "Flanders", "seguridad y smarthome", "conntacto2@correo.com"),
(default, "Lisa", "Compañia de Lisa","+5699996354", "+5699996386", "Krabappel", "impresoras y suministros", "conntacto3@correo.com"),
(default, "Bart", "Compañia de Bart","+5699789321", "+5699365322", "Smithers ", "impresoras y suministros", "conntacto4@correo.com"),
(default, "Magie", "Compañia de Magie","+5699997853", "+569997895", "Montgomery Burns","linea blanca", "conntacto5@correo.com");

/*insertamos registros en la tabla compra*/
INSERT INTO compra 
VALUES (default, 1, "produc00001","2022-05-01 12:00:00"),
(default, 1, "produc00002","2022-05-01 13:45:00"),
(default, 5, "produc00003","2022-04-02 14:20:00"),
(default, 1, "produc00004","2022-05-05 11:36:00"),
(default, 2, "produc00005","2022-03-04 10:25:00"),
(default, 3, "produc00006","2022-05-04 11:15:00"),
(default, 4, "produc00007","2022-05-06 12:42:00"),
(default, 3, "produc00008","2022-06-10 11:32:00"),
(default, 2, "produc00009","2022-04-15 10:14:00"),
(default, 2, "produc000010","2022-05-26 13:26:00");

/*insertamos registros en la tabla compra*/
INSERT INTO compra
VALUES (default, 1 , "produc00001" ,"2022-05-01 13:45:00");
INSERT INTO compra
VALUES 
(default, 1 , "produc00002" ,"2022-05-01 12:00:00"),
(default, 5 , "produc00003" ,"2022-05-01 14:20:00"),
(default, 1 , "produc00004" ,"2022-05-01 11:36:00"),
(default, 2 , "produc00005" ,"2022-05-01 10:25:00"),
(default, 3 , "produc00006" ,"2022-05-01 11:15:00"),
(default, 4 , "produc00007" ,"2022-05-01 12:42:00"),
(default, 3 , "produc00008" ,"2022-05-01 11:32:00"),
(default, 2 , "produc00009" ,"2022-05-01 10:14:00"),
(default, 2 , "produc00010" ,"2022-05-01 13:26:00");


/*Revisamos los datos insertados en tabla proveedor, compra y producto*/
select * from proveedor; 
select * from compra; 
select * from producto; 


/*agregamos la columna Stock en la tabla producto (se nos olvidó)*/
describe producto; 
alter table producto add stock int
after color;
UPDATE producto
  SET stock='8'
  WHERE id_producto='produc00010';
  UPDATE producto
  SET stock='4'
  WHERE id_producto='produc00009';
  UPDATE producto
  SET stock='19'
  WHERE id_producto='produc00008';
  UPDATE producto
  SET stock='10'
  WHERE id_producto='produc00007';
  UPDATE producto
  SET stock='9'
  WHERE id_producto='produc00006';
  UPDATE producto
  SET stock='5'
  WHERE id_producto='produc00005';
  UPDATE producto
  SET stock='12'
  WHERE id_producto='produc00004';
    UPDATE producto
  SET stock='8'
  WHERE id_producto='produc00003';
    UPDATE producto
  SET stock='10'
  WHERE id_producto='produc00002';
      UPDATE producto
  SET stock='15'
  WHERE id_producto='produc00001';
  
  
  /*Seleccionamos la categoría que mas se repite*/
  SELECT categoria As "Categoria que más se repite"
FROM  producto
ORDER BY categoria DESC 
limit 1;
    
  /* buscamos cuáles son los productos con mayor stock*/
  select nombre,stock as mayor_stock
from producto
group by stock order by stock desc limit 3;

/*Encontramos el color más común en la tienda*/
SELECT color, count(color) as "color que mas se repite"
from producto
group by color
order by  count(color) desc limit 1;

 /* Estos son los proveedores con menor stock de productos*/
SELECT nombre_corporativo,stock
FROM compra
INNER JOIN proveedor
   using (id_proveedor)
INNER JOIN producto 
     USING(id_producto)
group by id_proveedor order by stock asc limit 3;

update producto
set categoria = 'Electrónica y computación'
WHERE 
(
SELECT categoria As "Categoria que más se repite"
FROM  producto
ORDER BY categoria DESC 
limit 1
);

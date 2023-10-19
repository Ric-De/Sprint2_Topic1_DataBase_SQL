

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT nombre FROM producto;

SELECT nombre, precio FROM producto;

SHOW COLUMNS FROM producto;

SELECT 
nombre, 
precio, 
(precio * 1.06)
FROM producto;

SELECT
nombre AS "Product Name",
precio AS "Euros",
(precio * 1.06) AS "US Dollars"
FROM producto;

SELECT UPPER(nombre) AS "Product Name",
		precio AS "Price in Euros"
FROM producto;

SELECT LOWER(nombre) AS "Product Name",
precio AS "Price in Euros"
FROM producto;

SELECT nombre AS "Manufacturer Name",
       CONCAT(UPPER(SUBSTRING(nombre, 1, 2)), LOWER(SUBSTRING(nombre, 3))) AS "Capitalized First Two Characters"
FROM fabricante;

SELECT nombre AS "Product Name",
ROUND(precio) AS "Rounded price"
FROM producto;

SELECT nombre AS "Product Name",
TRUNCATE(precio, 0) AS "Price with no decimals"
FROM producto;

SELECT codigo AS "Manufacturer Code"
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);

SELECT f.codigo AS "Manufacturer Code"
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;

SELECT nombre AS "Manufacturer Name"
FROM fabricante
ORDER BY nombre ASC;

SELECT nombre AS "Manufacturer Name"
FROM fabricante
ORDER BY nombre DESC;

SELECT nombre AS "Product Name", precio AS "Price in Euros"
FROM producto
ORDER BY nombre ASC, precio DESC;

SELECT * FROM fabricante
LIMIT 5;

SELECT * FROM fabricante
LIMIT 2 OFFSET 3;

SELECT nombre AS "Cheapest Product Name", precio AS "Price in Euros"
FROM producto
ORDER BY precio ASC
LIMIT 1;

SELECT nombre AS "Most Expensive Product Name", precio AS "Price in Euros"
FROM producto
ORDER BY precio DESC
LIMIT 1;

SELECT p.nombre AS "Product Name"
FROM producto p
WHERE p.codigo_fabricante = 2;

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT f.nombre AS "Manufacturer Name", p.nombre AS "Product Name", p.precio AS "Price in Euros"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC, p.nombre ASC, p.precio ASC;

SELECT p.codigo AS "Product Code", p.nombre AS "Product Name", p.codigo_fabricante AS "Manufacturer Code", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE RIGHT(f.nombre, 1) IN ('e', 'E');

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

SELECT p.nombre AS "Product Name", p.precio AS "Price in Euros", f.nombre AS "Manufacturer Name"
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

SELECT f.codigo AS "Manufacturer Code", f.nombre AS "Manufacturer Name"
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);

SELECT f.codigo AS "Manufacturer Code", f.nombre AS "Manufacturer Name", p.nombre AS "Product Name"
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
ORDER BY f.codigo, p.codigo;

SELECT f.codigo AS "Manufacturer Code", f.nombre AS "Manufacturer Name"
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NULL;

SELECT nombre AS "Product Name", precio AS "Price in Euros"
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'
);

SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

SELECT nombre AS "Product Name"
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'
)
ORDER BY precio DESC
LIMIT 1;

SELECT nombre AS "Product Name"
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Hewlett-Packard'
)
ORDER BY precio ASC
LIMIT 1;

SELECT *
FROM producto
WHERE precio >= (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

SELECT *
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Asus'
    )
);

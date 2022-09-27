-- По задаче про магазин:

-- Сделайте, чтобы в таблице товаров у вас было какое-либо поле с типом дата.

CREATE DATABASE shoesShop;

USE shoesShop;

CREATE TABLE productCategory
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE product
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
    model VARCHAR(25) NOT NULL UNIQUE,
    price MEDIUMINT NOT NULL,
    productCategoryId INT NOT NULL,
    dateAdded DATE NOT NULL,
    FOREIGN KEY (productCategoryId) REFERENCES productCategory(id)
);

INSERT INTO productCategory(name)
VALUES 
	('Ботинки мужские'), 
	('Кеды All Star'), 
    ('Кеды All Star Chuck Taylor'),
    ('Кроссовки мужские'), 
    ('Полуботинки мужские'), 
    ('Кеды зимние');

INSERT INTO product(name, model, price, productCategoryId, dateAdded)
VALUES
	('Ботинки мужские FRAZIER', 'FR22-23', 9800, 1, '2019-01-15'),
	('Кеды Convers All Star летние низкие', 'M5039', 3600, 2, '2020-04-10'),
    ('Кеды Converse All Star Chuck Taylor летние', 'M9160', 3900, 3, '2020-04-20'),
    ('Кроссовки мужские GREY', 'GR22-23', 8500, 4, '2021-05-05'),
    ('Кроссовки ECCO ZIPFLEX M', 'M803824', 12900, 5, '2021-05-23'),
    ('Полуботинки ECCO ST.1 HYBRID', 'M836794', 9500, 6, '2022-08-16');
    
-- Выведите список товаров, чтобы день, месяц и год выводились отдельными полями.
    
SELECT Name, 
	DAY(dateAdded) AS dayAdded, 
	MONTH(dateAdded) AS monthAdded,
	YEAR(dateAdded) AS yearAdded 
FROM product; 

-- Выведите сколько товаров было в каждый год, который присутствует в этой таблице.

SELECT YEAR(dateAdded),
	COUNT(*) AS productsCount
FROM product
GROUP BY YEAR(dateAdded);
/*
Задача "Тестовые данные".
Напишите скрипт, который заполнит БД из задачи Shop категориями и товарами.
Пусть создастся 100 категорий и 5000 товаров.
Пусть товары привязываются к категориям случайным образом. 
И случайным образом пусть выставляется цена.
*/

CREATE DATABASE Shop;

USE Shop;

CREATE TABLE productCategory
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE product
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price MEDIUMINT NOT NULL,
    productCategoryId INT NOT NULL,
    FOREIGN KEY (productCategoryId) REFERENCES productCategory(id)
);

DELIMITER $$
CREATE PROCEDURE insertCategoriesData()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 100 DO
	INSERT INTO productCategory (name)
        VALUES (CONCAT('Категория ', i));
        
        SET i = i + 1;
    END WHILE;
END$$

CREATE PROCEDURE insertProductsData()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 5000 DO
	INSERT INTO product (name, price, productCategoryId)
        VALUES (
            CONCAT('Товар ', i),
            FLOOR(RAND() * 1000) + 1,
            FLOOR(RAND() * 100) + 1
	);
        
        SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;

CALL insertCategoriesData();

CALL insertProductsData();

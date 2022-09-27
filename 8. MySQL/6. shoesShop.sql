/* 
Вопрос-1 домашнего задания-4:
Создать базу данных магазина из 2 таблиц - продукты (товары) и категории товаров.
Каждый товар принадлежит одной категории.
Вставьте данные в таблицы (3 - 5 строк). 
*/

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
    FOREIGN KEY (productCategoryId) REFERENCES productCategory(id)
	ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO productCategory (name)
VALUES 
    ('Ботинки мужские'), 
    ('Кеды All Star'), 
    ('Кеды All Star Chuck Taylor'),
    ('Кроссовки мужские'), 
    ('Полуботинки мужские'), 
    ('Кеды зимние');

INSERT INTO product (name, model, price, productCategoryId)
VALUES
    ('Ботинки мужские FRAZIER', 'FR22-23', 98, 1),
    ('Кеды Convers All Star летние низкие', 'M5039', 36, 2),
    ('Кеды Converse All Star Chuck Taylor летние', 'M9160', 39, 3),
    ('Кроссовки мужские GREY', 'GR22-23', 85, 4),
    ('Кроссовки ECCO ZIPFLEX M', 'M803824', 129, 5),
    ('Полуботинки ECCO ST.1 HYBRID', 'M836794', 95, 6);

/*
Попробовать UPDATE, DELETE:
Удалить товары с ценой выше 100.
Изменить название и цену некоторому товару.
*/

DELETE FROM product
WHERE price > 100;

UPDATE product
SET 
    price = price * 2.25, 
    name = 'Кеды Convers Dainty зимние' 
WHERE id = 3;

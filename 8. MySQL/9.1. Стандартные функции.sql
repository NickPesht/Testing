-- Задача "Стандартные функции"

/*
	Выведите страны в порядке убывания длины названия. 
    И пусть название страны будет в верхнем регистре, а название континента – в нижнем
*/

USE world;

SELECT UPPER(name) AS countryName, 
	LOWER(continent) AS continent
FROM country
ORDER BY CHAR_LENGTH(name) DESC;

/*
	Для каждой страны найдите радиус окружности, 
    у которой площадь круга такая же, как площадь этой страны. 
    Отсортируйте результат по убыванию радиуса
*/

SELECT name, surfaceArea,
	SQRT(SurfaceArea / PI()) AS circleRadius
FROM Country
ORDER BY circleRadius DESC;
-- Задача GROUP BY. По таблице городов.

-- Вывести все страны вместе с количеством городов.

USE world;

SELECT countryCode, COUNT(*) AS numberOfCities
FROM city
GROUP BY countryCode;

/*
Вывести все страны вместе с количеством городов, 
оставить только страны, в которых не менее 2 городов
*/

SELECT countryCode, COUNT(*) AS numberOfCities
FROM city
GROUP BY countryCode
HAVING COUNT(*) >= 2;

/*
Вывести все страны вместе с количеством городов, 
в которых не менее 1 млн человек, 
оставить только страны, в которых не менее 2 таких городов.
*/

SELECT countryCode, COUNT(*) AS numberOfCities
FROM city
WHERE population >= 1000000
GROUP BY countryCode
HAVING COUNT(*) >= 2;

/*
Найти среднюю численность населения городов по каждой стране, 
вывести в порядке убывания средней численности.
*/

SELECT countryCode, AVG(population) AS averagePopulation
FROM city
GROUP BY countryCode
ORDER BY averagePopulation DESC;

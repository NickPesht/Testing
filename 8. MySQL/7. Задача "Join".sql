-- Задача JOIN.
-- Попробовать CROSS JOIN между таблицами городов и стран.

USE world;

SELECT * FROM country 
CROSS JOIN city;

/*
При помощи INNER JOIN: вывести код страны, название
страны и название города-столицы.
*/

SELECT co.code, co.name, ci.name
FROM country AS co
INNER JOIN city AS ci
    ON co.capital = ci.id;
    
/*
Сделайте запрос, который выводит имя города, его численность, 
а также код и название его страны.
*/

SELECT ci.name, ci.population, co.code, co.name
FROM city AS ci
INNER JOIN country AS co
    ON co.code = ci.countryCode;

/*
Для каждого континента выведите количество городов из этого континента. 
Учтите, что в Антарктиде городов нет, но надо чтобы все равно вывелся 0.
*/

SELECT co.continent, COUNT(ci.id) AS citiesCount
FROM country AS co
LEFT JOIN city AS ci
    ON co.code = ci.countryCode
GROUP BY co.continent;

/*
Выведите количество официальных языков для каждой страны 
в порядке убывания количества этих языков.
*/

SELECT co.name, COUNT(cl.language) AS languagesCount
FROM country AS co
LEFT JOIN countryLanguage AS cl
    ON co.code = cl.countryCode AND cl.isOfficial = 'T'
GROUP BY co.name
ORDER BY languagesCount DESC;

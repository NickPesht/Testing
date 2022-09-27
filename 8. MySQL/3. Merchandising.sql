/*
Задача Mercandayzing.
1. Выведите ФИО всех мерчандайзеров из сибирского региона.
*/

USE merchandising;

SELECT CONCAT(lastName,' ', firstName,' ', middleName) AS siberianMerchandisers
FROM merchandiser AS m
LEFT JOIN city AS c
    ON c.id = m.cityId
LEFT JOIN region AS r
    ON r.id = c.regionId
WHERE r.name = 'Сибирский';

/*
2. Выведите информацию о POSm, у которых не задан комментарий.
*/

SELECT * FROM posmItem
WHERE comment IS NULL;

/*
3. Для каждого города выведите название города и число мерчандайзеров из этого города. 
Если там 0 мерчандайзеров, то должно вывестись 0.
*/

SELECT c.name, COUNT(c.id) AS merchendisersCount
FROM city AS c
LEFT JOIN merchandiser AS m
    ON m.cityId = c.id
GROUP BY c.name;

/*
4. Для каждого региона выведите название региона и число мерчандайзеров из этого региона. 
Если там 0 мерчандайзеров, то должно вывестись 0.
*/

SELECT r.name, COUNT(m.id) AS merchendisersCount
FROM region AS r
LEFT JOIN city AS c
    ON c.regionId = r.id
LEFT JOIN merchandiser AS m
    ON m.cityId = c.id
GROUP BY r.name;

/*
5. Посчитайте сколько у каждого мерчандайзера задач «в работе» и «выполнено». 
Если 0, то должно вывестись 0.
*/

SELECT m.id, m.firstName, m.lastName,
SUM(
    CASE 
	WHEN pt.status = 1 THEN 1 
	ELSE 0 
    END
) AS inWork,
SUM(
    CASE 
    WHEN pt.status = 2 THEN 1 
    ELSE 0 
END
) AS Posted
FROM merchandiser AS m
LEFT JOIN placePosmTask AS pt 
    ON m.id = pt.merchandiserId
GROUP BY m.id, m.firstName, m.lastName;

/*
6. Найдите агентов, у которых более 2 задач на размещение, 
выведите для каждого из них количество задач.
*/

SELECT agentCode, COUNT(id) AS tasksCount
FROM placePosmTask
GROUP BY agentCode
HAVING COUNT(id) > 2;

/*
Описание:

В БД есть 2 таблицы:
department
id - число, первичный ключ
name - строка

employee
id - число, первичный ключ
department_id - число, внешний ключ на таблицу department
chief_id - число, внешний ключ на саму таблицу employee
name - строка
salary - число

Задача-1.
Вывести список сотрудников в формате: 
Сотрудник, Отдел сотрудника, Руководитель, Отдел руководителя.
*/

SELECT emp1.name AS employee_name, 
	d1.name AS employee_department,
	emp2.name AS chief_name,
    d2.name AS chief_department
FROM employees AS emp1
LEFT JOIN departments AS d1
	ON d1.id = emp1.departments_id
LEFT JOIN employees AS emp2
	ON emp1.chief_id = emp2.id
LEFT JOIN departments AS d2
	ON d2.id = emp2.departments_id
ORDER BY emp1.name;

 /*
Задача-2.
Вывести список сотрудников, получающих заработную плату, 
большую чем у непосредственного руководителя.
 */

SELECT emp1.name 
FROM employees AS emp1
LEFT JOIN employees AS chief
	ON chief.id = emp1.chief_id
WHERE emp1.salary > chief.salary;

/* 
Задача-3.
Вывести список сотрудников, получающих максимальную 
заработную плату в своем отделе.
*/

-- Вариант решения-1:

SELECT name
FROM employees
WHERE (departments_id, salary) IN (SELECT departments_id, MAX(salary)
															FROM employees
															GROUP BY departments_id);
-- Вариант решения-2:

SELECT emp1.name
FROM  employees AS emp1
WHERE emp1.salary = (SELECT MAX(salary) 
										FROM employees AS emp2
										WHERE  emp2.departments_id = emp1.departments_id);

/*
Задача-4.
Вывести список ID отделов, количество сотрудников в которых 
не превышает 3 человек.
*/

SELECT d.name
FROM departments AS d
LEFT JOIN employees AS e
	ON e.departments_id = d.id
GROUP BY d.name
HAVING COUNT(e.id) <= 3;

/*
Задача-5.
Вывести список сотрудников, не имеющих назначенного руководителя, 
работающего в том же отделе
*/

SELECT emp1.name
FROM  employees AS emp1
LEFT JOIN employees AS emp2 
	ON emp2.id = emp1.chief_id AND emp2.departments_id = emp1.departments_id
WHERE emp2.id IS NULL;
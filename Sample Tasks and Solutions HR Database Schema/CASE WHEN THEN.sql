--CASE WHEN THEN ELSE END--


--1. Display the first name and last name of employees along with information on whether their salary is high (above 10000) or low (10000 or less).
 --Sort the salary from highest to lowest./Wyświetl imiona i nazwiska pracowników oraz informację, czy ich wynagrodzenie jest wysokie (powyżej 10000) czy niskie (poniżej 10000 i mniej).
-- Posegreguj wynagrodzenie od najwyższej do najniższej.

SELECT first_name, last_name,salary,
	CASE
	WHEN salary > 10000 THEN 'Wysokie wynagrodzenie'
	ELSE 'Niskie wynagrodzenie'
	END AS salary_level
FROM employees
ORDER BY salary desc;
	
--2. Display the first name and last name of employees and information on whether they work in the IT department (department_id = 60). 
-- Show the first name, last name, department id, and department name./ Wyświetl imiona i nazwiska pracowników oraz informację, czy pracują w dziale IT (department_id = 60).
-- Pokaż imię, nazwisko, id departamentu, nazwę departamentu.

SELECT e.first_name, e.last_name,  e.department_id, d.department_name,
	CASE
	WHEN e.department_id = 60 THEN 'Pracuje w IT'
	ELSE 'Nie pracuje w IT'
	END AS it_department_status
FROM employees e
JOIN departments d ON d.department_id = e.department_id;
	
--3.Display the first and last names of employees along with their salary including any bonus, if assigned./ 
--Wyświetl imiona i nazwiska pracowników oraz ich wynagrodzenie z dodatkiem premii, jeśli mają przypisaną.

SELECT first_name, last_name, salary,
	CASE
	WHEN commission_pct IS NOT NULL THEN salary + (salary * commission_pct)
	ELSE salary
END AS total_compensation
FROM employees;
	
--4. Display the first and last names of employees along with the length of their employment in the company (less than 5 years, 5-10 years, more than 10 years).
--/Wyświetl imiona i nazwiska pracowników oraz ich długość zatrudnienia w firmie (krócej niż 5 lat, 5-10 lat, powyżej 10 lat).

SELECT first_name, last_name, hire_date,
	CASE
	WHEN MONTHS_BETWEEN(SYSDATE, hire_date) / 12 < 5 THEN 'Krócej niż 5 lat'
	WHEN MONTHS_BETWEEN(SYSDATE, hire_date) / 12 BETWEEN 5 AND 10 THEN '5-10 lat'
	ELSE 'Powyżej 10 lat'
	END AS employment_duration
FROM employees;
	
--5. Display the first and last names of employees along with information on whether their salary is below, within, or above the average salary in the company.
--/Wyświetl imiona i nazwiska pracowników oraz informację, czy ich wynagrodzenie jest poniżej, w przedziale czy powyżej średniego wynagrodzenia w firmie.

SELECT first_name, last_name, salary,
	CASE
	WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'Poniżej średniego wynagrodzenia'
	WHEN salary = (SELECT AVG(salary) FROM employees) THEN 'Średnie wynagrodzenie'
	END AS salary_comparison
FROM employees;
	
--6.Display the first and last names of employees along with their salary category (low, medium, high), using thresholds of 5000 and 10000.
--/Wyświetl imiona i nazwiska pracowników oraz ich kategorie wynagrodzenia (niska, średnia, wysoka), przyjmując progi 5000 i 10000. 
	
SELECT first_name, last_name, salary,
	CASE
	WHEN salary < 5000 THEN 'Niskie'
	WHEN salary BETWEEN 5000 AND 10000 THEN 'Średnie'
	ELSE 'Wysokie'
END AS salary_category
FROM employees;
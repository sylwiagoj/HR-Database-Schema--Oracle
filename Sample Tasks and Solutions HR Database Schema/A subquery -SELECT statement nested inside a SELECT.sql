--1. Find employees who earn more than the average salary of all employees./ Znajdź pracowników, którzy zarabiają więcej niż średnia pensja wszystkich pracowników.

	SELECT first_name, last_name, salary 
	FROM employees
	WHERE salary > (SELECT ROUND(ANG(salary),2) 
                FROM employees)
	ORDER BY salary ASC;

--2. Find employees who work in the same department as 'Jennifer Dilly' and earn more than Jennifer./Znajdź pracowników, którzy pracują w tym samym dziale co 'Jennifer	Dilly' i zarabiają więcej niż Jennifer.

	SELECT first_name, last_name, job_id, salary
	FROM employees
	WHERE job_id = (	SELECT job_id 
						FROM employees
						WHERE first_name = 'Jennifer' AND last_name = 'Dilly')
	AND salary >		SELECT salary    
						FROM employees 
						WHERE first_name = 'Jennifer' AND last_name = 'Dilly');
                
--3. Find employees who work in the same department as 'Adam Fripp'./Znajdź pracowników, którzy pracują w tym samym departamencie co 'Adam Fripp'.

	SELECT first_name, last_name, department_id
	FROM employees
	WHERE department_id =(	SELECT department_id 
							FROM employees
							WHERE first_name = 'Adam' 
							AND last_name = 'Fripp');

--4.Find the names of employees who work in a department based in the United Kingdom./Znajdź nazwiska pracowników, którzy pracują w dziale zlokalizowanym w Wielkiej Brytanii.
/*
powiązania między tabelami:
(employees.department_id=department.department_id), (departments.location_id = locations.location_id), 
(locations.country_id=countries.country_id) Cel: w countries jest country name (United Kingdom)
*/
--4a) 
	SELECT 
		e.first_name,
		e.last_name,
		d.department_name,
		c.country_name
	FROM
		employees e,
		departments d,
		locations l,
		countries c
	WHERE
		e.department_id=d.department_id
	AND d.location_id=l.location_id
	AND l.country_id=c.country_id
	AND country_name='United Kingdom';

--4b

	SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    c.country_name
	FROM
    employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
    JOIN countries c ON l.country_id = c.country_id
	WHERE
    c.country_name = 'United Kingdom';
--4c

	SELECT last_name
	FROM employees
	WHERE department_id IN ( SELECT department_id
							  FROM departments
							  WHERE location_id IN 
                                            (	SELECT location_id
												FROM locations
												WHERE country_id = 'UK'));

--5.Find the names of departments that have more than 5 employees./Znajdź nazwy działów, które mają więcej niż 5 pracowników.

	SELECT department_name
	FROM departments
	WHERE department_id IN (	SELECT department_id
								FROM employees
								GROUP BY department_id
								HAVING COUNT(*) > 5);
 
--6.Find employees whose salary is higher than the salary of every employee in the IT department./Znajdź pracowników, których pensja jest wyższa niż pensja każdego pracownika w dziale IT.

--6a
	SELECT first_name, last_name, job_id, salary
	FROM employees 
	WHERE salary > ALL (
							SELECT salary
							FROM employees 
							WHERE job_id = 'IT_PROG');

--6b                
	SELECT first_name, last_name, job_id, salary
	FROM employees 
	WHERE salary > (
						SELECT MAX(salary)
						FROM employees 
						WHERE job_id = 'IT_PROG');
    

--7. Find employees who have the highest salary in their department./Znajdź pracowników, którzy mają najwyższą pensję w swoim dziale.

	SELECT first_name, last_name, job_id, salary
	FROM (
			SELECT 
			first_name, 
			last_name, 
			job_id, 
			salary,
			RANK() OVER (PARTITION BY job_id ORDER BY salary DESC) AS rank_num
			FROM employees
							)  ranked_employees
WHERE rank_num = 1
order by salary desc; 

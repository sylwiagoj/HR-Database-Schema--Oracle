--Aggregation functions--

--1. Provide the highest and lowest salary among all employees. / Podaj najwyższą i najniższą pensję wśród wszystkich pracowników.

	SELECT 
	MAX(salary) AS highest_salary, 
	MIN(salary) AS lowest_salary
	FROM employees;


--2. Calculate the total salary paid to employees in each department. / Oblicz łączną pensję wypłaconą pracownikom w każdym dziale.

	SELECT department_id, SUM(salary) AS total_salary
	FROM employees
	GROUP BY department_id;
	
--3. Show the number of employees for each job position (job_id). / Przedstaw liczbę pracowników na każdym stanowisku (job_id).

	SELECT job_id, COUNT(*) AS number_of_employees
	FROM employees
	GROUP BY job_id;
	
--4. Calculate the number of employees in each department with a salary exceeding 5000. / Oblicz liczbę pracowników w każdym dziale, których pensja przekracza 5000.


	SELECT department_id, COUNT(*) AS number_of_high_salary_employees
	FROM employees
	WHERE salary > 5000
	GROUP BY department_id;
	
--5. Calculate the total salary in departments where the average salary exceeds 6000. /Oblicz sumę pensji w działach, gdzie średnia pensja przekracza 6000.

	SELECT department_id, 
       SUM(salary) AS total_salary
	FROM employees
	GROUP BY department_id
	HAVING AVG(salary) > 6000;


--6. Provide the earliest and latest hire date of employees in each department. Sort the results by the earliest hire date from shortest to longest duration. /
-- Podaj najwcześniejszą i najpóźniejszą datę zatrudnienia pracowników w każdym dziale. 
-- Posegreguj wyniki według najwcześniejszej daty zatrudnienia od najkrótszego do najdłuższego czasu.

	SELECT department_id, 
		MIN(hire_date) AS earliest_hire_date, 
		MAX(hire_date) AS latest_hire_date
	FROM employees
	GROUP BY department_id
	ORDER BY MIN(hire_date) ASC;	


--7. Calculate the average length of employment (in days) for employees in each department and round the results to the nearest whole number. / 
-- Oblicz średnią długość zatrudnienia pracowników (w dniach) w każdym dziale i zaokrąglij wyniki do najbliższej liczby całkowitej.

	SELECT department_id, 
		ROUND(AVG(SYSDATE - hire_date)) AS average_tenure
	FROM employees
	GROUP BY department_id;

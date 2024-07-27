--JOIN--


--1. Join the employees and departments tables to display employee names and the department names they work in. 
--/Połącz tabele employees i departments, aby wyświetlić imiona pracowników oraz nazwy działów, w których pracują. 

	SELECT e.first_name, e.last_name, d.department_name
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id;
	
--2. Join the employees and jobs tables to display employee names and their job titles. 
--/Połącz tabele employees i jobs, aby wyświetlić imiona pracowników oraz ich stanowiska.

	SELECT e.first_name, e.last_name, j.job_title
	FROM employees e
	JOIN jobs j ON e.job_id = j.job_id;


--3. Join the employees and locations tables to display employee names and the cities where their offices are located. 
--/Połącz tabele employees i locations, aby wyświetlić imiona pracowników oraz miasta, w których znajdują się ich biura. 
	
	SELECT e.first_name, e.last_name, l.city
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id
	JOIN locations l ON d.location_id = l.location_id;

--4. Join the employees and departments tables to display the total salaries in each department. 
--/Połącz tabele employees i departments, aby wyświetlić sumę wynagrodzeń w każdym dziale.

	SELECT d.department_name, SUM(e.salary) AS total_salary
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id
	GROUP BY d.department_name;
	
--5. Join the employees and regions tables through departments, locations, countries to display employee names and the regions they work in.
--/Połącz tabele employees i regions przez departments, locations, countries, aby wyświetlić imiona pracowników oraz regiony, w których pracują.

	SELECT e.first_name, e.last_name, r.region_name
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id
	JOIN locations l ON d.location_id = l.location_id
	JOIN countries c ON l.country_id = c.country_id
	JOIN regions r ON c.region_id = r.region_id;
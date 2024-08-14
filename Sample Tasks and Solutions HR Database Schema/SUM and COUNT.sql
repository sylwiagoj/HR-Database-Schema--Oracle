--SUM AND COUNT--


--1. Count all employees in the HR schema./Policz wszystkich pracowników w schemacie HR.

	SELECT COUNT(*) AS total_employees
	FROM employees;
	
--2. Display the number of employees in each department./Przedstaw liczbę pracowników w poszczególnych działach.

	SELECT department_id, COUNT(*) AS num_employees
	FROM employees
	GROUP BY department_id;


--3. Count the number of employees in each job position./Policz liczbę pracowników na poszczególnych stanowiskach.
	
	SELECT job_id, COUNT(*) AS num_employees
	FROM employees
	GROUP BY job_id;

--4. Display the unique values of all job positions./ Przedstaw wartości unikalne wszystkich stanowisk pracy.

	SELECT COUNT(DISTINCT job_id) AS unique_jobs
	FROM employees;

--5. Calculate the total sum of all employees' salaries./ Oblicz sumę wynagrodzeń wszystkich pracowników.

	SELECT SUM(salary) AS total_salary
	FROM employees;

--6. Calculate the total sum of salaries in each department./ Oblicz sumę wynagrodzeń w poszczególnych działach.

	SELECT department_id, SUM(salary) AS total_department_salary
	FROM employees
	GROUP BY department_id;
	
--7. Calculate the total sum of salaries for each job position./ Oblicz sumę wynagrodzeń na poszczególnych stanowiskach.

	SELECT job_id, SUM(salary) AS total_job_salary
	FROM employees
	GROUP BY job_id;
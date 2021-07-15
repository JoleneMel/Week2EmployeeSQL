use employees;

-- 1. I want to know how many employees with each title were born after 1965-01-01.
Select count(*) as "Number Of Employees", t.title as "Title"  from employees e
INNER JOIN titles t on t.emp_no = e.emp_no
Where birth_date > '1965-01-01'
group by(t.title)
order by(t.title);

-- 2. I want to know the average salary per title.
Select FORMAT(AVG(s.salary),2) as "Average Salary", t.title as "Title" from salaries s
-- FORMAT will format it with 2 decimal places  
INNER JOIN titles t USING(emp_no)
-- using performs the same action like ON but only IF the key is the same 
Group by(t.title)
order by(t.title);
-- to order alphabetical order

-- 3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
Select FORMAT(sum(s.salary),2) as "Total Budget for 2 Years", d.dept_name as "Department" from departments d
INNER JOIN dept_emp d_e USING(dept_no)
INNER JOIN salaries s on s.emp_no = d_e.emp_no AND s.from_date <= '1992-01-01' AND s.from_date >= '1990-01-01'
-- when muplitple columns have the same key need to specify by in this case s.from_date
where d.dept_name = 'Marketing'
Group by(d.dept_name);


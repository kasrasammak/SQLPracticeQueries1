#for reference
select *
from employees;

select * 
from salaries;

select * 
from dept_emp;

#query 1
select e.emp_id
from employees e
join salaries s
on e.emp_id = s.emp_id
order by s.salary desc
limit 1;

#query 2
select first_name, last_name, birth_date
from employees
order by birth_date desc
limit 1;

#query 3
select first_name, last_name, hire_date
from employees
order by hire_date asc
limit 1;

#query 4
select count(gender)/(select count(*) from employees) *100
from employees
where gender = "F";

#query 5
select d.dept_name, count(emp_id)
from departments d
join dept_emp de
on d.dept_no = de.dept_no
group by de.dept_no
order by d.dept_name asc;


#departments, employees, dept_manager, salaries, dept_emp 
#query 6
select count(*), YEAR(from_date) as calendar_year
from dept_emp
group by calendar_year
order by calendar_year desc;

#query 7
select YEAR(d.from_date) as calendar_year, e.gender, count(e.emp_id)
from dept_emp d
join employees e
on d.emp_id = e.emp_id
group by calendar_year, e.gender
having calendar_year >= 1990
order by calendar_year asc;


select *
from dept_manager;

#query 8
select YEAR(from_date) as calendar_year, count(DISTINCT emp_id)
from dept_manager
group by calendar_year
having calendar_year >= 1990
order by calendar_year asc;



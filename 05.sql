select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like '%REP%';

select min(hire_date), max(hire_date)
from employees;

select count(*)
from employees;

select count(commission_pct)
from employees;

select count(employee_id)
from employees;

select count(commission_pct)
from employees
where department_id = 70;

select commission_pct, department_id, last_name, job_id
from employees
where department_id = 70;

select commission_pct, department_id, last_name, job_id
from employees
where department_id = 60;

select count(commission_pct)
from employees
where department_id = 60;

select avg(commission_pct)
from employees;

select avg(nvl(commission_pct, 0))
from employees;

select sum(salary)
from employees;

select sum(all salary)
from employees;

select sum(distinct salary)
from employees;

select count(*)
from departments;

select department_id, department_name, manager_id
from departments;

select count(manager_id)
from departments;

select last_name, department_id
from employees;

select count(distinct department_id)
from employees;

select avg(salary)
from employees
group by department_id;

select last_name, first_name, job_id, department_id
from employees
where last_name = 'King';

select last_name, first_name, job_id, department_id
from employees
where department_id = 90;

select last_name, first_name, job_id, department_id, salary
from employees
where department_id is null;

select department_id, avg(salary)
from employees
group by department_id;

select salary, avg(salary)
from employees
group by department_id; -- error

select department_id, job_id, sum(salary)
from employees
where department_id > 40
group by department_id, job_id
order by department_id;

select count(last_name)
from employees;

select department_id, count(last_name)
from employees;

select department_id, job_id, count(last_name)
from employees
group by department_id, job_id;

select department_id, job_id, count(last_name)
from employees
group by department_id;

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary);

select max(avg(salary))
from employees
group by department_id;

select max(avg(salary))
from employees;

select department_id, max(avg(salary))
from employees
group by department_id;

select manager_id
from departments
order by manager_id;

select distinct manager_id
from employees
order by manager_id;

--4.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees;

--5.
select job_id, max(salary), min(salary), sum(salary), round(avg(salary))
from employees
group by job_id;

--6.
select job_id, count(*)
from employees
group by job_id;

--7.
select count(distinct manager_id)
from employees;

--8.
select max(salary) - min(salary)
from employees;

--9.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000;

--10.
select sum(decode(to_char(hire_date, 'yyyy'), '2000', 1, 0)) "2000",
    sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

--11.
select job_id, sum(decode(department_id, 20, salary)) "dept20",
    sum(decode(department_id, 50, salary)) "dept50",
    sum(decode(department_id, 80, salary)) "dept80",
    sum(decode(department_id, 90, salary)) "dept90"
from employees
group by job_id;
select department_id, department_name, location_id, city
from departments natural join locations;

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50);

select employee_id, last_name, location_id, department_id
from employees join departments
using(department_id);

select employee_id, last_name, location_id, department_id
from employees natural join departments;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where d.location_id = 1400; -- error

select l.city, d.department_name, d.location_id
from locations l join departments d
using(location_id)
where location_id = 1400; -- error

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where department_id = 60;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.department_id = 60; -- error

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where manager_id = 60; -- error

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.manager_id = 60;

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id);

select e.employee_id, e.last_name, department_id,
    department_id, d.location_id
from employees e join departments d
using (department_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id > d.department_id);

select employee_id, city, department_name
from employees e join departments d
on d.department_id = e.department_id 
join locations l
on d.location_id = l.location_id;

select employee_id, city, department_name
from employees e join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
and e.manager_id = 149;

select e.employee_id, e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on e.department_id = d.department_id
where e.manager_id = 149;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id;

select worker.last_name emp, manager.last_name mgr
from employees worker join employees manager
on manager_id = employee_id; -- error

select last_name emp, last_name mgr
from employees worker join employees manager
on worker.manager_id = manager.employee_id; -- error

select e.last_name, e.salary, e.job_id
from employees e join jobs j
on e.salary between j.min_salary and j.max_salary
where j.job_id = 'IT_PROG';

select e.last_name, e.salary, e.job_id
from employees e
where e.salary between 4000 and 10000;

select count(*)
from employees
where department_id = 190;

select department_id, department_name
from departments
where department_id = 190;

select employee_id, last_name, department_id
from employees
where department_id is null;

select e.last_name, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id;

select d.department_id, d.department_name, d.location_id, l.city
from departments d, locations l
where d.location_id = l.location_id
and d.department_id in (20, 50);

select e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

select e.last_name, e.salary, e.job_id
from employees e, jobs j
where e.salary between j.min_salary and j.max_salary
and j.job_id = 'IT_PROG';

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select worker.last_name || ' works for ' || manager.last_name
from employees worker, employees manager
where worker.manager_id = manager.employee_id;

--1.
select location_id, street_address, city, state_province, country_name
from locations natural join countries;

--2.
select last_name, department_id, department_name
from employees join departments
using (department_id);

--3.
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where lower(l.city) = 'toronto';

--4.
select w.last_name "Employee", w.employee_id "Emp#",
    m.last_name "Manager", m.employee_id "Mgr#"
from employees w join employees m
on w.manager_id = m.employee_id;

--5.
select w.last_name "Employee", w.employee_id "Emp#",
    m.last_name "Manager", m.employee_id "Mgr#"
from employees w left outer join employees m
on w.manager_id = m.employee_id;

--6.
select e.department_id department, e.last_name employee, c.last_name colleague
from employees e join employees c
on e.department_id = c.department_id
and e.employee_id <> c.employee_id
order by department, employee, colleague;

--7.
select e.last_name, e.hire_date
from employees e join employees davies
on davies.last_name = 'Davies'
and e.hire_date > davies.hire_date;

--8.
select w.last_name, w.hire_date, m.last_name, m.hire_date
from employees w join employees m
on w.manager_id = m.employee_id
where w.hire_date < m.hire_date;
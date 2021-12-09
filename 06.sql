select department_id, department_name, location_id, city
from departments natural join locations;

select department_id, department_name, location_id, city
from departments natural join locations
where department_id in (20, 50);

select employee_id, last_name, department_id, location_id
from employees join departments
using (department_id);

select employee_id, last_name, department_id, location_id
from employees natural join departments;

select locations.city, departments.department_name
from locations join departments
using(location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where location_id = 1400;

select l.city, d.department_name
from locations l join departments d
using(location_id)
where d.location_id = 1400; -- error

select l.city, d.department_name
from locations l join departments d
using(location_id)
where locations.location_id = 1400; -- error

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
where manager_id = 100; -- error

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where d.manager_id = 100;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where employee_id = 100;

select e.last_name, d.department_name
from employees e join departments d
using(department_id)
where e.employee_id = 100;

select e.employee_id , e.last_name, e.department_id,
    d.department_id, d.location_id
from employees e join departments d
on (e.department_id = d.department_id);

select employee_id, city, department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- 과제] 위 문장을, using 으로 변환하라.


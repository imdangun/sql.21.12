desc dual

select lower('SQL Course')
from dual;

select upper('SQL Course')
from dual;

select initcap('SQL cousre')
from dual;

select employee_id, last_name, department_id
from employees
where last_name = 'higgins';

select employee_id, last_name, department_id
from employees
where last_name = 'Higgins';

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'World') from dual;

select substr('HelloWorld', 2, 5) from dual;

select length('HelloWorld') from dual;

select instr('HelloWorld', 'W') from dual;
select instr('HelloWorld', 'a') from dual;

select lpad(salary, 10, '*') from employees;

select rpad(
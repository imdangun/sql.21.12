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

select rpad(salary, 10, '*') from employees;

select replace('JACK and JUE', 'J', 'BL') from dual;

select trim('H' from 'HelloWorldH') from dual;
select trim(' ' from ' Hello World ') from dual;

-- ����] �� ���忡�� ' '�� trim �Ǿ����� Ȯ�ν��� �ֶ�.
select '|' || trim(' ' from ' Hello World ') || '|'
from dual;

select trim (' Hello World ') from dual;

select employee_id, concat(first_name, last_name) name, 
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

-- ����] �� ������ like �� �����϶�.
select employee_id, concat(first_name, last_name) name, 
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%REP';

select last_name
from employees
where substr(last_name, -1, 1) = 'n';

select round(45.926, 2) from dual;
select trunc(45.926, 2) from dual;

select mod(1600, 300) from dual;

select round(45.923, 2), round(45.923, 0), round(45.923), round(45.923, -1)
from dual;

select trunc(45.923, 2), trunc(45.923, 0), trunc(45.923), trunc(45.923, -1)
from dual;

select last_name, salary, mod(salary, 5000)
from employees
where job_id = 'SA_REP';

select sysdate from dual;

select sysdate + 1 from dual;
select sysdate - 1 from dual;

select sysdate - sysdate from dual;

select sysdate + sysdate from dual; -- error
select sysdate * 1 from dual; -- error
select sysdate / 1 from dual; -- error

select last_name, (sysdate - hire_date) 
from employees
where department_id = 90;

-- ����] �� �ֵ��� �ٹ��ߴ� �� ��ȸ�϶�.
select last_name, (sysdate - hire_date) / 7 as weeks
from employees
where department_id = 90;

select months_between('25-FEB-19', '19-DEC-18')
from dual;

select months_between('19-DEC-18', '25-FEB-19')
from dual;

select add_months('19-DEC-18', 1) from dual;

select next_day('07-DEC-21', 'friday') from dual;

select last_day('07-DEC-21') from dual;

select employee_id, hire_date,
    months_between(sysdate, hire_date) tenure,
    add_months(hire_date, 6) review,
    next_day(hire_date, 'friday'),
    last_day(hire_date)
from employees
where months_between(sysdate, hire_date) < 200;


--1.���� ��¥�� ����Ѵ�. Į������ Date �̴�.
 select sysdate "Date"
 from dual;

--2.������� �����ȣ, �̸�, ����, 15.5% �λ�� ����(����: New Salary, ������ ǥ��)�� ����Ѵ�.
select employee_id, last_name, salary, round(salary * 1.155) "New Salary"
from employees;

--3.�� ��������, �λ�� ���ް� �������� ������ ���� Į���� �߰��� ����Ѵ�.
select employee_id, last_name, salary,
    round(salary * 1.155) "New Salary",
    round(salary * 1.155) - salary "Increase"
from employees;

--4.�̸��� J �� A �� M ���� �����ϴ� ������� �̸�, �̸� ���ڼ��� ����Ѵ�.
--  �̸��� ù��° ���ڸ� �빮��, �������� �ҹ��ڷ� ����Ѵ�.
select initcap(last_name) "Name", length(last_name) "Length"
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%'
order by last_name;

--5.������� �̸��� �ټ� �������� ����Ѵ�. �ټӰ����� Į������ MONTHS_WORKED �̴�.
--  �ܿ����ڴ� �ݿø� ó���Ѵ�.
select last_name, round(months_between(sysdate, hire_date)) months_worked
from employees
order by months_worked;

--6.������� �̸��� ������ ����Ѵ�. ������ 15���ڷ� ǥ���Ѵ�. �� �κ��� $ �� ä���.
select last_name, lpad(salary, 15, '$') salary
from employees;

--7.������� �̸��� �Բ� �޿��� �׷����� ����Ѵ�.
--  �̸��� 8 ���ڱ����� ǥ���ϰ�, �޿����� * �� ǥ���Ѵ�. * �ϳ��� $1,000�� ��Ÿ����.
--  Į������ EMPLOYEES_AND_THEIR_SALARIES �̴�.
select rpad(last_name, 8)|| ', ' || rpad(' ', salary / 1000 + 1, '*') 
    EMPLOYEES_AND_THEIR_SALARIES
from employees
order by salary desc;

--8.90�� �μ������� �̸��� �ټ� �ּ��� ����Ѵ�.
--  �ּ��� Į������ TENURE �̴�. �ټ��ּ����� �Ҽ��� ���ϴ� �����Ѵ�.
--  �ټ��ּ� �������� �����Ѵ�.
select last_name, trunc((sysdate - hire_date) / 7) as tenure
from employees
where department_id = 90
order by tenure desc;
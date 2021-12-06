select * from departments; 

select department_id, location_id
from departments;

select location_id, department_id
from departments;

select * from employees;
select * from departments;

select last_name, salary, salary + 300
from employees;

select last_name, salary * 12
from employees;

select last_name, salary, 12 * (salary + 100)
from employees;

select last_name, job_id, commission_pct, 12 * salary * commission_pct
from employees;

select last_name, job_id, salary * 12 + (salary * 12 * commission_pct)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name "Name", salary * 12 "Annual Salary"
from employees;

select last_name || job_id as employee
from employees;

select last_name || null
from employees;

select last_name || commission_pct
from employees;

select last_name || salary
from employees;

select last_name || hire_date
from employees;

select last_name || (salary + 300)
from employees;

select 'hello' from employees;

select last_name || ' is a ' || job_id as "Employee Details"
from employees;

select department_name || q'[ Departments's Manager Id: ]' ||
    manager_id as "Department and Manager"
from departments;

select q'[Department's Manager Id:]' from employees;
select q'<Department's Manager Id:>' from employees;
select q'sDepartment's Manager Id:s' from employees;

select 'Department''s Manager Id:' from employees;

select distinct department_id,manager_id
from employees;

select * from employees;

describe employees

--1.���� ������ ���� �����ϴ°�?
select last_name, job_id, salary as sal
from employees;

--2.���� ������ ���� �����ϴ°�?
select * from job_grades;

--3.���� ���忡�� ������ ã�´�.
select employee_id, last_name, salary * 12 "ANNUAL SALARY"
from employees;

--4.DEPARTMENTS ���̺��� ������ Ȯ���ϰ�, �� ������ ����Ѵ�.
desc departments
select * from departments;

--5.EMPLOYEES ���̺��� ������ Ȯ���Ѵ�.
desc employees;

--6.������� �����ȣ, �̸�, ����, �Ի����� ����Ѵ�.
--  �Ի����� ������ STARTDATE �� �Ѵ�.
select employee_id, last_name, job_id, hire_date startdate
from employees;

--7.EMPLOYEES ���̺���, �������� �ߺ����� �ʰ� ã�´�.
select distinct job_id
from employees;

--8.�����ȣ(����: Emp #), �̸�(����: Employee), ����(����: Job), �Ի���(����: Hire Date)�� ����Ѵ�.
select employee_id "Emp #", last_name "Employee", 
    job_id "Job", hire_date "HireDate"
from employees;

--9.�̸��� ������ �ٿ��� ����Ѵ�. �� ���� comma �� �����Ѵ�.
select last_name || ', ' || job_id "Employee and Title"
from employees;

--10.EMPLOYEES ���̺��� ��� �����͸� �̴´�.
--   �� ���� comma�� �����ؼ�, THE_OUTPUT Į�� �ϳ��� �����.
select employee_id || ',' ||
        first_name || ',' ||
        last_name || ',' ||
        email || ',' ||
        phone_number || ',' ||
        job_id || ',' ||
        manager_id || ',' ||
        hire_date || ',' ||
        salary || ',' ||
        commission_pct || ',' ||
        department_id the_output
from employees;
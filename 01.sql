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

--1.다음 문장이 실행 성공하는가?
select last_name, job_id, salary as sal
from employees;

--2.다음 문장이 실행 성공하는가?
select * from job_grades;

--3.다음 문장에서 에러를 찾는다.
select employee_id, last_name, salary * 12 "ANNUAL SALARY"
from employees;

--4.DEPARTMENTS 테이블의 구조를 확인하고, 그 내용을 출력한다.
desc departments
select * from departments;

--5.EMPLOYEES 테이블의 구조를 확인한다.
desc employees;

--6.사원들의 사원번호, 이름, 직업, 입사일을 출력한다.
--  입사일의 별명은 STARTDATE 로 한다.
select employee_id, last_name, job_id, hire_date startdate
from employees;

--7.EMPLOYEES 테이블에서, 직업들을 중복되지 않게 찾는다.
select distinct job_id
from employees;

--8.사원번호(별명: Emp #), 이름(별명: Employee), 직업(별명: Job), 입사일(별명: Hire Date)을 출력한다.
select employee_id "Emp #", last_name "Employee", 
    job_id "Job", hire_date "HireDate"
from employees;

--9.이름과 직업을 붙여서 출력한다. 각 값은 comma 로 구분한다.
select last_name || ', ' || job_id "Employee and Title"
from employees;

--10.EMPLOYEES 테이블의 모든 데이터를 뽑는다.
--   각 값을 comma로 구별해서, THE_OUTPUT 칼럼 하나로 만든다.
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
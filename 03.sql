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

-- 과제] 위 문장에서 ' '가 trim 되었음을 확인시켜 주라.
select '|' || trim(' ' from ' Hello World ') || '|'
from dual;

select trim (' Hello World ') from dual;

select employee_id, concat(first_name, last_name) name, 
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

-- 과제] 위 문장을 like 로 구현하라.
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

-- 과제] 몇 주동안 근무했는 지 조회하라.
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


--1.오늘 날짜를 출력한다. 칼럼명은 Date 이다.
 select sysdate "Date"
 from dual;

--2.사원들의 사원번호, 이름, 월급, 15.5% 인상된 월급(별명: New Salary, 정수로 표시)을 출력한다.
select employee_id, last_name, salary, round(salary * 1.155) "New Salary"
from employees;

--3.위 쿼리에서, 인상된 월급과 전월급의 차액을 담은 칼럼을 추가로 출력한다.
select employee_id, last_name, salary,
    round(salary * 1.155) "New Salary",
    round(salary * 1.155) - salary "Increase"
from employees;

--4.이름이 J 나 A 나 M 으로 시작하는 사원들의 이름, 이름 글자수를 출력한다.
--  이름은 첫번째 글자만 대문자, 나머지는 소문자로 출력한다.
select initcap(last_name) "Name", length(last_name) "Length"
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%'
order by last_name;

--5.사원들의 이름과 근속 개월수를 출력한다. 근속개월수 칼럼명은 MONTHS_WORKED 이다.
--  잔여일자는 반올림 처리한다.
select last_name, round(months_between(sysdate, hire_date)) months_worked
from employees
order by months_worked;

--6.사원들의 이름과 월급을 출력한다. 월급은 15글자로 표시한다. 빈 부분은 $ 로 채운다.
select last_name, lpad(salary, 15, '$') salary
from employees;

--7.사원들의 이름과 함께 급여액 그래프를 출력한다.
--  이름은 8 글자까지만 표시하고, 급여액은 * 로 표시한다. * 하나가 $1,000를 나타낸다.
--  칼럼명은 EMPLOYEES_AND_THEIR_SALARIES 이다.
select rpad(last_name, 8)|| ', ' || rpad(' ', salary / 1000 + 1, '*') 
    EMPLOYEES_AND_THEIR_SALARIES
from employees
order by salary desc;

--8.90번 부서원들의 이름과 근속 주수를 출력한다.
--  주수의 칼럼명은 TENURE 이다. 근속주수에서 소수점 이하는 내림한다.
--  근속주수 내림차순 정렬한다.
select last_name, trunc((sysdate - hire_date) / 7) as tenure
from employees
where department_id = 90
order by tenure desc;
select employee_id, last_name, job_id, department_id d_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen';

select last_name, hire_date
from employees
where hire_date = '06-feb-08';

select last_name, salary
from employees
where salary <= 3000;

select last_name, job_id
from employees
where job_id <> 'SA_REP';

select last_name, job_id
from employees
where job_id != 'SA_REP';

select last_name, job_id
from employees
where job_id ^= 'SA_REP';

select last_name, salary
from employees
where salary between 2500 and 3500;

select last_name
from employees
where last_name between 'King' and 'Smith';

-- 과제] 동명이인 'King' 을 파악하라.
select first_name, last_name, job_id, department_id
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '01-JAN-02' and '31-DEC-02';

select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);

select employee_id, job_id
from employees
where department_id = 60 or
    department_id = 70;

-- 과제] 위 ~in~ 명령문을 in 을 쓰지 않고 표현하라.
select employee_id, last_name, salary, manager_id
from employees
where manager_id = 100 or
        manager_id = 101 or
        manager_id = 201;

select employee_id, manager_id, department_id
from employees
where last_name in ('Hartstein', 'Vargas');

select employee_id, last_name, hire_date
from employees
where hire_date in ('17-JUN-03', '21-SEP-05');

select first_name
from employees
where first_name like 'S%';

select first_name
from employees
where first_name like '%r';

-- 과제] first_name 에 s가 포함된 사원을 찾아라.
select first_name
from employees
where first_name like '%s%';

-- 과제] 2005년에 입사한 사원을 찾아라.
select last_name, hire_date
from employees
where hire_date like '%05';

select first_name, last_name
from employees
where last_name like 'K___';

-- 과제] last_name 의 두번째 글자가 o 인 사원을 찾아라.
select last_name
from employees
where last_name like '_o%';

select employee_id, last_name, job_id
from employees
where job_id = 'SA_REP';

select employee_id, last_name, job_id
from employees
where job_id like 'SA\_%' escape '\';

select employee_id, last_name, job_id
from employees
where job_id like 'SAe_%' escape 'e';

-- 과제] job_id 에 _R 이 포함된 레코드를 찾아라.
select employee_id, last_name, job_id
from employees
where job_id like '%[_R%' escape '[';

select employee_id, last_name, job_id
from employees
where job_id like '%[_[R%' escape '['; -- error

select last_name, manager_id
from employees
where manager_id = null;

select last_name, manager_id
from employees
where manager_id is null;

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 and
        job_id like '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 or
        job_id like '%MAN%';

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

select last_name, job_id
from employees
where salary not between 10000 and 15000;

select last_name
from employees
where last_name not like '%A%';

select last_name, commission_pct
from employees
where commission_pct is not null;

select last_name, salary
from employees
where manager_id is null and salary > 20000;

-- 과제] 사장 외의 직원들을 찾아라. not 연산자를 이용한다.
select last_name, salary
from employees
where not (manager_id is null and salary > 20000);

select last_name, salary
from employees
where manager_id = null and salary > 20000;

select last_name, salary
from employees
where not (manager_id = null and salary > 20000);

select last_name, job_id, salary
from employees
where job_id = 'SA_REP' or
        job_id = 'AD_PRES' and
        salary > 15000;

select last_name, job_id, salary
from employees
where (job_id = 'SA_REP' or
        job_id = 'AD_PRES') and
        salary > 15000;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

select employee_id, last_name, salary * 12 annsal
from employees
order by annsal;

select last_name, job_id, department_id, hire_date
from employees
order by 3;

select last_name, department_id, salary
from employees
order by department_id, salary desc;

-- 1.$12,000 보다 더 버는 사원들의 이름과 월급을 출력한다.
select last_name, salary
from employees
where salary > 12000;

-- 2.176번 사원의 이름과 부서번호를 출력한다.
select last_name, department_id
from employees
where employee_id = 176;

--3.월급이 $5,000 이상 $12,000 이하가 아닌 사원들의 이름과 월급을 출력한다.
select last_name, salary
from employees
where salary not between 5000 and 12000;

--4.Matos와 Taylor 사원의 이름, 직업, 입사일을 출력한다.
select last_name, job_id, hire_date
from employees
where last_name in ('Matos', 'Taylor');

--5.20번이나 50번 부서원들의 이름과 부서번호를 출력한다.
select last_name, department_id
from employees
where department_id in (20, 50)
order by department_id;

--6.월급이 $5,000 이상 $12,000 이하이고, 
--  20번이나 50번 부서에서 일하는 사원들의 이름과 월급을 출력한다.
--  각 칼럼의 별명은 Employee, Monthly Salary 이다.
select last_name "Employee", salary "Monthly Salary"
from employees
where (salary between 5000 and 12000) and
        department_id in (20, 50);

--7.2003년도에 입사한 사원들의 이름과 입사일을 출력한다.
select last_name, hire_date
from employees
where hire_date like '%03';

--8.매니저가 없는 사원의 이름과 직업을 출력한다.
select last_name, job_id
from employees
where manager_id is null;

--9.커미션을 받는 사원들의 이름, 월급, 커미션율을 출력한다.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3 desc;

--10.이름에서 세번째 글자가 a 인 사원들의 이름을 출력한다.
select last_name
from employees
where last_name like '__a%';

--11.이름에 a 와 e 가 포함된 사원들의 이름을 출력한다.
select last_name
from employees
where last_name like '%a%' and
        last_name like '%e%';

--12.직업이 sales representative 이거나 stock clerk 인 
--   사원들의 이름, 직업, 월급을 출력한다.
--   월급은 2500, 3500, 7000 이 아니어야 한다.
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK') and
        salary not in (2500, 3500, 7000);
        
--13. 커미션율이 20%인 
--    사원들의 이름(별명: Employee), 월급(별명: Monthly Salary), 커미션율을 출력한다.
select last_name "Employee", salary "Monthly Salary", commission_pct
from employees
where commission_pct = .2;
select avg(salary), max(salary), min(salary), sum(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

select count(*)
from employees;

select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;

select avg(commission_pct)
from employees;

-- 과제] 전 사원의 평균 commission_pct 을 찾아라.
select avg(nvl(commission_pct, 0))
from employees;

select salary from employees order by salary;

select avg(salary)
from employees;

select avg(distinct salary)
from employees;

select avg(all salary)
from employees;

-- 과제] 직원이 배치된 부서 개수를 찾아라.
select department_id from employees;
select count(distinct department_id)
from employees;

select count(department_id)
from departments;

select department_id, round(avg(salary))
from employees
group by department_id
order by department_id;

select round(avg(salary))
from employees
group by department_id
order by department_id;

select department_id, job_id, sum(salary)
from employees
where department_id > 40
group by department_id, job_id
order by department_id;

select count(last_name)
from employees;

select department_id, count(last_name)
from employees; -- error

select department_id, count(last_name)
from employees
group by department_id;

select department_id, job_id, count(last_name)
from employees
group by department_id; -- error

select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000;

select department_id, max(salary)
from employees
where max(salary) > 10000
group by department_id; -- error

select department_id, max(salary)
from employees
group by department_id
having department_id > 90;

select department_id, max(salary)
from employees
where department_id > 90
group by department_id;

select job_id, sum(salary) 
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by 2;

select max(avg(salary))
from employees
group by department_id;

select sum(max(avg(salary)))
from employees
group by department_id; -- error

select max(avg(salary))
from employees; -- error

select department_id, max(avg(salary))
from employees
group by department_id; -- error

select max(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, round(avg(salary))
from employees; -- error


-- 다음 세 문장이 맞는지 판별한다.
-- 1. 그룹함수는 row들 그룹당 결과값 하나를 리턴한다.
-- True

-- 2. 그룹함수는 null값을 계산한다.
-- False

-- 3. where절에서 true인 row들만, 그룹함수가 사용한다.
-- True 

-- HR 부서에서 다음 보고서가 필요하다.
-- 4. 사원들의 최고월급, 최소월급, 월급함계, 월급평균을 찾는다.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees;

-- 5. 직업별로 최고월급, 최소월급, 월급함계, 월급평균을 찾는다.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees
group by job_id;

-- 6. 직업별 사원수를 출력한다.
select job_id, count(*)
from employees
group by job_id;

-- 7. 매니저 수를 출력한다.
select count(distinct manager_id)
from employees;

--8. 최고월급과 최소월급 차액을 출력한다.
select max(salary) - min(salary)
from employees;

--9. 매니저별 담당 직원들 중 최소월급을 찾는다.
--   최소월급이 $6000 초과만 보고서에 출력한다.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--10. 2000년, 2001년, 2002년, 2003년도별 입사자 수를 찾는다.
select sum(decode(to_char(hire_date, 'yyyy'), '2000', 1, 0)) "2000",
    sum(decode(to_char(hire_date, 'yyyy'), '2001', 1, 0)) "2001",
    sum(decode(to_char(hire_date, 'yyyy'), '2002', 1, 0)) "2002",
    sum(decode(to_char(hire_date, 'yyyy'), '2003', 1, 0)) "2003"
from employees;

select count(case when hire_date like '%00' then 1
                    else null end) "2000", 
        count(case when hire_date like '%01' then 1
                    else null end) "2001", 
        count(case when hire_date like '%02' then 1
                    else null end) "2002", 
        count((case when hire_date like '%03' then 1
                    else null end)) "2003"
from employees;

--11. 직업별/부서별 월급합을 구한다.
-- 20, 50, 80, 90번 부서만을 조사한다.
select job_id, 
    sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80",
    sum(decode(department_id, 90, salary)) "90"
from employees
group by job_id;
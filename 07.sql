select last_name, salary
from employees
where salary > ( select salary
                from employees
                where last_name = 'Abel');

select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
                from employees
                where last_name = 'Ernst');

select last_name, job_id, salary
from employees
where salary = (select min(salary)
                from employees);

select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);

select job_id, avg(salary)
from employees
group by job_id
having avg(salary) = (select min(avg(salary))
                        from employees
                        group by job_id);

select employee_id, last_name
from employees
where salary = (select min(salary)
                from employees
                group by department_id); -- error

select last_name, salary, department_id
from employees
where salary in (select min(salary)
                from employees
                group by department_id);

select last_name, salary, department_id
from employees
where salary =any (select min(salary)
                from employees
                group by department_id);

select employee_id, last_name, job_id, salary
from employees
where salary <any (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary <all (select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

-- subquery return 값이 null인 경우
select last_name, salary, department_id
from employees
where salary in (select salary
                    from employees
                    where employee_id = 1000);
                    
select last_name, salary, department_id
from employees
where salary =any (select salary
                    from employees
                    where employee_id = 1000);
                    
select last_name, salary, department_id
from employees
where salary =all (select salary
                    from employees
                    where employee_id = 1000); 
                    
-- exists                    
select count(*) from departments;

select count(*) 
from departments d
where exists (select * 
            from employees e
            where e.department_id = d.department_id);

select count(*) 
from departments d
where not exists (select * 
            from employees e
            where e.department_id = d.department_id);

-- subquery return 값 중의 일부가 null인 경우
select emp.last_name
from employees emp
where emp.employee_id in (select mgr.manager_id
                            from employees mgr);

select emp.last_name
from employees emp
where emp.employee_id not in (select mgr.manager_id
                            from employees mgr); 

-- 과제] not in 을 all 로 표현하라.
select emp.last_name
from employees emp
where emp.employee_id <>all (select mgr.manager_id
                            from employees mgr);  


--1.Abel과 같은 부서에서 일하는 동료들의 이름과 입사일을 출력한다.
select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and last_name <> 'Abel';                        

--2.회사 평균 월급보다 많이 버는 사원들의 사원번호, 이름, 월급을 출력한다.
--  월급 순으로 정렬한다.
select employee_id, last_name, salary
from employees
where salary > (select avg(salary) from employees)
order by salary;
 
--3.이름에 u 글자가 있는 사원과, 같은 부서에서 일하는 사원들의 사원번호,이름을 출력한다.
select employee_id, last_name
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%');

--4.부서 지역 번호가 1700인 부서에서 일하는 사원들의 이름, 부서번호, 직업을 출력한다.
select last_name, department_id, job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700);

--5.Kochhar 에게 보고하는 사원들의 이름, 월급을 출력한다.
select last_name, salary
from employees
where manager_id = (select employee_id
                    from employees
                    where last_name = 'Kochhar');

--6.IT 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력한다.
select department_id, last_name, job_id
from employees
where department_id in (select department_id
                        from departments
                        where department_name = 'IT');

--7.60번 부서의 일부 사원보다 급여가 많은 사원들의 이름을 출력한다.
select last_name
from employees
where salary >any (select salary
                    from employees
                    where department_id = 60);

--8.회사 평균 월급보다 급여가 많고, 
--  이름에 u가 포함된 사원과 같은 부서에 일하는 사원들의 사원번호, 이름, 월급을 출력한다.
select employee_id, last_name, salary
from employees
where department_id in (select department_id
                        from employees
                        where last_name like '%u%')
and salary > (select avg(salary)
                from employees);
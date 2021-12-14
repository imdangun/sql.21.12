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

-- ����] �� ����� ��� commission_pct �� ã�ƶ�.
select avg(nvl(commission_pct, 0))
from employees;

select salary from employees order by salary;

select avg(salary)
from employees;

select avg(distinct salary)
from employees;

select avg(all salary)
from employees;

-- ����] ������ ��ġ�� �μ� ������ ã�ƶ�.
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


-- ���� �� ������ �´��� �Ǻ��Ѵ�.
-- 1. �׷��Լ��� row�� �׷�� ����� �ϳ��� �����Ѵ�.
-- True

-- 2. �׷��Լ��� null���� ����Ѵ�.
-- False

-- 3. where������ true�� row�鸸, �׷��Լ��� ����Ѵ�.
-- True 

-- HR �μ����� ���� ������ �ʿ��ϴ�.
-- 4. ������� �ְ����, �ּҿ���, �����԰�, ��������� ã�´�.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees;

-- 5. �������� �ְ����, �ּҿ���, �����԰�, ��������� ã�´�.
select max(salary), min(salary), sum(salary), round(avg(salary))
from employees
group by job_id;

-- 6. ������ ������� ����Ѵ�.
select job_id, count(*)
from employees
group by job_id;

-- 7. �Ŵ��� ���� ����Ѵ�.
select count(distinct manager_id)
from employees;

--8. �ְ���ް� �ּҿ��� ������ ����Ѵ�.
select max(salary) - min(salary)
from employees;

--9. �Ŵ����� ��� ������ �� �ּҿ����� ã�´�.
--   �ּҿ����� $6000 �ʰ��� ������ ����Ѵ�.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

--10. 2000��, 2001��, 2002��, 2003�⵵�� �Ի��� ���� ã�´�.
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

--11. ������/�μ��� �������� ���Ѵ�.
-- 20, 50, 80, 90�� �μ����� �����Ѵ�.
select job_id, 
    sum(decode(department_id, 20, salary)) "20",
    sum(decode(department_id, 50, salary)) "50",
    sum(decode(department_id, 80, salary)) "80",
    sum(decode(department_id, 90, salary)) "90"
from employees
group by job_id;
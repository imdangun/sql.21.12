select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

-- 과제] 176, 200번 사원의 현재 직업이 과거 직업과 같다는 걸, 조회하라.
select e.employee_id, e.job_id current_job, j.job_id old_job
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id
and e.employee_id in (176, 200);

select employee_id
from employees
minus
select employee_id
from job_history;

select location_id, department_name
from departments
union
select location_id, state_province
from locations;

-- 과제] 위 문장에서, service 관점의 문제를 해결하라.
select location_id, department_name, null state
from departments
union
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id
from job_history; -- error

-- 과제] 위 문장의, 에러를 해결하라.
select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by job_id;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by 2;
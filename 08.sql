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

-- ����] 176, 200�� ����� ���� ������ ���� ������ ���ٴ� ��, ��ȸ�϶�.
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

-- ����] �� ���忡��, service ������ ������ �ذ��϶�.
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

-- ����] �� ������, ������ �ذ��϶�.
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
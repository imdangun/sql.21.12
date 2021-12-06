select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id, department_id
from employees
intersect
select employee_id, job_id, department_id
from job_history;
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

-- ����] �������� 'King' �� �ľ��϶�.
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

-- ����] �� ~in~ ��ɹ��� in �� ���� �ʰ� ǥ���϶�.
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

-- ����] first_name �� s�� ���Ե� ����� ã�ƶ�.
select first_name
from employees
where first_name like '%s%';

-- ����] 2005�⿡ �Ի��� ����� ã�ƶ�.
select last_name, hire_date
from employees
where hire_date like '%05';

select first_name, last_name
from employees
where last_name like 'K___';

-- ����] last_name �� �ι�° ���ڰ� o �� ����� ã�ƶ�.
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

-- ����] job_id �� _R �� ���Ե� ���ڵ带 ã�ƶ�.
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

-- ����] ���� ���� �������� ã�ƶ�. not �����ڸ� �̿��Ѵ�.
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

-- 1.$12,000 ���� �� ���� ������� �̸��� ������ ����Ѵ�.
select last_name, salary
from employees
where salary > 12000;

-- 2.176�� ����� �̸��� �μ���ȣ�� ����Ѵ�.
select last_name, department_id
from employees
where employee_id = 176;

--3.������ $5,000 �̻� $12,000 ���ϰ� �ƴ� ������� �̸��� ������ ����Ѵ�.
select last_name, salary
from employees
where salary not between 5000 and 12000;

--4.Matos�� Taylor ����� �̸�, ����, �Ի����� ����Ѵ�.
select last_name, job_id, hire_date
from employees
where last_name in ('Matos', 'Taylor');

--5.20���̳� 50�� �μ������� �̸��� �μ���ȣ�� ����Ѵ�.
select last_name, department_id
from employees
where department_id in (20, 50)
order by department_id;

--6.������ $5,000 �̻� $12,000 �����̰�, 
--  20���̳� 50�� �μ����� ���ϴ� ������� �̸��� ������ ����Ѵ�.
--  �� Į���� ������ Employee, Monthly Salary �̴�.
select last_name "Employee", salary "Monthly Salary"
from employees
where (salary between 5000 and 12000) and
        department_id in (20, 50);

--7.2003�⵵�� �Ի��� ������� �̸��� �Ի����� ����Ѵ�.
select last_name, hire_date
from employees
where hire_date like '%03';

--8.�Ŵ����� ���� ����� �̸��� ������ ����Ѵ�.
select last_name, job_id
from employees
where manager_id is null;

--9.Ŀ�̼��� �޴� ������� �̸�, ����, Ŀ�̼����� ����Ѵ�.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3 desc;

--10.�̸����� ����° ���ڰ� a �� ������� �̸��� ����Ѵ�.
select last_name
from employees
where last_name like '__a%';

--11.�̸��� a �� e �� ���Ե� ������� �̸��� ����Ѵ�.
select last_name
from employees
where last_name like '%a%' and
        last_name like '%e%';

--12.������ sales representative �̰ų� stock clerk �� 
--   ������� �̸�, ����, ������ ����Ѵ�.
--   ������ 2500, 3500, 7000 �� �ƴϾ�� �Ѵ�.
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK') and
        salary not in (2500, 3500, 7000);
        
--13. Ŀ�̼����� 20%�� 
--    ������� �̸�(����: Employee), ����(����: Monthly Salary), Ŀ�̼����� ����Ѵ�.
select last_name "Employee", salary "Monthly Salary", commission_pct
from employees
where commission_pct = .2;
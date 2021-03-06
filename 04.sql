select hire_date
from employees
where hire_date = '17-jun-03';

select salary
from employees
where salary = '7000';

select hire_date || ''
from employees;

select salary || ''
from employees;

select to_char(sysdate, 'yyyy/mm/dd') from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)') from dual;
select to_char(sysdate, 'Year Month Ddsp Day(Dy)') from dual;

select to_char(sysdate, 'hh24:mi:ss am') from dual;

select to_char(sysdate, 'DD "of" Month') from dual;

-- fill mode
select last_name, to_char(hire_date, 'fmDD Month YY') as hiredate
from employees;

select to_char(salary, '$99,999.99') salary
from employees
where last_name = 'Ernst';

select '|' || to_char(12.12, '9999.999') || '|' from dual;
select '|' || to_char(12.12, '0000.000') || '|' from dual;

select to_char(1237, 'L9999') from dual;

select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'Mon dd, yyyy'); 

select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'fxMon  dd, yyyy'); -- error

select last_name, hire_date
from employees
where hire_date = to_date('May 24, 2007', 'fxmon  dd rr'); -- error

select last_name, to_char(hire_date, 'dd-Mon-yyyy')
from employees
where hire_date < to_date('01-jan-03', 'dd-mon-rr');

select to_number('$1234.12', '$9999.00') from dual;

select to_number('1237') from dual;
select to_char(1234) from dual;

select to_char(sysdate) from dual;
select to_date('07-mar-07') from dual;

select last_name, upper(concat(substr(last_name, 1, 8), '_us'))
from employees
where department_id = 60;

select last_name, salary, nvl(commission_pct, 0),
    (salary * 12) + (salary * 12 * nvl(commission_pct, 0)) an_sal
from employees;

select last_name, salary, commission_pct,
    nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees
where department_id in (50, 80);

select last_name, salary, commission_pct,
    nvl2(commission_pct, 'SAL+COMM', 0) income
from employees
where department_id in (50, 80);

select first_name, length(first_name) "expr1",
    last_name, length(last_name) "expr2",
    nullif(length(first_name), length(last_name)) result
from employees;

select last_name, employee_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None') result
from employees;

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'ST_CLERK' then 1.15 * salary
                when 'SA_REP' then 1.20 * salary
    else salary end revised_salary
from employees;

select (case job_id when '1' then 1
                    when '2' then 2
                    else 0
        end) grade
from employees;

select (case salary when 1 then '1'
                    when 2 then '2'
                    else '0'
        end) grade
from employees;

select (case salary when '1' then '1'
                    when '2' then '2'
                    else '0'
        end) grade
from employees; -- error

select (case salary when 1 then '1'
                    when 2 then '2'
                    else 0
        end) grade
from employees; -- error

select (case salary when 1 then 1
                    when 2 then '2'
                    else '0'
        end) grade
from employees; -- error

select last_name, salary,
    (case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'good'
        else 'excellent'
    end) qualified_salary
from employees;
        
select last_name, job_id, salary,
    decode(job_id, 'IT_PROG', 1.10 * salary,
                    'ST_CLERK', 1.15 * salary,
                    'SA_REP', 1.20 * salary,
            salary) revised_salary
from employees;

select last_name, salary,
    decode(trunc(salary /2000),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
            0.45) tax_rate
from employees
where department_id = 80;

select decode(salary, 'a', 1) from employees;
select decode(salary, 'a', 1, 0) from employees;
select decode(job_id, 1, 1) from employees; -- error

select decode(hire_date, 'a', 1) from employees;
select decode(hire_date, 1, 1) from employees; -- error


-- 1. ???? ???????? ??????.
--   <????> earns <????> monthly but wants <????3??>.
select last_name || ' earns ' ||
    to_char(salary, 'fm$99,999.00') || ' monthly but wants ' ||
    to_char(salary * 3, 'fm$99,999.00') || '.' "Dreams Salaries"
from employees;

--2. ????, ??????, ???????????? ????????. 
--   ??????????(????:REVIEW)?? ?????? ?? 6???? ?? ?????? ??????????. 
--   ?????? Monday, the Thirsty-First of July, 2000 ???? ????????.
select last_name, hire_date,
    to_char(next_day(add_months(hire_date, 6), 'monday'),
        'fmDay, "the" Ddspth "of" Month, yyyy') review
from employees;

--3. ????, ??????, ????????(????: DAY)?? ?????????? ?????????? ????????.
select last_name, hire_date, to_char(hire_date, 'day')
from employees
order by to_char(hire_date - 1, 'd');

select last_name, hire_date, to_char(hire_date, 'day') hire_day,
    case to_char(hire_date, 'fmday') 
        when 'monday' then 1
        when 'tuesday' then 2
        when 'wednesday' then 3
        when 'thursday' then 4
        when 'friday' then 5
        when 'saturday' then 6
        when 'sunday' then 7
    end hire_day_num
from employees
order by hire_day_num;

-- 4. ????, ?????????? ????????. ???? ???????? ??????, No Commission, ?????? ????????.
select last_name, nvl(to_char(commission_pct), 'No Commission') comm
from employees;

-- 5. decode ?????? ????, ???????? ?????? ???????? ?????? ????????.
--  job              grade
--  AD_PRES            A
--  ST_MAN             B
--  IT_PROG            C
--  SA_REP             D
--  ST_CLERK           E
--  None of the above  0
select job_id, decode(job_id,
    'AD_PRES', 'A',
    'ST_MAN', 'B',
    'IT_PROG', 'C',
    'SA_REP', 'D',
    'ST_CLERK', 'E', '0') grade
from employees;

--6. ?? ?????? case ???????? ????????.
select job_id, case job_id
    when 'AD_PRES' then 'A'
    when 'ST_MAN' then 'B'
    when 'IT_PROG' then 'C'
    when 'SA_REP' then 'D'
    when 'ST_CLERK' then 'E'
    else '0' end grade
from employees;
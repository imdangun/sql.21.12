drop table emp;
drop table dept;

create table emp (
employee_id number(6),
first_name varchar2(20),
last_name varchar2(25),
email varchar2(25),
phone_number varchar2(20),
hire_date date,
job_id varchar2(10),
salary number(8),
commission_pct number(2, 2),
manager_id number(6),
department_id number(4));

create table dept(
department_id number(4),
department_name varchar2(30),
manager_id number(6),
location_id number(4));

insert into dept(department_id, department_name, manager_id, location_id)
values(300, 'Public Relation', 100, 1700);

insert into dept(department_id, department_name)
values(310, 'Purchaing');

-- ����] ���ڵ� 2���� insert ���� �ߴ� ��, Ȯ���϶�.
select * from dept;

commit;

insert into dept
values(320, 'Finance', null, null);

commit;

select * from dept;

insert into emp(employee_id, first_name, last_name,
                email, phone_number, hire_date,
                job_id, salary, commission_pct,
                manager_id, department_id)
values(300, 'Louis', 'Pop',
    'Pop@gmail.com', '010-378-1278', sysdate,
    'AC_ACCOUNT', 6900, null,
    205, 110);

select * from emp;

insert into emp
values(310, 'Jark', 'Klein',
    'Klein@gmail.com', '010-753-4635', to_date('FEB 8, 2025', 'MON DD, yyyy'),
    'IT_PROG', 8000, null,
    120, 190);
    
insert into emp
values(320, 'Terry', 'Benard',
    'Benard@gmail.com', '010-632-0972', '02-NOV-25',
    'AD_PRES', 5000, .2,    
    100, 30);   

commit;

drop table sa_reps;
create table sa_reps(
id number(6),
name varchar2(25),
salary number(8, 2),
commission_pct number(2, 2));

insert into sa_reps(id, name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

select * from sa_reps;    
rollback;
select * from sa_reps;

insert into sa_reps(id, name, salary, commission_pct)
    select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

select * from sa_reps;
commit;
select * from sa_reps;

declare
    base number(6) := 400;
begin
    for i in 1..10 loop
        insert into sa_reps(id, name, salary, commission_pct)
        values(base + i, 'n' || (base + i), base * i, i * 0.01);
    end loop;
end;
/

-- ����] �� procedure �� insert �� �����͸��� ��ȸ�϶�.
select * from sa_reps  
where id > 400;

select employee_id, salary, job_id
from emp
where employee_id = 300;

update emp
set salary = 9000, job_id = null
where employee_id = 300;

commit;

update emp
set job_id = (select job_id
                from employees
                where employee_id = 205),
    salary = (select salary
                from employees
                where employee_id = 205)
where employee_id = 300;

select job_id, salary
from emp
where employee_id = 300;

rollback;

update emp
set (job_id, salary) = (
    select job_id, salary
    from employees
    where employee_id = 205)
where employee_id = 300;

commit;

select * from dept;

delete from dept
where department_id = 300;

select * from dept;

rollback;

select * from dept;

delete dept
where department_id = 300;

commit;

select employee_id, department_id
from emp
where department_id = 190;

delete emp
where department_id = (
    select department_id
    from departments
    where department_name = 'Contracting');

select * from emp
where department_id = 190;

commit;


--���� ��ɹ��� �����Ͽ�, my_employees ���̺��� �����.
drop table my_employees;
create table my_employees(
  id number(4) primary key,
  last_name varchar2(25),
  first_name varchar2(25),
  userid varchar2(8),
  salary number(9,2));
 

--1.my_employee ���̺��� ������ ����.
desc my_employees  

--���� ǥ�� ����Ÿ�� my_employee ���̺� �߰��Ѵ�.
--2. ù��° record�� �߰��Ѵ�. insert ���� Į������ �������� �ʴ´�.
insert into my_employees
values (1, 'Patel', 'Ralph', 'rpatel', 895);
 
--3.insert ���� Į������ �����ؼ�, �ι�° ���ڵ带 �߰��Ѵ�.
insert into my_employees(id, last_name, first_name, userid, salary)
values(2, 'Dancs', 'Bettry', 'bdancs', 860); 

--4.���ݲ� �߰��� ����Ÿ�� Ȯ���Ѵ�.
select *
from my_employees;
 
--5.������ �� row ���� �߰��Ѵ�.
insert into my_employees values(3, 'Biri', 'Ben', 'bbiri', 1100);
insert into my_employees values(4, 'Newman', 'Chad', 'cnewman', 750);
insert into my_employees values(5, 'Ropeburn', 'Adurey', 'aropebur', 1550);

--6.���ݱ����� �߰� �۾��� Ȯ���Ѵ�.
commit;

--7.ID 3 �� ����� �̸��� Drexler�� �����Ѵ�.
update my_employees
set last_name = 'Drexler'
where id = 3;

--8.�޿��� 900 ���� ���� �޴� ������� ������ 1000 ���� �����Ѵ�.
update my_employees
set salary = 1000
where salary < 900;

--9.Dancs �� �����Ѵ�.
delete my_employees
where last_name = 'Dancs';

--10.step10 �̸�����, savepoint�� �����.
savepoint step10;

--11.my_employee �� ��� �����͸� �����Ѵ�.
delete my_employees;

--12.step10 �������� rollback �Ѵ�.
rollback to step10;

--13.transaction�� �����Ѵ�.
commit;
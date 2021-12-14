drop view empvu80;

create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;

desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);

create or replace view salvu50 as
    select employee_id emp_id, last_name, salary * 12 ann_sal, department_id
    from employees
    where department_id = 50;

desc salvu50

select * from salvu50;

drop table teams;
drop view team50;

create table teams as
    select department_id team_id, department_name team_name
    from departments;

create view team50 as
    select * from teams
    where team_id = 50;

select * from teams;
select count(*) from teams;

select * from team50;

insert into team50
values(300, 'Marketing');
select count(*) from teams;

create or replace view team50 as
    select * from teams
    where team_id = 50
    with check option;

insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support'); -- error, with check option

create or replace view empvu10(employee_number, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;

desc empvu10

insert into empvu10 values(501, 'abel', 'Sales'); -- error, with read only

--
drop sequence team_teamid_seq;

create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams values(team_teamid_seq.nextval, 'Marketing');
select * from teams 
where team_id = 3;

update teams
set team_id = team_teamid_seq.nextval
where team_id = 3;

select * from teams
where team_id <= 4;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20
    nocache
    nocycle;

select x_xid_seq.nextval from dual;

--

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select employee_id, last_name
from employees
where last_name = 'Ernst';

select last_name, rowid
from employees;

select index_name, index_type, table_owner, table_name
from user_indexes;

--
drop synonym team;

create synonym team
for departments;

select * from team;

--
-- 1. EMPLOYEES ���̺��� �Ϻ� ����Ÿ�� ���߰� �ʹ�.
--    �����ȣ, �̸�, �μ���ȣ�� ������ �� EMPLOYEES_VU �� �����.
--    �̸� Į���� EMPLOYEE �� �Ѵ�.
 

--2. EMPLOYEES_VU�� ��ȿ���� Ȯ���Ѵ�. ���� ������ �̾ƺ���.

 

--3. EMPLOYEES_VU �� �̿��ؼ�, ������� �̸�, �μ���ȣ�� ����Ѵ�.

 

--4. 50�� �μ������� �����ȣ, �̸�, �μ���ȣ�� DEPT50 �並 �����.
--   �� Į������ EMPNO, EMPLOYEE, DEPTNO �� �Ѵ�.
--   �並 ���ؼ� ������� �ٸ� �μ��� ���ġ ���� �ʵ��� �Ѵ�.



--5. DEPT50 ���� ������ ����.
 

--6. �並 �����Ѵ�. Matos�� 80�� �μ��� ��ġ�� ����.
--   with check option �������� ������ ������ �߻��� ���̴�.

 

--7. DEPT ���̺��� primary key column���� ���� sequence�� �ʿ��ϴ�.
--   �������� 300���� �����Ͽ�, �ִ� 1000���� ���� �� �ִ�. 10�� �����Ѵ�.
--   ������ �̸��� DEPT_ID_SEQ �̴�.


--8. �� �������� �̿��ؼ� Education �μ��� �߰��Ѵ�.


--9. DEPT ���̺��� NAME Į���� ���� index�� �����.


--10. EMPLOYEES ���̺��� synonum EMPS �� �����.
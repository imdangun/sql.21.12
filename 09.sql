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

-- 과제] 레코드 2건이 insert 성공 했는 지, 확인하라.
select * from dept;

commit;
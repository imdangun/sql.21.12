drop table hire_dates;

create table hire_dates(
id number(8),
hire_date date default sysdate);

select tname
from tab;

-- 과제] 결과에서 쓰레기는 제외토록, 위 문장을 고쳐라.
select tname
from tab
where tname not like 'BIN%';

insert into hire_dates values(1, to_date('21-DEC-25'));
insert into hire_dates values(2, null);
insert into hire_dates(id) values(3);

commit;

select * from hire_dates;


-- you user
drop table depts cascade constraints;
drop table emps cascade constraints;

create table depts( 
department_id number(3) constraint depts_deptid_pk primary key, 
department_name varchar2(20));

create table emps( 
employee_id number(3) primary key,
emp_name varchar2(10) constraint emps_empid_nn not null,
email varchar2(20),
salary number(6) constraint emps_sal_ck check(salary > 1000),
department_id number(3),
constraint emps_email_uk unique(email),        
constraint emps_deptid_fk foreign key(department_id)
    references depts(department_id));
    
desc user_constraints; 

select constraint_name, constraint_type, table_name
from user_constraints;

insert into depts values(100, 'Development');
insert into emps values(500, 'musk', 'musk@gmail.com', 5000, 100);
commit;
delete depts; 

insert into depts values(100, 'Marketing'); --error uk
insert into depts values(null, 'Marketing'); --error pk
insert into emps values(501, null, 'good@gmail.com', 6000, 100); --error nn
insert into emps values(501, 'label', 'musk@gmail.com', 6000, 100); --error uk
insert into emps values(501, 'abel', 'good@gmail.com', 6000, 200); --error fk

drop table employees cascade constraints;

create table employees(
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                    constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6) constraint emp_managerid_fk references employees(employee_id),
department_id number(4) constraint emp_deptid_fk references hr.departments(department_id));

drop table gu cascade constraints;
drop table dong cascade constraints;
drop table dong2 cascade constraints;

create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);

create table dong (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade); 

create table dong2 (
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);

insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼성동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

-- 과제] dong 의 데이터를 dong2 에 채워 넣어라.
insert into dong2
select * from dong;

delete gu
where gu_id = 100;

select * from dong;
select * from dong2;
commit;

drop table a cascade constraints;
drop table b cascade constraints;

create table a(
aid number(1) constraint a_aid_pk primary key);

create table b(
bid number(2),
aid number(1),
constraint b_aid_fk foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(31, 9); -- error, fk

alter table b disable constraint b_aid_fk;
insert into b values(31, 9);


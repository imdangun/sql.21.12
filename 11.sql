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
-- 1. EMPLOYEES 테이블에서 일부 데이타를 감추고 싶다.
--    사원번호, 이름, 부서번호로 구성된 뷰 EMPLOYEES_VU 를 만든다.
--    이름 칼럼은 EMPLOYEE 로 한다.
 

--2. EMPLOYEES_VU가 유효한지 확인한다. 뷰의 내용을 뽑아본다.

 

--3. EMPLOYEES_VU 를 이용해서, 사원들의 이름, 부서번호를 출력한다.

 

--4. 50번 부서원들의 사원번호, 이름, 부서번호로 DEPT50 뷰를 만든다.
--   각 칼럼명은 EMPNO, EMPLOYEE, DEPTNO 로 한다.
--   뷰를 통해서 사원들이 다른 부서로 재배치 되지 않도록 한다.



--5. DEPT50 뷰의 구조를 본다.
 

--6. 뷰를 시험한다. Matos를 80번 부서로 배치해 본다.
--   with check option 제약조건 때문에 에러가 발생할 것이다.

 

--7. DEPT 테이블의 primary key column으로 사용될 sequence가 필요하다.
--   시퀀스는 300에서 시작하여, 최대 1000까지 뽑을 수 있다. 10씩 증가한다.
--   시퀀스 이름은 DEPT_ID_SEQ 이다.


--8. 위 시퀀스를 이용해서 Education 부서를 추가한다.


--9. DEPT 테이블의 NAME 칼럼에 대해 index를 만든다.


--10. EMPLOYEES 테이블의 synonum EMPS 를 만든다.
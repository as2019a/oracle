-- [inner join]
-- [1. where]
-- 사원의 이름과 그 사원이 소속되어있는 부서의 이름
select first_name, e.department_id, department_name 
from employees e, departments d where e.department_id = d.department_id;
-- 부서명과 그 부서의 건물이 위치해있는 도시명
select department_name from departments;
select city from locations;
desc departments;
desc locations;
select department_name, city from departments d, locations l
where d.location_id = l.location_id;
-- 도시명과 그도시가 위치하고 있는 국가명 출력
desc locations;
desc countries;
select city, country_name from locations l, countries c
where l.country_id = c.country_id;

select first_name, city from employees e, locations l, departments d
where e.department_id = d.department_id and d.location_id = l.location_id;

-- 실습 사원의 이름과 사원이 존재하는 부서명, 도시명과 그 도시가 존재하는 국가(4개)
desc employees;
desc departments;
desc locations;
desc countries;
select first_name, department_name, city, country_name 
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id and d.location_id = l.location_id
and l.country_id = c.country_id; -- 4개 플롯트 join에서는 and가 2번 연결된다.

-- [2. join]
-- [inner join]
select first_name, department_name
from employees e inner join departments d
on e.department_id = d.department_id;
-- 실습 : 부서명과 부서가 위치하고 있는 도시의 이름과 거리명을 조회
select department_name, city, street_address
from departments d inner join locations l
on d.location_id = l.location_id;

select first_name, department_name, city
from employees e inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id;

-- [outer join]
-- [full outer join]
select first_name, department_name
from employees e full outer join departments d
on e.department_id = d.department_id;
-- 실습 : 부서명과 부서장의 이름을 조회하되 부서장이 없는 부서 출력
select department_name, first_name
from departments d full outer join employees e
on d.manager_id = e.manager_id;

-- [left outer join, right outer join]
select first_name, department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

select first_name, department_name
from departments d left outer join employees e
on e.department_id = d.department_id;

select first_name, department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

-- [self join]
select first_name, manager_id from employees;
select e1.first_name "사원 이름", e1.phone_number "사원 전화번호", 
        e2.first_name "매니저 이름", e2.phone_number "매니저 전화번호"
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

-- [none-equi join]
create table tax(
    tax_id number primary key,
    max number not null,
    min number not null,
    pct number(2,2)
);

insert into tax values(1, 30000, 20000,0.3);
insert into tax values(2, 20000, 10000,0.2);
insert into tax values(3, 10000, 0,0.1);
select * from tax;

select employee_id, first_name, salary, salary*pct
from employees e, tax t
where e.salary > t.min and e.salary < t.max;

-- [SELECT - select]
-- [값으로 사용]
select avg(salary) from employees;
select first_name, salary, 6461.83 from employees;

select first_name, salary, trunc((select avg(salary) from employees), 2) 
평균월급
from employees;

-- [테이블로 사용(join)]
select first_name, (select department_name from departments d
where e.department_id = d.department_id)
from employees e;

-- [SELECT - from : 테이블]
select first_name, salary from employees;
select 이름 from (select first_name 이름, salary 월급 
from employees);

select department_name, city 
from departments d, (
    select city, location_id from locations 
    where country_id = 'US'
) l
where d.location_id = l.location_id;

select department_name, city
from departments d, locations l
where d.location_id = l.location_id and l.country_name = 'US';
-- [SELECT - where : 값으로 사용]
select salary from employees where employee_id = 150;
-- 150번 사원과 같은 월급을 받는 사원들의 이름
select first_name from employees where salary = 10000;
select first_name from employees where salary = 
(select salary from employees where employee_id = 150);
-- 실습 : 원급이 직원들의 평균월급보다 많이 받는 사원들의 이름을 출력하시오.
select first_name, salary, (select avg(salary) 
from employees) from employees where salary > (select avg(salary) 
from employees);

-- 실습 : Bruce와 같은 부서에서 근무하고 있는 사원들의 이름을 출력하시오.
select first_name from employees where department_id = 
(select department_id from employees where first_name = 'Bruce');
-- =, in, like, between 사용가능
select first_name from employees where department_id in(
(select department_id from employees where first_name = 'Steven'));
-- 실습 : 137번 사원의 월급과 같거나 크고, 149번 사원의 월급과 작거나 같은
-- 월급을 받는 사원들의 이름을 조회하시오
select * from employees; -- 137 : Renske, 149 : Eleni -> 월급
select first_name from employees where salary between
(select salary from employees where employee_id = 137)
and
(select salary from employees where employee_id = 149); 

-- [SELECT - having : 값으로 사용]
-- 직종과 해당 직종을 가진 사원들의 평균월급
-- 평균 월급이 Bruce라는 사원의 월급보다 클때
select job_id, avg(salary) from employees group by job_id
having avg(salary) > (select salary from employees
where first_name = 'Bruce');

-- [SELECT : order by : 테이블]
-- 사원테이블에서 부서아이디, 이름을 조회하되 부서명으로 정리
select department_id, first_name from employees e
order by(select department_name from departments d
where e.department_id = d.department_id);
select * from departments;

-- [INSERT - values : 값으로 사용]
drop table dept;
create table dept as select * from departments;
select * from dept;
insert into dept values(
(select max(department_id) + 10 from dept), 'Virtual', null, 1700);

-- [DELETE - where : 값으로 사용]
-- 가장 최근에 추가된 부서를 삭제하시오
delete from dept where department_id = (
select max(department_id) from dept);
-- 실습 : 부서테이블에서 부서번호가 가장작은 번호를 삭제하시오.
delete from dept where department_id = (
select min(department_id) from dept); -- 위에 첫번째 10이 삭제처리
-- 부서테이블에서 사원 수가 가장 많은 테이블을 삭제하시오.
-- delete
select department_id from
(select department_id, count(*) 사원수
from employees group by department_id)
where 사원수 = (
    select max(사원숫자) from 
    (select department_id, count(*) 사원숫자
from employees group by department_id)
);

-- [UPDATE - set : 값으로 사용]
-- 사원들의 월급을 가장 적은 월급을 받는 사원의 월급으로 수정하시오.
update empl set salary = (
select min(salary) from employees
);
select * from empl;

-- [UPDATE - where]
-- 실습 : 월급을 가장 많이 받는 월급을 10% 삭감하시오.
update empl set salary = salary * 0.9
where salary = (select max(salary) from employees);
-- 실습 : 평균월급보다 월급을 적게 받는 사원의 월급을 5% 증가시키시오.
update empl set salary = salary * 1.05
where salary < (select max(salary) from employees);
-- [테이블을 복사하면서 생성]
create table dept as select * from departments;
select * from dept;
desc dept;
drop table dept;

select * from departments;
-- [테이블에서 컬럼정보만 복사하면서 새로운 테이블 생성]
create table dept2 as select * from departments
where 1=2;
select * from dept2;

-- [delete]
-- [전체로우 삭제]
delete from dept;
select * from dept;

-- [특정로우 삭제]
delete from dept where department_name like 'S%';
select * from dept;

-- 실습 : 부서번호가 홀수인 부서를 삭제하시오.(mod)
delete from dept where mod(department_id/10, 2) = 1;
select * from dept;
-- 실습 : 부서이름의 길이가 15글자 이하인 부서를 삭제하시오.
delete from dept where length(department_name) <= 15;

-- [update]
-- 실습 : employees테이블과 같은 데이터를 가지고 있는 empl테이블을 생성
create table empl as select * from employees;
drop table empl;
select * from empl;
update empl set salary = 0;
-- 실습 : where, commission_pct가 null인 사원의 commission_pct를 0으로 변경
update empl set commission_pct = 0 where commission_pct is null;

update empl set salary = salary * 1.1, 
commission_pct = commission_pct * 2
where employee_id = 100;
-- 실습 : 전화번호의 길이 13글자 이상되는 직원들의 전화번호를
-- 999-999-999변경 월급을 10% 인하 하세요)  
update empl set phone_number = replace(phone_number, '.', '-'), 
salary = salary * 0.9 where length(phone_number) >= 13;
-- 실습 : 근속년수 15년 이상되는 사원들의 월급을 10% 인상하시오.(months_between)
update empl set salary = salary * 1.1
where months_between(sysdate, hire_date) >= 15 * 12;
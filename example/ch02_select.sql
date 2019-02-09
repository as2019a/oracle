-- 계정이 소유하고 있는 테이블의 목록
select * from tabs;

desc employees;

-- 테이블의 모든 컬럼과 모든 로우 조회
select * from employees;

-- 실습 : 부서 테이블의 모든 데이터를 조회하시오
select * from departments;

-- 테이블의 일부 컬럼 조회
select employee_id, first_name, last_name from employees;

-- 실습 : 사원 테이블에서 사원번호, 월급, 입사일 조회
select employee_id, salary, hire_date from employees;

-- 실습 : 부서테이블에서 부서번호, 부서명 조회
select department_id, department_name from departments;

-- 여러개의 테이블에서 컬럼 조회
select employee_id, first_name, department_name
from employees, departments;

-- 별칭
select employee_id as 사원번호, first_name as 이름 from employees;
select employee_id 사원번호, first_name 이름 from employees;
select employee_id "사원 번호", first_name 이름 from employees;

-- 실습 : 부서테이블에서 부서명, 매니저 아이디를 조회하되 별칭을 추가하시오
select department_name "부서명", manager_id "매니저 아이디" from department;

-- 문자열 이어붙이기
select first_name || ' ' || last_name as full_name from employees;

-- 사칙 연산
select first_name, salary, commission_pct, salary * commission_pct bonus from employees;

-- 실습 : 사원테이블에서 사원이름, 실연봉[(월급 + 보너스)*12]를 조회하시오
select first_name, (salary+salary*commission_pct)*12 실제연봉 from employees;

select hire_date, hire_date+365 from employees;
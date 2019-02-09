-- [union, 합집합, 중복 제거, 정렬]
-- [union all, 중복 제거X, 정렬X]
select * from employees;
select department_id, first_name from employees where department_id = 90 
union all 
select department_id, first_name from employees where department_id = 80;
select * from jobs;
-- union은 컬럼명이 달라도 똑같은 자료형이라면 한꺼번에 조회가능
select department_id, first_name from employees union select department_id,
department_name from departments;
-- [intersect]
select salary from employees where department_id >= 90
intersect 
select salary from employees where department_id <= 80;
-- 누군가의 매니저인 직원의 사번을 조회
select employee_id from employees
intersect
select manager_id from employees;

-- 실제 사원이 일을 하는 부서들의 번호 출력
select department_id from employees intersect 
select department_id from departments;
-- [minus]
-- 사원들이 존재하지 않는 부서번호 조회
select department_id from departments 
minus
select department_id from employees;
-- 사원들 중 말단 직원(누군가의 매니저X)
select employee_id from employees minus select manager_id from employees;
select employee_id, first_name, manager_id from employees;


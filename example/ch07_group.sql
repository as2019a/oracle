-- [employees 전체]
select * from employees;
-- [count : null이 아닌 값의 갯수]
select count(employee_id) from employees;
select count(manager_id) from employees;
select count(*) from employees;
select department_id, count(*) from employees group by department_id;

-- 그룹함수와 일반 컬럼은 함께 사용할 수 없다.
select first_name, count(*) from employees;
select first_name, count(*) from employees group by first_name;

-- group by에서 사용한 컬럼(그룹조건컬럼)은 그룹함수와 같이 
-- select에서 사용가능
select job_id, count(*) from employees group by job_id;
select salary, count(*) from employees group by salary;

-- [sum]
select sum(salary) from employees;

-- 실습 : 부서별로 사원들의 사원들의 월급 합계 조회
select department_id, sum(salary) from employees 
group by department_id;

-- [avg : 평균]
-- 실습 : 직종별로 월급의 평균을 소숫점 2번째 자리까지 구하시오.
-- job_id, 월급평균
select job_id, trunc(avg(salary),2) 월급평균 from employees 
group by job_id order by 월급평균;
select * from employees;
-- 복수개의 그룹조건
select department_id, job_id,trunc(avg(salary),2) from employees 
group by department_id, job_id order by department_id;

-- [max : 최대값]
select max(salary) from employees;
select min(salary) from employees;
-- 직종별로 최대 월급을 조회
select job_id, max(salary) from employees group by job_id;

-- [min : 최소값]
select min(salary) from employees;
select job_id, min(salary) from employees group by job_id;

-- [variance : 분산 - 빈부격차]
select job_id, trunc(variance(salary)) from employees 
group by job_id;

-- [stddev : 표준편차]
select job_id, trunc(stddev(salary)) from employees 
group by job_id;

-- [having : 그룹함수의 조건절]
-- 부서별로 평균 월급을 구하되 단, 평균월급이 10,000$이상되는 부서
-- (where절에서는 그룹함수 사용 불가)
select department_id, avg(salary) from employees 
where avg(salary) >= 10000 
group by department_id; -- 에러

select department_id, avg(salary) from employees 
group by department_id having avg(salary) >= 10000;
-- 사전작업(avg -> min : 아래 실습 적용)
select department_id, avg(salary) from employees 
group by department_id having avg(salary) >= 5000;

-- 실습 각 부서별 최하 임금을 조회하되 최하 임금이 5000 이상인 경우에 한해서
-- 각 부서별 최하 임금을 조회하시오.
select department_id, min(salary) from employees 
group by department_id having min(salary) >= 5000;

-- [where vs having]
-- 부서별 평균월급을 조회하되 부서번호가 50번 이상인 부서 조회
-- [where : 테이블에서 원하는 튜플만 골라낸뒤 그룹화 후 결과 출력]
select department_id, trunc(avg(salary)) from employees 
where department_id >= 50 
group by department_id;
-- [having : 테이블에서 모든 튜플을 그룹화 한 뒤 원하는 튜플만 출력]
select department_id, trunc(avg(salary)) from employees 
group by department_id 
having department_id >= 50;
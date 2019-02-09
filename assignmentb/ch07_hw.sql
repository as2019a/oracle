--사원테이블에서 사원수, 가장 높은 연봉, 가장 낮은 연봉을 출력하세요.
select * from employees;
select count(*), max(salary), min(salary) from employees;
--사원테이블을 부서별(department_id)로 그룹화시키고 부서아이디(department_id)와 
--부서별 인원수, 부서별 급여평균을 출력하세요.
select department_id, count(*), avg(salary)
from employees group by department_id;
--이전 문제에서 조인을 활용해서 부서아이디(department_id) 대신 부서명(department_name)을 출력하세요.(그룹화 + 조인)
select department_name, count(*), avg(salary)
from employees e, departments d
where e.department_id = d.department_id
group by department_name;
--사원테이블을 부서 아이디, 직종 아이디로 그룹화시키고 
--부서아이디, 직종아이디, 각 그룹별 월급표준편차를 구하세요.
select department_id, job_id stddev(salary)
from employees group by department_id, job_id;
--사원테이블을 부서 아이디로 그룹화 시킨후 그룹의 급여평균이
--6000이 넘는 부서만 부서아이디, 부서별 급여총액, 부서별 급여평균을 
--출력하세요.
select department_id, sum(salary), avg(salary)
from employees group by department_id having avg(salary) > 6000;
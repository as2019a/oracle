--사원의 이름, 그 사원이 속한 부서의 부서명을 함께 출력하세요.(inner)
select * from employees;
select first_name, department_name
from employees e inner join departments d
on e.department_id = d.department_id;
--사원의 이름, 그 사원이 속한 부서의 부서명을 함께 출력하세요.(full outer)
select first_name, department_name
from employees e full outer join departments d
on e.department_id = d.department_id;
--사원의 이름,  그 사원이 속한 부서의 부서명을 함께 출력하세요.(left outer)
select first_name, department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
--사원의 이름, 그 사원이 속한 부서명, 그 부서가 속한 도시명을 함께 출력하세요
select first_name, department_name, city 
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;
--사원명, 그 사원의 매니저명을 출력하세요.
select first_name, e.manager_id from employees e, departments d
where e.department_id = d.department_id;
--부서명, 부서의 부서장명, 부서가 속한 지역의 우편번호를 출력하세요.
select department_name, first_name, postal_code
from departments d left outer join employees e 
on d.manager_id = e.manager_id inner join locations l
on d.location_id = l.location_id;
--사원명 사원의 직종명(job_title)을 출력하세요.
select first_name, job_title
from employees e, jobs j
where e.job_id = j.job_id;
--사원명, 직종명, 부서명, 도시명, 국가명, 대륙명을 출력하세요.
select * from employees;
desc employees;
desc departments;
desc locations;
desc countries;
select first_name, job_title, department_name, city, country_name, region_name
from employees e, jobs j, departments d, locations l, countries c, regions r
where e.job_id = j.job_id and e.department_id = d.department_id
and d.location_id = l.location_id and l.country_id = c.country_id
and c.region_id = r.region_id;

select first_name, job_title, department_name, city, country_name, region_name
from employees e, jobs j, departments d, locations l, countries c, regions r;
--사원명, 사원이 속한 부서명, 부서가 속한 도시명을 출력하되 
--조인을 사용하지 말고 subquery를 사용해서 출력하시오.
select frist_name, 
(),
(),
from employees ed;
--다음 두 쿼리는 같은 데이터를 출력한다. 두 쿼리를 비교할 때 어느 쿼리가 성능면에서 효율적인지를 판단하고 그 이유를 서술하세요.
select e.first_name, d.department_name 
from employees e, departments d 
where e.department_id = d.department_id and d.department_id > 80;

select e.first_name, d.department_name 
from employees e, (select * from departments 
where department_id > 80) d where e.department_id = d.department_id;
-- -> where문으로 쓴 코드가 성능이 좋고 가독성도 좋다

--사원테이블에서 부서별 급여가 가장 높은 사원의 이름과 급여와 
--부서아이디를 출력하세요.
select first_name, salary, department_id
from employees
where salary in (select max(salary) from employees group by department_id);
-- 스티븐과 같은 부서에서 일하는 사람들 모두 출력
select * from employees where derpartment_id in 
(select department_id from employees where first_name = 'Steven');
--dept테이블은 department_id가 10씩 증가하는 구조이다. 이 규칙을 깨뜨리지 않도록 빈칸을 채우시오. 
--(계속사용이 가능한 쿼리여아만 함)
insert into dept values ((select max(department_id + 10,'research and development', 200, 1500);
-- -> 
--dept테이블은 department_id가 10씩 증가하는 구조이다. dept테이블에서 가장 최근에 추가된 두개의 튜플을 삭제하는 쿼리를 작성하시오.





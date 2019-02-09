-- [기타함수]
-- [NVL, NVL2, NULLIF]
-- [NVL : 파라미터로 들어온 자료가 NULL이면 두번째 파라미터로 들어온 자료로 대체]
-- [NVL2 : 파라미터로 들어온 자료가 NULL이 아니면 두번째 파라미터 사용]
-- [NVL2 : 파라미터로 들어온 자료가 NULL이면 세번째 파라미터 사용]
select salary, salary + salary * salary*commission_pct from employees;
select salary, salary + salary * salary*nvl(commission_pct, 0) from employees;
select salary, salary + salary * salary*nvl2(commission_pct, commission_pct,0) 
from employees;
-- 실습 : employee_id, manager_id를 조회하되 null인 경우에는 employee_id로 대체
select employee_id, nvl(manager_id, employee_id) from employees;

-- [NULLIF : 파라미터로 들어온 두개의 값이 같으면 NULL]
-- [같지 않으면 첫번째 파라미티의 값을 반환]
select NULLIF(10, 10), NULLIF(10, 20) from dual;
select NULLIF(commission_pct, 0.1) from employees;

-- [decode : if문]
-- (비교값, 비교값2, 같을때 사용할 값, 다를 때 사용할 값)
select decode(manager_id, null, 0, manager_id) from employees;
select first_name, decode(job_id, 'IT_PROG', '개발자', '비개발자') from employees;
-- job_id가 IT_PROG인 경우에는 개발자, SA_MAN인 경우에는 영업담당자, 
-- 나머지인 경우에는 기타
select first_name, decode(job_id, 'IT_PROG', '개발자', 
decode(job_id, 'SA_MAN', '영업담당자', '기타')) from employees;
-- 년도별로 입사한 사원의 숫자를 표로 조회
select 
sum(decode(substr(hire_date,1,2), '02',1,0)) "2002년도",
sum(decode(substr(hire_date,1,2), '03',1,0)) "2003년도",
sum(decode(substr(hire_date,1,2), '04',1,0)) "2004년도",
sum(decode(substr(hire_date,1,2), '05',1,0)) "2005년도",
sum(decode(substr(hire_date,1,2), '06',1,0)) "2006년도" from employees;

-- [case : if else if문]
select first_name, 
case
    when job_id = 'IT_PROG' then '개발자'
    when job_id = 'SA_MAN' then '영업담당자'
    else '기타'
end
from employees;
select * from employees;
-- 실습 : 회사에서 입사일에 따라 퇴직금을 지급하려고 한다.
--  03/12/31 이전 입사 : salary * 100
--  04/01/01 ~ 06/12/31 입사 : salary * 50
--  07/01/01 이후 입사 : salary * 20
-- 사원의 이름, 입사일, 퇴직금 조회
select first_name, hire_date, 
    case
        when hire_date <= 03/12/31 then salary * 100
        when hire_date <= 06/12/31 then salary * 50
        else salary * 20
    end 세금
from employees;
-- [GREATEST, LEAST]
select greatest(10, 100, -5, 30) from dual;
select greatest(10, 100, -5, 30), least(10, -10) from dual;
-- 실습 : 이름과 입사일을 조회하되 입사일이 07/07/07 이전일 경우에는
-- 입사일을 07/01/01로 표시하시오.
select least(hire_date, '07/01/01') from employees;
-- [UID, USER]
select uid, user from dual;
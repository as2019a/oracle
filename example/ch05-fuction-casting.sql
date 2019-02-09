-- [형변환 함수] -> [{숫자} <-> {문자} <-> {날짜} 는 가능/{숫자} <-> {날짜} 불가능]
-- [{숫자} ==to_char()==> {문자} ==to_char()==> {날짜}]
-- [{숫자} <==to_number()== {문자} <==to_date()== {날짜}]

-- [숫자 ==> 문자]
select salary*12, to_char(salary*12) from employees;
select salary*12, to_char(salary*12, '$999,999.99') from employees;
select salary*12, to_char(salary*12, '$99,999.99') from employees;

-- [날짜 ==> 문자]
select sysdate, to_char(sysdate), to_char(sysdate,'YYYY-MM-DD') from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'YY-MM-DD') from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'YEAR-MM-DD') from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'YEAR-MONTH-DD') from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'YYYY-MM-DD DAY') from dual;
-- 실습 : 사원 테이블에서 이름과 입사년도(요일 포함)를 조회하시오.
select * from employees;
select first_name, to_char(hire_date, 'YYYY-MM-DD DAY') 
from employees;
-- 실습 : 자신이 태어난 날짜 요일 조회
select to_char(to_date('90/04/07'), 'YYYY-MM-DD DAY') 
from dual;
select to_char(to_date('90/04/07'), 'YYYY.MM.DD DAY') 
from dual;

-- [시간]
select sysdate, to_char(sysdate, 'YY-MM-DD HH:MI:SS') from dual;
select sysdate, to_char(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

-- [숫자형태의 문자 ==> 숫자]
select '114455', to_number('114455') from dual;
select '1234a' ,to_number('1234a') from dual;

-- [날짜형태의 문자 ==> 날짜]
select to_date('20180403') from dual;
select to_char(to_date('00011225'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('0001 12 25'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('0001.12.25'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('0001/12/25'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('0001-12-25'), 'YYYY-MM-DD DAY') from dual;
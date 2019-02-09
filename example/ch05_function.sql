-- [문자열 함수]
-- [initcap : 첫 글자만 대문자, 나머지는 소문자]
select job_id, initcap(job_id) from employees;

-- [upper, lower]
select upper(first_name), lower(first_name) from employees;
select first_name from employees where lower(first_name) like '%a%';

-- [length, lengthb]
select first_name, length(first_name), job_id, lengthb(job_id) from employees;
select length('바나나'), lengthb('바나나') from dual;
-- 실습 : 전화전호의 길이가 9 이상인 사원의 이름과 전화번호 조회
select * from employees;
select first_name, phone_number from employees where length(phone_number) >= 9;
select first_name, phone_number from employees where length(phone_number) < 13;

-- [substr(문자열, 추출을 시작할 위치, 추출할 문자 수)]
select hire_date, substr(hire_date, 1, 2) from employees;

-- 실습 : 월만 출력하시오
select hire_date, substr(hire_date, 4, 2) from employees;
-- 실습 : 일만 출력하시오
select hire_date, substr(hire_date, 7, 2) from employees;
select hire_date, substr(hire_date, -2, 2) from employees;
-- 실습 : 전화번호 4글자 출력
select phone_number, substr(phone_number, -4, 4) from employees;

-- [instr : 찾는 문자열의 위치를 반환]
-- (문자열, 찾는 문자 [, 시작할 위치, 몇번째 인지])
select first_name, instr(first_name, 'ar') from employees;
-- 실습 instr을 사용해서 이름에 ra라는 문자열이 들어있는 사원의 이름 조회
select first_name from employees where instr(first_name, 'ra') != 0;
select first_name from employees where instr(first_name, 'ra') > 0;
select hire_date, instr(hire_date,'/'), instr(hire_date,'/',1,2) from employees;
select phone_number, instr(phone_number, '.', -1, 1) from employees;
-- 실습 : instr, substr을 활용해서 phone_number의 3번째 숫자덩이 중
-- 4글자 추출
select phone_number, 
substr(phone_number, instr(phone_number,'.',1,2)+1, 4) from employees;

-- [lpad, rpad]
select first_name, lpad(first_name, 10, '*') from employees;
select first_name, rpad(first_name, 10, '*') from employees;
select first_name, lpad(first_name, 10, ' ') from employees;
select '181023-323456789', rpad('181023-3',14,'*') from dual;
select '181023-323456789', rpad(substr('181023-3456789',0,8),14,'*') from dual;

-- [replace (원본문자열, 찾을 문자열, 대체할 문자열)]
select hire_date, replace(hire_date, '/', '.') from employees;

-- 실습 : 전화번호에 구분자를 '.'이 아닌 '%'로 조회
select phone_number, replace(phone_number, '.', '%') from employees;
-- 실습 : 전화번호에 구분자를 '%'이 아닌 ' '로 조회
select phone_number, replace(phone_number, '.', ' ') from employees;


-- 2018-10-24
-- [숫자 함수]
-- [round : 반올림, trunc : 버림]
select 123.456, round(123.456), round(123.456,1) from dual;
select 123.456, trunc(123.456), trunc(123.456,2) from dual;
select 123.456, trunc(123.456)+1, trunc(123.456,2)+0.01 from dual;
select 123.456, trunc(123.456+0.9), trunc(123.456+0.009,2) from dual;


-- [mod : 나눈 나머지]
select mod(11,3) from dual;
select mod(11.5,3) from dual;

-- 실습 : 짝수 사원번호를 가진 사원들의 모든 정보를 조회
select * from employees;
select * from employees where mod(employee_id, 2) = 0;

-- [power : 제곱, sqrt : 제곱근]
select power(2, 3) from dual;
select power(-2, 3) from dual;
select power(2, -3) from dual;

select sqrt(2) from dual;
select sqrt(3) from dual;

-- [날짜 함수]
-- [sysdate, systimestamp]
select sysdate, hire_date from employees;
select systimestamp from dual;

-- [months_between]
select sysdate, hire_date, months_between(sysdate, hire_date) from employees;
-- 실습 : 입사기간이 160개월 이상 사원들의 이름, 입사일, 입사후 개월 수 조회
-- 단, 입사 후 개월 수는 정수로 표기 할 것(trunc), where
select first_name, hire_date, trunc(months_between(sysdate, hire_date))
from employees where months_between(sysdate, hire_date) >= 160;
-- 실습 : 자신의 나이를 월로 조회하시오(1990-04-07, '90/04/07')
select months_between(sysdate, '90/04/07')/12 from dual;

-- [add_months]
select hire_date, add_months(hire_date, 3) from employees;
select hire_date, add_months(hire_date, 6) from employees;
select hire_date, add_months(hire_date, 9) from employees;
select * from employees;
-- 실습 : 사번이 120번인 사원은 계약기간이 3년 6개월이다. 퇴사 날짜를 구하시오.
select hire_date, add_months(hire_date, 3*12+6)-1 from employees 
where employee_id = 120;

-- [next_day : 특정 날짜를 기준으로 가장 빨리 돌아오는 요일을 반환]
select hire_date, next_day(hire_date, '월') from employees;
-- 실습 : 월급일은 매달 첫째 주 월요일이다. 다음달 월급날을 구하시오.
select next_day('18/10/31', '월') from dual;

-- [last_day : 해당 월의 마지막날]
select last_day(sysdate) from dual;
select next_day(last_day(sysdate), '월') from dual;
select next_day(add_months(last_day(sysdate),-1), '월') from dual;


--사원테이블에서 월급이 5000이상이며 직종(job_id)이 'IT_PROG'인 사원을 조회하세요.
select * from employees;
select * from employees where job_id = 'IT_PROG' and salary >= 5000;
--어떤 사원이 자신의 이메일을 수기로 적었는데 'A□R~~~~'형태로 인식 되었다. 
--이러한 패턴을 가지는 사원의 이름, 이메일을 조회하세요.
--(단, □은 식별이 불가능한  한글자의 문자이며 ~~~~는 알파벳과 글자수 모두 
--식별이 불가능한 여러문자)
select * from employees where email like 'A_R%';
select first_name, email from employees where email like 'A_R%';
--사원테이블에서 직종(job_id)가 'IT_PROG', 'ST_MAN', 'ST_CLERK'이 아니면서 
--폰번호의 형태가 4덩이의 숫자로 이루어지지 않은 사원의 모든 컬럼을 조회하세요.
select * from employees where job_id not in('IT_PROG', 'ST_MAN', 'ST_CLERK')
and phone_number not like '%.%.%.%' or phone_number not like '%.%.%.%.%'; 
--사원테이블에서 모든 컬럼을 조회하되 job_id가 'SA_REP' 또는 'IT_PROG'이며 
--job_id가 'SA_REP'이면 salary가  5000 이상 10000이하이고
--job_id가 'IT_PROG'이면 salary가 4500이상 6000이하인 튜플만 조회하세요. 
--(BETWEEN 사용필수)
select * from employees where job_id = 'SA_REP' and salary between 5000 and 10000;
select * from employees where job_id = 'IT_PROG' and salary between 4500 and 6000;
--부서테이블에서 모든컬럼을 조회하되 지역번호(location_id)가 
--1700인 튜플만 조회하세요.
select * from employees;
--부서테이블에서 모든컬럼을 조회하되 메니저번호가 null인 튜플만 조회하세요.
select * from employees where manager_id is null;
--부서테이블에서 모든컬럼을 조회하되 부서명의 맨 앞 글자가 M 이거나 
--N인 튜플만 조회하세요.(OR 사용필수)
select * from employees where job_id like 'M%' or job_id like 'N%';
--직업테이블에서 직업아이디와 직업명, 그리고 최저임금과 최고임금의 격차를 
--조회하시오.
select * from jobs;
select job_id, job_title, max_salary - min_salary from jobs;
--지역테이블(locations)에서 sydney에 위치한 지사의 거리명과 우편번호를 조회하시오.
select * from locations;
select state_province, postal_code from locations where length(sydney);
--지역테이블에서 state_province가 null이 아닌 지역들 도시명을 조회하시오.

--지역테이블에서 도시명의 앞글자가 A ~ F인 지역의 도시명을 조회하시오.

--지역테이블에서 거리명이 3단어로 구성된 [ex) 2007 Zagora St] 지역의 거리명과 
--도시명을 조회하시오.

--지역테이블에서 국가코드가 내림차순으로, 같은 국가코드라면 city가 
--정렬되게 모든컬럼을 조회하시오.

--국가테이블(countries)에서 국가 코드가 UK이거나 IN인 국가의 
--국가명을 조회하시오.
select * from locations where country_id in('UK', 'IN');
--국가테이블에서 국가명이 5글자 이하인 국가의 국가명을 조회하시오.
select city from locations;
select city from locations where length(COUNTRY_NAME) <= 5;
--국가테이블에서 국가코드가 U로 시작하는 국가들의 국가명을 조회하시오.
select city, country_id from locations where country_id like 'U%';
--국가테이블에서 국가명이 내림차순으로 정렬되게 모든컬럼을 조회하시오.
select city from locations

-- [WHERE]
select first_name, salary from employees where salary > 10000;
select first_name, salary from employees where salary >= 10000;
select first_name, salary from employees where salary < 10000;
select first_name, salary from employees where salary <= 10000;
select first_name, salary from employees where salary = 10000;
select first_name, salary from employees where salary != 10000;
select first_name, salary from employees where salary <> 10000;
-- 실습 : 사원번호가 150 이상되는 사원번호, 성, 입사일
select employee_id, last_name, hire_date from employees 
where employee_id >= 150; 

-- 문자열 조건
select first_name, salary from employees where first_name = 'Lex';
select first_name, salary from employees where first_name > 'Lex';
select first_name, salary from employees where first_name < 'Lex';
select first_name, salary from employees where first_name != 'Lex';

-- 실습 : 이름의 맨 앞 글자가 I보다 사전 순으로 뒤에 있는 사원들의 모든 정보를 조회
select * from employees where first_name >= 'I';

-- null 비교
select first_name, salary, commission_pct from employees 
where commission_pct is null;
select first_name, salary, commission_pct from employees 
where commission_pct is not null;

-- 실습 : 매니저(멘토)가 없는 사원들의 모든 정보를 조회하시오.
select * from employees;
select * from employees where manager_id is null;

-- 다중조건
select first_name, salary from employees where salary > 5000 and salary <= 10000;

-- 실습 salary가 10000 이상 15000미만인 사원의 모든 정보를 조회
select * from employees where salary >= 10000 and salary < 15000;
-- 실습 salary가 5000 미만이거나 20000이상인 사원의 모든 정보를 조회
select * from employees where salary < 5000 or salary >= 20000;
select * from employees where salary > 10000 and hire_date <= '04/12/31';
-- 실습 : 05년 ~ 06년에 입사했고 commission_pct가 null이 아닌 
-- 사원의 모든 정보 를 조회.
select * from employees where hire_date >= '05/01/01' and hire_date <= '06/12/31'
and commission_pct is not null;

-- 실습 : Job_id가 'SA_MAN' 이거나 'IT_PROG' 인 사원의 모든정보를 조회
select * from employees where job_id = 'SA_MAN' or job_id = 'IT_PROG';
-- and가 or보다 더 먼저 계산된다(우선순위가 빠르다)

-- in
select * from employees where job_id = 'SA_MAN' or job_id = 'IT_PROG' 
or job_id = 'HR_REP';
select * from employees where job_id in('SA_MAN','IT_PROG','HR_REP');

-- 실습 : 사원번호가 100,102,104,106번인 사원의 모든 정보 조회
select * from employees where employee_id in(100,102,104,106);
select * from employees where employee_id not in(100,102,104,106);

-- between
-- 실습 : salary가 5000보다 크거나 같고 6000보다 작가나 같은 사원들의 모든정보 조회
select * from employees where salary >= 5000 and salary <= 6000;
select * from employees where salary between 5000 and 6000;
-- 실습 : 07년도에 입사한 사원의 모든 정보를 조회(between 사용)
select * from employees where hire_date between '07/01/01' and '07/12/31';

-- like %(임의의 여러문자), _(임의의 한문자)
select first_name from employees where first_name like 'H%';
select first_name from employees where first_name like 'Ha%';
select first_name from employees where first_name like '_____';

-- 실습 H로 시작하면서 길자길이가 7인 사원의 이름을 조회하시오.
select first_name from employees where first_name like 'H______';
-- 실습 이름에 a가 포함되는 사원의 이름을 출력하시오.
select first_name from employees where first_name like '%a%';
-- 실습 : 이름에 a가 두 개 이상 포함되는 사원의 이름을 출력하시오.
select first_name from employees where first_name not like '%a%a%';
-- 실습 : 이름에 a가 하나만 포함되는 사원의 이름을 출력하시오
select first_name from employees where first_name not like '%a%' and 
first_name not like '%a%a%';
-- 실습 : 이름에 o 가 포함이 되고 a로 끝나는 사원의 이름을 조회.
select first_name from employees where first_name like '%o%' and 
first_name like '%a';
select first_name from employees where first_name like '%o%a';
--실습 : 전화번호가 6으로 시작해서 중간에 4가 들어가고 9로 끝나는 사원의 이름 조회
select * from employees;
select first_name, phone_number from employees where phone_number like '6%2%9';
-- 실습 : 전화번호에 44가 들어가는 사원의 이름, 전화번호 조회
select first_name, phone_number from employees where phone_number like '%44%';
-- 실습 : 전화번호에 44가 중간에만 들어가는 전화번호 조회
select phone_number from employees where phone_number like '%44%'
and phone_number not like '44%' and phone_number not like '%44';
-- 실습 : 전화번호가 '___' 3덩이로 이루어진 사원의 이름, 전화번호 조회
select first_name, phone_number from employees where phone_number like '%.%.%'
and phone_number not like '%.%.%.%';

-- [order by]
select * from employees;
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary;
-- 실습 : 월급이 15000 이상 사원을 조회하되 입사일이 빠른순서대로 정렬
select * from employees where salary >= 15000 order by hire_date asc;
select * from employees order by hire_date desc, salary asc;
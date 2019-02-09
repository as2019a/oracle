 --employees테이블에서 first_name과 last_name을 조회하되 
--first_name은 모두 소문자로, last_name은 모두 대문자로 조회하세요.
select lower(first_name), upper(last_name) from employees;
--employees테이블에서 first_name과 last_name을 
--한 문장으로 조회하되 컬럼명은 'name'으로 조회하세요. 
--ex) "Steven King"처럼 가운데 공백 추가
select first_name || '' || last_name from employees;
--employees테이블에서 first_name, phone_number를 조회하되 
--phone_number에서 국번을 제외하고 출력하세요. ex)123.4567
select first_name, substr(phone_number, instr(phone_number, '.') + 1, 
length(phone_number)) from employees;
--locations테이블에서 city, street_address를 조회하되 
--street_address에 'st'라는 단어가 포함된 튜플만 조회하세요.
select city, street_address from locations
where instr(street_address, 'st') != 0;
--employees테이블에서 first_name, phone_number를 출력하되 
--phone_number의 앞 3자리를 ***로 출력하세요. ex) ***.123.4567
select first_name, lpad(substr(phone_number, 4, 20), length(phone_number), '*') 
from employees;
--employees테이블에서 first_name, phone_number를 출력하되 
--phone_number의 형태를 보기와 같이 출력하세요 ex) 515-123-4567
select first_name, replace(phone_number, '.', '-') from employees;
--employees테이블에서 first_name, commission_pct를 조회하되 
--commission_pct가 null이 아닌 튜플들은 commission_pct의 값을 
--소숫점 이하 둘째자리에서 반올림하여 수숫점 이하 첫째짜리까지 표현하세요.
select first_name, round(commission_pct, 1) from employees;
--employees테이블에서 first_name, salary를 조회하되 
--salary의 값을 소숫점 이하 0번째 자리에서 버림하세요
select first_name, trunc(salary) from employees; 
--employees테이블에서 first_name, hire_date를 조회하되
--hire_date의 양식을 다음 예와 같이 출력하세요. ex) 87.6월.17
select first_name, replace(to_char(hire_date, 'YY.MONTH.DD'), ' ', '') 
from employees;  
--employees테이블의 salary를 문자로 출력하세요.
select to_char(salary) from employees; 
--employees테이블에서 first_name, salary와 함께 세금을 출력하세요.
--단, 세율은 salary가 5000미만이면 10%, 5000이상 
--                    10000미만이면 15%, 10000이상이면 20%로 적용함
select first_name, salary,
case
    when salary < 5000 then salary * 0.1
    when salary < 10000 then salary * 0.15
    else salary * 0.2
end tax
from employees;
--세금 대신 실수령액으로 조회하시오
select first_name, salary,
case
    when salary < 5000 then salary - salary * 0.1
    when salary < 10000 then salary - salary * 0.15
    else salary - salary * 0.2
end 실수령액
from employees;


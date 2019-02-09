--[insert]--
--lion계정으로 접속하시오
-- 접속완료
--현대, 기아, 쉐보레, 쌍용, 르노삼성에서 마음에 드는 차를 하나씩 골라서 정보를 수집한 뒤
--car테이블에 추가하시오.
desc car;
insert into car values('Avante', 'H');

--학생에 대한 점수를 저장할 수 있는 score라는 테이블을 작성하시오.
--  id 숫자 기본키,
--  name 문자열,
--  korean 숫자,
--  english 숫자,
--  math 숫자
create table student(
    id number primary key,
    name varchar2(30),
    korean number(3),
    english number(3),
    math number(3)
);
--student테이블에 우리반학생들의 시험정보를 저장하시오(점수는 상상에 맡길 것...)

-- 부분 생략
--[select]--
--hr계정으로 서버에 접속하시오
-- 접속완료
--지역테이블(locations)의 컬럼정보를 조회하고 분석하세요.
select * from tabs;

desc locations;
--지역테이블(locations)에서 모든컬럼을 조회하세요.
select * from locations;
--지역테이블에서 도로명, 우편번호, 도시명을 조회하세요.
select street_address, postal_code, city from locations;
--지역테이블에서 state_province, country_id에 적절한 별칭을 부여해서 조회하세요.
select state_province "수도", country_id "국가" from locations;
--국가에 해당하는 테이블 명을 적으시오.
--CITY

--국가테이블의 전체 컬럼을 조회하되 적절한 별칭을 붙여서 조회하시오.
select location_id "코드", street_address "주요도시", postal_code "우편번호",
        city "도시", state_province "특정지역", country_id "국가" from locations;
--hr유저가 가지고있는 모든 테이블을 조회하고 모르는 테이블이면 분석하세요.
select * from locations;
--employees테이블을 조회해서 사원번호가 145인 사원의 성과 이름을 적으시오.
--성:John, 이름:Russel

--145번 사원의 JOB_ID를 알아 낸 뒤 직업에 대한 정보를 저장하는 테이블을 조회하여 145사원의 JOB_ID 
--에 해당하는 실제 이름을 찾아낸 뒤 적으시오.
--SA_MAN

--사원테이블에서 가장 높은 연봉을 받는 사원의 사원번호와 이름을 적으시오.
--사원번호:100, 이름:Steven King


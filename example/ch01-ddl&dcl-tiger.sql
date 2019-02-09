-- 테이블 생성
create table person(
    id number(2) primary key,
    name varchar(20) not null
);

-- 테이블 로우 조회
select * from person;

-- 테이블 컬럼 조회
describe person;
desc person;

-- 테이블 수정
-- 컬럼 추가
alter table person add birth date;

-- 실습:person테이블에 age라는 컬럼을 추가하시오.
alter table person add age number(3);

-- 컬럼명 수정
alter table person rename column birth to birthday;

-- 실습:컬럼 age의 이름을 old로 변경
alter table person rename column age to old;

-- 컬럼 속성 수정
alter table person modify id number(3);

-- 실습 : name컬럼의 자료형을 varchar(30)로 변경하시오.
alter table person modify name varchar(30);
alter table person modify old number(3);

-- 컬럼 삭제
alter table person drop column birthday;

-- old 컬럼 삭제
alter table person drop column old;

-- 테이블 삭제
drop table person;


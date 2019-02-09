--1)system유저로 데이터베이스에 접속하여 
--아이디:lion, 비밀번호:1111의 유저를 만드시오.
create user lion identified by 1111;
--2)lion 유저에게 모든 권한(DBA 롤)을 부여하시오.
grant dba to lion;
--2.5)lion 유저에게 접속할 수 있는 conn_lion이라는 connection을 생성하시오.
-- 접속완료
--3)lion유저로 데이터베이스에 접속하여 car라는 테이블을 만드시오.
--  컬럼 : model varchar2(50) not null, manufacturer varchar2(50) not null
create table car(
    model varchar2(50) not null,
    manufacturer varchar2(50) not null
);
--4)car테이블의 컬럼 정보를 조회하시오.
desc car;
--5)car테이블에 price number(20) 컬럼을 추가하시오.
alter table car add price number(20);
--6)car테이블의 manufacturer컬럼의 이름을 company로 변경하시오.
alter table car rename column manufacturer to company;
--7)car테이블의 company컬럼의 속성을 varchar2(100)으로 변경하시오.
alter table car modify company varchar2(100);
--8)car테이블의 company컬럼을 삭제하시오.
alter table car drop column company;
--9)car테이블을 삭제하시오.
drop table car;
--10)lion유저의 권한을 모두 회수하시오.
revoke dba from lion;
--11)system유저로 접속한 뒤 lion유저를 삭제하시오.
drop user lion;
--12)system유저로 데이터베이스에 다시 접속하시오.
-- 접속완료
--12)lion유저를 다시 만드시오.(다음 과제를 위한 것 입니다.)
create user lion identified by 1111;
--12)lion유저에게 모든권한을 다시 부여하시오.(다음 과제를 위한 것 입니다.)
grant dba to lion;
--13)car테이블을 다시 만드시오.(다음 과제를 위한 것 입니다.)
--  컬럼 : model varchar2(50), manufacturer varchar2(50), price number(20)
create table car(
    model varchar2(50) not null,
    manufacturer varchar2(50) not null,
    price number(20)
);

--14)1 ~ 11까지를 본인이 원하는 유저명, 권한종류, connection명, 테이블명, 컬럼명, 자료형등으로 한번더 진행하세요.
create user test identified by 1111;
grant dba to test;
create table fruit(
    name varchar2(20) primary key,
    price number not null
);
desc fruit;
select * from fruit;

drop table fruit;

revoke dba from test;

drop user test;

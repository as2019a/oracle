create table teacher(
    id number primary key,
    nickname varchar2(20),
    name varchar2(30) not null,
    gender char(1) not null
);

desc teacher;

-- [INSERT]
insert into teacher(id, nickname, name, gender) 
            values(1, 'fylnn', '장동혁', 'm');
select * from teacher;
-- 실습1 : 자기자신을 teacher 테이블에 추가
-- 실습2 : 추가하고 싶은 사람을 테이블에 추가
insert into teacher(id, nickname, name, gender) 
            values(2, 'lee', '이영섭', 'm');
select * from teacher;

insert into teacher(id, nickname, name, gender)
            values(3, 'has', '이지혜', 'y');
insert into teacher(id, nickname, name, gender)
             values(4, '', '이연경', 'y');

-- 컬럼명 생략
insert into teacher values(5, 'park', '박연경', 'y');

-- 제약조건 위반(primary key)
insert into teacher values(4, 'you', '유', 'y');

-- 제약조건 위반(not null)
insert into teacher(id, name) values(6, '장다혜');
insert into teacher(id, name, gender) values(6, '장다혜', null);

-- 자료형 위반
insert into teacher values('six', 'kong', '강은혜', 'y');
insert into teacher values(6, 'kong', '강은혜', 'female');



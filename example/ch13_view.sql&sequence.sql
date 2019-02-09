-- 시퀀스 생성
create sequence seq_testtable_testcolumn;

-- 시퀀스 사용
select seq_testtable_testcolumn.nextval from dual;
select seq_testtable_testcolumn.currval from dual;

-- 시퀀스 삭제
drop sequence seq_testtable_testcolumn;

-- 시퀀스 옵션
create sequence seq_testtable_testcolumn
start with 10 -- 시작할 값 : 1
increment by 2 -- 증가할 값 : 1
maxvalue 20 -- 최대값 : 10^27
cycle -- 순환여부 : nocycle
minvalue 5 -- 최소값
cache 5;

select seq_testtable_testcolumn.nextval from dual;

create table board(
    id number primary key,
    title varchar2(100) not null,
    content clob
);
create sequence seq_board_id;
insert into board values(seq_board_id.nextval, '두번째 글', '2019년을 준비하자!!');
select * from board;


-- [view]
select * from tabs;
select * from empl;
insert into empl (select * from employees);

create view salarys as
select first_name, salary*(1 + nvl(commission_pct, 0)) 실수령액 from employees;

select * from salarys;

create table score(
    name varchar2(30) primary key,
    korean number(3),
    math number(3),
    english number(3)
);
insert into score values('harry', 100, 60, 70);
select * from score;

create or replace view score_view as
    select name, korean, math, english, korean+math+english total,
                                        trunc((korean+math+english)/3) average
    from score
with read only;
select * from score_view;

update score set math = 100 where name = 'harry';
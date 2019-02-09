drop table teacher;
create table teacher(
    -- primary key : unique + not null, 테이블당 1개 가능
    id number constraint teacher_id_pk primary key,
    nickname varchar2(20) constraint teacher_nickname_uk unique,
    name varchar2(30) not null,
    gender char(1) 
    constraint teacher_gender_chk 
    check(gender in('f','m'))
    constraint teacher_gender_nn not null
);
-- 제약조건 조회
desc teacher;
select * from user_constraints where table_name = 'TEACHER';

insert into teacher values(1, 'michael', '오경주', 'm');
-- primary칼럼에는 중복된 값이나 null을 집어넣을 수 없다
insert into teacher values(null, 'flynn', '장동혁', 'm');
-- unique컬럼에는 중복된 값을 집어낳을 수 없다
insert into teacher values(2, null, '장동혁', 'm');
-- cheack제약조건은 조건이 true이어야지만 데이터를 집어넣을 수 있다
insert into teacher values(3, 'lee', '이지혜', 'F');

-- [제약조건 삭제, 제약조건 추가]
alter table teacher drop constraint teacher_gender_chk;
-- 이미 데이터가 들어가있는 상황에서 제약조건을 추가하려면
-- 데이터들을 위반하지않는 제약조건 추가
alter table teacher add constraint teacher_gender_chk
check(gender like 'F%' or gender like 'M%');
-- 제약조건 수정방법은 없으므로 삭제하고 다시 만들어야한다.
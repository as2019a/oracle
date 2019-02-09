select * from teacher;
insert into teacher values(4, 'null', '이혜나', 'f'); -- 기본구성

create table lecture(
    id number primary key,
    name varchar2(50) not null,
    room varchar2(50) check(room in ('A','B','C','D','E'))
);

insert into lecture values(1, '자바', 'A');
insert into lecture values(2, '오라클', 'B');
select * from teacher;
select * from lecture;

alter table lecture add teacher_id references teacher(id);
-- 실습 : 자바강의를 장동혁이 오라클강의를 이지혜에게 할당하시오
update lecture set teacher_id = 2 where id = 1;
update lecture set teacher_id = 3 where id = 2;

select l.name, t.name
from lecture l, teacher t
where l.teacher_id = t.id;

-- 실습 : 오경주 강사가 맡는 HTML이라는 lecture table에 추가하시오
insert into lecture values(3, 'HTML', 'B', 1);
-- 실습 : HTML 강의를 오경주 강사에서 장동혁 변경하시오
update lecture set teacher_id = 2 where id = 3;
-- 실습 : 장동혁 강사 맡고 있는 강의를 삭제 하시오.
--(단, teacher_id를 모르고 이름만 아는 상태)
delete from lecture where teacher_id in (
    select id from teacher where name = '장동혁'
);

-- 제약조건 설정방법 : 
-- 1. 테이블 생성시
-- 2. 테이블 생성 후 추가
select * from user_constraints where table_name = 'LECTURE';
alter table lecture drop constraint SYS_C007055;

-- 테이블 생성 후 제약조건 추가
alter table lecture add foreign key(teacher_id) references teacher(id);

-- foreign key제약조건 특징
-- 1. 참조 테이블에 참조 컬럼에 값이 있어야 한다.
insert into lecture values(4, '자바', 'A', 4);
-- 2. 1조건에서 null인 경우는 상관 없음
insert into lecture values(4, '자바', 'A', null);

-- [N:M]
create table student(
    id number primary key,
    name varchar2(20) not null,
    grade number(1) check(grade in(1,2,3,4))
);
select * from student;
select * from lecture;
insert into student values(1, '철수', 1);
insert into student values(2, '민수', 2);
insert into student values(3, '영희', 2);


create table register(
    id number primary key,
    lecture_id number references lecture(id),
    student_id number references student(id),
    reg_time timestamp not null
);
select * from register;
insert into register values(1, 4, 1, systimestamp);
insert into register values(2, 4, 2, systimestamp);
insert into register values(3, 2, 2, systimestamp);
insert into register values(4, 2, 3, systimestamp);

-- 자바과목(4)을 수강하는 학생이름 조회
select l.name, s.name, r.reg_time
from lecture l, student s, register r
where l.id = r.lecture_id and s.id = r.student_id;
-- 자바과목 수강생 조회
select l.name, s.name, r.reg_time
from lecture l, student s, register r
where l.id = r.lecture_id and s.id = r.student_id and l.id = 4;
-- 오라클과목 수강생 조회
select l.name, s.name, r.reg_time
from lecture l, student s, register r
where l.id = r.lecture_id and s.id = r.student_id and l.id = 2;

-- 실습 : 민수(2)학생이 수강하는 과목이름, 수강신청시간을 조회(+이름 조회)
select l.name, s.name, r.reg_time
from lecture l, student s, register r
where l.id = r.lecture_id and s.id = r.student_id and s.id = 2;

--
delete from lecture where id = 4;


create table room(
    room varchar(50) primary key,
    capacity number not null
);

insert into room values('A', 20);
insert into room values('B', 25);
select * from room;
select * from lecture;
alter table lecture add foreign key(room) references room(room);


-- [외래키 제약조건 삭제]
-- [no action(기본값)]
delete from lecture where room = 'A';
delete from room where room = 'A';

-- [on delete cascade : 참조 당하는 튜플이 삭제될시 참조하는 튜플도 함께 삭제]
select * from user_constraints where table_name = 'LECTURE';
alter table lecture drop constraint SYS_C007066;
alter table lecture add foreign key(room)
references room(room) on delete cascade;
delete from room where room = 'A';

-- [on delete set null : 참조당하는 튜플이 삭제될 시 참조를 제거(null로 변경)]
select * from user_constraints where table_name = 'REGISTER';
select * from user_constraints where table_name = 'STUDENT';
alter table register drop constraint SYS_C007062;
alter table register add foreign key(lecture_id)
references lecture(id) on delete set null;

delete from room where room = 'A';
select * from lecture;
select * from register;
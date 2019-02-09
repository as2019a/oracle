select * from empl;
-- 트랜젝션 시작(이전 commit 또는 rollback 또는 connection의 시작)
delete from empl;
-- 트랜젝션 취소
rollback;
delete from empl;
-- 트랜젝션 적용
commit;
rollback;

-- 은행계좌
create table account(
    account_number varchar2(20) primary key check(
    account_number like '%-%'),
    name varchar(20) not null,
    money number
);
rollback;
select * from account;

insert into account values('1111-1111','harry',10000);
insert into account values('2222-2222','lone',0);
-- rollback
commit;

-- 계좌이쳬 haaty -> lone 1000원 이체
update account set money = money-10000 where account_number = '1111-1111';
-- 천재지변
update account set money = money+10000 where account_number = '2222-2222';
rollback;

-- 계좌이쳬 haaty -> lone 1000원 이체
update account set money = money-10000 where account_number = '1111-1111';
-- 계좌번호 오류
update account set money = money+10000 where account_number = '2222-2221';
rollback;

-- 계좌이쳬 haaty -> lone 1000원 이체
update account set money = money-10000 where account_number = '1111-1111';
-- 정상 실행
update account set money = money+10000 where account_number = '2222-2222';
commit;
select * from account;
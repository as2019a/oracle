--employees 테이블의 복사본인 empl테이블을 만드시오 (이미 존재한다면 삭제하고 생성)
drop table empl;
create table empl as select * from employees;
--empl 테이블의 모든 튜플을 삭제하시오.
delete from empl;
--완료 후 원상태로 복원
drop table empl;
create table empl as select * from employees;
--empl 테이블의 튜플 중 사번이 짝수인 사원들을 삭제하시오.
delete from empl where mod(employee_id, 2) = 0;
--완료 후 원상태로 복원
drop table empl;
create table empl as select * from employees;
--empl 테이블의 튜플 중 commission_pct가 null인사원을 삭제하시오.
delete from empl where;
--완료 후 원상태로 복원
drop table empl;
create table empl as select * from employees;
--empl 테이블의 튜플 중 commission_pct의 값이 null인 사원의 commission_pct를 
--월급이 15000 이상이라면 0.15, 10000이상 15000미만이라면 0.1, 
--5000이상 10000미만이라면 0.07, 5000미만은 0.05로 수정하시오.
update empl set_commission_pct = 
    case
        when salary >= 15000 then 0.15
        when salary >= 10000 then 0.1
        when salary >= 5000 then 0.07
        else 0.05
    end
where commission_pct is null;
--완료 후 원상태로 복원
drop table empl;
create table empl as select * from employees;
--empl테이블의 튜플중 근속년수가 12년이 지난 사원은 월급을 10% 증가시키고 
--commission_pct를 2배로 수정하시오.
update empl set salary = salary*1.1
where months_between(sysdate, hire_date)
--완료 후 원상태로 복원
select * from empl;
drop table empl;
create table empl as select * from employees;
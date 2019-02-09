-- [표 작성]
create table hke_enterprise(
    hke_id number primary key,
    hke_name varchar2(30),
    hke_hire_date date,
    hke_salary number(8,2),
    department_name varchar2(30),
    city varchar2(30)
);
select * from hke_enterprise;
alter table hke_enterprise add my_date date;
-- insert into teacher(hke_id, hke_name, hke_hire_date, hke_salary, 
            -- department_name, city) 
            -- values(1, '권연정', ''
drop table hke_enterprise;
create table hke_enterprise(
    hke_id number primary key,
    name varchar2(30),
    my_number number,
    my_date date,
    hke_hire_date date,
    hke_salary number(8,2),
    department_name varchar2(30),
    city varchar2(30)
);
select * from hke_enterprise;
insert into teacher(hke_id, hke_name, my_number, my_date, 
            hke_hire_date, hke_salary, 
            department_name, city) 
            values(1, '권연정', 47, '72/03/02', '98/09/20', 830000,
                    'CEO', null);
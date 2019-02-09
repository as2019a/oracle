create table company(
    id number primary key,
    name varchar2(50) not null,
    phone varchar2(50) 
);

select * from company;

create table product(
    id number primary key,
    price number,
    company_id number references company(id)
);

select * from product;

create table users(
    id number primary key,
    name varchar2(50) not null,
    email varchar2(50) not null,
    regdate timestamp not null,
    point number(10)
);

select * from users;

create table buy(
    id number primary key,
    product_id number references product(id),
    company_id number references company(id),
    count timestamp not null
);

select * from buy;

create table basket(
    id number primary key,
    product_id number references product(id),
    company_id number references company(id),
    count timestamp not null
);

select * from basket;
alter table buy add foreign key(user_id) references users(id);
alter table basket add foreign key(user_id) references users(id);
alter table basket drop constraint SYS_C007082;
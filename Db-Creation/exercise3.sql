drop table providers cascade constraints;
drop table categories cascade constraints;
drop table customers cascade constraints;
drop table employees cascade constraints;
drop table products cascade constraints;
drop table products_providers cascade constraints;
drop table orders cascade constraints;
drop table order_details cascade constraints;

create table providers (
    id_prov number primary key,
    name_prov varchar2(25),
    phone number(9) unique,
    email varchar2(50)
    );

create table categories (
    id_cat number primary key,
    desc_cat varchar2(100)
    );
    
alter table categories modify (
    desc_cat varchar2(100) default 'No description'
);

insert into categories(id_cat,desc_cat) values (1,'Bikes');
insert into categories(id_cat,desc_cat) values (2,'Cars');
insert into categories(id_cat) values (3);

create table customers (
    id_cus number primary key,
    name_cus varchar2(25),
    surname varchar2(25),
    address varchar2(100),
    phone number(9) unique
    );
    
create table employees (
    id_emp number primary key,
    name_emp varchar2(25),
    surname varchar2(25),
    address varchar2(100),
    code_area number
    );
    
create table products (
    num_prod number primary key,
    name_prod varchar2(25),
    selling_price number,
    stock number,
    id_cat number,
    constraint products_fk foreign key (id_cat)
        references categories (id_cat) on delete cascade
    );

insert into products(num_prod,name_prod,selling_price,stock,id_cat)
    values (2,'Suzuki Bandit 1250SA',14000,1,1);

create table products_providers (
    id_prov number,
    num_prod number,
    constraint pp_pk primary key (id_prov,num_prod),
    constraint fk1 foreign key (id_prov)
        references providers (id_prov) on delete cascade,
    constraint fk2 foreign key (num_prod)
        references products (num_prod) on delete cascade
    );
    
create table orders (
    num_order number primary key,
    date_order date,
    id_cus number references customers (id_cus) on delete cascade not null,
    id_emp number references employees (id_emp) on delete cascade not null
    );
    
create table order_details (
    num_order number,
    num_prod number,
    quantity number,
    price number,
    constraint od_pk primary key (num_order, num_prod),
    constraint fk3 foreign key (num_order)
        references orders (num_order) on delete cascade,
    constraint fk4 foreign key (num_prod)
        references products (num_prod) on delete cascade
    );

alter table order_details 
    add constraint od_ck check (quantity between 1 and 100);
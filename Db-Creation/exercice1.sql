/*
1. Create the table PROVINCES with the following fields:
Cod_provi is number(2) and the primary key
Name is varchar2(25) and mandatory
Country is varchar2(25) and one of the followings: Spain, Portugal or Italy
*Insert the province 1, Aragon, of Spain.
*/

drop table provinces cascade constraints;

create table provinces (
    Cod_provi number(2) primary key,
    Name_provi varchar2(25) not null,
    Country varchar2(25),
    constraint country_ck check (country in ('Spain', 'Portugal', 'Italy') )
    );
    
insert into provinces values (1, 'Aragon', 'Spain');

insert into provinces(name_provi,cod_provi,country) values ('Catalunya', 3, 'Spain');

/*
2. Create the table COMPANIES with the following fields:
Cod_company number(2) is the primary key
Name varchar2(25) mandatory and by default is �Company1�
Date_crea is a date, and by default is the day after today�s date
*Insert the company 20, called Alfa21 S.A.
*/

drop table companies cascade constraints;
create table companies (
    cod_company number(2) primary key,
    name_company varchar2(25) default 'Company1' not null,
    date_crea date default sysdate+1
    );
insert into companies values (20,'Alfa21 S.A.',default);
insert into companies(cod_company,name_company) values (21,'Alfa21 S.A.');
insert into companies(cod_company) values (13);
insert into companies values (14,default,default);

/*
3. Create the table MAINLANDS with the following fields:
Code is a number and the primary key
Name is varchar2(20) mandatory with a default value �Europe�
*/
drop table mainlands cascade constraints;
create table mainlands (
    code number primary key,
    name_ml varchar2(20) default 'Europe' not null
    );


/*
4. Create the table STUDENTS with the following fields:
code is number(3) is the primary key
name is a varchar2(21), and it is mandatory
surname is a varchar2(30), mandatory, and must be in upper cases.
course is a number and must be 1, 2 or 3
date_enroll is a date and by default is today�s date.
*/
drop table students cascade constraints;
create table students (
    code number(3) primary key,
    name_stu varchar2(21) not null,
    surname varchar2(30) check ( surname = upper(surname) ) not null,
    course number,
        constraint course_ck check ( course in (1,2,3) ),
    date_enroll date default sysdate
    );


/*
5. Create the table EMPLOYEES with the following fields:
cod_emple number(2) and primary key
name varchar2(20) and mandatory
surname varchar2(25)
salary number with 7 digits and 2 decimals, higher than 0
In addition, two fields are foreign keys of provinces and companies,
respectively. The foreign key of provinces must have on delete cascade.
*Note: there must be a total of 6 fields.

a) Insert into the table EMPLOYEES the employee 300 Veronica Lopez with a salary
of 3000. What happens? Why?

b) Insert the same data with the employee code 30.

c) Insert into table EMPLOYEES the employee 10, Sergio P�rez, who works for the
company 10 in province 1. What happens? Why?

d) Insert into table EMPLOYEES the employee 10, Sergio P�rez, who works for the
company Alfa21 and lives in Aragon.
*/
drop table employees cascade constraints;
create table employees (
    cod_emple number(2) primary key,
    name_emp varchar2(20) not null,
    surname varchar2(25),
    salary number(7,2) check ( salary > 0 ),
    Cod_provi number(2) constraint provi_fk references provinces(cod_provi) on delete cascade,
    cod_company number(2),
        constraint company_fk foreign key (cod_company) references companies(cod_company)
    );
--a)
insert into employees (cod_emple,name_emp,surname,salary) values (300,'Veronica','Lopez',3000);
-- code_employee higher than 99 (data type)
--b)
insert into employees (cod_emple,name_emp,surname,salary) values (30,'Veronica','Lopez',3000);
--c)
insert into employees (cod_emple,name_emp,surname,cod_provi,cod_company) 
    values (10,'Sergio','Perez',1,10);
--error due to the cod_company foreign key; company 10 does not exist in table companies

--d)
insert into employees (cod_emple,name_emp,surname,cod_provi,cod_company) 
    values (10,'Sergio','Perez',1,20);

/*
6. Create the table PROVINCES and PEOPLE with the following structure: the primary
key is in bold, and codprovin is referring to cod_prov. Include on delete cascade.
*/
/* IMPORTANT NOTES
    1. Table provinces already exists, so first it should be removed with the cascade constraints.
    2. Tables with primary keys only must be created FIRST, because foreign keys refer to already 
        existing keys.
    3. Make sure to run the whole script once you think it is ok. */

drop table provinces cascade constraints;
drop table people cascade constraints;

create table provinces (
    cod_prov number,
    name_prov varchar2(25),
        constraint provi_pk primary key (cod_prov)
    );
create table people (
    id_person number primary key,
    name_person varchar2(25),
    address varchar2(150),
    codprovin number,
        constraint prov_fk foreign key (codprovin) references provinces (cod_prov) on delete cascade
    );

/*
7. Create the table EXAMPLE1 with the following columns and assign today�s date to
the date column.
ID VARCHAR2(10)
NAME VARCHAR2(30)
AGE NUMBER(2)
DATE DATE
Insert a row with the values: 1234, PEPA, 21 without the date, checking that today�s
date is actually added by default.
*/
drop table example1 cascade constraints;
create table example1 (
    ID_ex VARCHAR2(10),
    NAME_ex VARCHAR2(30),
    AGE NUMBER(2),
    DATE_ex DATE default sysdate
    );
insert into example1 (ID_ex,NAME_ex,AGE) values ('1234', 'PEPA', 21);

/*
8. Create the table EXAMPLE3 whose columns and constraints are the following:
ID VARCHAR2(10)
NAME VARCHAR2(30)
AGE NUMBER(2)
COURSE NUMBER
Constraints:
- ID cannot be null
- ID is the primary key
- Age must be between 5 and 20 years old
- Name must be in upper cases
- Course can be 1, 2 or 3
Insert the following rows and explain the possible errors in case there are any:
INSERT INTO example3 VALUES ('1111', 'Pepe', 4, 1);
INSERT INTO example3 VALUES ('1111', 'PEPE', 10, 2);
INSERT INTO example3 VALUES ('2222', 'MARIA', 12, 5);
INSERT INTO example3 VALUES ('2222', 'MARIA', 12, 2);
*/
create table example3 (
    ID_ex VARCHAR2(10) primary key not null,
    NAME_ex VARCHAR2(30),
        constraint name_ck check ( NAME_ex = upper(NAME_ex) ),
    AGE NUMBER(2),
        constraint age_ck check ( age between 5 and 20 ),
    COURSE NUMBER,
        constraint course_ck2 check (course in (1,2,3) )
    );
--INSERT INTO example3 VALUES ('1111', 'Pepe', 4, 1);
INSERT INTO example3 VALUES ('1111', 'PEPE', 10, 2);
--INSERT INTO example3 VALUES ('2222', 'MARIA', 12, 5);
INSERT INTO example3 VALUES ('2222', 'MARIA', 12, 2);

/*
9. Create the tables with the following fields and constraints:
STUDENTS
Code number(2) PK
Name varchar2(25) mandatory
SUBJECTS
Code number PK,
Name varchar2(25)
GRADES
Cod_stu number(2)
Cod_sub number
Grade number(2),
(Cod_stu, Cod_sub) is PK
Grade must be a number between 0 and 10
There are 2 foreign keys referring to STUDENTS and SUBJECTS.
*/
drop table students cascade constraints;
drop table subjects cascade constraints;
drop table grades cascade constraints;

create table students (
    Code number(2) primary key,
    Name_stu varchar2(25) not null
    );

create table subjects (
    Code number primary key,
    Name_sub varchar2(25)
    );
    
create table grades (
    Cod_stu number(2),
    Cod_sub number,
    Grade number(2),
    constraint grades_pk primary key (Cod_stu, Cod_sub),
    constraint cod_stu_fk foreign key (cod_stu) references students(code),
    constraint cod_sub_fk foreign key (cod_sub) references subjects(code),
    constraint grade_ck check ( grade between 0 and 10 )
    );
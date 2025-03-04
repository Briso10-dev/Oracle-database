-- Connect to the HR database.

/* 1. Create the table EMPLOYEES3 from the table EMPLOYEES, including all the fields and data
from the employees of department 100.
Check the structure of EMPLOYEES3 and compare it with EMPLOYEES. Does it have a primary
key? */
create table employees3 as
    select *
    from employees
    where department_id = 100;


/* 2. Create the table DEPARTMENTS2 with the same fields and data from DEPARTMENTS. */
create table departments2 as
    select *
    from departments;

/* 3. Add two new columns to the table EMPLOYEES3: hobby, varchar2(40), and children,
number(2). */
alter table employees3 add (hobby varchar2(40));
alter table employees3 add (children number(2));

alter table employees3 add (
    hobby varchar2(40),
    children number(2)
    );
    
/* 4. Add a new column called AGE, with type NUMBER(3) NOT NULL. What�s happening and
why? */
alter table employees3 add ( age number(3) not null );
-- error, table must be empty to add a not null column

/* 5. Try to do something to be able to define the column AGE as a not null field. */
alter table employees3 add ( age number(3) default 18 not null );

/* 6. Delete columns AGE and CHILDREN of the table EMPLOYEES3. */
alter table employees3 drop (age, children);

/* 7. Modify the length of the field hobby to 30 characters maximum. */
alter table employees3 modify ( hobby varchar2(30) );

/* 8. Modify the length of the field FIRST_NAME to 5 characters maximum. What�s happening
and why? */
alter table employees3 modify ( first_name varchar2(5) );
-- if data are already inside the column, be careful with the modification

/* 9. Modify the length of the field EMPLOYEE_ID of the table EMPLOYEES3 so that it is a
number with 5 digits, none of them decimal. What�s happening? Modify it now to be a
number with 8 digits with no decimals. */
alter table employees3 modify (employee_id number(5));
-- cannot decrease the length of a number, but always can increase it
alter table employees3 modify (employee_id number(8));

/* 10. Try to delete the column DEPARTMENT_ID of the table DEPARTMENTS. What�s happening
and why? */
alter table departments drop (department_id);

/* 11. Make the field EMPLOYEE_ID of the table EMPLOYEES3 the primary key of the table and
name the constraint PK_EMP3. Check the structure of the table to see it is indeed the
primary key now. */
ALTER TABLE employees3 ADD constraint PK_EMP3 primary key (employee_id);

/* 12. Add a new constraint to EMPLOYEES3 named salary_ck to check that the salary is higher
than 1000 and lower than 4000. What�s happening? Change the limits of the interval to
1000-25000. */
alter table employees3 add constraint salary_ck check ( salary>1000 and salary<4000 );
alter table employees3 add constraint salary_ck check ( salary>1000 and salary<25000 );

/* 13. Create a new table called dep as a copy of the table departments. */
create table dep as
    select *
    from departments;

/* 14. Insert the following row (10,'Admin', 203, 1700) into the table dep. */
insert into dep values (10,'Admin', 203, 1700);

/* 15. Create a new constraint for table dep so that department_id is the primary key. What�s
happening? Try to provide a solution. */
alter table dep add constraint dep_pk primary key (department_id);
--error: department admin duplicated
delete from dep
where department_name = 'Admin';
alter table dep add constraint dep_pk primary key (department_id);

/* 16. Create a new constraint for table employees3 so that commission is not higher than 5%
(0.05 in the table). */
alter table employees3 add constraint comission_ck check ( commission_pct <= 0.05 );

/* 17. Update every row in employees3 so that every employee has a 9% commission. What�s
happening? Set now a commission of 2%. */
--update employees3 set commission_pct = 0.09;
update employees3 set commission_pct = 0.02;

/* 18. Create a new constraint for the table employees3 called fk_emp3 so that department_id
is a foreign key from dep with on delete cascade. */
alter table employees3 add constraint fk_emp3 foreign key (department_id)
    references dep(department_id) on delete cascade;

/* 19. Create the table shops without constraints with the following fields (add an appropriate
domain for each of them): ID, name, address, location, city, province, postal_code.
Add the following constraints:
- ID is the primary key
- province must be in upper cases
- name is mandatory
- city must be one of the following values: Zaragoza, Huesca, Teruel */
create table shops (
    ID_shop number(2), 
    name_shop varchar2(30), 
    address varchar2(150), 
    location_shop varchar2(30), 
    city varchar2(30), 
    province varchar2(30), 
    postal_code number(5)
    );
    
alter table shops add constraint shops_pk primary key (ID_shop);
alter table shops add constraint province_upper check ( province = upper(province) );
alter table shops add constraint name_mandatory check ( name_shop is not null );    
alter table shops add constraint city_ck check ( city in ('Zaragoza', 'Huesca', 'Teruel') );   
    
    
    
    
    
    
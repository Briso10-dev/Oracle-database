--1.
SHOW AUTOCOMMIT;

--2.
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (300, 'Finances', 110, 1800);
-- To check if the insertion has been executed correctly:
SELECT * FROM departments 
WHERE department_id = 300;
COMMIT;

--3.
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (400, 'Finances2', 389, 1800);
--Observation : it's due to a foreign key constraint violation. In this case, the manager_id must exist in the employees table, and the location_id must exist in the locations table.

--4.
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, job_id)
VALUES (401, 'Ricardo', 'Marcelo', 'rmarcelo@gmail.com', SYSDATE, 1600, 'SA_MAN');


insert into departments
values (401,'Ricardo,'Marcelo','rmarcelo@gmail.com',null,sysdate);

--5.
rollback;
--6.
create table test_table (
    id number(6) primary key,
    name varchar2(20)   ,
    hire_date date,
    salary number(8,2)
);
insert into test_table (id,name,hire_date,salary)
select employee_id, first_name || ' ' || last_name as full_name,hire_date, salary
from employees
where department_id = 50;

--7.
insert into ttest_table
select 390,'Julio',hire_date,salary
from employees
where employee_id = 119;
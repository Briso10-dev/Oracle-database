-- Connect to Unit_6_Ex_2

-- Unit 6 - Subqueries EMPLOYEES database Exercises II

/* 1. Obtain all the data of the Marketing employees. */
select *
from employees
where department_id = (
    select department_id
    from departments
    where department_name like 'Marketing'
    );

/* 2. Obtain all the data of employees with a salary lower than the average salary. Note:
use the function avg. */
select *
from employees
where salary < ( select avg(salary)
                 from employees )
;

/* 3. Obtain all the data of the countries that belong to the same continent as Argentina. */
select *
from countries
where region_id = (
    select region_id
    from countries
    where country_name like 'Argentina'
    );

/* 4. Obtain all the data of the employees whose salary is lower than the average salary
of the sales manager employees. Note: sales manager employees have a jod_id
equal to SA_MAN. */
select *
from employees
where salary < (
    select avg(salary)
    from employees
    where job_id like 'SA_MAN'
    );

/* 5. Obtain all the data of the employees with the same job as David Austin. */
select *
from employees
where job_id like (
    select job_id
    from employees
    where first_name like 'David'
        and last_name like 'Austin'
    )
;

/* 6. Obtain all the data of the employees whose job title is Sales Manager. */
select *
from employees
where job_id like (
    select job_id
    from jobs
    where job_title like 'Sales Manager'
    );

/* 7. Obtain the name (first name) and surname (last name) of the employees that do
not work in the department of Steven King. */
select first_name,last_name
from employees
where department_id != (
    select department_id
    from employees
    where first_name like 'Steven' and last_name like 'King'
    );

/*8. Obtain all the data of the employees that earn more money than the employees of
department 30. */
select *
from employees
where salary > ALL (
    select salary
    from employees
    where department_id = 30
    );

/* 9. Obtain all the data of the Seattle departments. */
select *
from departments
where location_id = (
    select location_id
    from locations
    where city like 'Seattle'
    );

/* 10. Show the name, surname and department ID of the Seattle employees. */
--with IN
select first_name,last_name,department_id
from employees
where department_id IN (
    select department_id
    from departments
    where location_id = (
        select location_id
        from locations
        where city like 'Seattle'
        )
    )
;
--with ANY
select first_name,last_name,department_id
from employees
where department_id = ANY (
    select department_id
    from departments
    where location_id = (
        select location_id
        from locations
        where city like 'Seattle'
        )
    )
;

/* 11. Obtain all the data of the employees that work in any department but Marketing or
Sales. */
select *
from employees
where department_id not in (
    select department_id
    from departments
    where department_name in ('Marketing','Sales')
    )
;

/* 12. Obtain all the data of employees that work in either Marketing or Sales. */
select *
from employees
where department_id in (
    select department_id
    from departments
    where department_name in ('Marketing','Sales')
    )
;

/* 13. Make a list of the countries from Asia or Europe. */
select *
from countries
where region_id in (
    select region_id
    from regions
    where region_name in ('Asia','Europe')
    )
;

/* 14. Obtain all the data of the employees whose name starts with H and whose salary
is higher than any of the salaries of employees of department 100. */
select *
from employees
where first_name like 'H%'
    and
      salary > any (
        select salary
        from employees
        where department_id = 100
        )
;

/* 15. Find the name and surname of the boss of David Austin. */
select first_name,last_name
from employees
where employee_id = (
    select manager_id
    from employees
    where first_name like 'David' and last_name like 'Austin'
    );

/* 16. Obtain all the data of the employees of the United States of America. */
select *
from employees
where department_id IN (
    select department_id
    from departments
    where location_id IN (
        select location_id
        from locations
        where country_id IN (
            select country_id
            from countries
            where country_name like 'United States of America'
            )
        )
    )
;

/* 17. Obtain the name and surname of the employees who earn the minimum salary
for their jobs. */
select first_name,last_name
from employees e
where job_id in (
    select job_id
    from jobs j
    where j.min_salary = e.salary
    );

select first_name,last_name
from employees
where salary in (
    select min_salary
    from jobs
    where jobs.job_id = employees.job_id
    );


/* 18. Obtain all the data of the departments starting with R that have no employees. */
select *
from departments
where department_name like 'R%'
    and department_id not in (
        select department_id
        from employees
        where employees.department_id = departments.department_id
        );

/* 19. Show all the data of departments with employees whose names start with A. */
select *
from departments d
where department_id in (
    select department_id
    from employees e
    where first_name like 'A%'
        and e.department_id = d.department_id
    );

/* 20. Show all the data of departments whose employees ended their contracts in
1998. */
select *
from departments
where department_id in (
    select department_id
    from job_history
    where end_date like '%98'
    );
    
select *
from departments
where department_id in (
    select department_id
    from job_history
    where end_date between '01/01/1998' and '31/12/1998'
    );
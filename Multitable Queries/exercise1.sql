-- Connect to Unit_6_Ex_2

-- Unit 6 - Multitable queries EMPLOYEES database Exercises III

/* 1. Obtain the name of each department with the city where they are located. */
select department_name, city
from departments natural join locations;

select departments.department_name, locations.city
from departments join locations using (location_id);

select d.department_name, l.city
from departments d join locations l 
    on ( d.location_id = l.location_id );

-- example showing the country name also, but only deparments starting with A
select d.department_name, l.city, c.country_name
from departments d join locations l on (d.location_id=l.location_id)
    join countries c on (l.country_id=c.country_id)
where d.department_name like 'A%';

/* 2. Obtain a list of the full name of the employees with the department they belong to. */
select e.first_name,e.last_name,d.department_name
from employees e left outer join departments d on (d.department_id=e.department_id);

/* 3. Obtain the departments that have employees, only once (no names repeated). */
select distinct department_name
from departments join employees using (department_id);

/* 4. Obtain the id, last name and job title of the employees of department 80. */
select e.employee_id, e.last_name, j.job_title
from employees e join jobs j on (e.job_id=j.job_id)
where e.department_id = 80;

/* 5. Obtain the last name and job title of the employees whose job is not Sales Manager. */
select e.last_name,j.job_title
from employees e join jobs j on (e.job_id=j.job_id)
where j.job_title not like 'Sales Manager';

/* 6. Obtain a list with the departments and their location (city and country). */
select d.department_name, l.city, c.country_name
from departments d join locations l on (d.location_id=l.location_id)
    join countries c on (l.country_id=c.country_id);

/* 7. Show the last name, job title and department name of the employees whose last name starts
with A and has more than 6 letters. */
select e.last_name,j.job_title,d.department_name
from departments d join employees e on (d.department_id=e.department_id)
    join jobs j on (e.job_id=j.job_id)
where e.last_name like 'A_______%'
;

/* 8. Obtain the surname of the employees that have the same job title as their manager. */
select e.last_name as employee, e.job_id as employee_job, m.last_name as boss, m.job_id as boss_job
from employees e join employees m on (e.job_id=m.job_id)
where e.manager_id = m.employee_id
;

/* 9. Obtain a list of the employees� surnames with the surname of their boss, alphabetically listed by
the bosses� surnames. */
select e.last_name as employee, m.last_name as boss
from employees e join employees m on (e.manager_id=m.employee_id)
order by boss,employee;

/* 10. Make a list of the employees whose department code is higher than the Marketing department
code. Do this in two ways: with a subquery and with a multitable query. */
select *
from employees
where department_id > (
    select department_id
    from departments
    where department_name like 'Marketing'
    );
    
select *
from employees e cross join departments d
where e.department_id > d.department_id
    and
      d.department_name like 'Marketing';

select *
from employees e join departments d on (e.department_id > d.department_id)
where d.department_name like 'Marketing';
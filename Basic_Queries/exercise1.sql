-- Unit 6 - Basic Queries - Exercises 1

/* 1. Obtain the list of all products including: id_manufacturer, id_product, description, price and price
with VAT (VAT is 21%). */
select id_manuf, id_prod, description, price, price*1.21 as price_VAT
from products
;

/* 2. Show the following data of orders: number of the order, manufacturer, product, quantity, price
per unit and total price. */
-- amount is the total price of a product for a certain order.
select num_order,manuf,prod,quantity,amount/quantity as price_per_unit, amount
from orders
;

/* 3. Obtain a list with all the information of the customers ordered by the assigned representative
employee. */
select *
from customers
order by num_emp -- ordination is ascendant by default, so there is no need to type asc
;

/* 4. Obtain a list of the offices in alphabetical order by region, then city, and then the office with the
higher number in case of 2 or more offices in the same city. */
select *
from offices
order by region, city, office desc
;

/* 5. Obtain a list of orders from the oldest one to the newest one. */
select *
from orders
order by date_order
;

/* 6. Get the list of employees that are assigned to an office. */
select num_emp,name,office
from employees
where office is not null;

/* 7. Obtain the offices without a manager. */
select office,city,region,boss
from offices
where boss is null;

/* 8. Make a list with the data of the north and east offices, in that order (first north and then east). */
select *
from offices
where region = 'north' or region = 'east'
order by region desc
;

select *
from offices
where region like 'north' or region like 'east'
order by region desc
;

select *
from offices
where region in ('north','east')
order by region desc
;

/* 9. Make a list with the employees called Julia and another list with the customers called Julia. */
select *
from employees
where name like 'Julia%';

select *
from customers
where name like 'Julia%';

/* 10. Make a list of the products whose id ends with x. */
-- ok way
select *
from products
where rtrim(id_prod) like '%x';
-- cutre way
select *
from products
where id_prod like '%x_____'
    or id_prod like '%x______';

/* 11. Obtain the list of products whose id starts with 4. */
select *
from products
where id_prod like '4%';
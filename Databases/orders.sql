drop table orders cascade constraints;
drop table customers cascade constraints;
drop table products cascade constraints;
drop table employees cascade constraints;
drop table offices cascade constraints;


--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------
create table customers 
   (    num_cus number, 
        name varchar2(30), 
        num_emp number, 
        credit_limit number
   ) ;


--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------
create table employees 
   (    num_emp number, 
        name varchar2(100), 
        age number, 
        office number, 
        title varchar2(20), 
        contract date, 
        boss number, 
        fee number, 
        sales number
   ) ;


--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------
create table orders 
   (    code number, 
        num_order number, 
        date_order date, 
        cus number, 
        employee number, 
        manuf char(10), 
        prod char(10), 
        quantity number, 
        amount number
   ) ;


--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------
create table products 
   (    id_manuf char(10), 
        id_prod char(10), 
        description varchar2(20), 
        price number, 
        stock number
   ) ;


--------------------------------------------------------
--  DDL for Table OFFICES
--------------------------------------------------------
create table offices 
   (    office number, 
        city varchar2(20), 
        region varchar2(20), 
        boss number, 
        goal number, 
        sales number
   ) ;


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEES
--   FILTER = none used
---------------------------------------------------
rem inserting into employees
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (106,'Luis Antonio',52,11,'general boss',to_timestamp('14/06/88 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),null,1500,1800);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (108,'Ana Bustamante',62,21,'sales boss',to_timestamp('12/10/89 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),106,2100,2200);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (109,'María Sunta',31,11,'representative',to_timestamp('12/10/99 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),106,1800,2400);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (101,'Antonio Viguer',45,12,'representative',to_timestamp('20/10/86 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),104,1800,2000);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (102,'Alvaro Jaumes',48,21,'representative',to_timestamp('10/12/86 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),108,2300,3500);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (103,'Juan Rovira',29,12,'representative',to_timestamp('01/03/87 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),104,1500,1600);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (104,'José Gonzalez',33,12,'sales boss',to_timestamp('20/10/87 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),106,1200,900);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (105,'Vicente Pantalla',37,13,'representative',to_timestamp('12/02/88 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),104,2100,2200);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (107,'Jorge Gutierrez',49,22,'representative',to_timestamp('14/11/88 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),108,1800,1100);
insert into employees (num_emp,name,age,office,title,contract,boss,fee,sales) values (110,'Juan Victor',41,null,'representative',to_timestamp('13/01/90 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),104,null,500);


---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE CUSTOMERS
--   FILTER = none used
---------------------------------------------------
rem inserting into customers
insert into customers (num_cus,name,num_emp,credit_limit) values (2101,'Luis García Antón',106,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2102,'Alvaro Rodriguez',101,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2103,'Jaime Llorens',105,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2105,'Antonio Canales',101,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2106,'Juan Suárez',102,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2107,'Juan López',110,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2108,'Julia Antequera',109,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2109,'Alberto Juanes',103,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2111,'Cristobal García',103,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2112,'María Silva',108,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2113,'Luisa Maron',104,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2114,'Cristina Bulini',102,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2115,'Vicente Martínez',101,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2117,'Carlos Tena',106,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2118,'Junípero Alvarez',108,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2119,'Salomón Bueno',109,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2120,'Juan Malo',102,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2121,'Vicente Ríos',103,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2122,'José Marchante',105,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2123,'José Libros ',102,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2124,'Juan Bolto',107,600);
insert into customers (num_cus,name,num_emp,credit_limit) values (2125,'Berta Besteiro',null,600);


---------------------------------------------------
--   END DATA FOR TABLE CUSTOMERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE PRODUCTS
--   FILTER = none used
---------------------------------------------------
rem inserting into products
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','41001','washer',1,277);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','41002','hinge',1.2,167);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','41003','art t3',1.5,207);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','41004','art 14',1.6,139);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','4100x','joint',0.3,37);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','4100y','exhauster',15,25);
insert into products (id_manuf,id_prod,description,price,stock) values ('aci','4100z','counter',14,28);
insert into products (id_manuf,id_prod,description,price,stock) values ('bic','41003','crank',4,3);
insert into products (id_manuf,id_prod,description,price,stock) values ('bic','41089','bearing',1.5,78);
insert into products (id_manuf,id_prod,description,price,stock) values ('bic','41672','plate',1.2,0);
insert into products (id_manuf,id_prod,description,price,stock) values ('fea','112','bucket',1.5,115);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','773c','rheostat 1',5.99,28);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','775c','rheostat 2',9,5);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','779c','rheostat 3',10.99,0);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','887h','nail box',0.4,223);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','887p','bolt',0.15,24);
insert into products (id_manuf,id_prod,description,price,stock) values ('imm','887x','crank',2.8,32);
insert into products (id_manuf,id_prod,description,price,stock) values ('qsa','xk47','net',2.2,38);
insert into products (id_manuf,id_prod,description,price,stock) values ('rei','2a44g','pas',2.3,14);
insert into products (id_manuf,id_prod,description,price,stock) values ('rei','2a44l','pump l',27,12);
insert into products (id_manuf,id_prod,description,price,stock) values ('rei','2a44r','pump r',27,12);
insert into products (id_manuf,id_prod,description,price,stock) values ('rei','2a45c','joint',0.5,10);
insert into products (id_manuf,id_prod,description,price,stock) values ('fea','114','bucket',1.8,15);
insert into products (id_manuf,id_prod,description,price,stock) values ('qsa','xk48','net',0.9,203);
insert into products (id_manuf,id_prod,description,price,stock) values ('qsa','xk48a','net',0.75,37);


---------------------------------------------------
--   END DATA FOR TABLE PRODUCTS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE OFFICES
--   FILTER = none used
---------------------------------------------------
rem inserting into offices
insert into offices (office,city,region,boss,goal,sales) values (11,'Valencia','east',106,3500,4000);
insert into offices (office,city,region,boss,goal,sales) values (12,'Alicante','east',104,4800,4200);
insert into offices (office,city,region,boss,goal,sales) values (13,'Castellon','east',105,2100,2160);
insert into offices (office,city,region,boss,goal,sales) values (21,'Badajoz','west',108,1800,1180);
insert into offices (office,city,region,boss,goal,sales) values (22,'A Coruña','west',108,null,null);
insert into offices (office,city,region,boss,goal,sales) values (23,'Madrid','centre',108,null,null);
insert into offices (office,city,region,boss,goal,sales) values (24,'Madrid','centre',108,1500,900);
insert into offices (office,city,region,boss,goal,sales) values (26,'Pamplona','north',null,null,null);
insert into offices (office,city,region,boss,goal,sales) values (28,'Valencia','east',null,5400,0);


---------------------------------------------------
--   END DATA FOR TABLE OFFICES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ORDERS
--   FILTER = none used
---------------------------------------------------
rem inserting into orders
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (2,110036,to_timestamp('02/01/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2117,106,'rei','2a44l',7,189);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (3,112963,to_timestamp('10/05/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2103,105,'aci','41004',28,19.7);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (4,112968,to_timestamp('11/01/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2102,101,'aci','41004',34,24);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (5,112975,to_timestamp('11/02/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2111,103,'rei','2a44g',6,13);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (6,112979,to_timestamp('12/10/09 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2114,108,'aci','4100z',6,90);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (7,112983,to_timestamp('10/05/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2103,105,'aci','41004',6,5);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (8,112987,to_timestamp('01/01/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2103,105,'aci','4100y',11,165);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (9,112989,to_timestamp('10/12/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2101,106,'fea','114',6,9);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (10,112992,to_timestamp('15/04/10 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2118,108,'aci','41002',10,4.5);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (11,112993,to_timestamp('10/03/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2106,102,'rei','2a45c',24,11.4);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (12,112997,to_timestamp('04/04/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2124,107,'bic','41003',1,4);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (13,113003,to_timestamp('05/02/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2108,109,'imm','779c',3,33.5);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (14,113007,to_timestamp('01/01/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2112,108,'imm','773c',3,18);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (15,113012,to_timestamp('05/05/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2111,105,'aci','41003',35,22);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (16,113013,to_timestamp('06/08/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2118,108,'bic','41003',1,4);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (17,113024,to_timestamp('04/07/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2114,108,'qsa','xk47',20,48);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (18,113027,to_timestamp('02/02/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2103,105,'aci','41002',54,24);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (19,113034,to_timestamp('05/11/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2107,110,'rei','2a45c',8,4);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (20,113042,to_timestamp('01/01/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2113,101,'rei','2a44r',5,135);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (21,113045,to_timestamp('02/07/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2112,108,'rei','2a44r',10,270);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (22,113048,to_timestamp('02/02/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2120,102,'imm','779c',2,22);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (23,113049,to_timestamp('04/04/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2118,108,'qsa','xk47',2,4.4);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (24,113051,to_timestamp('06/07/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2118,108,'qsa','xk47',4,8.8);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (25,113055,to_timestamp('01/04/09 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2108,101,'aci','4100x',6,1.8);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (26,113057,to_timestamp('01/11/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2111,103,'aci','4100x',24,7.2);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (27,113058,to_timestamp('04/07/99 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2108,109,'fea','112',10,15);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (28,113062,to_timestamp('04/07/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2124,107,'bic','41003',10,14);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (29,113065,to_timestamp('03/07/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2106,102,'qsa','xk47',6,13);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (30,113069,to_timestamp('01/08/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2109,107,'imm','773c',22,186);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (1,110036,to_timestamp('02/01/07 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2107,110,'aci','4100z',9,135);
insert into orders (code,num_order,date_order,cus,employee,manuf,prod,quantity,amount) values (31,113070,to_timestamp('15/03/11 00:00:00,000000000','DD/MM/RR HH24:MI:SS,FF'),2107,110,'aci','41004',5,165);


---------------------------------------------------
--   END DATA FOR TABLE ORDERS
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table Customers
--------------------------------------------------------


  ALTER TABLE customers ADD PRIMARY KEY (num_cus) ENABLE;
--------------------------------------------------------
--  Constraints for Table employees
--------------------------------------------------------


  ALTER TABLE employees ADD PRIMARY KEY (num_emp) ENABLE;
 
  ALTER TABLE employees ADD UNIQUE (name) ENABLE;
--------------------------------------------------------
--  Constraints for Table orders
--------------------------------------------------------


  ALTER TABLE orders ADD PRIMARY KEY (code) ENABLE;
--------------------------------------------------------
--  Constraints for Table products
--------------------------------------------------------


  ALTER TABLE products ADD CONSTRAINT PK_products PRIMARY KEY (id_manuf, id_prod) ENABLE;






--------------------------------------------------------
--  Ref Constraints for Table customers
--------------------------------------------------------


  ALTER TABLE customers ADD CONSTRAINT FK_num_emp_num_emp FOREIGN KEY (num_emp)
          REFERENCES employees (num_emp) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table employees
--------------------------------------------------------
ALTER TABLE offices ADD CONSTRAINT PK_OFIC PRIMARY KEY (office);


  ALTER TABLE employees ADD CONSTRAINT FK_EMPL_OFIC FOREIGN KEY (office)
          REFERENCES offices (office) ENABLE;
 
  ALTER TABLE employees ADD FOREIGN KEY (boss)
          REFERENCES employees (num_emp) ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table orders
--------------------------------------------------------


  ALTER TABLE orders ADD CONSTRAINT FK_customers FOREIGN KEY (cus)
          REFERENCES customers (num_cus) ENABLE;
 
  ALTER TABLE orders ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (employee)
          REFERENCES employees (num_emp) ENABLE;
 
  ALTER TABLE orders ADD CONSTRAINT FK_products FOREIGN KEY (manuf, prod)
          REFERENCES products (id_manuf, id_prod) ENABLE;


--------------------------------------------------------
--  Ref Constraints for Table offices
--------------------------------------------------------


  ALTER TABLE offices ADD CONSTRAINT FK_offices_employees FOREIGN KEY (boss)
          REFERENCES employees (num_emp) ENABLE;
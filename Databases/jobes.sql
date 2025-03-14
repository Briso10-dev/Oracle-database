
DROP TABLE EMPLOYEES cascade constraints;
DROP TABLE DEPARTMENTS cascade constraints; 
DROP TABLE STUDENTS cascade constraints;
DROP TABLE NEW cascade constraints;
DROP TABLE OLD cascade constraints; 
DROP TABLE STAFF cascade constraints; 
DROP TABLE TEACHERS cascade constraints;
DROP TABLE SCHOOLS cascade constraints;  
drop table BANK cascade constraints;
drop table BRANCH cascade constraints;
drop table ACCOUNT cascade constraints;
drop table MOVEMENT Cascade constraints;
DROP TABLE PRODUCTS cascade constraints; 
DROP TABLE SHOPS cascade constraints; 
DROP TABLE MANUFACTURERS cascade constraints; 
DROP TABLE ORDERS cascade constraints; 
DROP TABLE SALES cascade constraints;

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

CREATE TABLE DEPARTMENTS (
 DEP_NUM  NUMBER(2) PRIMARY KEY,
 NAME  VARCHAR2(14), 
 CITY      VARCHAR2(14) ) ;

INSERT INTO DEPARTMENTS VALUES (10,'ACCOUNTING','SEVILLA');
INSERT INTO DEPARTMENTS VALUES (20,'RESEARCH','MADRID');
INSERT INTO DEPARTMENTS VALUES (30,'SALES','BARCELONA');
INSERT INTO DEPARTMENTS VALUES (40,'PRODUCTION','BILBAO');


CREATE TABLE EMPLOYEES (
 EMP_NUM    NUMBER(4) PRIMARY KEY,
 SURNAME  VARCHAR2(30)  ,
 JOB    VARCHAR2(30)  ,
 ADDRESS       NUMBER(4) ,
 HIRE_DATE DATE      ,
 SALARY   NUMBER(10),
 COMMISSION  NUMBER(10),
 DEP_NUM   NUMBER(2) REFERENCES DEPARTMENTS(DEP_NUM) NOT NULL) ;

INSERT INTO EMPLOYEES VALUES (7369,'SANCHEZ','EMPLOYEE',7902,'17/12/1980', 104000,NULL,20);
INSERT INTO EMPLOYEES VALUES (7499,'ARROYO','SALES ASSISTANT',7698,'20/02/1980', 208000,39000,30);
INSERT INTO EMPLOYEES VALUES (7521,'SALA','SALES ASSISTANT',7698,'22/02/1981', 162500,65000,30);
INSERT INTO EMPLOYEES VALUES (7566,'JIMENEZ','MANAGER',7839,'02/04/1981', 386750,NULL,20);
INSERT INTO EMPLOYEES VALUES (7654,'MARIN','SALES ASSISTANT',7698,'29/09/1981', 162500,182000,30);
INSERT INTO EMPLOYEES VALUES (7698,'NEGRO','MANAGER',7839,'01/05/1981', 370500,NULL,30);
INSERT INTO EMPLOYEES VALUES (7782,'CEREZO','MANAGER',7839,'09/06/1981', 318500,NULL,10);
INSERT INTO EMPLOYEES VALUES (7788,'GIL','ANALYST',7566,'09/11/1981', 390000,NULL,20);
INSERT INTO EMPLOYEES VALUES (7839,'REY','PRESIDENT',NULL,'17/11/1981',  650000,NULL,10);
INSERT INTO EMPLOYEES VALUES (7844,'TOVAR','SALES ASSISTANT',7698,'08/09/1981', 195000,0,30);
INSERT INTO EMPLOYEES VALUES (7876,'ALONSO','EMPLOYEE',7788,'23/09/1981', 143000,NULL,20);
INSERT INTO EMPLOYEES VALUES (7900,'JIMENO','EMPLOYEE',7698,'03/12/1981',  123500,NULL,30);
INSERT INTO EMPLOYEES VALUES (7902,'FERNANDEZ','ANALYST',7566,'03/12/1981', 390000,NULL,20);
INSERT INTO EMPLOYEES VALUES (7934,'MUÑOZ','EMPLOYEE',7782,'23/01/1982', 169000,NULL,10);

CREATE TABLE STUDENTS
(
    DNI VARCHAR2(9) PRIMARY KEY,
    NAME VARCHAR2(20),
    AGE NUMBER(2),
    LOCALITY VARCHAR2(15)
) ;

CREATE TABLE  NEW
(
    DNI VARCHAR2(9) PRIMARY KEY,
    NAME  VARCHAR2(20),
    AGE NUMBER(2),
    LOCALITY VARCHAR2(15)
) ;

CREATE TABLE OLD
(
    DNI VARCHAR2(9) PRIMARY KEY,
    NAME  VARCHAR2(20),
    AGE NUMBER(2),
    LOCALITY VARCHAR2(15)
) ;


INSERT INTO STUDENTS VALUES('2A', 'PEDRO',19,'COSLADA');
INSERT INTO STUDENTS VALUES('4A', 'LUISA',18,'TORREJ N');
INSERT INTO STUDENTS VALUES('7A', 'RAQUEL',19,'TOLEDO');
INSERT INTO STUDENTS VALUES('5A', 'MAR A',20,'MADRID');
INSERT INTO STUDENTS VALUES('6A', 'ERNESTO',21,'MADRID');
INSERT INTO STUDENTS VALUES('10A', 'ANDR S',26,'LAS ROZAS');
INSERT INTO STUDENTS VALUES('11A', 'IRENE',24,'LAS ROZAS');

INSERT INTO NEW VALUES('1A', 'JUAN',18,'COSLADA');
INSERT INTO NEW VALUES('8A', 'MAITE',15,'ALCAL ');
INSERT INTO NEW VALUES('9A', 'SOF A',14,'ALCAL ');
INSERT INTO NEW VALUES('3A', 'ANA',17,'ALCALA');
INSERT INTO NEW VALUES('6A', 'ERNESTO',21,'MADRID');

INSERT INTO OLD VALUES('5A', 'MAR A',20,'MADRID');
INSERT INTO OLD VALUES('6A', 'ERNESTO',21,'MADRID');
INSERT INTO OLD VALUES('10A', 'ANDR S',26,'LAS ROZAS');
INSERT INTO OLD VALUES('11A', 'IRENE',24,'LAS ROZAS');


CREATE TABLE SCHOOLS (
 COD_SCHOOL   NUMBER(4) PRIMARY KEY,
 TYPE_SCHOOL  CHAR(1),
 NAME VARCHAR2(30),
 ADDRESS VARCHAR2(26),
 PHONE VARCHAR2(10),
 NUM_PLACES NUMBER(4)
 ) ;


INSERT INTO SCHOOLS VALUES (10,'S','IES El Quijote', 'Avda. Los Molinos 25', '965-887654',538);
INSERT INTO SCHOOLS VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n', '985-112322',250);
INSERT INTO SCHOOLS VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45', '925-443400',300);
INSERT INTO SCHOOLS VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5', '926-202310',220);
INSERT INTO SCHOOLS VALUES (50,'S', 'IES Anto ete', 'C/Los Toreros 21','989-406090',310);

CREATE TABLE STAFF (
 DNI NUMBER(10) PRIMARY KEY,
 SURNAME VARCHAR2(30),
 FUNCTION VARCHAR2(15),
 SALARY NUMBER (10),
 COD_SCHOOL   NUMBER(4) REFERENCES SCHOOLS(COD_SCHOOL)
);

INSERT INTO STAFF VALUES (1112345,'Mart nez Salas, Fernando', 'TEACHER', 220000, 10);
INSERT INTO STAFF VALUES (4123005,'Bueno Zarco, Elisa', 'TEACHER', 220000, 10);
INSERT INTO STAFF VALUES (4122025,'Montes Gar a, M.Pilar', 'TEACHER', 220000, 10);

INSERT INTO STAFF VALUES (1112346,'Rivera Silvestre, Ana','TEACHER', 205000, 15);
INSERT INTO STAFF VALUES (9800990, 'Ramos Ruiz, Luis','TEACHER', 205000, 15);
INSERT INTO STAFF VALUES (8660990, 'De Lucas Fdez, M.Angel','TEACHER', 205000, 15);
INSERT INTO STAFF VALUES (7650000, 'Ruiz Lafuente, Manuel','TEACHER', 220000, 22);
INSERT INTO STAFF VALUES (43526789, 'Serrano Lagu a, Mar a','TEACHER', 205000, 45);


INSERT INTO STAFF VALUES (4480099,'Ruano Cerezo, Manuel', 'ADMINISTRATIVE', 180000, 10);
INSERT INTO STAFF VALUES (1002345,'Albarr n Serrano, Alicia', 'ADMINISTRATIVE', 180000, 15);
INSERT INTO STAFF VALUES (7002660,'Mu oz Rey, Felicia', 'ADMINISTRATIVE', 180000, 15);
INSERT INTO STAFF VALUES (5502678,'Mar n Mar n, Pedro', 'ADMINISTRATIVE', 180000, 22);
INSERT INTO STAFF VALUES (6600980, 'Peinado Gil, Elena', 'JANITOR', 175000, 22);
INSERT INTO STAFF VALUES (4163222, 'Sarro Molina, Carmen', 'JANITOR', 175000, 45);



CREATE TABLE TEACHERS (
 DNI          NUMBER(10) PRIMARY KEY,
 SURNAME VARCHAR2(30),
 SPECIALTY VARCHAR2(16),
 COD_SCHOOL   NUMBER(4) REFERENCES SCHOOLS(COD_SCHOOL)
) ;


INSERT INTO TEACHERS VALUES (1112345,'Mart nez Salas, Fernando','ICT', 10);
INSERT INTO TEACHERS VALUES (4123005,'Bueno Zarco, Elisa', 'MATHS', 10);
INSERT INTO TEACHERS VALUES (4122025,'Montes Garc a, M.Pilar', 'MATHS', 10);
INSERT INTO TEACHERS VALUES (9800990, 'Ramos Ruiz, Luis', 'LANGUAGE', 15);
INSERT INTO TEACHERS VALUES (1112346,'Rivera Silvestre, Ana', 'DRAWING', 15);
INSERT INTO TEACHERS VALUES (8660990, 'De Lucas Fdez, M.Angel', 'LANGUAGE', 15);
INSERT INTO TEACHERS VALUES (7650000, 'Ruiz Lafuente, Manuel', 'MATHS', 22);
INSERT INTO TEACHERS VALUES (43526789, 'Serrano Lagu a, Mar a','ICT', 45);


Create TABLE   BANK(
    COD_BANK   NUMBER(4) PRIMARY KEY,
    NIF_BANK    VARCHAR2(10),
    NAME_BANK VARCHAR2(30),
    TAX_ADDRESS  VARCHAR(35),
    CITY   VARCHAR(35)
);


Create TABLE  BRANCH(
    COD_BANK   NUMBER(4) REFERENCES BANK(COD_BANK),
    COD_BRANCH   NUMBER (4),
    NAME_BRANCH  VARCHAR2(35),
    ADDRESS_BRANCH   VARCHAR2(35),
    CITY_BRANCH     VARCHAR2(20),
    PROV_BRANCH    VARCHAR2(20),
    PRIMARY KEY (COD_BANK,COD_BRANCH)
);	

Create TABLE   ACCOUNT (
    COD_BANK   NUMBER(4),
    COD_BRANCH   NUMBER(4),
    NUM_ACCOUNT     NUMBER(10) ,
    HIRE_DATE  DATE,
    NAME_ACCOUNT  VARCHAR2(35),
    ADDRESS_ACCOUNT   VARCHAR2(35),
    CITY_ACCOUNT   VARCHAR2(20),
    BALANCE_OWE  NUMBER(10),
    BALANCE_HAS NUMBER(10),
    FOREIGN KEY (COD_BANK, COD_BRANCH) REFERENCES BRANCH(COD_BANK,COD_BRANCH),
    PRIMARY KEY (COD_BANK,COD_BRANCH,NUM_ACCOUNT)
);

CREATE TABLE  MOVEMENT(
    COD_BANK   NUMBER(4),
    COD_BRANCH   NUMBER(4),
    NUM_ACCOUNT     NUMBER(10), 
    DATE_MOV   DATE,
    TYPE_MOV    CHAR(1), 
    AMOUNT     NUMBER(10),
    FOREIGN KEY (COD_BANK, COD_BRANCH, NUM_ACCOUNT) REFERENCES ACCOUNT(COD_BANK,COD_BRANCH, NUM_ACCOUNT),
    PRIMARY KEY (COD_BANK,COD_BRANCH,NUM_ACCOUNT, DATE_MOV, TYPE_MOV)
);


INSERT INTO BANK VALUES(1111,'122322223','BANCO DE ESPA A','GRAN VIA','MADRID');
INSERT INTO BANK VALUES(1112,'222322223','BANCO DE GUADALAJARA','MAYOR', 'GUADALAJARA');
INSERT INTO BANK VALUES(1113,'322322223','BANCO POPULAR','LA PLAZA','TOLEDO');
INSERT INTO BANK VALUES(1114,'422322223','CAJA CM','RIO DULCE','ALBACETE');


INSERT INTO BRANCH VALUES(1111, 5000,'* BRANCH 1*', 'ANCHA 24', 'TOLEDO','TOLEDO');
INSERT INTO BRANCH VALUES(1111, 5001,'* BRANCH 2*', 'PILON 33', 'PASTRANA','GUADALAJARA');
INSERT INTO BRANCH VALUES(1112, 6000,'* BRANCH 6000*', 'MAYOR 55','ALCALA','ALCALA');
INSERT INTO BRANCH VALUES(1113, 4000,'* BRANCH 4000*', 'ERAS 77','ARANJUEZ','MADRID');


INSERT INTO ACCOUNT VALUES(1111, 5000,123456789,SYSDATE -7, 'JUAN','TOLEDO','TOLEDO', 0,0);
INSERT INTO ACCOUNT VALUES(1111, 5000,123456788,SYSDATE -6, 'PEDRO','TOLEDO','TOLEDO', 0,0);
INSERT INTO ACCOUNT VALUES(1111, 5001,123456787,SYSDATE -100, 'ANA','GUADALAJARA','GUADALAJARA', 0,0);
INSERT INTO ACCOUNT VALUES(1111, 5001,123456786,SYSDATE -6, 'MANUEL','GUADALAJARA','GUADALAJARA', 0,0);
INSERT INTO ACCOUNT VALUES(1111, 5001,123456785,SYSDATE -230, 'ANDRES','ALCALA','ALCALA', 0,0);
INSERT INTO ACCOUNT VALUES(1112, 6000,33334444, SYSDATE,'ISABEL','MADRID', 'MADRID', 0,0);
INSERT INTO ACCOUNT VALUES(1112, 6000,33334440, SYSDATE-140,'MARIA','MADRID', 'MADRID', 0,0);


INSERT INTO MOVEMENT VALUES(1112, 6000,33334444, SYSDATE,'I', 1000); 
INSERT INTO MOVEMENT VALUES(1112, 6000,33334444, SYSDATE-1,'I', 2000); 
INSERT INTO MOVEMENT VALUES(1112, 6000,33334444, SYSDATE-2,'R', 100); 
INSERT INTO MOVEMENT VALUES(1112, 6000,33334444, SYSDATE,'R', 5000); 
INSERT INTO MOVEMENT VALUES(1112, 6000,33334440, SYSDATE,'R',200);
INSERT INTO MOVEMENT VALUES(1112, 6000,33334440, SYSDATE-2,'I',200);
INSERT INTO MOVEMENT VALUES(1111, 5000,123456789,SYSDATE -7, 'I',100);
INSERT INTO MOVEMENT VALUES(1111, 5000,123456789,SYSDATE -5, 'R',200);
INSERT INTO MOVEMENT VALUES(1111, 5000,123456789,SYSDATE -4, 'I',300);
INSERT INTO MOVEMENT VALUES(1111, 5000,123456788,SYSDATE,'I',200);
INSERT INTO MOVEMENT VALUES(1111, 5001,123456787,SYSDATE, 'R',198);
INSERT INTO MOVEMENT VALUES(1111, 5001,123456786,SYSDATE,'I',998);


UPDATE  ACCOUNT C SET BALANCE_OWE  = (SELECT SUM(IMPORTE) FROM MOVEMENT
WHERE TYPE_MOV='R' AND C.COD_BANK= COD_BANK AND C.COD_BRANCH=COD_BRANCH
AND C.NUM_ACCOUNT =NUM_ACCOUNT);

UPDATE  ACCOUNT C SET BALANCE_HAS  = (SELECT SUM(IMPORTE) FROM MOVEMENT
WHERE TYPE_MOV='I' AND C.COD_BANK= COD_BANK AND C.COD_BRANCH=COD_BRANCH
AND C.NUM_ACCOUNT =NUM_ACCOUNT);

UPDATE  ACCOUNT SET BALANCE_OWE =0 WHERE BALANCE_OWE IS NULL;
UPDATE  ACCOUNT SET BALANCE_HAS=0 WHERE BALANCE_HAS IS NULL; 


CREATE TABLE MANUFACTURERS(
    COD NUMBER(3) PRIMARY KEY,
    NAME         VARCHAR2(15), 
    PAIS           VARCHAR2(15)
) ;

INSERT INTO MANUFACTURERS VALUES(10,'CALVO', 'ESPA A');
INSERT INTO MANUFACTURERS VALUES(15,'LU', 'BELGICA');
INSERT INTO MANUFACTURERS VALUES(20,'BARILLA', 'ITALIA');
INSERT INTO MANUFACTURERS VALUES(25,'GALLO', 'ESPA A');
INSERT INTO MANUFACTURERS VALUES(30,'PRESIDENT', 'FRANCIA');


CREATE TABLE PRODUCTS(
    COD VARCHAR2(6) PRIMARY KEY,
    NAME       VARCHAR2(20),
    COD_MANU NUMBER(3) REFERENCES MANUFACTURERS (COD),
    WEIGHT           NUMBER(3) NOT NULL ,
    CATEGORY      VARCHAR2(10) NOT NULL,
    SELL_PRICE   NUMBER (4),
    EXPENSE_PRICE   NUMBER (4),
    EXISTENCES    NUMBER (5)
) ;

INSERT INTO PRODUCTS VALUES ('M201', 'Macarrones',20, 1, 'First',100,98,120);
INSERT INTO PRODUCTS VALUES ('T201','Tallarines',20, 2, 'First',120,100,100);
INSERT INTO PRODUCTS VALUES ('T202', 'Tallarines',20, 1, 'Second',99,50,100);
INSERT INTO PRODUCTS VALUES ('M203', 'Macarrones',20, 1, 'Third',80,50,100);

INSERT INTO PRODUCTS VALUES ('A101', 'Atun',10, 3, 'First',200,150,220);
INSERT INTO PRODUCTS VALUES ('A102', 'Atun',10, 3, 'Second',150,100,220);
INSERT INTO PRODUCTS VALUES ('A103', 'Atun',10, 3, 'Third',100,50,220);
INSERT INTO PRODUCTS VALUES ('S101', 'Sardinillas',10, 1,'First',250,200,200);
INSERT INTO PRODUCTS VALUES ('S102', 'Sardinillas',10, 1, 'Second',200,160,200);
INSERT INTO PRODUCTS VALUES ('S103', 'Sardinillas',10, 1, 'Third',100,150,220);
INSERT INTO PRODUCTS VALUES ('ME103', 'Mejillones',10, 1, 'Third',90,50,200);
INSERT INTO PRODUCTS VALUES ('ME101', 'Mejillones',10, 1, 'First',200,150,300);

INSERT INTO PRODUCTS VALUES ('M251', 'Macarrones',25, 1, 'First',90,68,150);
INSERT INTO PRODUCTS VALUES ('T251', 'Tallarines',25, 1, 'First',100,90,100);
INSERT INTO PRODUCTS VALUES ('F252', 'Fideos',25, 1, 'Second',75,50,100);
INSERT INTO PRODUCTS VALUES ('F251', 'Fideos',25, 1, 'First',100,80,100);

INSERT INTO PRODUCTS VALUES ('G151', 'Galletas Cuadradas',15, 1, 'First',100,80,100);
INSERT INTO PRODUCTS VALUES ('G152', 'Galletas Cuadradas',15, 1, 'Second',70,50,100);
INSERT INTO PRODUCTS VALUES ('G153', 'Galletas Cuadradas',15, 1, 'Third',50,40,100);
INSERT INTO PRODUCTS VALUES ('B151', 'Barquillos',15, 1, 'First',100,80,100);
INSERT INTO PRODUCTS VALUES ('B152', 'Barquillos',15, 1, 'Second',100,80,100);
INSERT INTO PRODUCTS VALUES ('C151', 'Canutillos',15, 2, 'First',170,150,110);
INSERT INTO PRODUCTS VALUES ('C152', 'Canutillos',15, 2, 'Second',120,150,110);

INSERT INTO PRODUCTS VALUES ('LE301', 'Leche entera',30, 1, 'First',110,100,300);
INSERT INTO PRODUCTS VALUES ('LE302', 'Leche entera',30, 2, 'Second',210,200,300);
INSERT INTO PRODUCTS VALUES ('LD301', 'Leche desnat.',30, 1, 'First',120,100,300);
INSERT INTO PRODUCTS VALUES ('LD302', 'Leche desnat.',30, 2, 'Second',220,200,300);
INSERT INTO PRODUCTS VALUES ('LS301', 'Leche semi.',30, 1, 'First',130,110,300);
INSERT INTO PRODUCTS VALUES ('LS302', 'Leche semi.',30, 2, 'Second',230,210,300);
INSERT INTO PRODUCTS VALUES ('ML301', 'Mantequilla',30, 1, 'First',510,400,200);
INSERT INTO PRODUCTS VALUES ('ML302', 'Mantequilla',30, 1, 'Second',450,340,200);


CREATE TABLE SHOPS(
    NIF       VARCHAR2(10) PRIMARY KEY,
    NAME    VARCHAR2(20),
    ADDRESS VARCHAR2(20),
    CITY VARCHAR2(20),
    PROVINCE VARCHAR2(20),
    POSTAL_CODE NUMBER(5) ) ;

INSERT INTO SHOPS VALUES('1111-A','Almacenes P rez', 'C/Toledo, 20','Siguenza','GUADALAJARA',19104); 
INSERT INTO SHOPS VALUES('5555-B','La gacela', 'C/Santander Rios, 45','Azuqueca','GUADALAJARA', 19209);
INSERT INTO SHOPS VALUES('2222-A','Comestibles Rodolfo',  'C/ del Val s/n', 'Alcal  de Henares','MADRID',28804);
INSERT INTO SHOPS VALUES('4444-A','La Pasta Gansa', 'C/Alcal , 2', 'Ajalvir','MADRID', 28765);
INSERT INTO SHOPS VALUES('3333-N','Ultramarinos Montse','Avda. Pio 10', 'Toledo','TOLEDO',45100);
INSERT INTO SHOPS VALUES('4141-B','Todo Toledo','C/Avila 24', 'Talavera','TOLEDO',45199);


CREATE TABLE ORDERS(
    NIF VARCHAR2(10) REFERENCES SHOPS(NIF),
    COD_PRODUCT VARCHAR2(6) REFERENCES PRODUCTS(COD),
    DATE_ORDER DATE,
    ORDERED_UNITS NUMBER(4) NOT NULL,
    PRIMARY KEY (NIF, COD_PRODUCT, DATE_ORDER )
) ;


INSERT INTO ORDERS VALUES ('5555-B','M201', TO_DATE('18/02/1999'), 30);
INSERT INTO ORDERS VALUES ('5555-B','A101', TO_DATE('21/02/1999'), 10);
INSERT INTO ORDERS VALUES ('5555-B','A102', TO_DATE('11/03/1999'), 4);
INSERT INTO ORDERS VALUES ('5555-B','S102', TO_DATE('11/03/1999'), 10);
INSERT INTO ORDERS VALUES ('5555-B','M251',TO_DATE('14/04/1999'), 12);
INSERT INTO ORDERS VALUES ('5555-B','F252', TO_DATE('18/05/1999'), 24);
INSERT INTO ORDERS VALUES ('5555-B','F252', TO_DATE('19/05/1999'), 20);
INSERT INTO ORDERS VALUES ('5555-B','G152', TO_DATE('20/06/1999'), 15);
INSERT INTO ORDERS VALUES ('1111-A','B151', TO_DATE('20/02/1999'), 10);
INSERT INTO ORDERS VALUES ('1111-A','C152', TO_DATE('10/04/1999'), 12);
INSERT INTO ORDERS VALUES ('1111-A','LS302',TO_DATE('24/06/1999'), 5);
INSERT INTO ORDERS VALUES ('1111-A','LS301',TO_DATE('04/07/1999'), 11);
INSERT INTO ORDERS VALUES ('1111-A','ML301', TO_DATE('10/07/1999'), 10);
INSERT INTO ORDERS VALUES ('4141-B','M201',TO_DATE('16/04/1999'), 30);
INSERT INTO ORDERS VALUES ('4141-B','A101',TO_DATE('21/06/1999'), 10);
INSERT INTO ORDERS VALUES ('4141-B','A102',TO_DATE('12/08/1999'), 9);
INSERT INTO ORDERS VALUES ('2222-A','S102', TO_DATE('12/08/1999'),20);
INSERT INTO ORDERS VALUES ('2222-A','S103', TO_DATE('12/08/1999'),22);
INSERT INTO ORDERS VALUES ('2222-A','M201',SYSDATE,1000);
INSERT INTO ORDERS VALUES ('3333-N','M251',TO_DATE('10/11/1999'),8);
INSERT INTO ORDERS VALUES ('3333-N','T251', TO_DATE('12/11/1999'),9);
INSERT INTO ORDERS VALUES ('3333-N','F251', TO_DATE('15/11/1999'),11);
INSERT INTO ORDERS VALUES ('3333-N','G151', TO_DATE('20/11/1999'),6);
INSERT INTO ORDERS VALUES ('3333-N','B152', TO_DATE('20/11/1999'),40);
INSERT INTO ORDERS VALUES ('3333-N','C152', TO_DATE('20/11/1999'),10);



CREATE TABLE SALES (
    NIF  VARCHAR2(10) REFERENCES SHOPS(NIF) NOT NULL,
    COD_PRODUCT VARCHAR2(6) REFERENCES PRODUCTS(COD),
    DATE_SALE DATE NOT NULL,
    SOLD_UNITS NUMBER(4),
    PRIMARY KEY (NIF, COD_PRODUCT )
) ;


INSERT INTO SALES VALUES ('5555-B','M201', TO_DATE('19/02/1999'), 5);
INSERT INTO SALES VALUES ('5555-B','A101', TO_DATE('19/02/1999'), 6);
INSERT INTO SALES VALUES ('5555-B','A102', TO_DATE('20/03/1999'), 15);
INSERT INTO SALES VALUES ('5555-B','S102',  TO_DATE('20/03/1999'), 8);
INSERT INTO SALES VALUES ('5555-B','M251', TO_DATE('17/04/1999'), 2);
INSERT INTO SALES VALUES ('5555-B','F252',  TO_DATE('18/05/1999'), 14);
INSERT INTO SALES VALUES ('5555-B','LS301', TO_DATE('24/06/1999'), 5);
INSERT INTO SALES VALUES ('2222-A','G152', TO_DATE('20/06/1999'), 5);
INSERT INTO SALES VALUES ('2222-A','B151', TO_DATE('20/02/1999'), 6);
INSERT INTO SALES VALUES ('2222-A','C152', TO_DATE('10/06/1999'), 2);
INSERT INTO SALES VALUES ('2222-A','S102', TO_DATE('15/08/1999'),5);
INSERT INTO SALES VALUES ('2222-A','S103', TO_DATE('15/08/1999'),5);
INSERT INTO SALES VALUES ('3333-N','LS301', TO_DATE('06/07/1999'), 11);
INSERT INTO SALES VALUES ('3333-N','ML301', TO_DATE('16/07/1999'), 10);
INSERT INTO SALES VALUES ('3333-N','M201',TO_DATE('26/04/1999'), 30);
INSERT INTO SALES VALUES ('3333-N','A101',TO_DATE('26/04/1999'), 10);
INSERT INTO SALES VALUES ('3333-N','B152', TO_DATE('25/11/1999'),4);
INSERT INTO SALES VALUES ('3333-N','C152', TO_DATE('25/11/1999'),4);
INSERT INTO SALES VALUES ('4141-B','A102', TO_DATE('12/08/1999'), 2);
INSERT INTO SALES VALUES ('4141-B','M251',TO_DATE('10/11/1999'),2);
INSERT INTO SALES VALUES ('4141-B','T251', TO_DATE('11/11/1999'),3);
INSERT INTO SALES VALUES ('4141-B','C152', TO_DATE('11/11/1999'),8);

commit;

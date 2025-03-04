drop table disease cascade constraints;
drop table patient cascade constraints;
drop table history cascade constraints;
drop table history_line cascade constraints;
drop table location cascade constraints;
drop table patient_stays cascade constraints;


CREATE TABLE disease (
 id_disease  SMALLINT PRIMARY KEY,
 name VARCHAR(30) NOT NULL UNIQUE,
 description      VARCHAR(100),
 recovery_time INT) ;




INSERT INTO disease VALUES (1, 'COV', 'Coronavirus', 15);
INSERT INTO disease VALUES (2, 'J09', 'Gripe A', 9);
INSERT INTO disease VALUES (3, 'A95', 'Fiebre Amarilla', 8);
INSERT INTO disease VALUES (4, 'A75', 'Tifus', 18);
INSERT INTO disease VALUES (5, 'A90', 'Fiebre del dengue', 7);




CREATE TABLE patient (
 id_patient    SMALLINT PRIMARY KEY ,
 name    VARCHAR (20) NOT NULL,
 surname    VARCHAR (50) NOT NULL,
 birthdate DATE,
 city VARCHAR (50),
 id_doctor SMALLINT,
 FOREIGN KEY (id_doctor) REFERENCES patient(id_patient)
 );




INSERT INTO patient VALUES (1,'Silvia','Fernandez',TO_DATE('1980-12-17','YYYY-MM-DD'), 'Zaragoza',NULL);
INSERT INTO patient VALUES (2,'Ana','Molina', TO_DATE('1980-02-20','YYYY-MM-DD'), 'Calatayud',1);
INSERT INTO patient VALUES (3,'Sergio','Tovar', TO_DATE('1981-02-22','YYYY-MM-DD'), 'Huesca',1);
INSERT INTO patient VALUES (4,'David','Martin', TO_DATE('1981-04-02','YYYY-MM-DD'), 'Teruel',2);
INSERT INTO patient VALUES (5,'Soraya','Basarrate', TO_DATE('1981-09-29','YYYY-MM-DD'), 'Zaragoza',1);
INSERT INTO patient VALUES (6,'Elena','Romero', TO_DATE('1981-05-01','YYYY-MM-DD'), 'Huesca',1); 
INSERT INTO patient VALUES (7,'Joaquin','Sanchez', TO_DATE('1981-06-09','YYYY-MM-DD'), 'Huesca',2);
INSERT INTO patient VALUES (8,'Beatriz','Abril',TO_DATE('1981-11-09','YYYY-MM-DD'), 'Teruel',1);
INSERT INTO patient VALUES (9,'Luis','Gimeno', TO_DATE('1981-11-09','YYYY-MM-DD'), 'Zaragoza',2);
INSERT INTO patient VALUES (10,'Hugo','Formento', TO_DATE('1981-09-08','YYYY-MM-DD'), 'Teruel',1);




CREATE TABLE history (
 id_history    SMALLINT PRIMARY KEY ,
 id_patient SMALLINT,
 blood_type VARCHAR (3),
 FOREIGN KEY (id_patient) REFERENCES patient(id_patient)
 );
 


INSERT INTO history VALUES (121,1,'A');
INSERT INTO history VALUES (122,2,'A');
INSERT INTO history VALUES (123,3,'B');
INSERT INTO history VALUES (124,4,'AB');
INSERT INTO history VALUES (125,5,'0');
INSERT INTO history VALUES (126,6,'0');
INSERT INTO history VALUES (127,7,'0');
INSERT INTO history VALUES (128,8, 'AB');
INSERT INTO history VALUES (129,9, 'AB');
INSERT INTO history VALUES (130,10,'B'); 




CREATE TABLE history_line (
 num_lin SMALLINT,
 id_history SMALLINT,
 id_disease SMALLINT NOT NULL,
 start_date DATE,
 end_date DATE,
 symptoms VARCHAR (50),
 comments  VARCHAR (100),
 FOREIGN KEY (id_history) REFERENCES history(id_history),
 FOREIGN KEY (id_disease) REFERENCES disease(id_disease),
 PRIMARY KEY (num_lin, id_history)
 );






INSERT INTO history_line VALUES (20, 123, 1, TO_DATE('2020-1-1','YYYY-MM-DD'), TO_DATE('2020-1-10','YYYY-MM-DD'), NULL,NULL);
INSERT INTO history_line VALUES (21, 123, 3, TO_DATE('2019-10-12','YYYY-MM-DD'), TO_DATE('2019-11-12','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (22, 123, 5, TO_DATE('2018-12-17','YYYY-MM-DD'), TO_DATE('2018-12-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (23, 128, 2, TO_DATE('2018-11-17','YYYY-MM-DD'), TO_DATE('2018-11-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (24, 129, 2, TO_DATE('2017-12-17','YYYY-MM-DD'), TO_DATE('2017-12-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (25, 130, 2, TO_DATE('2016-10-17','YYYY-MM-DD'), TO_DATE('2016-10-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (26, 121, 1, TO_DATE('2018-11-17','YYYY-MM-DD'), TO_DATE('2018-11-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (27, 125, 1, TO_DATE('2017-12-17','YYYY-MM-DD'), TO_DATE('2017-12-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (28, 129, 1, TO_DATE('2016-10-17','YYYY-MM-DD'), TO_DATE('2016-11-22','YYYY-MM-DD'),NULL,NULL);
INSERT INTO history_line VALUES (29, 130, 1, TO_DATE('2018-11-17','YYYY-MM-DD'), TO_DATE('2018-12-05','YYYY-MM-DD'),NULL,NULL);








CREATE TABLE location(
 id_location SMALLINT PRIMARY KEY,
 postal_code VARCHAR (10) NOT NULL  UNIQUE,
 city VARCHAR (30),
 risk  SMALLINT DEFAULT 1);




INSERT INTO location VALUES (100, 08001, 'Cusco', 6);
INSERT INTO location VALUES (101, 33500, 'Manang', 8);
INSERT INTO location VALUES (102, 266033, 'Shandong', 9);
INSERT INTO location VALUES (103, 34033, 'Siargao', 9);


CREATE TABLE patient_stays (
 id_patient SMALLINT,
 id_location SMALLINT,
 entry_date DATE,
 exit_date DATE,
 FOREIGN KEY (id_patient) REFERENCES patient(id_patient),
 FOREIGN KEY (id_location) REFERENCES location(id_location),
 PRIMARY KEY (id_patient, id_location, entry_date)
 );
 
 INSERT INTO patient_stays VALUES (3, 100, TO_DATE('2019-12-1','YYYY-MM-DD'), TO_DATE('2019-12-10','YYYY-MM-DD'));
 INSERT INTO patient_stays VALUES (4, 100, TO_DATE('2019-11-1','YYYY-MM-DD'), TO_DATE('2019-11-10','YYYY-MM-DD'));
 INSERT INTO patient_stays VALUES (5, 100, TO_DATE('2018-12-1','YYYY-MM-DD'), TO_DATE('2018-12-10','YYYY-MM-DD'));
 INSERT INTO patient_stays VALUES (3, 101, TO_DATE('2016-12-20','YYYY-MM-DD'), TO_DATE('2019-12-30','YYYY-MM-DD'));
 INSERT INTO patient_stays VALUES (1, 101, TO_DATE('2018-12-20','YYYY-MM-DD'), TO_DATE('2018-12-30','YYYY-MM-DD'));
 INSERT INTO patient_stays VALUES (2, 101, TO_DATE('2019-1-20','YYYY-MM-DD'), TO_DATE('2019-1-30','YYYY-MM-DD'));






commit;
drop table disease cascade constraints;
drop table patient cascade constraints;
drop table history cascade constraints;
drop table history_line cascade constraints;
drop table location cascade constraints;
drop table stay_patient cascade constraints;

create table disease (
    id_dis number primary key,
    name varchar2(25) unique not null,
    description varchar2(250),
    recovery_time number
    );

create table patient (
    id_pat number primary key,
    name varchar2(25),
    surname varchar2(25),
    birthdate date,
    city varchar2(25),
    id_doctor number references patient(id_pat) on delete cascade
    );
    
insert into patient (id_pat,name,id_doctor)
    values (1,'A',null);
insert into patient (id_pat,name,id_doctor)
    values (2,'B',1);
insert into patient (id_pat,name,id_doctor)
    values (3,'C',2);
insert into patient (id_pat,name,id_doctor)
    values (4,'D',2);
insert into patient (id_pat,name,id_doctor)
    values (5,'E',1);



create table history (
    id_hist number primary key,
    blood_type varchar2(25),
    id_pat number references patient(id_pat) on delete cascade
    );

create table history_line (
    num_line number,
    id_hist number references history(id_hist) on delete cascade,
    id_dis number references disease(id_dis)  on delete cascade not null,
    start_date date,
    end_date date,
    symptoms varchar2(250),
    comments varchar2(250),
    constraint hist_line_pk primary key(num_line,id_hist),
    constraint date_ck check (end_date > start_date)
    );
    
create table location (
    id_loc number primary key,
    postal_code number,
    city varchar2(25),
    risk number default 1
    );
    
create table stay_patient (
    id_pat number references patient(id_pat) on delete cascade,
    id_loc number references location(id_loc) on delete cascade,
    entry_date date,
    exit_date date,
    constraint stay_pat_pk primary key (id_pat,id_loc,entry_date)
    );
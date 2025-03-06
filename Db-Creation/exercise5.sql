drop table trainers cascade constraints;
drop table teams cascade constraints;
drop table players cascade constraints;
drop table statistics cascade constraints;
drop table matchs cascade constraints;

create table teams (
    name varchar2(25) primary key,
    city varchar2(25),
    conference varchar2(25),
    division varchar2(25)
    );

create table trainers (
    code number primary key,
    name varchar2(25),
    origin varchar2(25),
    name_team varchar2(25) references teams (name)  on delete cascade
    );

create table players (
    code number primary key,
    name varchar2(25),
    origin varchar2(25),
    height number,
    weight number,
    position varchar2(25),
    name_team varchar2(25) references teams(name)  on delete cascade,
    salary number
    );
    
create table statistics (
    season varchar2(25),
    player number references players(code)  on delete cascade,
    points_pm number,
    assists_pm number,
    blocks_pm number,
    rebounds_pm number,
    constraint sta_pk primary key (season,player)
    );
    
create table matchs (
    code number primary key,
    local_team varchar2(25) references teams(name) on delete cascade,
    visiting_team varchar2(25) references teams(name) on delete cascade,
    local_points number default 0,
    visiting_points number default 0,
    season varchar2(25),
    constraint ck1 check (local_points >= 0),
    constraint ck2 check (visiting_points >= 0)
    );

-- DATA INSERTION
-- Teams
insert into teams
    values ('Casademont','Zaragoza','East','ACB');
insert into teams
    values ('Baskonia','Vitoria','East','ACB');
    
-- Trainers
insert into trainers
    values (1,'Alex',null,'Casademont');
insert into trainers
    values (2,'Pepito','Ceuta','Baskonia');

-- Players
insert into players (code,name,name_team)
    values (1,'Carlos','Casademont');
insert into players (code,name,name_team)
    values (2,'Juan Carlos','Casademont');
insert into players (code,name,name_team)
    values (3,'Juan','Casademont');
insert into players (code,name,name_team)
    values (4,'Allisson','Baskonia');
insert into players (code,name,name_team)
    values (5,'Daniel','Baskonia');
insert into players (code,name,name_team)
    values (6,'Enrique','Baskonia');

-- Matchs
insert into matchs (code,local_team,visiting_team,local_points,visiting_points,season)
    values (1,'Casademont','Baskonia',123,98,'2023-24');
insert into matchs (code,local_team,visiting_team)
    values (2,'Baskonia','Casademont');



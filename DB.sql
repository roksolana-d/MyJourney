-- Create table
create table Users
(
 U_ID int not null,
 Username VARCHAR(36) not null,
 Password VARCHAR(36) not null,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Date_Of_Birth Date,
 Residence VARCHAR(50),
 Summary VARCHAR(500),
 Enabled smallint not null
) ;
alter table Users
 add constraint USER_PK primary key (U_ID);

 ---------------------

-- Create table
create table User_Roles
(
 Role_ID int not null,
 Username  VARCHAR(36) not null,
 User_Role VARCHAR(30) not null
) ;

alter table User_Roles
 add constraint USER_ROLE_PK primary key (Role_ID);
 
alter table User_Roles
 add constraint USER_ROLE_UK unique (Username, User_Role);

---------------------
-- Create table
create table Places
(
 P_ID int not null,
 Country  VARCHAR(50) not null,
 City VARCHAR(50) not null,
 City_Status VARCHAR(50) 
) ;

alter table Places
 add constraint Places_PK primary key (P_ID);
 
alter table Places
 add constraint Places_unique unique (Country, City);
 
 ---------------------
-- Create table
 create table Users_Places
 (
	UID int not null,
    PID int not null
 );

alter table Users_Places
 add constraint UP_PK primary key (UID, PID);
 
alter table Users_Places
 add constraint U_FK foreign key (UID) references Users(U_ID);
 
 alter table Users_Places
 add constraint P_FK foreign key (PID) references Places(P_ID);
 
---------------------
-- Insert into Users table
insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (1, 'dbuser1', '12345', 'Anna', 'Poberezhna', '1995-02-16', 'Kyiv, Ukraine', 'Student and blogger who loves to travel', 1);
 
insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (2, 'dbadmin1', '12345', NULL, NULL, NULL, NULL, NULL, 1);  

insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (3, 'Cassie13', '54321', 'Cassie', 'Ainsworth', '1994-08-09', 'Bristol, UK', 'Dream to leave this city without coming back', 1);

insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (4, 'johnW', '12345', 'John', 'Winston', '1985-04-13', 'Miami, US', 'Successful businessman', 1);

insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (5, 'mashaS', '67890', 'Masha', 'Sedgwick', '1987-03-19', 'Berlin, Germany', 'Beauty and travel blogger', 1);

insert into Users (U_ID, Username, Password, FirstName, LastName, Date_Of_Birth, Residence, Summary, Enabled)
values (6, 'kumar', '09876', 'Pankaj', 'Kumar', '1981-10-24', 'New York, US', 'Passionate Java and JS developer',1);


---------------------
-- Insert into User_Roles table

insert into User_Roles (Role_ID, Username, User_Role)
values (1, 'dbuser1', 'USER');
 
insert into User_Roles (Role_ID, Username, User_Role)
values (2, 'dbadmin1', 'ADMIN');
 
insert into User_Roles (Role_ID, Username, User_Role)
values (3, 'dbadmin1', 'USER');

insert into User_Roles (Role_ID, Username, User_Role)
values (4, 'Cassie13', 'USER');

insert into User_Roles (Role_ID, Username, User_Role)
values (5, 'johnW', 'USER');

insert into User_Roles (Role_ID, Username, User_Role)
values (6, 'mashaS', 'USER');

insert into User_Roles (Role_ID, Username, User_Role)
values (7, 'kumar', 'USER');
 
---------------------
-- Insert into Places table

insert into Places (P_ID, Country, City, City_Status)
 values (1,'Ukraine', 'Kyiv', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (2,'Ukraine', 'Lviv', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (3,'Netherlands', 'Amsterdam', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (4,'France', 'Paris', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (5,'UK', 'London', 'capital');

insert into Places (P_ID, Country, City, City_Status)
 values (6,'UK', 'Bristol', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (7,'US', 'Miami', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (8,'US', 'New York', NULL);

insert into Places (P_ID, Country, City, City_Status)
 values (9,'US', 'Los Angeles', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (10,'US', 'San Francisko', NULL);

insert into Places (P_ID, Country, City, City_Status)
 values (11,'US', 'Boston', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (12,'Germany', 'Berlin', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (13,'Germany', 'Munich', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (14,'Austria', 'Vienna', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (15,'Austria', 'Hallstatt', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (16,'Ukraine', 'Odessa', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (17,'Ukraine', 'Chernivtsi', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (18,'Italy', 'Rome', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (19,'Italy', 'Venice', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (20,'Italy', 'Florence', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (21,'Italy', 'Burano', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (22,'Hungary', 'Budapest', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (23,'Sweden', 'Stockholm', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (24,'Czech Republic', 'Prague', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (25,'Czech Republic', 'Karlovy Vary', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (26,'France', 'Nice', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (27,'Ireland', 'Dublin', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (28,'India', 'New Delhi', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (29,'India', 'Mumbai', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (30,'India', 'Calcutta', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (31,'Belarus', 'Minsk', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (32,'Poland', 'Krakow', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (33,'Poland', 'Warsaw', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (34,'Poland', 'Wroclaw', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (35,'Poland', 'Gdansk', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (36,'Belgium', 'Brussels', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (37,'Belgium', 'Antwerpen', NULL);

insert into Places (P_ID, Country, City, City_Status)
 values (38,'Belgium', 'Brugge', NULL);
 
select * from Places order by P_ID;
---------------------
-- Insert into Users_Places table
-- For Anna

insert into Users_Places (Uid, Pid)
 values (1,1);
 
insert into Users_Places (Uid, Pid)
 values (1,2);
 
insert into Users_Places (Uid, Pid)
 values (1,3);
 
insert into Users_Places (Uid, Pid)
 values (1,4);
 
insert into Users_Places (Uid, Pid)
 values (1,16);
 
insert into Users_Places (Uid, Pid)
 values (1,17);

insert into Users_Places (Uid, Pid)
 values (1,22);
 
insert into Users_Places (Uid, Pid)
 values (1,24);
 
insert into Users_Places (Uid, Pid)
 values (1,25);
 
insert into Users_Places (Uid, Pid)
 values (1,32);
 
insert into Users_Places (Uid, Pid)
 values (1,34);
 
insert into Users_Places (Uid, Pid)
 values (1,35);
 
insert into Users_Places (Uid, Pid)
 values (1,31);
 
 select * from Users_Places;
---------------------
-- For Cassie
insert into Users_Places (Uid, Pid)
 values (3,5);
 
insert into Users_Places (Uid, Pid)
 values (3,6);
 
insert into Users_Places (Uid, Pid)
 values (3,8);

insert into Users_Places (Uid, Pid)
 values (3,27);
 
---------------------
-- For Masha
insert into Users_Places (Uid, Pid)
 values (5,3);
 
insert into Users_Places (Uid, Pid)
 values (5,4);
 
insert into Users_Places (Uid, Pid)
 values (5,5);

insert into Users_Places (Uid, Pid)
 values (5,8);

insert into Users_Places (Uid, Pid)
 values (5,10);

insert into Users_Places (Uid, Pid)
 values (5,12);

insert into Users_Places (Uid, Pid)
 values (5,13);
 
insert into Users_Places (Uid, Pid)
 values (5,14);
 
insert into Users_Places (Uid, Pid)
 values (5,15);

insert into Users_Places (Uid, Pid)
 values (5,18);
 
insert into Users_Places (Uid, Pid)
 values (5,19);

insert into Users_Places (Uid, Pid)
 values (5,20);
 
insert into Users_Places (Uid, Pid)
 values (5,21);

insert into Users_Places (Uid, Pid)
 values (5,23);

insert into Users_Places (Uid, Pid)
 values (5,26);
 
insert into Users_Places (Uid, Pid)
 values (5,33);

insert into Users_Places (Uid, Pid)
 values (5,36);

insert into Users_Places (Uid, Pid)
 values (5,37);

insert into Users_Places (Uid, Pid)
 values (5,38);
 
---------------------
-- For John
insert into Users_Places (Uid, Pid)
 values (4,3);
 
insert into Users_Places (Uid, Pid)
 values (4,4);
 
insert into Users_Places (Uid, Pid)
 values (4,7);

insert into Users_Places (Uid, Pid)
 values (4,8);

insert into Users_Places (Uid, Pid)
 values (4,9);
 
insert into Users_Places (Uid, Pid)
 values (4,10);
 
insert into Users_Places (Uid, Pid)
 values (4,11);

insert into Users_Places (Uid, Pid)
 values (4,12);

insert into Users_Places (Uid, Pid)
 values (4,18);
 
insert into Users_Places (Uid, Pid)
 values (4,23);

insert into Users_Places (Uid, Pid)
 values (4,27);
 
insert into Users_Places (Uid, Pid)
 values (4,33);

insert into Users_Places (Uid, Pid)
 values (4,36);
 
---------------------
-- For Pankaj
 
insert into Users_Places (Uid, Pid)
 values (6,7);

insert into Users_Places (Uid, Pid)
 values (6,8);
 
insert into Users_Places (Uid, Pid)
 values (6,10);

insert into Users_Places (Uid, Pid)
 values (6,28);

insert into Users_Places (Uid, Pid)
 values (6,29);
 
insert into Users_Places (Uid, Pid)
 values (6,30);

---------------------
 select DISTINCT p.Country from Users_Places up
 join Places p on up.PID = p.P_ID
 join Users u on up.UID = u.U_ID
 where u.Username = 'dbuser1' order by p.Country;
 
--------------------
 select DISTINCT p.City from Users_Places up
 join Places p on up.PID = p.P_ID
 join Users u on up.UID = u.U_ID
 where u.Username = 'dbuser1' order by p.City;
 
 

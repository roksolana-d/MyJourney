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
 CoordX FLOAT(9,7),
 CoordY FLOAT(9,7),
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

insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (1,'Ukraine', 'Kyiv', 'capital', 50.4021368, 30.2525088);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (2,'Ukraine', 'Lviv', NULL, 49.8327787, 23.9421957);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (3,'Netherlands', 'Amsterdam', 'capital', 52.3746961, 4.8285745);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (4,'France', 'Paris', 'capital', 48.8589507, 2.2775171);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (5,'UK', 'London', 'capital', 51.5287718, -0.2417014);

insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (6,'UK', 'Bristol', NULL, 51.3570991, -3.6231525);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (7,'US', 'Miami', NULL, 25.7902689, -80.3025756);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (8,'US', 'New York', NULL, 40.7058316, -74.2581909);

insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (9,'US', 'Los Angeles', NULL, 34.0207504, -118.6919231);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (10,'US', 'San Francisco', NULL, 37.757815, -122.5076402);

insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (11,'US', 'Boston', NULL, 43.272556, -76.1226202);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (12,'Germany', 'Berlin', 'capital', 52.2574157, 12.9894098);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (13,'Germany', 'Munich', NULL, 48.9352345, 8.965889);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (14,'Austria', 'Vienna', 'capital', 48.1370518, 15.8950305);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (15,'Austria', 'Hallstatt', NULL, 47.5601464, 13.5631719);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (16,'Ukraine', 'Odessa', NULL, 46.4601261, 30.5717035);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (17,'Ukraine', 'Chernivtsi', NULL, 48.228952, 26.0904992);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (18,'Italy', 'Rome', 'capital', 41.8518616, 11.9545369);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (19,'Italy', 'Venice', NULL, 43.8591351, 12.3658014);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (20,'Italy', 'Florence', NULL, 43.7727656, 10.4833404);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (21,'Italy', 'Burano', NULL, 45.4905016, 12.428467);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (22,'Hungary', 'Budapest', 'capital', 47.4042071, 18.9570666);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (23,'Sweden', 'Stockholm', 'capital', 59.326242, 17.8474634);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (24,'Czech Republic', 'Prague', 'capital', 49.8008803, 14.309061);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (25,'Czech Republic', 'Karlovy Vary', NULL, 49.9311685, 11.9986745);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (26,'France', 'Nice', NULL, 43.6822122, 6.8504077);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (27,'Ireland', 'Dublin', NULL, 53.3244431, -6.3857871);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (28,'India', 'New Delhi', 'capital', 28.6350432,77.1451167);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (29,'India', 'Mumbai', NULL, 18.5955829, 72.5858389);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (30,'India', 'Calcutta', NULL, 22.8097772, 88.1292971);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (31,'Belarus', 'Minsk', 'capital', 53.6867179, 27.01594);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (32,'Poland', 'Krakow', NULL, 49.7707466, 19.4974343);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (33,'Poland', 'Warsaw', 'capital', 51.8251441, 20.8084955);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (34,'Poland', 'Wroclaw', NULL, 50.7810493, 16.9524741);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (35,'Poland', 'Gdansk', NULL, 54.0141813, 18.6630094);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (36,'Belgium', 'Brussels', 'capital', 50.4003828, 4.2516901);
 
insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (37,'Belgium', 'Antwerpen', NULL, 50.953239, 4.0566884);

insert into Places (P_ID, Country, City, City_Status, CoordX, CoordY)
 values (38,'Belgium', 'Brugge', NULL, 50.9649133, 3.0368275);
 
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
 select DISTINCT p.City, p.Country from Users_Places up
 join Places p on up.PID = p.P_ID
 join Users u on up.UID = u.U_ID
 where u.Username = 'dbuser1' order by p.Country;
 
 select DISTINCT Country from Users_Places up
 join Places p on up.PID = p.P_ID
 join Users u on up.UID = u.U_ID
 where u.Username = 'dbuser1';
 


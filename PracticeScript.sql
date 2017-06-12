-- Create table
create table Users
(
 U_ID int not null,
 Username VARCHAR(36) not null,
 Password VARCHAR(36) not null,
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

insert into Users (U_ID, Username, Password, Enabled)
values (1, 'dbuser1', '12345', 1);
 
insert into Users (U_ID, Username, Password, Enabled)
values (2, 'dbadmin1', '12345', 1);  

insert into User_Roles (Role_ID, Username, User_Role)
values (1, 'dbuser1', 'USER');
 
insert into User_Roles (Role_ID, Username, User_Role)
values (2, 'dbadmin1', 'ADMIN');
 
insert into User_Roles (Role_ID, Username, User_Role)
values (3, 'dbadmin1', 'USER');

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
 
insert into Users_Places (Uid, Pid)
 values (1,1);
 
insert into Users_Places (Uid, Pid)
 values (1,2);
 
insert into Users_Places (Uid, Pid)
 values (1,3);
 
insert into Places (P_ID, Country, City, City_Status)
 values (1,'Ukraine', 'Kyiv', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (2,'Ukraine', 'Lviv', NULL);
 
insert into Places (P_ID, Country, City, City_Status)
 values (3,'Netherlands', 'Amsterdam', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (4,'France', 'Paris', 'capital');
 
insert into Places (P_ID, Country, City, City_Status)
 values (5,'Great Britain', 'London', 'capital');

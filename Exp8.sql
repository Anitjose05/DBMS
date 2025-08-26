create table Customer (CustomerID int primary key,
Customername varchar(50),
ContactNo varchar(10),
Address varchar(100),
City varchar(30),
PostalCode varchar(50),
Country varchar(25));
desc Customer;

create table Employees(EmployeeID int primary key,
LastName varchar(30),
FirstName varchar(30),
BirthDate date);
desc Employees;

create table Orders(OrderID int primary key,
CustomerID int,
EmployeeID int,
OrderDate date,
ShipperID int,
foreign key (CustomerID) references Customer(CustomerID),
foreign key (EmployeeID) references Employees(EmployeeID)); 
desc Orders;

insert into Customer values(01,'Harry',9123456780,'Lakesvilla','Texas','037546','USA');
insert into Customer values(02,'Ronald',652783012,'Rosegarden','Portugal','037906','United Kingdom');
insert into Customer values(03,'Draco',7193026480,'Rocksvilla','New York','230946','USA');
insert into Customer values(04,'Luna',4590128743,'Edeanhome','Salt Lake City','037546','USA');
insert into Customer values(05,'Suzuki',0118123903,'Futari','Tokyo','71234','Japan');
select * from Customer;

insert into Employees values(100,'Jitraphol','Jimmy',to_date('21-08-1994','dd-mm-yyyy'));
insert into Employees values(101,'Jakarapart','William',to_date('14-02-1975','dd-mm-yyyy'));
insert into Employees values(102,'Kentaro','Mitusha',to_date('08-12-1996','dd-mm-yyyy'));
insert into Employees values(103,'Kim','Jisoo',to_date('03-01-1995','dd-mm-yyyy'));
insert into Employees values(104,'Granger','Hermione',to_date('11-10-1971','dd-mm-yyyy'));
select * from Employees;

update Employees set BirthDate='14-02-1975' where EmployeeID=101;
update Employees set BirthDate='11-10-1971' where EmployeeID=104;

insert into Orders values(1001, 01, 101, to_date('01-01-2023','dd-mm-yyyy'), 1);
insert into Orders values(1002, 01, 102, to_date('10-02-2023','dd-mm-yyyy'), 2);
insert into Orders values(1003, 01, 103, to_date('15-03-2023','dd-mm-yyyy'), 1);
insert into Orders values(1004, 02, 104, to_date('20-04-2023','dd-mm-yyyy'), 3);
insert into Orders values(1005, 05, 100, to_date('25-05-2023','dd-mm-yyyy'), 2);
select * from Orders;


select * from Customer order by CustomerName asc;

select * from Orders order by OrderDate asc;

select * from Employees where extract(year from BirthDate)> 1980 order by BirthDate desc;

select * from Orders where CustomerID in (select CustomerID from Customer where Country='USA');

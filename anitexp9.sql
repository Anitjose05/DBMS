create table Items (
itemsid int primary key,
itemname varchar(50),
category varchar(50),
Price decimal(10,2),
Instock int check(Instock >=0) );

create table Customers ( 
custid int primary key,
custname varchar(50),
Address varchar(50),
State varchar(50));

create table OrdersX (
orderid int primary key,
itemid int,
custid int,
Quantity int,
Orderdate date,
foreign key(itemid) references Items(itemsid),
foreign key(custid) references Customers(custid));

create table Delivery (
deliveryid int primary key,
custid int,
Orderid int,
foreign key(custid) references Customers(custid),
foreign key(Orderid) references OrdersX(orderid));

insert into Items values (1, 'Samsung GalaxyS4', 'Electronics', 600, 50);
insert into Items values(2, 'Laptop', 'Electronics', 1200, 20);
insert into Items values(3, 'T-Shirt', 'Apparel', 25, 200);
insert into Items values(4, 'Jeans', 'Apparel', 50, 150);
insert into Items values(5, 'Desk', 'Furniture', 300, 75);
insert into Items values(6, 'Smart TV', 'Electronics', 800, 30);
insert into Items values(7, 'Washing Machine', 'Appliances', 550, 10);
insert into Items values(8, 'Camera', 'Electronics', 5500, 15);
select * from Items;

insert into Customers  values (101, 'Mickey', '123Main St', 'California');
insert into Customers  values(102, 'Donald', '456Oak Ave', 'New York');
insert into Customers  values(103, 'Jessy', '789Pine Ln', 'Texas');
insert into Customers  values(104, 'Minnie', '101Elm Blvd', 'California');
insert into Customers  values(105, 'Goofy', '202Maple Dr', 'Florida');
insert into Customers  values(106, 'Jack', '303Cedar Rd', 'New York');
select * from Customers;

insert into OrdersX values(1, 1, 101, 1, Date '2023-02-15');
insert into OrdersX values(2, 3, 102, 2, Date '2023-05-20');
insert into OrdersX values(3, 8, 103, 1, Date'2024-01-10');
insert into OrdersX values(4, 2, 101, 1, Date'2023-03-01');
insert into OrdersX values(5, 5, 104, 1, Date'2022-11-05');
insert into OrdersX values(6, 1, 105, 1, Date'2024-02-28');
insert into OrdersX values(7, 3, 102, 1, Date '2025-06-12');
insert into OrdersX values(8, 4, 106, 1, Date'2023-01-05');
select * from OrdersX;

insert into Delivery values(1, 101, 1);
insert into Delivery values(2, 102, 2);
insert into Delivery values(3, 104, 5);
insert into Delivery values(4, 105, 6);
insert into Delivery values(5, 106, 8);
select * from Delivery;

select distinct c.*
from Customers c
join OrdersX o on c.custid= o.custid;

select distinct c.*
from Customers c 
join Delivery d on c.custid=d.custid;

select o.Orderdate 
from OrdersX o
join Customers c on o.custid=c.custid
where c.custname like 'J%';

select i.itemname,i.price
from Items i
join OrdersX o on i.itemsid=o.itemid
join Customers c on o.custid=c.custid
where c.custname='Mickey';

select distinct c.*
from Customers c
join OrdersX o on c.custid=o.custid
left join Delivery d on o.orderid=d.orderid
where o.orderdate > date '2023-01-01'
and d.deliveryid is null;

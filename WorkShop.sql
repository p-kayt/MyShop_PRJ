use master
drop database MyShop
create database MyShop

use MyShop
drop table OrderDetails
drop table Orders
drop table Products
drop table Categories
drop table Accounts
drop table Roles

create table Roles(
roleId char(2) primary key,
roleName varchar(10),
)

create table Categories(
cateId int identity(1,1) primary key,
cateName varchar(30)
)

create table Accounts(
accId int identity(1,1)primary key,
email varchar(30) unique,
password varchar(30),
fullname varchar(30),
phone varchar(12),
status int check(status =1 or status=0),-- 1:active; 0:inactive
roleId char(2) foreign key references Roles(roleId)
)

create table Products (
pId int identity(1,1) primary key,
pName varchar(30),
price decimal(30,2) check(price>=0),
imgPath varchar(50),
quantity int check(quantity>=0),
description text,
status int, --1:active, 0:inactive
cateId int foreign key references Categories(cateId)
)

create table Orders(
orderId int identity(1,1) primary key,
ordDate date,
accId int foreign key references Accounts(accId) on DELETE SET NULL,
total decimal(30,2) check(total>=0),
)


create table OrderDetails(
detailId int identity(1,1) primary key,
orderId int foreign key references Orders(OrderID),
pId int foreign key references Products(pId),
quantity int check(quantity>=1),
price decimal(30,2) check(price>=0),
)


CREATE TRIGGER [OrderDetails_INSERT]
ON [OrderDetails]
AFTER INSERT
AS 
BEGIN
	DECLARE @productId INT
	SELECT @productId = inserted.pId FROM inserted


	DECLARE @orderQty INT
	SELECT @orderQty = inserted.quantity FROM inserted

	DECLARE @productQty INT
	SELECT @productQty = Products.quantity FROM Products

	UPDATE Products SET quantity=(@productQty - @orderQty) WHERE pId = @productId
END


INSERT INTO Roles (roleId, roleName) VALUES ('AD', 'Admin')
INSERT INTO Roles (roleId, roleName) VALUES ('US', 'User')

INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('admin1@gmail.com','Admin 1','admin','123','AD')
INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('admin2@gmail.com','Admin 2','admin','123','AD')
INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('nam@gmail.com','Nam','123','123','US')
INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('hoa@gmail.com','Hoa','123','123','US')
INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('abc@gmail.com','Abc','123','123','US')
INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('abcded@gmail.com','Abcde','123','123','US')

INSERT INTO Categories(cateName) VALUES ('A Classic')
INSERT INTO Categories(cateName) VALUES ('Boba (Bubble Tea)')
INSERT INTO Categories(cateName) VALUES ('Thai Tea')
INSERT INTO Categories(cateName) VALUES ('Others')

INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Milk Tea','./img/1.jpg','This is a description','100','1000','1','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('BoBa','./img/2.jpg','This is a description','101','1000','2','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Thai Tea','./img/3.jpg','This is a description','102','1000','3','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Nutmeg Milk Tea','./img/4.jpg','This is a description','103','1000','4','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Matcha','./img/5.jpg','This is a description','104','1000','4','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Fruit Tea','./img/6.jpg','This is a description','105','1000','4','1')
INSERT INTO Products(pName, imgPath, description, price, quantity, cateId, status) VALUES ('Peach Milk Tea','./img/7.jpg','This is a description','106','1000','4','1')

SELECT * FROM Roles

SELECT * FROM Accounts

SELECT * FROM Categories

SELECT * FROM Products

SELECT * FROM Orders

SELECT * FROM OrderDetails


INSERT INTO Orders(ordDate, accId, total) VALUES ('2022-12-01', '6', '100.0')
INSERT INTO OrderDetails(orderId, pId, price, quantity) VALUES('1', '1', '100', '2000') --quantity 2000 se k dc update


SELECT accId, fullName, roleId, phone FROM Accounts WHERE email='hoa@gmail.com' AND password='123'

SELECT accId, email, fullname, password, phone, roleId FROM Accounts WHERE fullName like '%%'

INSERT INTO Accounts(email, fullname, password, phone, roleId) VALUES ('abcd@gmail.com','test_insert','123','123','US')

SELECT pId, price, imgPath, quantity, description, cateId FROM Products WHERE pName like '%%'

UPDATE Accounts SET roleId='AD' WHERE accId='1'

DELETE Accounts WHERE accId =10
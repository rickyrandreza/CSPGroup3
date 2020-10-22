--creates the database "GameStoreManager", tables, constraints, and
--sample data for the database. 
USE inew2330fa20;
CREATE TABLE group3fa202330.Employees
(
EmplID int identity(100,1) NOT NULL PRIMARY KEY,
LastName varchar(25) NOT NULL,
FirstName varchar(25) NOT NULL,
Title varchar(25) NOT NULL,
BirthDate date,
HireDate date,
Username varchar(25),
Password varchar(25),
Phone char(15) NOT NULL,
Address varchar(30),
City varchar(30),
State char(2),
Zip varchar(6)
);


--create Invoice table with CHECK constraint
Use inew2330fa20;
CREATE TABLE group3fa202330.Invoices
(
InvoiceID int identity(1000,1) NOT NULL PRIMARY KEY,
EmplID int NOT NULL,
SalesTotal money NOT NULL CONSTRAINT [CK_group3fa202330.Invoices_SalesTotal] CHECK (SalesTotal>0),
InvoiceDate date,
);

--Create InvoiceProduct table with Composite key
Use inew2330fa20;
CREATE TABLE group3fa202330.InvoicesProduct
(
ProductID int NOT NULL,
InvoiceID int NOT NULL,
CONSTRAINT [group3fa202330.InvoicesProduct_pk] PRIMARY KEY (ProductID, InvoiceID)
);


	
--create Product table with CHECK constraint
Use inew2330fa20;
CREATE TABLE group3fa202330.Products
(
ProductID int identity(1,1) NOT NULL PRIMARY KEY,
Description varchar (25) NOT NULL,
Console varchar(25),
Quantity int NOT NULL,
Category varchar(25) NOT NULL,
Cost money NOT NULL CONSTRAINT CK_Product_Cost CHECK (Cost>0),
Retail money NOT NULL CONSTRAINT CK_Product_Retail CHECK (Retail>0),
Profit AS Retail-Cost
);



--create Supplier Table
Use inew2330fa20;
CREATE TABLE group3fa202330.Supplier
(
SupplierID int identity(200,1) NOT NULL PRIMARY KEY,
Name varchar(25) NOT NULL,
Contact varchar (25) NOT NULL,
Phone char (15) NOT NULL,
Address varchar(30),
City varchar(30),
State char(2),
Zip varchar(6)
);


--Create ProductSupplier table with Composite key
Use inew2330fa20;
CREATE TABLE group3fa202330.ProductSupplier
(
ProductID int NOT NULL,
SupplierID int NOT NULL,
CONSTRAINT [group3fa202330.ProductSupplier_pk] PRIMARY KEY (ProductID, SupplierID)
);

		--Add constraints FK for existing tables

Use inew2330fa20;
ALTER TABLE group3fa202330.InvoicesProduct
ADD CONSTRAINT [FK_group3fa202330.InvoicesProduct_ProductID]
FOREIGN KEY (ProductID) REFERENCES group3fa202330.Products(ProductID);

Use inew2330fa20;
ALTER TABLE group3fa202330.InvoicesProduct
ADD CONSTRAINT [FK_group3fa202330.InvoicesProduct_InvoiceID]
FOREIGN KEY (InvoiceID) REFERENCES group3fa202330.Invoices(InvoiceID);

Use inew2330fa20;
ALTER TABLE group3fa202330.ProductSupplier
ADD CONSTRAINT [FK_group3fa202330.ProductSupplier_ProductID]
FOREIGN KEY (ProductID) REFERENCES group3fa202330.Products(ProductID);

Use inew2330fa20;
ALTER TABLE group3fa202330.ProductSupplier
ADD CONSTRAINT [FK_group3fa202330.ProductSupplier_SupplierID]
FOREIGN KEY (SupplierID) REFERENCES group3fa202330.Supplier(SupplierID);

Use inew2330fa20;
ALTER TABLE group3fa202330.Invoices
ADD CONSTRAINT [FK_group3fa202330.Invoices_EmplID]
FOREIGN KEY (EmplID) REFERENCES group3fa202330.Employees(EmplID);

--Below are sample records for each field in the group3fa202330.Employees Table
INSERT INTO group3fa202330.Employees
VALUES('Rodriguez', 'Caesar', 'Manager', '2012-01-21','1983-02-11','101CR','CaesaR','325-298-567','456 Oak street', 'Abilene' ,'Tx','79601'),
		('Mallet', 'Sarah', 'Manager', '2013-10-05','1981-04-18','102CR','SaraM','421-232-012','329 Friars street', 'Abilene' ,'Tx','79602'),
		('Lee', 'Bobby', 'Clerk', '2014-05-10','1988-02-14','103BL','BobL','241-222-312','202 Chantecleers street', 'Abilene' ,'Tx','79602'),
		('Perkins', 'Brad', 'Clerk', '2018-07-15','1989-04-20','104BP','BradP','324-723-612','1434 Pines street', 'Abilene' ,'Tx','79602');
		
--Below are sample records for each field in the Invoices Table
INSERT INTO group3fa202330.Invoices
VALUES('100','890.45','2020-09-09'),
('101','1090.25','2020-09-11');

--Below are sample records for each field in the Product Table
INSERT INTO group3fa202330.Products
VALUES('Playstation 4','PS4','30','Console','150.99','289.90'),
('Controller','XBOX ONE','50','Accessory','15.99','49.90'),
('NBA 2k21','PS5','25','New Disc Game','20.00','49.90'),
('Super Mario','Nintendo DS','25','Cartridge Game','12.99','29.90');


--Below are sample records for each field in the Supplier Table
INSERT INTO group3fa202330.Supplier
VALUES( 'GameWorld Distributor', 'Chris Hunter','721-232-012','108-15 Corona Ave', 'Corona' ,'NY','11368'),
		( 'MatCom Distribution', 'Jacob Batee','213-745-2445','2415 South Broadway', 'Los Angeles' ,'CA','90007');



 




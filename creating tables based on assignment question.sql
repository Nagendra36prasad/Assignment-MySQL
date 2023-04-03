-- Assignment of my sql
-- create Table1 :SalesPeople
CREATE TABLE SalesPeople(
Snum int primary key,
Sname varchar(100) unique,
City  varchar(100),
Comm decimal(4,2));

insert into SalesPeople (Snum, Sname, City,Comm)
values(1001, 'Peel', 'London', 0.12),
	  (1002,  'Serres', 'Sanjose', 0.13),
	  (1004,'Motika', 'London', 0.11),
      (1007, 'Rifkin', 'Barcelona', 0.15),
	  (1003, 'Axelrod', 'Newyork', 0.10);

Select * from salespeople;

-- create Table 2: Customers

CREATE TABLE Customers (
  Cnum INT PRIMARY KEY,
  Cname VARCHAR(255),
  City VARCHAR(255) NOT NULL,
  Snum INT,
  CONSTRAINT fk_SalesPeople_Snum FOREIGN KEY (Snum) REFERENCES SalesPeople (Snum)
);

INSERT INTO Customers (Cnum, Cname, City, Snum) VALUES
(2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004, 'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);

-- Table 3 : order

CREATE TABLE Orders (
    Onum INT PRIMARY KEY,
    Amt DECIMAL(10,2),
    Odate DATE,
    Cnum INT,
    Snum INT,
    FOREIGN KEY (Cnum) REFERENCES Customers (Cnum),
    FOREIGN KEY (Snum) REFERENCES SalesPeople (Snum)
);

INSERT INTO Orders (Onum, Amt, Odate, Cnum, Snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4273.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);


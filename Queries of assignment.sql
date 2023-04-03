/* Queries of assignment 
 1.Count the number of Salesperson whose name begin with ‘a’/’A’.
 2.Display all the Salesperson whose all orders worth is more than Rs. 2000.
 3.Count the number of Salesperson belonging to Newyork.
 4.Display the number of Salespeople belonging to London and belonging to Paris.
5.Display the number of orders taken by each Salesperson and their date of orders.
*/
--  1.Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT count(*)  FROM salespeople where Sname LIKE 'A%' ;

--  2.Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT DISTINCT salespeople.Sname FROM salespeople
JOIN Customers ON SalesPeople.Snum = Customers.Snum
JOIN Orders ON Customers.Cnum = Orders.Cnum
WHERE orders.Amt >2000
GROUP BY SalesPeople.Sname
HAVING SUM(Orders.Amt) > 2000;

--  3.Count the number of Salesperson belonging to Newyork.
 SELECT  City, count(Sname) FROM salespeople GROUP BY City HAVING city = 'Newyork';
 
 --  4.Display the number of Salespeople belonging to London and belonging to Paris.
SELECT City, COUNT(*) AS NumSalespeople FROM SalesPeople WHERE City IN ('London', 'Paris') GROUP BY City;

-- 5.Display the number of orders taken by each Salesperson and their date of orders.

SELECT S.Sname, O.Odate, COUNT(*) AS num_orders FROM SalesPeople S
JOIN Customers C ON S.Snum = C.Snum
JOIN Orders O ON C.Cnum = O.Cnum
GROUP BY S.Sname, O.Odate;




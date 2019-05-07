/*Student: Virginia Castro Delion */


SET PAGESIZE 16  
SET PAUSE 'To Continue .. Please, Press Enter ..'
SET PAUSE ON 

/*Question 1: SQL Group Functions (10 points) 
Display the number of customers for each country. */

SELECT COUNTRY, 
COUNT (*)FROM CUSTOMER 
GROUP BY COUNTRY ORDER BY COUNTRY;


/*Question 2: SQL Group Functions (10 points)
Display the Employee_id and the number of orders for each employee having more than 10 orders.*/

SELECT Employee_Id, 
COUNT (order_id) "NUMBER OF ORDERS" FROM ORDERS 
GROUP BY Employee_Id 
HAVING COUNT(*)>11 
ORDER BY COUNT(order_id);

/*Question 3: SQL Group Functions (10 points)
Display the total of each order where Order_ID is greater than 11072.*/

SELECT ORDER_ID, SUM ((QUANTITY*UNIT_PRICE)-(QUANTITY*UNIT_PRICE*DISCOUNT))"Order Total" 
FROM ORDERDETAILS 
WHERE ORDER_ID > 11072
GROUP BY ORDER_ID;

/*Question 4: SUBQUEY (10 points)
Display the Company_name of customers who did not submit any orders*/

SELECT DISTINCT COMPANY_NAME FROM CUSTOMER 
WHERE CUSTOMER_ID NOT IN (SELECT CUSTOMER_ID FROM ORDERS)
ORDER BY COMPANY_NAME;

/*Question 5: SUBQUEY (10 points)
Display the Company_name of canadian customers who are located in cities where there is at least one supplier.*/

SELECT COMPANY_NAME, CITY FROM CUSTOMER
WHERE CITY IN (SELECT DISTINCT CITY FROM SUPPLIER
WHERE UPPER(COUNTRY)='CANADA');


/*Question 6: SUBQUEY (10 points)
Display the First_name , Last_name and title of all employees who have a salary 
greater than all employees who have the title of 'Sales Representative'.*/

SELECT FIRST_NAME, LAST_NAME, 
TITLE FROM EMPLOYEE 
WHERE SALARY > ALL (SELECT SALARY 
FROM EMPLOYEE 
WHERE UPPER (TITLE) ='Sales Representative');

/*Question 7: JOINS (10 points)
Display the list of suppliers who are selling products having a price is greater than 50*/

SELECT S.COMPANY_NAME 
FROM SUPPLIER S JOIN Product P 
ON (S.Supplier_ID = P.Supplier_Id) 
WHERE P.unit_price > 50 
ORDER BY S.COMPANY_NAME;


/*Question 8: JOINS (10 points)
Display the list of Product_Name of products having the same Unit_Price.*/

SELECT P.PRODUCT_NAME, Q.UNIT_PRICE,Q.PRODUCT_NAME
FROM PRODUCT P JOIN PRODUCT Q
ON P.UNIT_PRICE = Q.UNIT_PRICE
WHERE P.PRODUCT_ID != Q.PRODUCT_ID
ORDER BY Q.UNIT_PRICE DESC;

/*Question 9: JOIN and GROUP FUNCTION (10 points)
Display the First_name , Last_name and the number of orders for each employee having more than 10 orders.*/

SELECT E.First_Name, E.Last_Name, 
COUNT(O.ORDER_ID) "NUMBER OF ORDERS" 
FROM EMPLOYEE E JOIN ORDERS O 
ON E.EMPLOYEE_ID = O.EMPLOYEE_ID
GROUP BY E.First_Name, E.Last_Name
HAVING COUNT(O.ORDER_ID)>10
ORDER BY E.First_Name;

/*Question 10: JOIN and SUBQUERY (10 points)
Display the names of suppliers who sell products that have the same 
unit price as the product Steeleye Stout.*/

SELECT S.Company_Name "Names of Suppliers", P.Unit_Price
FROM Supplier S JOIN Product P 
ON S.Supplier_ID = P.Supplier_ID 
WHERE P.Unit_Price =(SELECT Unit_Price FROM Product
WHERE UPPER(Product_Name)='STEELEYE STOUT')
ORDER BY S.Company_Name;


COMMIT; 


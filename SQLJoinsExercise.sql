/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM products AS products
 INNER JOIN categories AS categories
 ON products.CategoryID = categories.CategoryID 
 WHERE categories.Name = 'computers';


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating 
 FROM products
 INNER JOIN reviews
 ON products.ProductID = reviews.ProductID 
 WHERE reviews.Rating = 5;


/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) AS Quantity
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID 
GROUP BY employees.EmployeeID
ORDER BY Quantity DESC
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name as "Department Name", categories.Name as "Category Name"
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games"; 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) as "Total # sold", 
SUM(sales.Quantity * sales.PricePerUnit) as "Total price sold"
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "Eagles: Hotel California";

 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
INNER JOIN products
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = (
SELECT MIN(Rating)
FROM reviews
WHERE products.Name = "Visio TV"
);



/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, Sum(sales.Quantity)
FROM employees
INNER JOIN sales on employees.EmployeeID = sales.EmployeeID
INNER JOIN products on sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.FirstName;
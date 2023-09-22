/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products 
INNER JOIN categories 
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
ORDER BY Quantity DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games"; 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS SUMSALES, SUM(sales.Quantity * products.Price) AS SUMPRICE
FROM sales
INNER JOIN products
ON products.ProductID = sales.ProductID
WHERE products.Name = "Hotel California"
GROUP BY products.Name;
 

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
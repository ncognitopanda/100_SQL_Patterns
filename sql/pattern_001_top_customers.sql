/*
Pattern 001: Top Customers by Total Spend

Purpose:
- Find the top customers ranked by the total amount they have spent.

Demonstrates:
- INNER JOIN between Customers, Orders, and OrderLines tables
- Aggregation with SUM
- GROUP BY and ORDER BY clauses

Tables Used:
- Sales.Customers
- Sales.Orders
- Sales.OrderLines

Expected Output:
- List of top 5 customers with their CustomerID, CustomerName, and total amount spent

*/

SELECT TOP 5 
    C.CustomerID, 
    C.CustomerName, 
    SUM(ORD.Quantity * ORD.UnitPrice) AS Total_Amount_Spent  
FROM Sales.Customers AS C
INNER JOIN Sales.Orders AS O ON C.CustomerID = O.CustomerID
INNER JOIN Sales.OrderLines AS ORD ON O.OrderID = ORD.OrderID
GROUP BY C.CustomerID, C.CustomerName 
ORDER BY Total_Amount_Spent DESC;

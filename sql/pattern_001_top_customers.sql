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

Parameters:
- Top N customers (currently hardcoded as 5)

Performance Notes:
- Ensure indexes on Sales.Orders.CustomerID and Sales.OrderLines.OrderID for faster joins.

Possible Extensions:
- Filter by date range on Orders.OrderDate
- Show top customers by region or country

Sample Output:
CustomerID | CustomerName       | Total_Amount_Spent
-----------|--------------------|-------------------
23         | John Smith         | 1539.20
56         | Alice Johnson      | 1340.75
12         | Bob Lee            | 1285.10

Related Patterns:
- Pattern 002: Top Products Sold
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

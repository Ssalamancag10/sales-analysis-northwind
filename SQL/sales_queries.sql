-- Total ventas con descuento
SELECT 
    SUM(UnitPrice * Quantity * (1 - Discount)) AS total_sales
FROM "Order Details";

-- Ventas por mes
SELECT 
    strftime('%Y-%m', o.OrderDate) AS month,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS sales
FROM Orders o
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY month
ORDER BY month;

-- Top 5 productos
SELECT 
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS sales
FROM "Order Details" od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY sales DESC
LIMIT 5;

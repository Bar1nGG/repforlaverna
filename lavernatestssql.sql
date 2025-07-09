-- Менеджеры с телефоном
SELECT ID, Fio, Phone 
FROM Managers 
WHERE Phone IS NOT NULL AND Phone <> '';

-- Количество продаж 20 июня 2025
SELECT COUNT(*) AS SalesCount
FROM Sells
WHERE CAST(Date AS DATE) = '2025-06-20';

-- Средняя сумма продаж с товаром Фанера
SELECT AVG(s.Sum) AS AverageSum
FROM Sells s
JOIN Products p ON s.ID_Prod = p.ID
WHERE p.Name = 'Фанера';

-- Менеджеры и общая сумма продаж 'ОСБ'
SELECT m.Fio, SUM(s.Sum) AS TotalSum
FROM Sells s
JOIN Managers m ON s.ID_Manag = m.ID
JOIN Products p ON s.ID_Prod = p.ID
WHERE p.Name = 'ОСБ'
GROUP BY m.Fio;

-- менеджер и товар, проданный 22 августа 2024
SELECT m.Fio AS Manager, p.Name AS Product
FROM Sells s
JOIN Managers m ON s.ID_Manag = m.ID
JOIN Products p ON s.ID_Prod = p.ID
WHERE CAST(s.Date AS DATE) = '2024-08-22';

-- Товары с Фанера в названии и ценой от 1750
SELECT ID, Name, Cost
FROM Products
WHERE Name LIKE '%Фанера%' AND Cost >= 1750;

-- История продаж по месяцам и товарам
SELECT 
    FORMAT(s.Date, 'yyyy-MM') AS Month,
    p.Name AS ProductName,
    SUM(s.Count) AS TotalCount,
    SUM(s.Sum) AS TotalSum
FROM Sells s
JOIN Products p ON s.ID_Prod = p.ID
GROUP BY FORMAT(s.Date, 'yyyy-MM'), p.Name
ORDER BY Month, ProductName;

-- Повторяющиеся товары (с количеством > 1)
SELECT 
    Name,
    COUNT(*) AS DuplicateCount
FROM Products
GROUP BY Name
HAVING COUNT(*) > 1;
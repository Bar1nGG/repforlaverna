-- ��������� � ���������
SELECT ID, Fio, Phone 
FROM Managers 
WHERE Phone IS NOT NULL AND Phone <> '';

-- ���������� ������ 20 ���� 2025
SELECT COUNT(*) AS SalesCount
FROM Sells
WHERE CAST(Date AS DATE) = '2025-06-20';

-- ������� ����� ������ � ������� ������
SELECT AVG(s.Sum) AS AverageSum
FROM Sells s
JOIN Products p ON s.ID_Prod = p.ID
WHERE p.Name = '������';

-- ��������� � ����� ����� ������ '���'
SELECT m.Fio, SUM(s.Sum) AS TotalSum
FROM Sells s
JOIN Managers m ON s.ID_Manag = m.ID
JOIN Products p ON s.ID_Prod = p.ID
WHERE p.Name = '���'
GROUP BY m.Fio;

-- �������� � �����, ��������� 22 ������� 2024
SELECT m.Fio AS Manager, p.Name AS Product
FROM Sells s
JOIN Managers m ON s.ID_Manag = m.ID
JOIN Products p ON s.ID_Prod = p.ID
WHERE CAST(s.Date AS DATE) = '2024-08-22';

-- ������ � ������ � �������� � ����� �� 1750
SELECT ID, Name, Cost
FROM Products
WHERE Name LIKE '%������%' AND Cost >= 1750;

-- ������� ������ �� ������� � �������
SELECT 
    FORMAT(s.Date, 'yyyy-MM') AS Month,
    p.Name AS ProductName,
    SUM(s.Count) AS TotalCount,
    SUM(s.Sum) AS TotalSum
FROM Sells s
JOIN Products p ON s.ID_Prod = p.ID
GROUP BY FORMAT(s.Date, 'yyyy-MM'), p.Name
ORDER BY Month, ProductName;

-- ������������� ������ (� ����������� > 1)
SELECT 
    Name,
    COUNT(*) AS DuplicateCount
FROM Products
GROUP BY Name
HAVING COUNT(*) > 1;
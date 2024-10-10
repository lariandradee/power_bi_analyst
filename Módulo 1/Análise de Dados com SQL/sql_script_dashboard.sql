SELECT * FROM Album a;

SELECT COUNT(*) AS TotalRecords FROM Album a;

SELECT COUNT(*) FROM Album a WHERE Column1 IS NOT NULL;

SELECT AlbumId, Title FROM Album a WHERE Column1 IS NULL;

SELECT * FROM Artist a;

SELECT a2.ArtistId, a2.Name, COUNT(*) AS TotalRecords 
FROM Album a 
INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId 
GROUP BY a2.ArtistId, a2.Name;

SELECT a2.ArtistId, a2.Name, COUNT(*) AS TotalRecords 
FROM Album a 
INNER JOIN Artist a2 ON a.ArtistId = a2.ArtistId 
GROUP BY a2.ArtistId, a2.Name 
ORDER BY TotalRecords DESC 
LIMIT 3;

SELECT * FROM Customer c LIMIT 10;

SELECT COUNT(*) AS TotalCustomers FROM Customer c;

SELECT FirstName, Address FROM Customer c;

SELECT COUNT(*) FROM Customer c WHERE Address LIKE '%Broadway%';

SELECT State, COUNT(*) AS Total FROM Customer c GROUP BY State ORDER BY Total DESC LIMIT 10;

SELECT * FROM Customer c;

SELECT COUNT(*) FROM Customer c WHERE Company IS NOT NULL;

SELECT FirstName FROM Customer c WHERE Company IS NULL;

SELECT * FROM Employee e;

SELECT c.FirstName, c.LastName 
FROM Customer c 
WHERE Company IS NULL AND c.FirstName IN 
    (SELECT e.FirstName FROM Employee e);

SELECT c.FirstName, c.LastName 
FROM Customer c 
INNER JOIN Employee e ON c.FirstName = e.FirstName;

SELECT * FROM Invoice i LIMIT 10;

SELECT * FROM InvoiceLine il ORDER BY UnitPrice DESC LIMIT 10;

SELECT UnitPrice, COUNT(*) AS TotalRecords FROM InvoiceLine il GROUP BY UnitPrice;

SELECT c.CustomerId, c.FirstName, COUNT(*) AS TotalInvoices 
FROM Invoice i 
INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId, c.FirstName 
ORDER BY TotalInvoices DESC;

SELECT i.InvoiceId, il.InvoiceLineId 
FROM Invoice i 
INNER JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId 
INNER JOIN Customer c ON c.CustomerId = i.CustomerId 
GROUP BY i.InvoiceId, il.InvoiceLineId 
LIMIT 100;

-- Xania Hotel Booking Management System
-- DML queries for customer reservations, revenue analysis, and reporting.

-- Query 1:
-- Display customers who have not made any reservation from the beginning until the end of 2024.
-- The result includes customer name, email address, and contact number.
SELECT
    c.Cust_Name AS CustomerName,
    c.Cust_Email AS EmailAddress,
    c.Cust_Phone AS ContactNumber
FROM Customer AS c
LEFT JOIN Booking AS b
    ON c.Cust_ID = b.Cust_ID
    AND b.BookingDate >= '2024-01-01'
    AND b.BookingDate < '2025-01-01'
WHERE b.BookingID IS NULL
ORDER BY c.Cust_Name;

-- Query 2:
-- Display monthly hotel revenue by branch/state for 2024 and sort by monthly revenue descending.
SELECT
    br.BranchName,
    YEAR(p.PaymentDate) AS RevenueYear,
    MONTH(p.PaymentDate) AS RevenueMonth,
    DATENAME(MONTH, p.PaymentDate) AS RevenueMonthName,
    SUM(p.PaymentAmount) AS MonthlyRevenue
FROM Payment AS p
INNER JOIN Booking AS b
    ON p.BookingID = b.BookingID
INNER JOIN Branch AS br
    ON b.BranchID = br.BranchID
WHERE p.PaymentDate >= '2024-01-01'
    AND p.PaymentDate < '2025-01-01'
GROUP BY
    br.BranchName,
    YEAR(p.PaymentDate),
    MONTH(p.PaymentDate),
    DATENAME(MONTH, p.PaymentDate)
ORDER BY MonthlyRevenue DESC;

-- Query 3:
-- Display customers who made more than 3 reservations in 2024.
SELECT
    c.Cust_ID,
    c.Cust_Name,
    c.Cust_Email,
    COUNT(b.BookingID) AS ReservationCount
FROM Customer AS c
INNER JOIN Booking AS b
    ON c.Cust_ID = b.Cust_ID
WHERE b.BookingDate >= '2024-01-01'
    AND b.BookingDate < '2025-01-01'
GROUP BY
    c.Cust_ID,
    c.Cust_Name,
    c.Cust_Email
HAVING COUNT(b.BookingID) > 3
ORDER BY ReservationCount DESC;

-- Extra Query 4:
-- Display total bookings per branch.
SELECT
    br.BranchName,
    COUNT(b.BookingID) AS TotalBookings
FROM Branch AS br
LEFT JOIN Booking AS b
    ON br.BranchID = b.BranchID
GROUP BY br.BranchName
ORDER BY TotalBookings DESC;

-- Extra Query 5:
-- Display the most booked room types in 2024.
SELECT
    r.RoomType,
    COUNT(b.BookingID) AS BookingCount
FROM Booking AS b
INNER JOIN Room AS r
    ON b.BranchID = r.BranchID
    AND b.RoomNo = r.RoomNo
WHERE b.BookingDate >= '2024-01-01'
    AND b.BookingDate < '2025-01-01'
GROUP BY r.RoomType
ORDER BY BookingCount DESC;

-- Extra Query 6:
-- Summarize payment records by payment status.
SELECT
    PaymentStatus,
    COUNT(PaymentID) AS PaymentCount,
    SUM(PaymentAmount) AS TotalAmount
FROM Payment
GROUP BY PaymentStatus
ORDER BY TotalAmount DESC;

-- Extra Query 7:
-- Display average hotel rating by branch for 2024.
SELECT
    br.BranchName,
    AVG(CAST(b.HotelRating AS DECIMAL(10, 2))) AS AverageRating
FROM Branch AS br
INNER JOIN Booking AS b
    ON br.BranchID = b.BranchID
WHERE b.BookingDate >= '2024-01-01'
    AND b.BookingDate < '2025-01-01'
    AND b.HotelRating IS NOT NULL
GROUP BY br.BranchName
ORDER BY AverageRating DESC;

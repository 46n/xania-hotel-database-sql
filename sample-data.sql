-- Xania Hotel Booking Management System
-- Safe fictional sample data for portfolio and query testing.

INSERT INTO Branch (BranchID, BranchName)
VALUES
    ('B01', 'Kuala Lumpur Branch'),
    ('B02', 'Penang Branch'),
    ('B03', 'Johor Branch'),
    ('B04', 'Melaka Branch'),
    ('B05', 'Sabah Branch');

INSERT INTO RoomType (RoomType, BaseRate)
VALUES
    ('Standard Double', 150.00),
    ('Standard Twin', 200.00),
    ('Deluxe Double', 250.00),
    ('Family Suite', 450.00),
    ('Executive Suite', 400.00),
    ('Studio', 140.00);

INSERT INTO Room (BranchID, RoomNo, RoomType, Capacity, PricePerNight)
VALUES
    ('B01', '101', 'Standard Double', 2, 150.00),
    ('B01', '201', 'Standard Twin', 2, 200.00),
    ('B01', '301', 'Executive Suite', 4, 400.00),
    ('B02', '101', 'Deluxe Double', 3, 250.00),
    ('B02', '201', 'Family Suite', 4, 450.00),
    ('B03', '101', 'Standard Double', 2, 150.00),
    ('B03', '201', 'Studio', 2, 140.00),
    ('B04', '101', 'Standard Twin', 2, 200.00),
    ('B04', '201', 'Family Suite', 4, 450.00),
    ('B05', '101', 'Studio', 2, 140.00),
    ('B05', '201', 'Deluxe Double', 3, 250.00);

INSERT INTO Customer (Cust_ID, Cust_Name, Cust_Gender, Cust_Email, Cust_Phone, Cust_Address, EmergencyContact)
VALUES
    ('C001', 'Aisha Rahman', 'Female', 'aisha.rahman@example.com', '010-100-1001', 'Kuala Lumpur, Malaysia', '010-900-1001'),
    ('C002', 'Daniel Tan', 'Male', 'daniel.tan@example.com', '010-100-1002', 'Penang, Malaysia', '010-900-1002'),
    ('C003', 'Maya Lim', 'Female', 'maya.lim@example.com', '010-100-1003', 'Johor Bahru, Malaysia', '010-900-1003'),
    ('C004', 'Omar Hassan', 'Male', 'omar.hassan@example.com', '010-100-1004', 'Melaka, Malaysia', '010-900-1004'),
    ('C005', 'Priya Nair', 'Female', 'priya.nair@example.com', '010-100-1005', 'Kota Kinabalu, Malaysia', '010-900-1005'),
    ('C006', 'Victor Lee', 'Male', 'victor.lee@example.com', '010-100-1006', 'Kuala Lumpur, Malaysia', '010-900-1006'),
    ('C007', 'Sara Wong', 'Female', 'sara.wong@example.com', '010-100-1007', 'Ipoh, Malaysia', '010-900-1007'),
    ('C008', 'Noah Ibrahim', 'Male', 'noah.ibrahim@example.com', '010-100-1008', 'Kuantan, Malaysia', '010-900-1008');

INSERT INTO Staff (StaffID, StaffName, BranchID)
VALUES
    ('S001', 'Amir Khalid', 'B01'),
    ('S002', 'Nora Ismail', 'B01'),
    ('S003', 'Grace Tan', 'B02'),
    ('S004', 'Hafiz Zain', 'B03'),
    ('S005', 'Lina Teo', 'B04'),
    ('S006', 'Farah Musa', 'B05');

INSERT INTO Booking
    (BookingID, BookingDate, BranchID, RoomNo, CheckIn, CheckOut, Cust_ID, StaffID, HotelRating, Review, SpecialRequests)
VALUES
    ('BK001', '2024-01-05', 'B01', '101', '2024-01-12', '2024-01-15', 'C001', 'S001', 5, 'Excellent service and clean room.', 'Late check-in'),
    ('BK002', '2024-02-10', 'B02', '101', '2024-02-14', '2024-02-17', 'C002', 'S003', 4, 'Good location.', 'Quiet room'),
    ('BK003', '2024-03-03', 'B01', '201', '2024-03-10', '2024-03-12', 'C003', 'S002', 5, 'Comfortable stay.', NULL),
    ('BK004', '2024-04-08', 'B03', '101', '2024-04-15', '2024-04-18', 'C003', 'S004', 4, 'Helpful staff.', 'Extra towels'),
    ('BK005', '2024-05-12', 'B04', '201', '2024-05-20', '2024-05-24', 'C003', 'S005', 5, 'Spacious room.', 'Non-smoking'),
    ('BK006', '2024-06-20', 'B05', '101', '2024-06-25', '2024-06-27', 'C003', 'S006', 3, 'Average experience.', NULL),
    ('BK007', '2024-07-01', 'B02', '201', '2024-07-08', '2024-07-11', 'C004', 'S003', 4, 'Family suite was suitable.', 'Baby cot'),
    ('BK008', '2024-08-15', 'B03', '201', '2024-08-22', '2024-08-25', 'C005', 'S004', 5, 'Good value.', 'Early check-in'),
    ('BK009', '2024-09-05', 'B04', '101', '2024-09-12', '2024-09-13', 'C006', 'S005', 4, 'Fast check-in.', NULL),
    ('BK010', '2024-10-18', 'B01', '301', '2024-10-24', '2024-10-27', 'C001', 'S001', 5, 'Excellent suite.', 'High floor'),
    ('BK011', '2024-11-02', 'B05', '201', '2024-11-09', '2024-11-12', 'C002', 'S006', 4, 'Friendly staff.', 'Sea view'),
    ('BK012', '2023-12-08', 'B01', '101', '2023-12-15', '2023-12-16', 'C007', 'S002', 4, 'Short business stay.', NULL);

INSERT INTO Payment (PaymentID, BookingID, PaymentDate, PaymentAmount, PaymentMethod, PaymentStatus)
VALUES
    ('PAY001', 'BK001', '2024-01-05', 450.00, 'Visa', 'Fully Paid'),
    ('PAY002', 'BK002', '2024-02-10', 750.00, 'MasterCard', 'Fully Paid'),
    ('PAY003', 'BK003', '2024-03-03', 400.00, 'Cash', 'Fully Paid'),
    ('PAY004', 'BK004', '2024-04-08', 450.00, 'Visa', 'Fully Paid'),
    ('PAY005', 'BK005', '2024-05-12', 1800.00, 'MasterCard', 'Fully Paid'),
    ('PAY006', 'BK006', '2024-06-20', 280.00, 'Cash', 'Fully Paid'),
    ('PAY007', 'BK007', '2024-07-01', 1350.00, 'Visa', 'Deposit Paid'),
    ('PAY008', 'BK008', '2024-08-15', 420.00, 'MasterCard', 'Fully Paid'),
    ('PAY009', 'BK009', '2024-09-05', 200.00, 'Cash', 'Fully Paid'),
    ('PAY010', 'BK010', '2024-10-18', 1200.00, 'Visa', 'Fully Paid'),
    ('PAY011', 'BK011', '2024-11-02', 750.00, 'MasterCard', 'Fully Paid'),
    ('PAY012', 'BK012', '2023-12-08', 150.00, 'Cash', 'Fully Paid');

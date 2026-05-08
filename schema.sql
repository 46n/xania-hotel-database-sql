-- Xania Hotel Booking Management System
-- Cleaned SQL Server schema adapted from the academic assignment SQL for portfolio use.

CREATE TABLE Branch (
    BranchID NVARCHAR(10) NOT NULL,
    BranchName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Branch PRIMARY KEY (BranchID)
);

CREATE TABLE RoomType (
    RoomType NVARCHAR(40) NOT NULL,
    BaseRate DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_RoomType PRIMARY KEY (RoomType)
);

CREATE TABLE Room (
    BranchID NVARCHAR(10) NOT NULL,
    RoomNo NVARCHAR(10) NOT NULL,
    RoomType NVARCHAR(40) NOT NULL,
    Capacity INT NOT NULL,
    PricePerNight DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_Room PRIMARY KEY (BranchID, RoomNo),
    CONSTRAINT FK_Room_Branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID),
    CONSTRAINT FK_Room_RoomType FOREIGN KEY (RoomType)
        REFERENCES RoomType(RoomType)
);

CREATE TABLE Customer (
    Cust_ID NVARCHAR(10) NOT NULL,
    Cust_Name NVARCHAR(100) NOT NULL,
    Cust_Gender NVARCHAR(10) NULL,
    Cust_Email NVARCHAR(100) NOT NULL,
    Cust_Phone NVARCHAR(20) NOT NULL,
    Cust_Address NVARCHAR(150) NULL,
    EmergencyContact NVARCHAR(20) NULL,
    CONSTRAINT PK_Customer PRIMARY KEY (Cust_ID)
);

CREATE TABLE Staff (
    StaffID NVARCHAR(10) NOT NULL,
    StaffName NVARCHAR(50) NOT NULL,
    BranchID NVARCHAR(10) NOT NULL,
    CONSTRAINT PK_Staff PRIMARY KEY (StaffID),
    CONSTRAINT FK_Staff_Branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID)
);

CREATE TABLE Booking (
    BookingID NVARCHAR(10) NOT NULL,
    BookingDate DATE NOT NULL,
    BranchID NVARCHAR(10) NOT NULL,
    RoomNo NVARCHAR(10) NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    Cust_ID NVARCHAR(10) NOT NULL,
    StaffID NVARCHAR(10) NOT NULL,
    HotelRating INT NULL,
    Review NVARCHAR(300) NULL,
    SpecialRequests NVARCHAR(300) NULL,
    CONSTRAINT PK_Booking PRIMARY KEY (BookingID),
    CONSTRAINT FK_Booking_Customer FOREIGN KEY (Cust_ID)
        REFERENCES Customer(Cust_ID),
    CONSTRAINT FK_Booking_Staff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID),
    CONSTRAINT FK_Booking_Branch FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID),
    CONSTRAINT FK_Booking_Room FOREIGN KEY (BranchID, RoomNo)
        REFERENCES Room(BranchID, RoomNo)
);

CREATE TABLE Payment (
    PaymentID NVARCHAR(10) NOT NULL,
    BookingID NVARCHAR(10) NOT NULL,
    PaymentDate DATE NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod NVARCHAR(50) NULL,
    PaymentStatus NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Payment PRIMARY KEY (PaymentID),
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID)
        REFERENCES Booking(BookingID)
);

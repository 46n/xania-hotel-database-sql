# Xania Hotel Booking Database Project Summary

## Project Overview

Xania Hotel Booking Database is a relational database design project for managing hotel branches, rooms, customers, staff, bookings, and payments. The database supports common hotel booking operations such as recording reservations, assigning rooms, tracking customer information, storing payment details, and analyzing booking or revenue activity.

This file is part of a cleaned portfolio version of an Introduction to Database academic group project. Private academic submission details are intentionally excluded.

## Business Rules Summary

- A branch can have many rooms.
- Each room belongs to one branch.
- Each room has one room type.
- A room type can be used by many rooms.
- A customer can make many bookings.
- Each booking belongs to one customer.
- Each booking reserves one room at one branch.
- Staff members are assigned to branches.
- Each booking is handled by one staff member.
- A booking can generate one or more payment records.
- Each payment belongs to one booking.

## Normalization Summary

The design separates hotel data into focused relational tables to reduce duplication and improve consistency. Branch details are stored separately from rooms, room category data is stored in the RoomType table, customer details are separated from booking records, and payment information is separated from booking information.

The resulting structure supports normalized relationships between entities and uses primary keys and foreign keys to maintain referential integrity.

## ERD Explanation

The ERD represents the main entities involved in the hotel booking process:

- Branch stores hotel branch information.
- RoomType stores room category and base rate information.
- Room stores physical rooms and links each room to a branch and room type.
- Customer stores customer contact and emergency contact information.
- Staff stores staff members and their assigned branch.
- Booking connects customers, rooms, branches, and staff through a reservation record.
- Payment stores payment details for bookings.

## Schema Explanation

The schema uses SQL Server style syntax and includes seven core tables: Branch, RoomType, Room, Customer, Staff, Booking, and Payment. Primary keys uniquely identify records, while foreign keys connect related records across tables.

The Room table uses a composite primary key of BranchID and RoomNo because room numbers may be repeated across different branches. Booking references this combined room identity so the reserved room is tied to the correct branch.

## Main DML Query Explanations

### Query 1: Customers Without 2024 Reservations

This query uses a LEFT JOIN between Customer and Booking to find customers who have no booking records in 2024. It returns the customer name, email address, and contact number.

### Query 2: Monthly Revenue by Branch

This query joins Payment, Booking, and Branch to calculate monthly hotel revenue by branch for 2024. It groups results by branch and payment month, then sorts the revenue from highest to lowest.

### Query 3: Customers With More Than Three 2024 Reservations

This query joins Customer and Booking, groups bookings by customer, and uses HAVING COUNT to return customers who made more than three reservations in 2024.

## Limitations

- The project uses sample data rather than production data.
- Some constraints could be expanded, such as stricter rating ranges and payment status validation.
- The current repository focuses on SQL scripts and documentation, not an application frontend.
- Screenshots should be regenerated from the cleaned SQL files before publishing.

## Future Improvements

- Add stored procedures for common booking and payment operations.
- Add SQL views for reporting.
- Improve constraints and validation rules.
- Add indexes for frequently queried columns.
- Connect the database to an application.
- Build a dashboard from the SQL data.

## Portfolio Version Note

This is a cleaned portfolio version of an academic group project. TP numbers, lecturer names, full group member details, workload matrix information, private university cover pages, and unsanitized submission files are excluded.

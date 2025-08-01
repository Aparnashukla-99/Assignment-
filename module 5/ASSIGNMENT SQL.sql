create database assignment;
use assignment;

CREATE TABLE Contact (
    ContactID INT,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

select* from contact;
INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 1, 'Anna', 'Smith', '456 Main St', 'Philadelphia', 'PA', '19107', TRUE, 'anna.smith@urban.com', '215-555-1111'),
(2, 2, 'John', 'Doe', '789 Market St', 'Horsham', 'PA', '19044', TRUE, 'john.doe@tollbrothers.com', '215-555-2222');

CREATE TABLE Employee (
    EmployeeID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

select* from employee;

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(1, 'Lesley', 'Bland', 60000.00, '2018-05-10', 'Sales Manager', 'lesley.bland@marketco.com', '215-555-1234'),
(2, 'Dianne', 'Connor', 55000.00, '2019-07-15', 'Account Executive', 'dianne.connor@marketco.com', '215-555-5678'),
(3, 'Jack', 'Lee', 58000.00, '2017-09-25', 'Account Executive', 'jack.lee@marketco.com', '215-555-9012');

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100)
);

select* from contactemployee;

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 2, 1, '2024-05-15', 'Initial meeting with Toll Brothers'),  
(2, 1, 2, '2024-06-10', 'Meeting Urban Outfitters'),           
(3, 1, 3, '2024-07-01', 'Follow-up with Urban Outfitters');    

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(4,3,4,'2024-08-12', 'urban technology'),
(5,4,5,'2024-07-11','polyster outfits');



CREATE TABLE Company (
    CompanyID INT,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Zip VARCHAR(10)
);

INSERT INTO Company (CompanyID, CompanyName, Street, City, State, Zip)
VALUES
(1, 'Urban Outfitters, Inc.', '123 Fashion St', 'Philadelphia', 'PA', '19107'),
(2, 'Toll Brothers', '250 Gibraltar Rd', 'Horsham', 'PA', '19044');
select* from company;

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 5;

SELECT Employee.FirstName, Employee.LastName
FROM Employee 
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact  ON ContactEmployee.ContactID = contact.ContactID
JOIN Company  ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';


/*8) Significance of % and _ in LIKE

%: Matches zero or more characters. Example: LIKE 'A%' matches 'Apple', 'A', 'Amazon'.

_: Matches exactly one character. Example: LIKE '_a%' matches 'Bat', 'Cat'.


9) Explain normalization
Normalization organizes data in tables to reduce redundancy and improve data integrity.
 It breaks large tables into smaller ones and defines relationships between them, usually following normal forms (1NF, 2NF, 3NF, etc.).
 
  10) What does a join in MySQL mean?
A join combines rows from two or more tables based on related columns, enabling retrieval of data spread across multiple tables.

 11) Understand DDL, DCL, and DML in MySQL

DDL (Data Definition Language): Defines structure (e.g., CREATE, ALTER, DROP).

DCL (Data Control Language): Controls access (e.g., GRANT, REVOKE).

DML (Data Manipulation Language): Manipulates data (e.g., SELECT, INSERT, UPDATE, DELETE).

12) Role of JOIN clause & common types

Combines rows from multiple tables using related columns.

Common types:

INNER JOIN: Returns matching rows.

LEFT JOIN / LEFT OUTER JOIN: All from left table + matching from right.

RIGHT JOIN / RIGHT OUTER JOIN: All from right + matching from left.

FULL JOIN: All rows when there’s a match in one of the tables.*/
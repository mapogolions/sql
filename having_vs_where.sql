DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee
(
    EmployeeId INT IDENTITY(1, 1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
)


ALTER TABLE dbo.Employee
ADD CONSTRAINT CK_Employee_Gender
CHECK ([Gender] IN ('male', 'female'))

INSERT INTO dbo.Employee (Name, City, Gender)
    VALUES ('someone1', 'A', 'male')
        , ('someone2', 'B', 'male')
        , ('someone3', 'B', 'female')
        , ('someone4', 'B', 'female')
        , ('someone5', 'A', 'female')
        , ('someone6', 'B', 'female')
        , ('someone7', 'B', 'male')
        , ('someone8', 'A', 'male')


SELECT City, COUNT(EmployeeId) FROM dbo.Employee
GROUP BY City, Gender
HAVING Gender = 'female'

SELECT City, COUNT(EmployeeId) FROM dbo.Employee
WHERE Gender = 'female'
GROUP BY City

-- subtle case

SELECT City, COUNT(EmployeeId) FROM dbo.Employee
GROUP BY City, Gender
HAVING Gender = 'female' AND COUNT(EmployeeId) > 2

-- SELECT City, COUNT(EmployeeId) FROM dbo.Employee
-- WHERE Gender = 'female' AND COUNT(EmployeeId) > 2 -- invalid expression
-- GROUP BY City

SELECT * FROM (
    SELECT City, COUNT(EmployeeId) as Count  FROM dbo.Employee
    WHERE Gender = 'female'
    GROUP BY City
) as interim WHERE interim.Count > 1

DROP TABLE IF EXISTS dbo.Employee

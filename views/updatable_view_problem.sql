DROP TABLE IF EXISTS dbo.Department
DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Department (
    DepartmentId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100),
)

INSERT INTO dbo.Department (Name, Location) VALUES ('HR', 'London'), ('IT', 'Leeds')

CREATE TABLE dbo.Employee (
    EmployeeId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Salary DECIMAL NOT NULL,
    DepartmentId INT FOREIGN KEY REFERENCES dbo.Department (DepartmentId)
)

INSERT INTO dbo.Employee (Name, Salary, DepartmentId)
VALUES
    ('Sam', 100, 1),
    ('Fill', 200, 1),
    ('Henrick', 110, 1),
    ('Bob', 115, 2),
    ('Mark', 100, 2),
    ('Jim', 140, 2)

DROP VIEW IF EXISTS dbo.vwEmployeeDetails

GO
CREATE VIEW vwEmployeeDetails
    AS
    SELECT em.EmployeeId, em.Name, dept.Name as DepartmentName
    FROM dbo.Employee as em INNER JOIN dbo.Department as dept
    ON em.DepartmentId = dept.DepartmentId
GO

SELECT * FROM vwEmployeeDetails

-- DELETE FROM vwEmployeeDetails WHERE EmployeeId = 1 -- error

DROP VIEW IF EXISTS dbo.vwEmployeeDetails
DROP TABLE IF EXISTS dbo.Employee
DROP TABLE IF EXISTS dbo.Department

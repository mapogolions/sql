DROP TABLE IF EXISTS dbo.Department

CREATE TABLE dbo.Department (
    DepartmentId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL,
    Head NVARCHAR(100) NOT NULL,
    Employees NVARCHAR(1000)
)

INSERT INTO dbo.Department (Name, Location, Head, Employees)
VALUES
    ('HR', 'London', 'Bill', 'Sam, Fill, Henrick'),
    ('IT', 'Leeds', 'Erick', 'Bob, Mark, Jim');

SELECT * FROM dbo.Department

DROP TABLE IF EXISTS dbo.Department

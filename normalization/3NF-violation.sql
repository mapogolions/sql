-- 3NF AnnualSalary attribute is not fully dependent on primary key
DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Salary DECIMAL NOT NULL
)

-- how to add a computed property
ALTER TABLE dbo.Employee
ADD AnnualSalary AS Salary * 12

INSERT INTO dbo.Employee (Name, Salary)
VALUES
    ('Sam', 100),
    ('Fill', 200),
    ('Henrick', 110),
    ('Bob', 115),
    ('Mark', 100),
    ('Jim', 140)

SELECT * FROM dbo.Employee

DROP TABLE IF EXISTS dbo.Employee

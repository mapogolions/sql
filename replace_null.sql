DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    ManagerId INT
)

INSERT INTO dbo.Employee (Name, ManagerId)
VALUES
    ('Jane', NULL),
    ('John', 1),
    ('Sarah', 1)

SELECT em.Name as Employee, ISNULL(mng.Name, 'No manager') as Manager
FROM dbo.Employee as em LEFT JOIN dbo.Employee as mng
ON em.ManagerId = mng.EmployeeId

-- COALESCE returns first non-null value
SELECT em.Name as Employee, COALESCE(mng.Name, 'No manager') as Manager
FROM dbo.Employee as em LEFT JOIN dbo.Employee as mng
ON em.ManagerId = mng.EmployeeId

DROP TABLE IF EXISTS dbo.Employee

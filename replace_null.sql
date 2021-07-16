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

select * from dbo.Employee

-- ISNULL
SELECT em.Name as Employee, ISNULL(mng.Name, 'No manager') as Manager
FROM dbo.Employee as em LEFT JOIN dbo.Employee as mng
ON em.ManagerId = mng.EmployeeId

-- COALESCE returns first non-null value
SELECT em.Name as Employee, COALESCE(mng.Name, 'No manager') as Manager
FROM dbo.Employee as em LEFT JOIN dbo.Employee as mng
ON em.ManagerId = mng.EmployeeId

-- CASE
select em.Name as Employee, (case when mng.Name is null then 'No manager' else mng.Name end) as Manager
from dbo.Employee as em left join dbo.Employee as mng
on em.ManagerId = mng.EmployeeId


DROP TABLE IF EXISTS dbo.Employee

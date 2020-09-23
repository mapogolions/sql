DROP TABLE IF EXISTS [dbo].[Department]
DROP TABLE IF EXISTS [dbo].[Employee]

CREATE TABLE [dbo].[Department] (
    DepartmentId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100),
)

INSERT INTO [dbo].[Department] ([Name], [Location]) VALUES ('HR', 'London'), ('IT', 'Leeds')

CREATE TABLE [dbo].[Employee] (
    EmployeeId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Salary DECIMAL NOT NULL,
    DepartmentId INT FOREIGN KEY REFERENCES [dbo].[Department] ([DepartmentId])
)

INSERT INTO [dbo].[Employee] ([Name], [Salary], [DepartmentId])
VALUES
    ('Sam', 100, 1),
    ('Fill', 200, 1),
    ('Henrick', 110, 1),
    ('Bob', 115, 2),
    ('Mark', 100, 2),
    ('Jim', 140, 2)

DROP VIEW IF EXISTS [dbo].[vwGrantAccessITDepartment]

GO
CREATE VIEW vwGrantAccessITDepartment
AS
SELECT [em].[Name], [dept].[Name] as [DepartmentName] FROM [dbo].[Employee] as [em]
INNER JOIN [dbo].[Department] as [dept]
ON [em].[DepartmentId] = [dept].[DepartmentId]
WHERE [dept].[Name] LIKE 'IT'
GO

-- create virtual table that contains only IT department data (row level security)
-- and hides private info like salary (column level security)
SELECT * FROM vwGrantAccessITDepartment

DROP TABLE IF EXISTS [dbo].[Employee]
DROP TABLE IF EXISTS [dbo].[Department]

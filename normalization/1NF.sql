-- 1NF
-- atomic attribute
-- no dubplicate columns
-- primary key should uniquely identify each tuple

DROP TABLE IF EXISTS [dbo].[Employee]

CREATE TABLE [dbo].[Employee] (
    EmployeeId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    DepartmentName NVARCHAR(100) NOT NULL,
    DepartmentLocation NVARCHAR(100) NOT NULL,
)

INSERT INTO [dbo].[Employee] ([Name], [DepartmentName], [DepartmentLocation])
VALUES
    ('Sam', 'HR', 'London'),
    ('Fill', 'HR', 'London'),
    ('Henrick', 'HR', 'London'),
    ('Bob', 'IT', 'Leeds'),
    ('Mark', 'IT', 'Leeds'),
    ('Jim', 'IT', 'Leeds')

SELECT * FROM [dbo].[Employee]

DROP TABLE IF EXISTS [dbo].[Employee]

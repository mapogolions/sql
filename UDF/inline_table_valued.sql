DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Salary DECIMAL(18, 2) NOT NULL,
    Gender NVARCHAR(10) NOT NULL
)

ALTER TABLE dbo.Employee
ADD CONSTRAINT CK_Employee_Name
CHECK (Gender IN ('male', 'female'))

INSERT INTO dbo.Employee (FullName, Salary, Gender)
VALUES
    ('John Doe', 320.00, 'male'),
    ('Jane Doe', 500.50, 'female'),
    ('Bob Smith', 320.09, 'male')


DROP FUNCTION IF EXISTS dbo.FilterByGender

GO
CREATE FUNCTION dbo.FilterByGender (@Gender NVARCHAR(10))
    RETURNS TABLE
AS
    RETURN (SELECT * FROM dbo.Employee WHERE @Gender = Gender)
GO

SELECT * FROM dbo.FilterByGender('male')

DROP FUNCTION IF EXISTS dbo.FilterByGender
DROP TABLE IF EXISTS dbo.Employee

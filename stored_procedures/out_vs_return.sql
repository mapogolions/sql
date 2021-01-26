-- when return value is not integer
-- when need to return multiple values

DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT NOT NULL IDENTITY PRIMARY KEY,
    Name  NVARCHAR(100) NOT NULL,
    LeadId INT NULL
)

INSERT INTO dbo.Employee (Name, LeadId)
VALUES ('Joe', NULL), ('John', 1), ('Sarah', 1)


-- return value int type
DROP PROC IF EXISTS dbo.spGetTotalCountOfEmployees

GO
CREATE PROC dbo.spGetTotalCountOfEmployees
AS
BEGIN
    RETURN (SELECT COUNT(EmployeeId) FROM dbo.Employee)
END
GO

DECLARE @TotalCountOfEmployees INT
EXEC @TotalCountOfEmployees = dbo.spGetTotalCountOfEmployees
SELECT @TotalCountOfEmployees as [Total Count Of Employees]


-- return value nvarchar type
DROP PROC IF EXISTS dbo.spGetEmployeeNameById

GO
CREATE PROC dbo.spGetEmployeeNameById
    @EmployeeId INT,
    @EmployeeName NVARCHAR(100) OUT
AS
BEGIN
    SELECT @EmployeeName = Name FROM dbo.Employee WHERE EmployeeId = @EmployeeId
    -- invalid expression
    -- RETURN (SELECT Name FROM dbo.Employee WHERE EmployeeId = @EmployeeId)
END

GO
DECLARE @EmployeeName NVARCHAR(100)
EXEC dbo.spGetEmployeeNameById 1, @EmployeeName OUT
SELECT @EmployeeName as [Employee Name]


DROP PROC IF EXISTS dbo.spGetTotalCountOfEmployees
DROP PROC IF EXISTS dbo.spGetEmployeeNameById
DROP TABLE IF EXISTS dbo.Employee

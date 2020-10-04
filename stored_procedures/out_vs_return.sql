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

DROP PROC IF EXISTS dbo.spGetEmployeeNameById

GO
CREATE PROC dbo.spGetEmployeeNameById
    @EmployeeId INT,
    @EmployeeName NVARCHAR(100) OUT
AS
BEGIN
    SELECT @EmployeeName = Name FROM dbo.Employee WHERE EmployeeId = @EmployeeId
    -- RETURN (SELECT Name FROM dbo.Employee WHERE EmployeeId = @EmployeeId)
END

GO
DECLARE @EmployeeName NVARCHAR(100)
EXEC dbo.spGetEmployeeNameById 1, @EmployeeName OUT
PRINT 'Employee Name => ' + @EmployeeName

DROP PROC IF EXISTS dbo.spGetEmployeeNameById
DROP TABLE IF EXISTS dbo.Employee

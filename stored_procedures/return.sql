DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT NOT NULL IDENTITY PRIMARY KEY,
    Name  NVARCHAR(100) NOT NULL,
    LeadId INT NULL
)

INSERT INTO dbo.Employee (Name, LeadId)
VALUES ('Joe', NULL), ('John', 1), ('Sarah', 1)

DROP PROC IF EXISTS dbo.spGetTotalWorkersByLeadName

GO
CREATE PROC dbo.spGetTotalWorkersByLeadName
    @LeadName NVARCHAR(100)
AS
BEGIN
    -- parentheses required
    RETURN (SELECT COUNT(em.EmployeeId)
    FROM dbo.Employee as em INNER JOIN dbo.Employee as lead
    ON em.LeadId = lead.EmployeeId
    WHERE lead.Name LIKE '%' + @LeadName + '%')
END

GO
DECLARE @TotalWorkers INT
EXEC @TotalWorkers = dbo.spGetTotalWorkersByLeadName @LeadName = 'Joe'

SELECt @TotalWorkers as [Total Workers]

DROP PROC IF EXISTS dbo.spGetTotalWorkersByLeadName
DROP TABLE IF EXISTS dbo.Employee

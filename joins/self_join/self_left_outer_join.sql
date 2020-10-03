DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT NOT NULL IDENTITY PRIMARY KEY,
    Name  NVARCHAR(100) NOT NULL,
    LeadId INT NULL
)

INSERT INTO dbo.Employee (Name, LeadId)
VALUES ('Joe', NULL), ('John', 1), ('Sarah', 1)

SELECT em.Name as [Employee Name], lead.Name as [Lead Name]
FROM dbo.Employee as em
LEFT OUTER JOIN dbo.Employee as lead
ON em.LeadId = lead.EmployeeId

SELECT em.Name as [Employee Name], lead.Name as [Lead Name]
FROM dbo.Employee as em
LEFT OUTER JOIN dbo.Employee as lead
ON em.LeadId = lead.EmployeeId
WHERE lead.EmployeeId IS NOT NULL

-- exclude intersection
SELECT em.Name as [Employee Name], lead.Name as [Lead Name]
FROM dbo.Employee as em
LEFT OUTER JOIN dbo.Employee as lead
ON em.LeadId = lead.EmployeeId
WHERE lead.EmployeeId IS NULL

DROP TABLE IF EXISTS dbo.Employee

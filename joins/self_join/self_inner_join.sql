DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT NOT NULL IDENTITY PRIMARY KEY,
    Name  NVARCHAR(100) NOT NULL,
    LeadId INT NULL
)

INSERT INTO dbo.Employee (Name, LeadId)
VALUES ('Joe', NULL), ('John', 1), ('Sarah', 1)

-- subordinates
SELECT em.Name, lead.Name as [Lead Name] FROM dbo.Employee as em
INNER JOIN dbo.Employee as lead
ON em.LeadId = lead.EmployeeId

DROP TABLE IF EXISTS dbo.Employee

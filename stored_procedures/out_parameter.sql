DROP TABLE IF EXISTS [dbo].[Employee]

CREATE TABLE [dbo].[Employee] (
    [EmployeeId] INT NOT NULL IDENTITY PRIMARY KEY,
    [Name]  NVARCHAR(100) NOT NULL,
    [LeadId] INT NULL
)

INSERT INTO [dbo].[Employee] ([Name], [LeadId])
VALUES ('Joe', NULL), ('John', 1), ('Sarah', 1)

DROP PROC IF EXISTS [dbo].[spNumberOfEmployeesInSubordination]

GO
CREATE PROC [dbo].[spNumberOfEmployeesInSubordination]
    @LeadName NVARCHAR(100),
    @Amount INT OUT
AS
BEGIN
    SELECT @Amount = COUNT([em].[EmployeeId]) FROM [dbo].[Employee] as [em] INNER JOIN [dbo].[Employee] as [lead]
    ON [em].[LeadId] = [lead].[EmployeeId]
    WHERE [lead].[Name] LIKE '%' + @LeadName + '%'
END

GO
DECLARE @Amount INT
EXEC [dbo].[spNumberOfEmployeesInSubordination] @LeadName = 'Joe', @Amount = @Amount OUT
SELECt @Amount as [Number of Employees]

DROP PROC IF EXISTS [dbo].[spNumberOfEmployeesInSubordination]
DROP TABLE IF EXISTS [dbo].[Employee]

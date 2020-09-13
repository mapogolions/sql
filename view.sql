Drop Table If Exists [dbo].[Department]
Drop Table If Exists [dbo].[Employee]

Create Table [dbo].[Department] (
    DepartmentId int Identity Primary Key,
    DepartmentName nvarchar(50) Not Null,
)

Create Table [dbo].[Employee] (
    EmployeeId int Identity Primary Key,
    EmployeeName nvarchar(100) Not Null,
    EmployeeSalary decimal Not Null,
    DepartementId int Foreign Key References [dbo].[Department] ([DepartmentId])
)

Insert Into [dbo].[Department] ([DepartmentName])
Values ('IT'), ('HR'), ('Economy')

Insert Into [dbo].[Employee] ([EmployeeName], [DepartementId], [EmployeeSalary])
Values
    ('John', 1, 100.00),
    ('Jane', 3, 200.00),
    ('Bill', 2, 150.00)

Drop View If Exists vwEmployeeWithDepartmentInfo

Go
Create View vwEmployeeWithDepartmentInfo as
Select * From
    [dbo].[Employee] as em Inner Join [dbo].[Department] as dep
    On [em].[DepartementId] = [dep].[DepartmentId]
Go

Select [EmployeeName], [DepartmentName] From vwEmployeeWithDepartmentInfo

Drop Table [dbo].[Employee]
Drop Table [dbo].[Department]

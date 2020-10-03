Drop Table If Exists dbo.Customer

Create Table dbo.Customer (
    CustomerId int Identity Primary Key,
    Name nvarchar(100) Not Null,
    Status Bit -- can be nullable
)

Alter Table dbo.Customer
Add Constraint DF_Customer_Status
Default 1 For Status

Insert Into dbo.Customer (Name, Status) Values ('First', 0)
Insert Into dbo.Customer (Name) Values ('Second')
Insert Into dbo.Customer (Name, Status) Values ('Third', Null) -- ignore default value

Select * From dbo.Customer

Drop Table dbo.Customer

Drop Table If Exists dbo.Customer

Create Table dbo.Customer (
    CustomerId int Identity Primary Key,
    Name nvarchar(100) Not Null,
    -- nullable
    Status Bit -- Default 1
)

Alter Table dbo.Customer
Add Constraint DF_Customer_Status
Default 1 For Status

Insert Into dbo.Customer (Name, Status) Values ('First', 0)
Insert Into dbo.Customer (Name) Values ('Second') -- default value will be used

-- little bit quiz
Insert Into dbo.Customer (Name, Status) Values ('Third', Null) -- default value will be ignored, NULL
Insert Into dbo.Customer (Name, Status) Values ('Fourth', 5)
Insert Into dbo.Customer (Name, Status) Values ('Fifth', -1)

Select * From dbo.Customer

Drop Table dbo.Customer

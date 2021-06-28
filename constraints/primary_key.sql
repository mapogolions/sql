Drop Table If Exists [dbo].[User]

Create Table [dbo].[User] (
    UserId int Not Null, -- Primary Key
    Name nvarchar(50) Not Null
    -- CONSTRAINT PK_User_UserId PRIMARY KEY ([UserId])
    -- Primary Key (UserId)
)


Alter Table [dbo].[User]
Add Constraint PK_User_UserId
Primary Key ([UserId])


Insert Into [dbo].[User] Values (1, 'first')
Insert Into [dbo].[User] Values (2, 'second')

go
sp_helpindex 'dbo.User'
go

Select * From [dbo].[User]

Drop Table [dbo].[User]

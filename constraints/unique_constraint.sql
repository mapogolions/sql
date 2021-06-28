Drop Table If Exists [dbo].[User]

Create Table [dbo].[User] (
    UserId int Identity Primary Key,
    Email nvarchar(200) -- UNIQUE
    -- CONSTRAINT UQ_User_Email UNIQUE ([Email])
    -- Unique (Email)
)

Alter Table [dbo].[User]
Add Constraint UQ_User_Email
Unique ([Email])

Insert Into [dbo].[User] ([Email]) Values ('first@example.com')
Select * From [dbo].[User]

-- Violation of UNIQUE KEY constraint 'UQ_User_Email'. Cannot insert duplicate key in object 'dbo.User'
-- Insert Into [dbo].[User] ([Email]) Values ('first@example.com')

go
sp_helpindex 'dbo.User'
go

Drop Table [dbo].[User]

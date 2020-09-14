Drop Table If Exists [dbo].[Gender]

Create Table [dbo].[Gender] (
    [GenderId] int Identity Primary Key,
    [Name] nvarchar(10) Not Null Unique
)

Alter Table [dbo].[Gender]
Add Constraint CK_Gender_Name
Check ([Name] In ('male', 'female'))

-- Alter Table [dbo].[TableName]
-- Add Constraint CK_TableName_Email
-- Check ([Email] Like '%@%')

Insert Into [dbo].[Gender] ([Name])
Values ('male'), ('female')

Select * From [dbo].[Gender]

-- The INSERT statement conflicted with the CHECK constraint "CK_Gender_Name".
-- Insert Into [dbo].[Gender] ([Name]) Values ('other')

Drop Table [dbo].[Gender]
Drop Table If Exists dbo.Gender

Create Table dbo.Gender (
    GenderId int Identity Primary Key,
    Name nvarchar(10) Not Null Unique
    -- CONSTRAINT CK_Gender_Name CHECK (Name In ('male', 'female'))
    -- Check (Name in ('male', 'female'))
)

Alter Table dbo.Gender
Add Constraint CK_Gender_Name
Check (Name In ('male', 'female'))

-- Alter Table dbo.TableName
-- Add Constraint CK_TableName_Email
-- Check (Email Like '%@%')

Insert Into dbo.Gender (Name)
Values ('male'), ('female')

-- The INSERT statement conflicted with the CHECK constraint "CK_Gender_Name".
-- Insert Into dbo.Gender (Name) Values ('other')

Select * From dbo.Gender

Drop Table dbo.Gender

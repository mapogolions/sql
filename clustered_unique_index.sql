Drop Table If Exists [dbo].[User]

Create Table [dbo].[User] (
    -- primary key constraint creates Clustered Unique Index under the hood
    UserId int Primary Key,
    Name nvarchar(50) Not Null
)

Exec sp_helpindex 'User'

Drop Table [dbo].[User]


-- manual version
Drop Table If Exists [dbo].[User]

Create Table [dbo].[User] (
    UserId int,
    Name nvarchar(50) Not Null
)

Create Unique Clustered Index PK_User_UserId
On [dbo].[User] ([UserId])

Exec sp_helpindex 'User'

Drop Table [dbo].[User]

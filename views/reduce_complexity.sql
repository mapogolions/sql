DROP TABLE IF EXISTS [dbo].[Post]
DROP TABLE IF EXISTS [dbo].[PostMeta]

CREATE TABLE [dbo].[Post] (
    PostId INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME NOT NULL
)

CREATE TABLE [dbo].[PostMeta] (
    PostMetaId int IDENTITY PRIMARY KEY,
    MetaKey NVARCHAR(100) NOT NULL,
    MetaValue NVARCHAR(100) NOT NULL,
    PostId INT FOREIGN KEY REFERENCES [dbo].[Post] (PostId)
)

ALTER TABLE [dbo].[PostMeta]
ADD CONSTRAINT UQ_PostMeta_MetaKey_PostId
UNIQUE ([MetaKey], [PostId])

INSERT INTO [dbo].[Post] ([Title], [CreatedAt])
VALUES ('AOP', GETDATE()), ('TDD', GETDATE());

INSERT INTO [dbo].[PostMeta] ([MetaKey], [MetaValue], [PostId])
VALUES ('views', '20', 1), ('likes', '1000', 1), ('views', '100', 2)

DROP VIEW IF EXISTS [dbo].[vwPostMetaKeys]

GO
CREATE VIEW vwPostMetaKeys
AS
SELECT [post].[PostId], [Title], [MetaKey], [MetaValue] FROM [dbo].[Post] as [post]
INNER JOIN [dbo].[PostMeta] as [postmeta]
ON [post].[PostId] = [postmeta].[PostId]
GO

-- using views is much easier than using join (especially for non-it specialists)
SELECT * FROM vwPostMetaKeys WHERE Title LIKE 'aop'
SELECT * FROM vwPostMetaKeys WHERE Title LIKE 'tdd'

DROP TABLE IF EXISTS [dbo].[PostMeta]
DROP TABLE IF EXISTS [dbo].[Post]

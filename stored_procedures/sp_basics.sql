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
VALUES ('AOP', GETDATE()), ('TDD', GETDATE())

INSERT INTO [dbo].[PostMeta] ([MetaKey], [MetaValue], [PostId])
VALUES ('views', '20', 1), ('likes', '1000', 1), ('views', '100', 2)

DROP PROC IF EXISTS [dbo].[spGetMetaKeysByPostId]

GO
CREATE PROC [dbo].[spGetMetaKeysByPostId]
@PostId INT
AS
BEGIN
    SELECT [post].[PostId], [Title], [MetaKey], [MetaValue] FROM [dbo].[Post] as [post]
    INNER JOIN [dbo].[PostMeta] as [postmeta]
    ON [post].[PostId] = [postmeta].[PostId]
    WHERE [post].[PostId] = @PostId
END
GO

-- pass by position
[dbo].[spGetMetaKeysByPostId] 1
GO

-- pass by name
[dbo].[spGetMetaKeysByPostId] @PostId = 2

DROP TABLE IF EXISTS [dbo].[PostMeta]
DROP TABLE IF EXISTS [dbo].[Post]

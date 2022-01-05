IF OBJECT_ID('dbo.Posts', 'U') IS NOT NULL
DROP TABLE dbo.Posts
GO
CREATE TABLE dbo.Posts
(
    PostId INT NOT NULL IDENTITY(1, 1),
    Title NVARCHAR(100) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    CONSTRAINT PK_Posts_Post_Id PRIMARY KEY(PostId)
);
GO

IF OBJECT_ID('dbo.PostMetas', 'U') IS NOT NULL
DROP TABLE dbo.PostMetas
GO
CREATE TABLE dbo.PostMetas
(
    PostMetaId INT NOT NULL IDENTITY(1, 1),
    MetaKey NVARCHAR(256) NOT NULL,
    MetaValue NVARCHAR(256) NOT NULL,
    PostId INT NOT NULL,
    CONSTRAINT PK_PostMetas_PostMetaId PRIMARY KEY (PostMetaId),
    CONSTRAINT FK_PostMetas_Posts_PostId FOREIGN KEY (PostId) REFERENCES dbo.Posts (PostId)
);
GO

INSERT INTO dbo.Posts (Title, Content) VALUES ('Post1', '...')
INSERT INTO dbo.PostMetas (MetaKey, MetaValue, PostId) VALUES ('ke1', 'value1', 1)

ALTER TABLE dbo.PostMetas NOCHECK CONSTRAINT ALL
    DELETE FROM dbo.Posts WHERE 1=1
    DELETE FROM dbo.PostMetas WHERE 1=1
-- ALTER TABLE dob.PostMetas WITH CHECK CHECK CONSTRAINT ALL;

IF OBJECT_ID('dbo.PostMetas', 'U') IS NOT NULL
DROP TABLE dbo.PostMetas

IF OBJECT_ID('dbo.Posts', 'U') IS NOT NULL
DROP TABLE dbo.Posts

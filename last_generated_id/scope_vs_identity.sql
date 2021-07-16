DROP TABLE IF EXISTS dbo.Post
DROP TABLE IF EXISTS dbo.PostMeta

CREATE TABLE dbo.Post
(
    PostId INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL
)

CREATE TABLE dbo.PostMeta
(
    PostMetaId INT IDENTITY PRIMARY KEY,
    MetaKey NVARCHAR(256) NOT NULL,
    MetaValue NVARCHAR(256) NOT NULL,
    PostId INT FOREIGN KEY REFERENCES dbo.Post (PostId),
    CONSTRAINT UQ_PostMeta_MetaKey_PostId UNIQUE (MetaKey, PostId)
)

INSERT INTO dbo.Post (Title, Content) VALUES ('post_1', 'desc_1'), ('post_2', 'desc_2')

DROP TRIGGER IF EXISTS dbo.TrAddCreatedAtMetaKeyWhenPostInserted

GO
CREATE TRIGGER dbo.TrAddCreatedAtMetaKeyWhenPostInserted ON dbo.Post FOR INSERT
AS
BEGIN
    INSERT INTO dbo.PostMeta (MetaKey, MetaValue, PostId)
    VALUES ('created_at', CONVERT(NVARCHAR(256), GETDATE()), SCOPE_IDENTITY())
END
GO

INSERT INTO dbo.Post (Title, Content) VALUES ('post_3', 'desc_3')

SELECT SCOPE_IDENTITY() AS [Scope Identity function returns]
SELECT @@IDENTITY AS [Identity Variable returns]

DROP TRIGGER IF EXISTS dbo.TrAddCreatedAtMetaKeyWhenPostInserted
DROP TABLE IF EXISTS dbo.PostMeta
DROP TABLE IF EXISTS dbo.Post

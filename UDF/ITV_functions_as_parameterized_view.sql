DROP TABLE IF EXISTS dbo.Post
DROP TABLE IF EXISTS dbo.PostMeta

CREATE TABLE dbo.Post (
    PostId INT IDENTITY PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME NOT NULL
)

CREATE TABLE dbo.PostMeta (
    PostMetaId int IDENTITY PRIMARY KEY,
    MetaKey NVARCHAR(100) NOT NULL,
    MetaValue NVARCHAR(100) NOT NULL,
    PostId INT FOREIGN KEY REFERENCES dbo.Post (PostId)
)

ALTER TABLE dbo.PostMeta
ADD CONSTRAINT UQ_PostMeta_MetaKey_PostId
UNIQUE (MetaKey, PostId)

INSERT INTO dbo.Post (Title, CreatedAt)
VALUES ('AOP', GETDATE()), ('TDD', GETDATE())

INSERT INTO dbo.PostMeta (MetaKey, MetaValue, PostId)
VALUES ('views', '20', 1), ('likes', '1000', 1), ('views', '100', 2)

DROP VIEW IF EXISTS dbo.vwPostMetaKeys

GO
CREATE VIEW dbo.vwPostMetaKeys
    AS
    SELECT post.PostId, Title, MetaKey, MetaValue FROM dbo.Post as post
    INNER JOIN dbo.PostMeta as postmeta
    ON post.PostId = postmeta.PostId
GO

DROP FUNCTION IF EXISTS dbo.GetPostMetaKeysByTitle

GO
CREATE FUNCTION dbo.GetPostMetaKeysByTitle (@PostTitle NVARCHAR(100))
    RETURNS TABLE
AS
    RETURN (SELECT post.PostId, Title, MetaKey, MetaValue FROM dbo.Post as post
            INNER JOIN dbo.PostMeta as postmeta
            ON post.PostId = postmeta.PostId
            WHERE Title LIKE @PostTitle)
GO

SELECT * FROM dbo.vwPostMetaKeys WHERE Title LIKE 'aop'
SELECT * FROM dbo.GetPostMetaKeysByTitle('aop')

DROP VIEW IF EXISTS dbo.vwPostMetaKeys
DROP FUNCTION IF EXISTS dbo.GetPostMetaKeysByTitle
DROP TABLE IF EXISTS dbo.PostMeta
DROP TABLE IF EXISTS dbo.Post

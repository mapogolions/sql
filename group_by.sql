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
VALUES ('_field_1', '20', 1), ('_field_2', '1000', 1), ('_field_1', '100', 2)

SELECT post.PostId,  COUNT(post.PostId) as [Total MetaKeys Count]
FROM dbo.Post as post INNER JOIN dbo.PostMeta as meta
ON post.PostId = meta.PostId
GROUP BY post.PostId

DROP TABLE IF EXISTS dbo.PostMeta
DROP TABLE IF EXISTS dbo.Post

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
VALUES ('AOP', GETDATE()), ('TDD', GETDATE()), ('OOP', GETDATE())

INSERT INTO dbo.PostMeta (MetaKey, MetaValue, PostId)
VALUES ('meta_key1', '20', 1), ('meta_key2', '1000', 1), ('meta_key1', '100', 2)

SELECT post.PostId, post.Title, meta.MetaKey, meta.MetaValue
FROM dbo.Post as post RIGHT OUTER JOIN dbo.PostMeta as meta
ON post.PostId = meta.PostId

SELECT post.PostId, post.Title, meta.MetaKey, meta.MetaValue
FROM dbo.Post as post LEFT OUTER JOIN dbo.PostMeta as meta
ON post.PostId = meta.PostId

-- exclude intersection (only left part)
SELECT post.PostId, post.Title, meta.MetaKey, meta.MetaValue
FROM dbo.Post as post LEFT OUTER JOIN dbo.PostMeta as meta
ON post.PostId = meta.PostId
WHERE meta.PostMetaId IS NULL

DROP TABLE IF EXISTS dbo.PostMeta
DROP TABLE IF EXISTS dbo.Post

DROP TABLE IF EXISTS dbo.Post

CREATE TABLE dbo.Post (
    PostId INT IDENTITY(1, 1) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL
)

INSERT INTO dbo.Post
VALUES ('AOP'), ('TDD'), ('OOP')

SELECT * FROM dbo.Post
SELECT  IDENT_CURRENT('Post') AS [Last Generted Id]

-- DML
DELETE FROM dbo.Post

INSERT INTO dbo.Post
VALUES ('AOP'), ('TDD'), ('OOP')

SELECT * FROM dbo.Post
SELECT IDENT_CURRENT('Post') AS [Last Generated Id]

-- DDL (reset identity seed)
TRUNCATE TABLE dbo.Post
INSERT INTO dbo.Post
VALUES ('AOP'), ('TDD'), ('OOP')

SELECT * FROM dbo.Post
SELECT IDENT_CURRENT('Post')

DROP TABLE IF EXISTS dbo.Post

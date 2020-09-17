-- TODO: add example

DROP TABLE IF EXISTS [dbo].[Post]
DROP TABLE IF EXISTS [dbo].[PostMeta]

CREATE TABLE [dbo].[Post] (
    [PostId] INT IDENTITY PRIMARY KEY,
    [Title] NVARCHAR(100) NOT NULL,
    [Type] NVARCHAR(100) NOT NULL
)

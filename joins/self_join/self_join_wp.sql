DROP TABLE IF EXISTS [dbo].[UserMeta]
DROP TABLE IF EXISTS [dbo].[User]

CREATE TABLE [dbo].[User]
(
    UserId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL,
    Email NVARCHAR(254) NOT NULL
    CONSTRAINT UQ_User_Email UNIQUE ([Email])
)

CREATE TABLE [dbo].[UserMeta]
(
    UserMetaId INT IDENTITY PRIMARY KEY,
    UserId INT NOT NULL,
    MetaKey NVARCHAR(450) NOT NULL,
    MetaValue NVARCHAR(MAX) NOT NULL,
    CONSTRAINT Fk_UserMeta_User_UserId FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
)

INSERT INTO [dbo].[User]
    ([Name], [Email])
VALUES ('John Doe', 'john.doe@gmail.com')
    , ('Jane Doe', 'jane.doe@gmail.com')
    , ('Some One', 'some.one@gmail.com')

INSERT INTO [dbo].[UserMeta]
    ([UserId], [MetaKey], [MetaValue])
VALUES (1, 'email_notification_enabled', '1')
    , (2, 'email_notification_enabled', '0')
    , (3, 'email_notification_enabled', '1')
    , (1, 'role', 'subscriber')
    , (2, 'role', 'subscriber')
    , (3, 'role', 'author')

SELECT
    [users].[UserId],
    [Name],
    [Email],
    [UserRole],
    [EmailNotificationEnabled]
FROM [dbo].[User] AS users
INNER JOIN
(
    SELECT
        [umeta_1].[UserMetaId],
        [umeta_1].[UserId],
        [umeta_1].[MetaValue] AS [EmailNotificationEnabled],
        [umeta_2].[MetaValue] AS [UserRole]
    FROM [dbo].[UserMeta] AS [umeta_1]
    INNER JOIN [dbo].[UserMeta] AS [umeta_2]
    ON [umeta_1].[UserId] = [umeta_2].[UserId]
    WHERE [umeta_1].[MetaKey] = 'email_notification_enabled' AND [umeta_1].[MetaValue] = '1'
    AND [umeta_2].[MetaKey] = 'role' AND [umeta_2].[MetaValue] = 'subscriber'
) as [tmp]
ON [users].[UserId] = [tmp].[UserId]



DROP TABLE IF EXISTS [dbo].[UserMeta]
DROP TABLE IF EXISTS [dbo].[User]

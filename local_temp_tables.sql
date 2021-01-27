DROP TABLE IF EXISTS #Heros

CREATE TABLE #SessionTempTable
(
    HeroId INT IDENTITY(1, 1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
)

INSERT INTO #SessionTempTable (Name)
VALUES ('First')
    , ('Second')
    , ('Third')

SELECT * FROM #SessionTempTable

SELECT * FROM tempdb..sysobjects
WHERE name LIKE '#SessionTempTable%'



DROP PROC IF EXISTS dbo.spCreateScopedTempTable

GO
CREATE PROC dbo.spCreateScopedTempTable
AS
BEGIN
    CREATE TABLE #ScopedTempTable
    (
        HeroId INT IDENTITY(1, 1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL
    )

    INSERT INTO #ScopedTempTable (Name)
    VALUES ('Scoped First')
        , ('Scoped Second')
        , ('Scoped Third')

    SELECT * FROM #ScopedTempTable

    SELECT * FROM tempdb..sysobjects
    WHERE name LIKE '#ScopedTempTable%'
END
GO

DECLARE @ExitCode INT
EXEC @ExitCode = dbo.spCreateScopedTempTable
PRINT 'Exit code =' + CAST(@ExitCode as NVARCHAR(10))

SELECT * FROM tempdb..sysobjects
WHERE name LIKE '#ScopedTempTable%'

DROP PROC IF EXISTS dbo.spCreateScopedTempTable

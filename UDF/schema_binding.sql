DROP TABLE IF EXISTS dbo.City

CREATE TABLE dbo.City (
    CityId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Population DECIMAL(18, 3) NOT NULL
)

INSERT INTO dbo.City (Name, Population)
VALUES
    ('Tokyo', 13.9),
    ('New York', 8.399),
    ('London', 8.982),
    ('Mexico', 8.918)

DROP FUNCTION IF EXISTS dbo.GetPopulationByCityName

GO
CREATE FUNCTION dbo.GetPopulationByCityName (@CityName NVARCHAR(100))
    RETURNS DECIMAL(18, 3)
    WITH SCHEMABINDING
AS
BEGIN
    RETURN (SELECT Population FROM dbo.City WHERE Name LIKE '%' + @CityName + '%')
END
GO

SELECT dbo.GetPopulationByCityName('Tokyo')
-- Invalid drop because dependency exists
-- DROP TABLE IF EXISTS dbo.City

DROP FUNCTION IF EXISTS dbo.GetPopulationByCityName
DROP TABLE IF EXISTS dbo.City

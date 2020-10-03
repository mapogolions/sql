DROP TABLE IF EXISTS dbo.City

CREATE TABLE dbo.City (
    CityId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Population DECIMAL NOT NULL
)

INSERT INTO dbo.City (Name, Population)
VALUES
    ('Tokyo', 13.9),
    ('New Yourk', 8.399),
    ('London', 8.982),
    ('Mexico', 8.918)

EXEC sp_helpindex 'City'

CREATE INDEX IX_City_Population
ON dbo.City (Population ASC)

EXEC sp_helpindex 'City'

DROP TABLE IF EXISTS dbo.City

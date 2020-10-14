-- clustered index determines the physical order of data in a table
-- A table can have only one clustered index
DROP TABLE IF EXISTS dbo.City

CREATE TABLE dbo.City (
    CityId INT NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Population DECIMAL(18, 3) NOT NULL
)

ALTER TABLE dbo.City
ADD CONSTRAINT PK_City_CityId -- clustered unique index
PRIMARY KEY (CityId)


INSERT INTO dbo.City (CityId, Name, Population)
VALUES
    (1, 'Tokyo', 13.9),
    (2, 'New Yourk', 8.399),
    (3, 'London', 8.982),
    (4, 'Mexico', 8.918)

SELECT * FROM dbo.City
EXEC sp_helpindex 'City'

ALTER TABLE dbo.City
DROP CONSTRAINT PK_City_CityId

EXEC sp_helpindex 'City'


CREATE CLUSTERED INDEX IX_City_Population
ON dbo.City (Population ASC)

SELECT * FROM dbo.City -- physical order affected
EXEC sp_helpindex 'City'

DROP TABLE IF EXISTS dbo.City

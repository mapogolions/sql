USE master
GO
IF EXISTS (
  SELECT name
   FROM sys.databases
   WHERE name = N'TestDb'
)
DROP DATABASE TestDb
GO

CREATE DATABASE TestDb
GO
use TestDb

IF OBJECT_ID('dbo.City', 'U') IS NOT NULL
DROP TABLE dbo.City
GO

CREATE TABLE dbo.City
(
    CityId INT IDENTITY(1, 1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Population DECIMAL(18, 2) NOT NULL
)
GO

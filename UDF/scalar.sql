DROP TABLE IF EXISTS dbo.Employee

CREATE TABLE dbo.Employee (
    EmployeeId INT NOT NULL IDENTITY PRIMARY KEY,
    Name  NVARCHAR(100) NOT NULL,
    HireDate DATETIME
)

INSERT INTO dbo.Employee (Name, HireDate)
VALUES ('Joe', '11/01/2010')
    , ('Jane', '10/23/2019')
    , ('Sarah', '10/09/2019')
    , ('Bob', '10/08/2019')

DROP FUNCTION IF EXISTS dbo.HireInfo

GO
CREATE FUNCTION dbo.HireInfo (@HireDate DATETIME, @PointTime DATETIME)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @HireInfo NVARCHAR(100)
    IF (@HireDate >= @PointTime)
        SET @HireInfo = 'Will be hired in the future'
    ELSE
        BEGIN
            DECLARE @YearOffset INT
            SET @HireInfo = DATEDIFF(YEAR, @HireDate, @PointTime) -
                (CASE
                    WHEN (MONTH(@HireDate) >= MONTH(@PointTime)) AND
                         (DAY(@HireDate) >= DAY(@PointTime))
                    THEN 0 ELSE 1
                END)
        END
    RETURN @HireInfo
END
GO

DECLARE @PointTime DATETIME
SET @PointTime = '10/09/2020'

SELECT Name, dbo.HireInfo(HireDate, @PointTime) as [Hire Info] FROM dbo.Employee

DROP FUNCTION IF EXISTS dbo.HireInfo
DROP TABLE IF EXISTS dbo.Employee

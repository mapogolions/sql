DROP TABLE IF EXISTS dbo.Product
DROP TABLE IF EXISTS dbo.SoldTransaction


CREATE TABLE dbo.Product (
    ProductId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL
)

CREATE TABLE dbo.SoldTransaction (
    SoldTransactionId INT IDENTITY PRIMARY KEY,
    ProductId INT,
    Quantity INT NOT NULL,
    CONSTRAINT FK_SoldTransaction_ProductId FOREIGN KEY (ProductId)
        REFERENCES dbo.Product (ProductId),
    CONSTRAINT CK_SoldTransaction_Quantity CHECK (Quantity > 0)
)

INSERT INTO dbo.Product (Name, UnitPrice)
VALUES
    ('Books', 20),
    ('PC', 1000)

INSERT INTO dbo.SoldTransaction (ProductId, Quantity)
VALUES
    (1, 20),
    (1, 30),
    (2, 5),
    (1, 5),
    (2, 10)


DROP VIEW IF EXISTS dbo.vwSalesInfo

GO
CREATE VIEW dbo.vwSalesInfo
WITH SCHEMABINDING
AS
    SELECT
        p.Name,
        COUNT_BIG(*) as TotalTransactions,
        SUM(ISNULL(Quantity * UnitPrice, 0)) as TotalSales
    FROM dbo.Product as p INNER JOIN dbo.SoldTransaction as t
    ON p.ProductID = t.ProductId
    GROUP BY p.Name
GO

CREATE UNIQUE CLUSTERED INDEX UIX_vwSalesInfo_Name
ON dbo.vwSalesInfo (Name DESC)

EXEC sp_helpindex 'dbo.vwSalesInfo'

SELECT * FROM dbo.vwSalesInfo
INSERT INTO dbo.SoldTransaction (ProductId, Quantity) VALUES (2, 1) -- views are recalculated every time an INSERT / DELETE / UPDATE occurs
-- if you have a bunch of data, the best way is to drop view, to do bulk insert and then recreate index
SELECT * FROM dbo.vwSalesInfo

DROP VIEW IF EXISTS dbo.vwSalesInfo
DROP TABLE IF EXISTS dbo.SoldTransaction
DROP TABLE IF EXISTS dbo.Product

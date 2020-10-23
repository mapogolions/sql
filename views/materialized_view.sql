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

DROP TABLE IF EXISTS dbo.SoldTransaction
DROP TABLE IF EXISTS dbo.Product

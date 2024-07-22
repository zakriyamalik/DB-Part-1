create database dblab6
use dblab6;
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE Items(
[ItemNo] [int] NOT NULL,
[Name] [varchar](10) NULL,
[Price] [int] NULL,
[Quantity in Store] [int] NULL,
PRIMARY KEY CLUSTERED
(
[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (100, N'A', 1000, 100)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (200, N'B', 2000, 50)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (300, N'C', 3000, 60)
INSERT [dbo].[Items] ([ItemNo], [Name], [Price], [Quantity in Store]) VALUES (400, N'D', 6000, 400)
/****** Object:  Table [dbo].[Courses]    Script Date: 02/17/2017 13:04:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Customers](
[CustomerNo] [varchar](2) NOT NULL,
[Name] [varchar](30) NULL,
[City] [varchar](3) NULL,
[Phone] [varchar](11) NULL,
PRIMARY KEY CLUSTERED
(
[CustomerNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C1', N'AHMED ALI', N'LHR', N'111111')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C2', N'ALI', N'LHR', N'222222')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C3', N'AYESHA', N'LHR', N'333333')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C4', N'BILAL', N'KHI', N'444444')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C5', N'SADAF', N'KHI', N'555555')
INSERT [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone]) VALUES (N'C6', N'FARAH', N'ISL', NULL)
/****** Object:  Table [dbo].[Order]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Order](
[OrderNo] [int] NOT NULL,
[CustomerNo] [varchar](2) NULL,
[Date] [date] NULL,
[Total_Items_Ordered] [int] NULL,
PRIMARY KEY CLUSTERED
(
[OrderNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (1, N'C1', CAST(0x7F360B00 AS Date), 30)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (2, N'C3', CAST(0x2A3C0B00 AS Date), 5)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (3, N'C3', CAST(0x493C0B00 AS Date), 20)
INSERT [dbo].[Order] ([OrderNo], [CustomerNo], [Date], [Total_Items_Ordered]) VALUES (4, N'C4', CAST(0x4A3C0B00 AS Date), 15)
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02/17/2017 13:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
[OrderNo] [int] NOT NULL,
[ItemNo] [int] NOT NULL,
[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED
(
[OrderNo] ASC,
[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 200, 20)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (1, 400, 10)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (2, 200, 5)
INSERT [dbo].[OrderDetails] ([OrderNo], [ItemNo], [Quantity]) VALUES (3, 200, 60)

GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ItemNo])
REFERENCES [dbo].[Items] ([ItemNo])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderNo])
REFERENCES [dbo].[Order] ([OrderNo])
GO


CREATE VIEW OrderTotalPrice AS

SELECT [dbo].[OrderDetails].OrderNo, SUM([dbo].[Items].Price * [dbo].[OrderDetails].Total_Items_Ordered) AS TotalPrice

FROM [dbo].[OrderDetails]

JOIN [dbo].[Items] ON [dbo].[Order].OrderNo = [dbo].[Items] .ItemNo

GROUP BY [dbo].[Order].OrderNo;

select * from OrderTotalPrice

CREATE VIEW BestSellingItems AS

SELECT ItemID, SUM(Quantity) AS TotalSold

FROM Orders

GROUP BY ItemID

HAVING SUM(Quantity) > 20;



CREATE VIEW StarCustomers AS

SELECT CustomerID, SUM(TotalPrice) AS TotalPurchase

FROM OrderTotalPrice

GROUP BY CustomerID

HAVING SUM(TotalPrice) > 2000;


-- View without WITH CHECK option

CREATE VIEW CustomersWithPhoneNotNull AS

SELECT *

FROM Customers

WHERE [dbo].[Customers].Phone IS NOT NULL;


select * from CustomersWithPhoneNotNull






CREATE VIEW [Q1] AS
SELECT [dbo].[Order].OrderNo, SUM( Quantity*Price) AS [TOTAL PRICE] FROM ([dbo].[Order] JOIN [dbo].[OrderDetails] ON [dbo].[Order].OrderNo=OrderDetails.OrderNo) JOIN [dbo].[Items] ON [dbo].[OrderDetails].ItemNo=[dbo].[Items].ItemNo
GROUP BY [dbo].[Order].OrderNo
select * from Q1

CREATE VIEW [Q2] AS
SELECT [dbo].OrderDetails.ItemNo,SUM(Quantity) AS [Total_Quantity_Order] FROM [dbo].OrderDetails JOIN [dbo].Items ON [dbo].OrderDetails.ItemNo=[dbo].Items.ItemNo GROUP BY [dbo].OrderDetails.ItemNo HAVING SUM(Quantity)>20

select * from Q2

CREATE VIEW [Q3] AS
SELECT CustomerNo FROM ([dbo].[Order] JOIN [dbo].[OrderDetails] ON [dbo].[Order].OrderNo=OrderDetails.OrderNo) JOIN [dbo].[Items] ON [dbo].[OrderDetails].ItemNo=[dbo].[Items].ItemNo
GROUP BY [dbo].[Order].CustomerNo HAVING SUM( Quantity*Price)>2000

select * from Q3


CREATE VIEW [Q4] AS

SELECT * FROM Customers WHERE dbo.Customers.Phone IS NOT NULL;
select * from Q4


CREATE VIEW [Q5] AS
-- Create a view with WITH CHECK option to get customers who have not ordered Item C
SELECT [dbo].[Customers].CustomerNo, [dbo].[Customers].Name, [dbo].[Customers].Phone
FROM Customers
WHERE [dbo].[Customers].CustomerNo NOT IN (
    SELECT [dbo].[OrderDetails].ItemNo
    FROM [dbo].[OrderDetails]
    JOIN Items ON [dbo].[OrderDetails].ItemNo =[dbo].[Items].ItemNo
    WHERE [dbo].[Items].Name = 'Item C'
)
WITH CHECK OPTION;

INSERT INTO [dbo].[OrderDetails] ([dbo].[OrderDetails].OrderNo,  [dbo].[Customers].CustomerNo,  [dbo].[OrderDetails].ItemNo, Quantity, Date)
VALUES (5, 2, 2, 1, '2024-03-11'), (6, 2, 3, 1, '2024-03-11');


DELETE FROM [dbo].[Order]
WHERE [dbo].[Customers].CustomerNo = 2 AND  [dbo].[Items].ItemNo = 3;


INSERT INTO [dbo].[OrderDetails] ([dbo].[OrderDetails].OrderNo, [dbo].[Customers].CustomerNo,  [dbo].[OrderDetails].ItemNo, Quantity, Date)
VALUES (7, 2, 4, 1, '2024-03-11');


SELECT *
FROM CustomersWithoutItemC;


CREATE PROCEDURE CustomerSignup
    @CustomerNo VARCHAR(10),
    @Name VARCHAR(30),
    @City VARCHAR(30),
    @Phone VARCHAR(11),
    @Flag INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check Rule 1: Customer No should be unique
    IF EXISTS (SELECT 1 FROM [dbo].[Customers] WHERE [CustomerNo] = @CustomerNo)
    BEGIN
        SET @Flag = 1; -- Flag 1 indicates violation of Rule 1
        RETURN;
    END

    -- Check Rule 2: City cannot be null
    IF @City IS NULL
    BEGIN
        SET @Flag = 2; -- Flag 2 indicates violation of Rule 2
        RETURN;
    END

    -- Check Rule 3: Phone number should be of 6 numbers
    IF LEN(@Phone) != 6
    BEGIN
        SET @Flag = 3; -- Flag 3 indicates violation of Rule 3
        RETURN;
    END

    -- All rules satisfied, insert the customer
    INSERT INTO [dbo].[Customers] ([CustomerNo], [Name], [City], [Phone])
    VALUES (@CustomerNo, @Name, @City, @Phone);

    SET @Flag = 0; -- Flag 0 indicates successful insertion
END;
CREATE PROCEDURE CancelOrder
    @CustomerNo VARCHAR(10),
    @OrderNo INT,
    @Message NVARCHAR(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the order belongs to the customer
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Order] WHERE [OrderNo] = @OrderNo AND [CustomerNo] = @CustomerNo)
    BEGIN
        SET @Message = 'Order no ' + CAST(@OrderNo AS NVARCHAR(10)) + ' is not of ' + @CustomerNo + ' (' + (SELECT [Name] FROM [dbo].[Customers] WHERE [CustomerNo] = @CustomerNo) + ')';
        RETURN;
    END

    -- Delete order details
    DELETE FROM [dbo].[OrderDetails] WHERE [OrderNo] = @OrderNo;
    -- Delete order
    DELETE FROM [dbo].[Order] WHERE [OrderNo] = @OrderNo;

    SET @Message = 'Order cancelled successfully.';
END;
CREATE PROCEDURE GetTotalPoints
    @CustomerName VARCHAR(30),
    @TotalPoints INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @TotalPoints = (SUM([Total_Items_Ordered]) / 100) -- Assuming each Rs. 100 gives 1 point
    FROM [dbo].[Order]
    WHERE [CustomerNo] IN (SELECT [CustomerNo] FROM [dbo].[Customers] WHERE [Name] = @CustomerName);
END;
Select * 
From AdventureWorks2019.Sales.Customer

Select * 
From AdventureWorks2019.Sales.SalesOrderDetail

Select 
SalesOrderID,
OrderQty,
ProductID,
UnitPrice,
UnitPriceDiscount

From AdventureWorks2019.Sales.SalesOrderDetail

Select 
SalesOrderID
OrderQty,
UnitPrice As PricePerUnit,
UnitPriceDiscount

From AdventureWorks2019.Sales.SalesOrderDetail

Select 
SalesOrderID
OrderQty,
UnitPrice As PricePerUnit,
UnitPriceDiscount

From AdventureWorks2019.Sales.SalesOrderDetail
Where UnitPrice>2039.994


Select 
SalesOrderID,
Sum(OrderQty) as SumOfOrderQty,
--ProductID,
Sum(UnitPrice) as SumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by SalesOrderID


Select 
SalesOrderID,
ModifiedDate,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by SalesOrderID,ModifiedDate


Select 
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >= 3

Select 
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >= 3
order by sum(OrderQty) desc

Select 
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >= 3
order by sum(OrderQty) asc

Select Top(5)
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >=1 
order by sum(OrderQty) asc


Select Top(5) Percent
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >=1 
order by sum(OrderQty) asc

Select 
ProductID,
SUM(OrderQty) as sumOfOrderQty,
Sum(UnitPrice) as sumOfUnitPrice
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID = 43659
Group by ProductID
Having sum(OrderQty) >=1 
order by sum(OrderQty) asc
Offset 1 Rows Fetch Next 10 Rows Only

Select Distinct
SalesOrderID
From AdventureWorks2019.Sales.SalesOrderDetail
Order by SalesOrderID


--Exercise 1A
Select 
SalesOrderID,
sum(UnitPrice) as TotalProductCost
From AdventureWorks2019.Sales.SalesOrderDetail
Group by SalesOrderID
Having Sum(UnitPrice) > 2000

-- Exercise 1B
Select 
SalesOrderID,
ProductID,
UnitPrice,
LineTotal
From AdventureWorks2019.Sales.SalesOrderDetail
Where SalesOrderID=46086

-- Exercise 1C
Select Distinct
ProductID
From AdventureWorks2019.Sales.SalesOrderDetail
Order by ProductID asc


Select Distinct
Count(ProductID) As TotalNumberOfProducts
From AdventureWorks2019.Sales.SalesOrderDetail

Select 
Round(LineTotal,1) RndLineTotals
From AdventureWorks2019.Sales.SalesOrderDetail




Select *
From AdventureWorks2019.Sales.SalesOrderDetail


Select 
p.FirstName, 
p.LastName,

h.OrderDate,
h.DueDate,
h.ShipDate,
h.SalesOrderNumber,
h.PurchaseOrderNumber,
h.TaxAmt,
h.TotalDue,

d.OrderQty,
d.UnitPrice,
d.UnitPriceDiscount,
d.LineTotal,

s.DiscountPct,
s.[Type],
s.Category,

t.[Name],
t.CountryRegionCode,
t.[Group]


From Sales.SalesOrderHeader as h
	inner join Sales.SalesOrderDetail as d
	on h.SalesOrderID = d.SalesOrderID
	inner join Sales.SalesTerritory as t
	on h.TerritoryID = t.TerritoryID
	inner join Sales.SpecialOffer as s
	on d.SpecialOfferID = s.SpecialOfferID
	inner join Sales.Customer as c
	on h.CustomerID = c.CustomerID
	inner join Person.Person as p
	on c.PersonID = p.BusinessEntityID
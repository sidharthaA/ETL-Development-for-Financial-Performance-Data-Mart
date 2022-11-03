use `DW-2211-Team2_SalesOrders`;
-- Total cost of products for each supplier per product.
Select sum(F.Cost + F.Transportation_Cost) as Total_Cost, count(F.Product_SK) as Quantity_purchased, PD.Product_Description, SD.Supplier_Name 
from Financial_Analysis_Fact F 
Join Supplier_Dim SD Join Product_Dim PD 
where F.Supplier_SK = SD.Supplier_SK 
and F.Product_SK = PD.Product_SK 
Group By F.Supplier_SK, F.product_sk 
Order By Total_Cost desc;
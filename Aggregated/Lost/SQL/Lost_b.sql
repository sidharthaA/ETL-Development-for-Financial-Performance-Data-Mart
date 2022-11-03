use Financial_Analysis_Lost;
SELECT ft.Supplier_SK, sd.Supplier_Name, sd.Addr1, sd.Addr2, sd.City, sd.State, sd.Zip, 
sum(ft.Sales) as Total_Sales_Amount, sum(ft.Profit) as Total_Profit, sum(ft.Cost) as Total_Cost
FROM Financial_Analysis_Lost.Supplier_Dim sd
JOIN Financial_Analysis_Lost.Financial_Analysis_Fact ft ON sd.Supplier_SK = ft.Supplier_SK
GROUP BY ft.Supplier_SK 
ORDER BY Total_Profit DESC LIMIT 1;
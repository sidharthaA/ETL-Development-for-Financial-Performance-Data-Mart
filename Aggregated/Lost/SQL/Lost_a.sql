use Financial_Analysis_Lost;
SELECT ft.Customer_SK, cd.`Customer_ID(NK)`, cd.Customer_Name, cd.Addr1, cd.Addr2, cd.City, 
cd.State, cd.Zip, pd.Product_Type_Description, sum(ft.Sales) as Total_Sales_Amount, 
sum(ft.Profit) as Total_Profit, sum(ft.Quantity) as Total_Qty_Purchased 
FROM Financial_Analysis_Lost.Product_Dim pd
JOIN Financial_Analysis_Lost.Financial_Analysis_Fact ft ON pd.Product_SK = ft.Product_SK
JOIN Financial_Analysis_Lost.Customer_Dim cd ON cd.Customer_SK = ft.Customer_SK
WHERE pd.Product_Type_Description = 'Polishing Equipment' 
GROUP BY ft.Customer_SK;
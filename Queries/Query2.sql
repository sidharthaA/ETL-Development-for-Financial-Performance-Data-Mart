use `DW-2211-Team2_SalesOrders`;
-- Reports should be able to report sales, costs and gross profit (sales minus costs) per month per year.
Select sum(F.Sales) as Total_Sales, sum(F.Cost + F.Transportation_Cost) as Total_Costs, sum(F.Profit) as Total_Profits,
Sdt.Calendar_Month, Sdt.Calendar_Year 
from Financial_Analysis_Fact F 
Join Sales_Date_Dim SDt 
where F.Sales_Date_SK = SDt.Sales_Date_SK 
Group By Calendar_Year, Calendar_Month 
Order By Calendar_Year, Calendar_Month;
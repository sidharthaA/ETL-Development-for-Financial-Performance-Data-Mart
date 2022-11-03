use Financial_Analysis_Shrunken;
SELECT SUM(Profit) as Quarterly_Profit, sd.Calendar_Quarter, sd.Calendar_Year
FROM Financial_Analysis_Shrunken.Financial_Analysis_Fact ft
JOIN Sales_Date_Dim sd on ft.Sales_Date_SK = sd.Sales_Date_SK
WHERE sd.Calendar_Quarter is not null
GROUP BY sd.Calendar_Quarter, sd.Calendar_Year
ORDER BY sd.Calendar_Year, sd.Calendar_Quarter;
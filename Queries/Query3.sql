use `DW-2211-Team2_SalesOrders`;
-- The percentage of invoices that are COD
Select CNT_COD.c * 100 / Total_All.t as COD_Percentage FROM
(Select count(*) as c from (SELECT count(*) from Financial_Analysis_Fact F
JOIN Options_Junk OJ on F.Options_Junk_SK = OJ.Options_SK
WHERE Payment_Method = 'COD'
GROUP BY `Invoice_ID(DD)`) AS Only_COD ) AS CNT_COD 
CROSS JOIN
( Select count(*) as t from (SELECT count(*) from Financial_Analysis_Fact F
JOIN Options_Junk OJ on F.Options_Junk_SK = OJ.Options_SK
WHERE Options_SK is not null and
Payment_Method in ('COD', 'charge', 'cash') 
GROUP BY `Invoice_ID(DD)`) AS All_Payments_Methods ) AS Total_All;
update a
set LDTEXT=(STUFF((
--select * 
from 
 [dbo].[Client_workorder_All] a
left join [Lilly_Straging].[dbo].[Asset Analytix WorkOrder WorkLog table all] b on
a.wonum=b.[Work Order]


select * from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder WorkLog table all]


update a
set a.LDTEXT=b.LDTEXT from
 [dbo].[Client_workorder_All] a
  left join (
select [Work Order] , 
string_agg(CONCAT(cast(Date as datetime),'-',summary,'-',[Work Log Long Description (1K Charaters)]),'-')ldtext
from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder WorkLog table all]
--where [work order]='14124676'
group by [Work Order] )b
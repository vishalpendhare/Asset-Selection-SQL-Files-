select * into Assets_with_high_criticality_bot_no_pm_wo_PRD1
order by 1

select * from AX_Segment_Metric_Facts_all1 where siteId='PRD' and 
SegmentMasterID='2014'


insert into Segment_Objects_ALL1
select * ,'DAF' as Siteid 
from [dbo].[Segment_Objects_DAF1] --order by 2

select * from [dbo].[Segment_Objects_PRD1]
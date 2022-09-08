



--select [RM Cost(After)Yr1] Yr1,[RM Cost(After)Yr2] Yr2,[RM Cost(After)Yr3] Yr3,[RM Cost(After)Yr4] Yr4,[RM Cost(After)Yr5] Yr5,
--[Cumulative Savings Yr1] C_Yr1,[Cumulative Savings Yr2] C_Yr2,[Cumulative Savings Yr3] C_Yr3,[Cumulative Savings Yr4] C_Yr4,[Cumulative Savings Yr5] C_Yr5,
--[Total MC(After PMO)] P_YR1,[Total MC(After PMO)]P_YR2,[Total MC(After PMO)] P_YR3,[Total MC(After PMO)] P_YR4,[Total MC(After PMO)] P_YR5

--from (


select *,([Payback_Period 1]+[Payback_Period 2]+[Payback_Period 3]+[Payback_Period 4]+[Payback_Period 5]) [Payback (In Years)]
from 
(
select * , case when ([Exercise cost]<0 and [Cumulative Cash Flow Y1]>0) then (0+(-([Exercise cost]))/[Cumulative Total MC Yr1])
else 0 end [Payback_Period 1],case when ([Cumulative Cash Flow Y1]<0 and [Cumulative Cash Flow Y2]>0) then (1+(-([Cumulative Cash Flow Y1])/[Cumulative Total MC Yr2]))
else 0 end [Payback_Period 2],case when ([Cumulative Cash Flow Y2]<0 and [Cumulative Cash Flow Y3]>0) then (2+(-([Cumulative Cash Flow Y2])/[Cumulative Total MC Yr3]))
else 0 end [Payback_Period 3],case when ([Cumulative Cash Flow Y3]<0 and [Cumulative Cash Flow Y4]>0) then (3+(-([Cumulative Cash Flow Y3])/[Cumulative Total MC Yr4]))
else 0 end [Payback_Period 4],case when ([Cumulative Cash Flow Y4]<0 and [Cumulative Cash Flow Y5]>0) then (4+(-([Cumulative Cash Flow Y4])/[Cumulative Total MC Yr5]))
else 0 end [Payback_Period 5]
from 

(
select *,
[Exercise cost]+[Cumulative Total MC Yr1] [Cumulative Cash Flow Y1],
[Exercise cost]+[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2] [Cumulative Cash Flow Y2],
[Exercise cost]+[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3] [Cumulative Cash Flow Y3],
[Exercise cost]+[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3]+[Cumulative Total MC Yr4] [Cumulative Cash Flow Y4],
[Exercise cost]+[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3]+[Cumulative Total MC Yr4]+[Cumulative Total MC Yr5] [Cumulative Cash Flow Y5]
from 
(
select *,[Cumulative Total MC Yr1] [Cumulative Savings Yr1]
,[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2] [Cumulative Savings Yr2],
[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3] [Cumulative Savings Yr3],
[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3]+[Cumulative Total MC Yr4] [Cumulative Savings Yr4],
[Cumulative Total MC Yr1]+[Cumulative Total MC Yr2]+[Cumulative Total MC Yr3]+[Cumulative Total MC Yr4]+[Cumulative Total MC Yr5] [Cumulative Savings Yr5]

from
(
select *,round((PMRM-([Total MC(After PMO)]+[RM Cost(After)Yr1])+[Unscheduled DT Saving Yr1]+([Decreased SDT Hrs]*1200)),2) [Cumulative Total MC Yr1],
round((PMRM-([Total MC(After PMO)]+[RM Cost(After)Yr2])+[Unscheduled DT Saving Yr2]+([Decreased SDT Hrs]*1200)),2) [Cumulative Total MC Yr2],
round((PMRM-([Total MC(After PMO)]+[RM Cost(After)Yr3])+[Unscheduled DT Saving Yr3]+([Decreased SDT Hrs]*1200)),2) [Cumulative Total MC Yr3],
round((PMRM-([Total MC(After PMO)]+[RM Cost(After)Yr4])+[Unscheduled DT Saving Yr4]+([Decreased SDT Hrs]*1200)),2) [Cumulative Total MC Yr4],
round((PMRM-([Total MC(After PMO)]+[RM Cost(After)Yr5])+[Unscheduled DT Saving Yr5]+([Decreased SDT Hrs]*1200)),2) [Cumulative Total MC Yr5],
-20000 as [Exercise cost]

from 
( select segment,(c.pmlaborcost)PMlabor_cost,(c.pmsparecost)PMPart_cost,(c.pmlaborcost+c.pmsparecost) Total_PM_cost,

 (pmdowntime)PMDowntime,
 (NONPmlabcost)NonPMlabor_cost,(nonpmsparecost)NonPMPart_cost,(NONPmlabcost+nonpmsparecost)Total_NonPM_cost_
 ,(nonpmdowntime) NonPMDowntime

  ,(c.pmlaborcost/5) labor_PM_cost,(c.pmsparecost/5) part_PM_cost,((c.pmlaborcost+c.pmsparecost)/5) Total_PM_cost1,
  (pmdowntime/5) PMDowntime1,
  (c.NONPmlabcost/5) labor_NonPM_cost,(c.nonpmsparecost/5) part_NonPM_cost,((c.NONPmlabcost+c.nonpmsparecost)/5) Total_NonPM_cost
 ,(nonpmdowntime/5) NonPMDowntime1,
  (((c.pmlaborcost+c.pmsparecost)/5)+((c.NONPmlabcost+c.nonpmsparecost)/5))PMRM,

  ((c.NONPmlabcost+c.nonpmsparecost)/5)-(((c.NONPmlabcost+c.nonpmsparecost)/5)*0.01) [RM Cost(After)Yr1],
  ((c.NONPmlabcost+c.nonpmsparecost)/5)-(((c.NONPmlabcost+c.nonpmsparecost)/5)*0.07) [RM Cost(After)Yr2],
  ((c.NONPmlabcost+c.nonpmsparecost)/5)-(((c.NONPmlabcost+c.nonpmsparecost)/5)*0.13) [RM Cost(After)Yr3],
  ((c.NONPmlabcost+c.nonpmsparecost)/5)-(((c.NONPmlabcost+c.nonpmsparecost)/5)*0.17) [RM Cost(After)Yr4],
  ((c.NONPmlabcost+c.nonpmsparecost)/5)-(((c.NONPmlabcost+c.nonpmsparecost)/5)*0.2) [RM Cost(After)Yr5],
  round((c.pmsparecost/5)-((c.pmsparecost/5)*0.2),2) [PM spares(After)],
  round((c.pmlaborcost/5)-((c.pmlaborcost/5)*0.25),2) [PM Labor(After)]
  ,round((pmdowntime/5)-((pmdowntime/5)*0.15),2) [Sched DT Hrs After],

	round((nonpmdowntime/5)*0.01,2) [Reduction_in_Unscheduled_DT_Hrs_yr1],
	round((nonpmdowntime/5)*0.07,2) [Reduction_in_Unscheduled_DT_Hrs_yr2],
	round((nonpmdowntime/5)*0.13,2) [Reduction_in_Unscheduled_DT_Hrs_yr3],
	round((nonpmdowntime/5)*0.17,2) [Reduction_in_Unscheduled_DT_Hrs_yr4],
	round((nonpmdowntime/5)*0.2,2) [Reduction_in_Unscheduled_DT_Hrs_yr5],

	(round((c.pmsparecost/5)-((c.pmsparecost/5)*0.2),2)+round((c.pmlaborcost/5)-((c.pmlaborcost/5)*0.25),2)) [Total MC(After PMO)],

	((pmdowntime/5)-round((pmdowntime/5)-((pmdowntime/5)*0.15),2))	[Decreased SDT Hrs],
	round(((nonpmdowntime/5)*0.01*1683),2)	[Unscheduled DT Saving Yr1],
	round(((nonpmdowntime/5)*0.07*1683),2)	[Unscheduled DT Saving Yr2],
	round(((nonpmdowntime/5)*0.13*1683),2)	 [Unscheduled DT Saving Yr3],
	round(((nonpmdowntime/5)*0.17*1683),2) [Unscheduled DT Saving Yr4],
	round(((nonpmdowntime/5)*0.2*1683),2) [Unscheduled DT Saving Yr5],

	((pmdowntime/5)-round((pmdowntime/5)-((pmdowntime/5)*0.15),2))*1200 [Schedule DT savings]
 from 
 (
 select  concat(assetclass,'-',manufacturer,'-',makemodel)segment,


isnull(sum(case when DEV_WORKTYPE in ('PM') then ACTLABCOST  end),0) pmlaborcost,
isnull(sum(case when DEV_WORKTYPE in ('PM') then ACTMATCOST  end),0) pmsparecost,
isnull(sum(case when DEV_WORKTYPE in ('PM') then DOWNTIME end),0) pmdowntime,
isnull( sum(case when DEV_WORKTYPE in ('RM','CM') then ACTLABCOST end),0) NONPmlabcost,
isnull(sum(case when DEV_WORKTYPE in ('RM','CM') then ACTMATCOST end),0) nonpmsparecost,
isnull(sum(case when DEV_WORKTYPE in ('RM','CM') then DOWNTIME end),0) nonpmdowntime
from [dbo].[Asset_Master_PRD] a
left join  [dbo].[client_workorder_PRD] b
on a.assetnum= b.assetnum
where concat(assetclass,'-',manufacturer,'-',makemodel)='ANAL0001-M000000899-8453'
group by  concat(assetclass,'-',manufacturer,'-',makemodel)
)c
group by segment,c.pmlaborcost,c.pmsparecost,pmdowntime,NONPmlabcost,nonpmsparecost,(nonpmdowntime)
)
D
)E
)F
)G
)H
--)I





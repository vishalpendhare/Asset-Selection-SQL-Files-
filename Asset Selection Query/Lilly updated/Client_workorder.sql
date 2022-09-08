truncate table Client_workorder_2204insert into Client_workorder_2204SELECT  a.[Work Order] [WONUM]      ,[Parent WO] [PARENT]      ,[Status][STATUS]      ,null[STATUSDATE]      ,a.[Work Type][WORKTYPE]      ,[Work Order Description][DESCRIPTION]      ,[Asset][ASSETNUM]      ,[Location][LOCATION]      ,[Job Plan][JPNUM]      ,null [FAILDATE]      ,null [CHANGEDATE]      ,[Duration][ESTDUR]      ,sum(a.quantity*a.[regular hours]) [ESTLABHRS]      ,null [ESTMATCOST]      ,null [ESTLABCOST]      ,null [ESTTOOLCOST]      ,[PM][PMNUM]      ,a.[WO Actual Labor Hr Qty][ACTLABHRS]      ,a.[WO Actual Material Cost][ACTMATCOST]      ,(a.[WO Actual Labor Hr Qty]*90)[ACTLABCOST]      ,null[HASCHILDREN]      ,[Reported By Name][REPORTEDBY]      ,null [HISTORYFLAG]      ,[WO Priority][WOPRIORITY]      ,[Target Finish Date][TARGCOMPDATE]      ,[Target Start Date][TARGSTARTDATE]      ,a.[Reported Date][REPORTDATE]      ,null[DOWNTIME]      ,[Actual Start][ACTSTART]      ,a.[Actual Finish][ACTFINISH]      ,[Scheduled Start][SCHEDSTART]      ,[Scheduled Finish][SCHEDFINISH]      ,[Crew][CREWID]      ,null[FAILURECODE]      ,a.[Site][SITEID]      ,null[CLASSSTRUCTUREID]      ,null [F37]      ,'31-Mar-2022' [Year]      ,a.[WO Actual Material Cost] [SPARECOST]      ,(a.[WO Actual Labor Hr Qty] * 90)[LABORCOST]      ,null [IsReview]      ,k.Dev_worktype      ,null [CMDowntime]      ,null [PMDowntime]      ,null [RMDowntime]      ,null [NONPPMDowntime]      ,null [LDTEXT]	  ,null  FROM [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table with plan labor_All] a--  where status='close' and site='PRD' and [Actual Finish]>= '2020-04-01'and [Actual Finish] <='2022-03-31'  join(select a.Site,a.[Work Order] [Work Order],[Work Type],[Actual Finish], b.refwo,a.[Reported Date],min(startdate)startdate,DATEDIFF(hour,[Reported Date],min(startdate)) HrsWithin,case when [Work Type] in('PDM','PM','PMCAL','PMSN') then 'PM'	 when [Work Type] in('MA') then 'RM'	 when [Work Type] in('RPM','RPDM','MA','MI','SD') then 'CM'		 when DATEDIFF(hour,[Reported Date],min(startdate)) < 72 then 'RM'	 when DATEDIFF(hour,[Reported Date],min(startdate)) > 72 then 'CM' 	 else 'OTH'end Dev_worktypefrom [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table with plan labor_All]  aleft join [Lilly_PMO].dbo.Client_Labtrans_ALL bon a.[Work Order]=b.refwo and a.Site=b.SITEIDwhere --a.Site='DAF' and b.SITEID='DAF'--and a.[Reported Date] >='2021-03-31'and a.[Reported Date] <'2022-04-01' a.[Actual Finish] >='2020-04-01 00:00:00:000'and a.[Actual Finish] <='2022-03-31 23:59:59:999'--and  [Work Type] not in('PDM','PM','PMCAL','PMSN')and crew in ('INUT','INUP','INRN','INAFM1','INAFM3','INAFM4','INRMT1','INRMOD','INDC1','INRS','INAFM2','INDB')group by a.Site,a.[Work Order] , b.refwo,a.[Reported Date],[Work Type],[Actual Finish] )k on a.[Work Order]=k.[Work Order] and a.Site=k.Sitegroup by a.[Work Order],[Parent WO],[Status],a.[Work Type],[Work Order Description],[Asset]     ,[Location]      ,[Job Plan]      ,[Duration]      ,[PM]      ,a.[WO Actual Labor Hr Qty]      ,a.[WO Actual Material Cost]      ,(a.[WO Actual Labor Hr Qty]*90)      ,[Reported By Name]      ,[WO Priority]      ,[Target Finish Date]      ,[Target Start Date]      ,a.[Reported Date]      ,[Actual Start]      ,a.[Actual Finish]      ,[Scheduled Start]      ,[Scheduled Finish]      ,[Crew]      ,a.[Site]      ,a.[WO Actual Material Cost]       ,(a.[WO Actual Labor Hr Qty] * 90)      ,k.Dev_worktype
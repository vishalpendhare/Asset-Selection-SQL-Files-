select * into [dbo].[Assets_with_high_criticality_bot_no_pm_wo_ALL]from [Honda_Repository].dbo.Assets_with_high_criticality_bot_no_pm_wowhere 1=2select * from [dbo].[Asset_Master_Combine]select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo_ALL]truncate table [dbo].[Assets_with_high_criticality_bot_no_pm_wo_ALL]insert into  [dbo].[Assets_with_high_criticality_bot_no_pm_wo_ALL]--SELECT * INTO Assets_with_high_criticality_bot_no_pm_wo_PRD FROM(--SELECT TOP 5 * FROM [dbo].[Assets_with_high_criticality_bot_no_pm_wo_DAF]select distinct CMMS_Asset_ID,NONPM_count,case when pmactlabhrs>0 then 'YES' else 'NO' end 'NONPM(YES/NO)' ,aa.siteid,aa.dept,AssetClass,[MANUFACTURER],MakeModel,null ,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 end ECRRanking,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 ---when ECRRanking>160 and ECRRanking<=315 then '5'end 'priority',nonpmactlabhrs, '31-Mar-2022' year ,null ,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 end 'priority_description'--,sid from [AX_Asset_Metric_Facts_ALL] 
 aaleft join [dbo].[Asset_Master_Combine] a on aa.CMMS_Asset_ID=a.assetnum and aa.siteid=a.SiteId--)A--where --a.Effective_Currentflag='Y' and --a.StatusId='Active' --where rm_count>0 --drop table [dbo].[Assets_with_low_criticality_and_high_pm_hrs_ALL]select * from [Honda_Repository].[dbo].[AX_Asset_Master] a where a.Effective_Currentflag='Y' and a.StatusId='A-Active'select hnarisk from [Honda_Staging].[dbo].[Asset_jan_22]--update a--set a.ecrranking=b.hnarisk--from [Honda_Repository].[dbo].[AX_Asset_Master] a-- join [Honda_Staging].[dbo].[Asset_jan_22] b--on a.AssetNum=b.ASSETNUM--where a.Effective_Currentflag='Y'select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]update aset a.ECRRanking=b.HNARISK from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] a   join [dbo].[ASSET_DEC] bon a.assetnum=b.AssetNumwhere a.Effective_Currentflag='Y'  --and b.Effective_Currentflag='Y'update aset a.ECRRanking=b.hnarisk  from [AX_Assetmaster_Sep] a  left join Assetmaster_SEP bon a.assetnum=b.AssetNumwhere a.Effective_Currentflag='Y' --and b.Effective_Currentflag='Y'update aset a.ECRRanking=b.hnarisk from [Honda_Repository].dbo.AX_Asset_Master aleft join  [Honda_Repository].dbo.Assets_with_high_criticality_bot_no_pm_wo bon a.assetnum=b.assetnum   where a.Effective_Currentflag='Y'select * from [Honda_Repository].[dbo].[AX_Asset_Master] awhere a.Effective_Currentflag='Y' and ECRRanking > 0  is not nullselect * from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] awhere a.Effective_Currentflag='Y' and ECRRanking is  nullupdate aset a.ECRRanking=b.ECRRanking from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] aleft join  [Honda_Repository].[dbo].[AX_Asset_Master] bon a.assetnum=b.assetnumwhere a.Effective_Currentflag='Y' and b.Effective_Currentflag='Y'--update a--set a.assetclass=b.assetclass--from [Assetmaster_Aug] a--left join--[AX_Assetmaster_Aug] b--on a.assetnum=b.assetnum---------------------------------------------------------------------------------------------------------------------------LowCriticality-----------------------select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs_PRD]select * from [dbo].[Asset_Master_Combine]select * from [Assets_with_low_criticality_and_high_pm_hrs_ALL]from  [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs]where 1=2truncate table  [Assets_with_low_criticality_and_high_pm_hrs_ALL]insert into [Assets_with_low_criticality_and_high_pm_hrs_ALL]--SELECT * INTO [Assets_with_low_criticality_and_high_pm_hrs_PRD] FROM(select distinct CMMS_Asset_ID,PMcount,case when nonpmactlabhrs>0 then 'YES' else 'NO' end 'PM(YES/NO)' ,aa.siteid,aa.dept,AssetClass,[MANUFACTURER],MakeModel,null b,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 end ECRRanking,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 end 'priority',pmactlabhrs, '31-Mar-2022' year ,null a,case when ECRRanking=1 then 1when ECRRanking=2 then 2when ECRRanking=3 then 3when ECRRanking =0 or ECRRanking is null then 4 end 'priority_description'from [dbo].[AX_Asset_Metric_Facts_ALL] aaleft join [dbo].[Asset_Master_Combine] a on aa.CMMS_Asset_ID=a.assetnum and aa.siteid=a.SiteId)A--where --a.Effective_Currentflag='Y' and --StatusId='Active'--where pm_count>0 --and a.year='31-Mar-2021' and aa.year='31-Mar-2021' SELECT * INTO [Assets_with_low_criticality_and_high_pm_hrs_ALL] FROM [dbo].[Assets_with_low_criticality_and_high_pm_hrs_DAF]insert INTO [Assets_with_low_criticality_and_high_pm_hrs_ALL] SELECT * --INTO [Assets_with_low_criticality_and_high_pm_hrs_ALL] FROM [dbo].[Assets_with_low_criticality_and_high_pm_hrs_PRD]-------------SELECT * INTO [dbo].[Assets_with_high_criticality_bot_no_pm_wo] FROM [dbo].[Assets_with_high_criticality_bot_no_pm_wo_PRD]insert INTO [dbo].[Assets_with_high_criticality_bot_no_pm_wo_ALL]--[Assets_with_low_criticality_and_high_pm_hrs_ALL] SELECT * --INTO [Assets_with_low_criticality_and_high_pm_hrs_ALL] FROM [dbo].[Assets_with_high_criticality_bot_no_pm_wo_daf]SELECT * FROM [Assets_with_high_criticality_bot_no_pm_wo_ALL]SELECT * FROM [Assets_with_low_criticality_and_high_pm_hrs_ALL]SELECT * FROM [Asset_Master_ALL] ORDER BY 1DELETE  [dbo].[Asset_Master_ALL]WHERE SITEID='prd'INSERT INTO [Asset_Master_ALL]SELECT * FROM [dbo].[Asset_Master_PRD]DELETE   [dbo].[AX_Segment_Metric_Facts_All]WHERE SITEID='prd'INSERT INTO [AX_Segment_Metric_Facts_All]SELECT * FROM [dbo].[AX_Segment_Metric_Facts_PRD]DELETE [dbo].[AX_Asset_Saving_All]  WHERE SITEID='prd'--INSERT INTO [AX_Segment_Metric_Facts_All]SELECT *,'DAF' AS SITEID INTO  [dbo].[AX_Asset_Saving_All] FROM [dbo].[AX_Asset_Saving_DAF]INSERT INTO [AX_Asset_Saving_All]SELECT *,'PRD' AS SITEID --INTO  [dbo].[AX_Asset_Saving_All] FROM [dbo].[AX_Asset_Saving_PRD]SELECT * FROM [Segment_Objects_ALL]DROP TABLE [Segment_Objects_ALL]SELECT *, 'PRD' AS SITEID INTO [Segment_Objects_ALL] FROM [dbo].[Segment_Objects_prd]INSERT INTO [Segment_Objects_ALL]SELECT *, 'DAF' AS SITEID --INTO [Segment_Objects_ALL] FROM [dbo].[Segment_Objects_DAF]
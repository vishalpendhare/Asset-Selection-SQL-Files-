Select count(*) from [ELP_Repository].dbo.PMO_3410012 order by 1
Select count(*) from [Honda_ELP_Staging].[dbo].[ASSETMASTER$]
Select count(*) from [Honda_ELP_Staging].[dbo].[AX_Asset_master_Aug22]

Select * into   
[Honda_ELP_Staging].dbo.[AX_Asset_master_Aug22] from 
[HONDA_HCM_Staging].[dbo].[AX_Assetmaster_Aug22] where 1=2


--insert into [Honda_ELP_Staging].dbo.[AX_Asset_master_Aug22]
SELECT 		row_number() over(order by [ASSETNUM]) Id,      0 as  [IsDeleted]	  ,0 as [CreatedBy]	  ,getdate() [CreatedOn]	  , getdate() [ModifiedOn]	  , 0 as [ModifiedBy]      ,a.[DESCRIPTION] as [Name]      ,a.[Description]      ,MANUFACTURER as [Manufacturer]      ,null as [Serial]      ,[LOCATION] as [Location]      ,null [Notes]      ,hnarisk [ECRRanking]      ,[PLUSCMODELNUM] as [MakeModel]      ,[SITEID] as [SiteId]      ,[ORGID] as [OrgId]      ,[ASSETNUM] as [AssetNum]      ,[VENDOR] as Vendor      ,[FAILURECODE] as FailureCode      ,[PURCHASEPRICE] as PurchasePrice      ,[INSTALLDATE] as [InstalledDate]      ,[WARRANTYEXPDATE] as [WarrantyExpDate]      ,[TOTALCOST] as [TotalCost]      ,[BUDGETCOST] as [BudgetCost]      ,[ISRUNNING] as [IsRunning]      ,[ASSETTYPE] as [AssetType]      , [STATUS] as [StatusId]      ,[ASSETID] as [AssetId]      ,[SERIALNUM] as [SerialNum]      ,[ASSETTAG] as [AssetTag]      ,null [CId]      ,null [SId]      ,null [Quantity]      , b.id as [DepartmentId]      ,null [IsPmOptimization]      ,null [OldECRRanking]      ,null [Ref_Asset_Number]      ,null [Ref_Parent_Number]      ,null [Ref_Parent_Asset_Number]      ,null [Ref_Id]      ,[AssetClass] as [AssetClass]      ,[CLASSSTRUCTUREID] as [CLASSSTRUCTUREID]      ,[MANUFACTURERNAME] as [MANUFACTURERID]	,[LOCDESCRIPTION] as [LOCDESCRIPTION]	  ,'2022-07-01 00:00:00.000' as [Effective_Startdate]	  ,'9999-12-31 23:59:59.000' as [Effective_Enddate]	  ,'Y' as [Effective_Currentflag]	  ,'BI Team' as [Updated_BY]	  ,getdate() as [Updated_On]	  ,'BI Team' as [Inserted_By]	  ,getdate() as [Inserted_On] from [Honda_ELP_Staging].[dbo].[ASSETMASTER$] aleft join [Honda_ELP_Staging].dbo.GLBL_1010009_Department  bon case when a.location like 'FA%' then substring(a.location,1,2)else substring(a.location,1,3) end=b.DepartmentName where a.siteid='ELP' and b.CompanyId=4
)a

 Select * from [Honda_ELP_Staging].[dbo].[ASSETMASTER$] a
 left join [Honda_ELP_Staging].dbo.GLBL_1010009_Department b 
 on case when a.location like 'FA%' then substring(a.location,1,2)else substring(a.location,1,3) end=b.DepartmentName 
where a.siteid='ELP' and b.CompanyId=4

Select * from [Honda_ELP_Staging].dbo.GLBL_1010009_Department 

--drop table [dbo].[AX_Assetmaster_Aug22]
Select substring(location,1,2), substring(location,1,3) from [dbo].[ASSETMASTER$]

Select * from [dbo].[AX_Asset_master_Aug22]

Select * from [Honda_ELP_Staging].dbo.[AX_Asset_master_Aug22]

truncate table AX_Assetmaster_Aug22

Select * from [HCM_Repository].[dbo].[GLBL_1010009_Department]
from [Honda_Repository].dbo.AX_Asset_Master

Select * from [Honda_Repository].[dbo].[GLBL_1010009_Department]

Select * 

drop table [HONDA_HCM_Staging].dbo.[AX_Assetmaster_Aug22]

Select * into [HONDA_HCM_Staging].dbo.[AX_Assetmaster_Aug22] from [Honda_Repository].dbo.AX_Asset_master where 1=2
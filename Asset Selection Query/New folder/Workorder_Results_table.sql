SELECT Site,case when [Work Type] in('PDM','PM','PMCAL','PMSN') THEN 'PM' 		   when  [Work Type] in('CAL','RPDM','RPM') THEN 'CM'	       when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority] in(1,0) THEN 'CM' 		   when  [Work Type] in('MA') THEN 'RM'	       when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority] IN (2,3) THEN 'RM' 		 else 'OTH' END [DEV_WORKTYPE]--,[Target Start Date]*/		 ,Status,		 COUNT(*) AS WOCOUNT 		 FROM [dbo].[Asset Analytix WorkOrder table_all]--[Asset Analytix WorkOrder table all]WHERE STATUS NOT IN ('CAN','COMPDLY','COMPLFT','COMPSUP','COMPINV','CLOSE')AND [Work Type]  not in('PDM','PM','PMCAL','PMSN') --AND [Target Start Date]<='2022-03-31 00:00:00.000'GROUP BY SITE,case when [Work Type] in('PDM','PM','PMCAL','PMSN') THEN 'PM' 		   when  [Work Type] in('CAL','RPDM','RPM') THEN 'CM'	       when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority] in(1,0) THEN 'CM' 		   when  [Work Type] in('MA') THEN 'RM'	       when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority] IN (2,3) THEN 'RM' 		 else 'OTH' END,STATUSSELECT * FROM [dbo].[dboAsset Analytix Work Order Types] WHERE [Work Type (CM, RM, PM, Other)]='PM'--------------------------------------------------------------------------------------SELECT   --crew -- ----Site,	--COUNT(*) AS WOCOUNT 		* FROM [dbo].[Asset Analytix WorkOrder table_all]  --[Asset Analytix WorkOrder table all]WHERE STATUS not IN ('COMP','CLOSE','CAN')AND [Work Type]   in('PDM','PM','PMCAL','PMSN') and crew  in('INPN','INDB','INUP','INUT','INUTL','INDC1','INRN','INRMT1','INAFM1','INAFM4','INAFM3','INRMOD','INRS','INAFM2')AND [PM Target Start]<'2022-04-01'-- 23:59:59.999'\--or  [PM Target Start] is null)--and [Work Order] in('20432700')   --'20295074','20475193','20620676')and site='DAF' --GROUP BY Siteorder by 2 desc --[PM Target Start]  SELECT   --crew -- ----Site,	--COUNT(*) AS WOCOUNT 		* FROM [dbo].[Asset Analytix WorkOrder table_all]  --[Asset Analytix WorkOrder table all]WHERE STATUS not IN ('CAN','COMP','CLOSE')--AND--([Work Type]  in('CAL','RPDM','RPM') AND [Work Type] not  in('PDM','PM','PMCAL','PMSN') --or  [Work Type] not in('CM','ENV','MI','SA')AND [WO Priority] in(1,0))and crew  in('INPN','INDB','INUP','INUT','INUTL','INDC1','INRN','INRMT1','INAFM1','INAFM4','INAFM3','INRMOD','INRS','INAFM2')AND [Reported date]>'2019-12-31'-- 23:59:59.999'--and site='DAF' --GROUP BY siteorder by 2select * FROM [dbo].[Asset Analytix WorkOrder table_all] where [Work Order] in('20295074','20475193','20620676')
INUT
INUP
INRN
INAFM1
INAFM3
INAFM4
INRMT1
INRMOD
INDC1
INRS
INAFM2
INDB


--------------------
SELECT   --crew -- --Site,	--,COUNT(*) AS WOCOUNT 		* FROM [dbo].[Asset Analytix WorkOrder table_all]  --[Asset Analytix WorkOrder table all]WHERE STATUS not IN ('COMPDLY','COMPCFT','COMPSUP','COMPINV','CLOSE','CAN','COMP')AND [Work Type]   in('PDM','PM','PMCAL','PMSN') --and crew  in('INRN','INUT','INAFM4','INAFM1','INDC1','INRMT1','INDB','INUP','INPN')and crew  in('INPN','INDB','INUP','INUT','INUTL','INDC1','INRN','INRMT1','INAFM1','INAFM4','INAFM3','INRMOD','INRS','INAFM2')AND ([PM Target Start]<'2022-04-01'or [PM Target Start] is null)-- 23:59:59.999'and site='DAF' and [Work Order] in ('20295074','20475193','20620676')
GROUP BY creworder by 2 desc --[PM Target Start]  SELECT   --crew -- --Site,	--,COUNT(*) AS WOCOUNT 		* FROM [dbo].[Asset Analytix WorkOrder table_all]  --[Asset Analytix WorkOrder table all]WHERE STATUS not IN ('COMPDLY','COMPCFT','COMPSUP','COMPINV','CLOSE','CAN','COMP')--AND--([Work Type]  in('CAL','RPDM','RPM') AND [Work Type] not  in('PDM','PM','PMCAL','PMSN') --or  [Work Type] not in('CM','ENV','MI','SA')AND [WO Priority] in(1,0))--and crew  in('INRN','INUT','INAFM4','INAFM1','INDC1','INRMT1','INDB','INUP','INPN')and crew  in('INPN','INDB','INUP','INUT','INUTL','INDC1','INRN','INRMT1','INAFM1','INAFM4','INAFM3','INRMOD','INRS','INAFM2')AND [Reported date]>'2019-12-31'-- 23:59:59.999'and site='DAF' --GROUP BY creworder by [Reported date]
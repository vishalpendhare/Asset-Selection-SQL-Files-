/****** Script for SelectTopNRows command from SSMS  ******/
SELECT w.*
  FROM [360Navigator_Honda_Live_04_05].[dbo].[WO_log_30_06] w
  where exists (
  Select 1 from Client_Labtrans wl where wl.memo != ''
  
  and wl.refwo =w.WONUM
  and wl.siteid = 'HCM'
  )
  and w.wonum ='M10183268'
  order by CHANGEDATE



  Select * from [WO_log_30_06] where wonum ='M10183268'

  Select * from Client_Workorder where wonum ='M10183268'




















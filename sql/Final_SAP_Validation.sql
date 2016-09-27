
CREATE view [wcprod].[V_CH_SAP_Validation_View] AS SELECT LCSSeasonProductLink2.idA2A2 as 'UID', 
LCSSeasonProductLink2.skuSeasonRevId as 'skuSeasonRevId', wcprod.LCSSeason.att1 as 'Season_Name' , 
wcprod.LCSSeason.branchIditerationInfo as 'SeasonId', wcprod.LCSSeason.idA3masterReference as 'SeasonMasterRef',
wcprod.prodarev.att1 as 'Product_Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId',
wcprod.LCSSKU.att1 as 'Stock_Name', wcprod.LCSSKU.att13 as 'Stock_No' , 
wcprod.LCSSKU.branchIditerationInfo as 'SKUId', wcprod.LCSSKU.idA3masterReference as 'SKUMasterRef',
wcprod.LCSSeasonProductLink.att18 as 'SKU_Season_Status', LCSSeasonProductLink2.createStampA2 as 'Transaction_Date' ,
LCSSeasonProductLink2.effectInDate as 'EffectInDate', LCSSeasonProductLink2.effectOutDate as 'EffectOutDate',
LCSSeasonProductLink2.effectLatest as 'EffectLatestFlag', LCSSeasonProductLink2.effectSequence as 'EffectSequence',
LCSSeasonProductLink2.att16 as 'SAP_Costing_Valid', LCSSeasonProductLink2.att22 as 'SAP_Costing_Valididation_Message',
LCSSeasonProductLink2.att23 as 'SAP_Custom_Valid', LCSSeasonProductLink2.att24 as 'SAP_Custom_Valididation_Message',
LCSSeasonProductLink2.att25 as 'SAP_Stock_Valid', LCSSeasonProductLink2.att26 as 'SAP_Stock_Valididation_Message',  
LCSSeasonProductLink2.date5 as 'Date_first_sent_to_SAP', LCSSeasonProductLink2.date6 as 'Date_last_sent_to_SAP',
LCSSeasonProductLink2.att40 as 'SAP_Status', LCSSeasonProductLink2.att27 as 'Ready_for_SAP', 
LCSSeasonProductLink2.att33 as 'SAP_Push_Value', LCSSeasonProductLink2.att12 as 'SAP_Validation_Comments' 
from wcprod.prodarev, wcprod.LCSSeasonProductLink, wcprod.LCSSeason , wcprod.LCSSKU, 
 wcprod.LCSSeasonProductLink LCSSeasonProductLink2 
where 
wcprod.LCSSeasonProductLink.productMasterId = wcprod.prodarev.idA3masterReference and
wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and
wcprod.LCSSeasonProductLink.seasonLinkType = 'PRODUCT' and
wcprod.LCSSeason.latestiterationInfo = '1' AND 
wcprod.prodarev.latestiterationInfo = '1' AND 
wcprod.LCSSeasonProductLink.effectOutDate is null AND 
LCSSeasonProductLink2.seasonLinkType = 'SKU' AND
LCSSeasonProductLink2.seasonRemoved = 0 AND 
wcprod.LCSSKU.latestiterationInfo = 1 AND
wcprod.LCSSeason.branchIditerationInfo = LCSSeasonProductLink2.seasonRevId AND
LCSSeasonProductLink2.skuARevId = wcprod.LCSSKU.branchIditerationInfo AND
wcprod.LCSSKU.placeholder = 0 AND 
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference;


CREATE view [wcprod].[V_CH_SAP_Validation_Flag_Itr] AS SELECT a.* FROM (SELECT [UID], [skuSeasonRevId], [Season_Name]
      ,[SeasonId]
      ,[SeasonMasterRef]
      ,[Product_Name]
      ,[ProductId]
      ,[Stock_Name]
      ,[Stock_No]
      ,[SKUId]
      ,[SKUMasterRef]
      ,[SKU_Season_Status]
      ,[Transaction_Date]
      ,[EffectInDate]
      ,[EffectOutDate]
      ,[EffectLatestFlag]
      ,[EffectSequence]
      ,[SAP_Costing_Valid]
      ,[SAP_Costing_Valididation_Message]
      ,[SAP_Custom_Valid]
      ,[SAP_Custom_Valididation_Message]
      ,[SAP_Stock_Valid]
      ,[SAP_Stock_Valididation_Message]
      ,[Date_first_sent_to_SAP]
      ,[Date_last_sent_to_SAP]
      ,[SAP_Status]
      ,[Ready_for_SAP]
      ,[SAP_Push_Value]
      ,[SAP_Validation_Comments]
	  ,Rank() OVER (PARTITION BY [Stock No] ORDER BY [EffectSequence] DESC) AS Rank
  FROM [wcprod].[V_CH_SAP_Validation_View] ) a where Rank < 3
  
  SELECT A.*, B.SAP_Sourcing_Valid, B.SAP_Sourcing_Validation_Message from 
  V_CH_SAP_Validation_Flag_Itr A 
  LEFT  JOIN V_CH_SAP_Source_Validation B ON A.SeasonId = B.SeasonId 
  AND V_CH_SAP_Source_Validation B1 ON A.SKUId = B1.SKUId 
  
  SELECT A.* FROM wcprod.V_CH_SAP_Validation_Flag_Itr A INNER JOIN wcprod.V_CH_SAP_Validation_Flag_Itr B ON A.skuSeasonRevId = B.skuSeasonRevId
AND (A.SAP_Costing_Valid != B.SAP_Costing_Valid OR A.SAP_Custom_Valid != B.SAP_Custom_Valid OR A.SAP_Stock_Valid != B.SAP_Stock_Valid);



CREATE view [wcprod].[V_CH_SAP_Source_Validation] AS select distinct wcprod.LCSSKUSourcingLink.idA2A2 as 'SKUSourceId', 
wcprod.LCSSeason.branchIditerationInfo as 'seasonId', wcprod.LCSSKU.branchIditerationInfo as 'skuId',
 wcprod.LCSSeason.idA3masterReference as 'seasonMasterId' , wcprod.LCSSKU.idA3masterReference as 'SKUMasterId', 
 wcprod.LCSSKUSourcingLink.att4 as 'SAP_Sourcing_Valid', wcprod.LCSSKUSourcingLink.att5 as 'SAP_Sourcing_Validation_Message' 
from wcprod.LCSSourcingConfig, wcprod.LCSSourcingConfigMaster,
 wcprod.LCSSourceToSeasonLink, wcprod.LCSSourceToSeasonLinkMaster, wcprod.LCSSKUSourcingLink,
 wcprod.LCSSKU, wcprod.LCSSeason
  where 
wcprod.LCSSourcingConfig.idA3masterReference = wcprod.LCSSourcingConfigMaster.idA2A2 
and wcprod.LCSSourcingConfigMaster.idA2A2 = wcprod.LCSSourceToSeasonLinkMaster.idA3A6
--and wcprod.LCSSourceToSeasonLinkMaster.idA3A6 = wcprod.LCSSourceToSeasonLinkMaster.idA3A6
and wcprod.LCSSourceToSeasonLinkMaster.idA2A2 = wcprod.LCSSourceToSeasonLink.idA3masterReference
and wcprod.LCSSourcingConfigMaster.idA2A2 = wcprod.LCSSKUSourcingLink.idA3B5
and wcprod.LCSSourcingConfig.latestiterationInfo = 1
and wcprod.LCSSourceToSeasonLink.latestiterationInfo = 1
and wcprod.LCSSKUSourcingLink.idA3A7 = LCSSeason.idA3masterReference
and wcprod.LCSSKU.idA3masterReference = LCSSKUSourcingLink.idA3A5
and wcprod.LCSSKU.latestiterationInfo =1
and wcprod.LCSSeason.idA3masterReference = LCSSourceToSeasonLinkMaster.idA3B6
and wcprod.LCSSeason.latestiterationInfo = 1
and wcprod.LCSSKU.placeholder = 0
and wcprod.LCSSourceToSeasonLinkMaster.primarySTSL = 0




CREATE view [wcprod].[V_SKU_SEASON_DETAILS] AS  select distinct wcprod.LCSSeason.att1 as 'SEASON_NAME', wcprod.LCSSeason.branchIditerationInfo as 'SEASON_ID',  wcprod.LCSSKU.att1 as 'SKU_NAME', 
 wcprod.LCSSKU.branchIditerationInfo as 'SKU_ID', wcprod.LCSSKU.att13 as 'STOCK_NUMBER', spl.idA2A2 as 'SEASON_SKU_LINK_ID' from 
 wcprod.LCSSeasonProductLink spl, wcprod.LCSSeason, wcprod.LCSSKU
where wcprod.LCSSeason.branchIditerationInfo = spl.seasonRevId
and spl.skuARevId = wcprod.LCSSKU.branchIditerationInfo
and spl.seasonLinkType = 'SKU'
and wcprod.LCSSKU.placeholder= 0
and wcprod.LCSSeason.latestiterationInfo=1
And spl.effectOutDate is null
and wcprod.LCSSKU.latestiterationInfo=1;

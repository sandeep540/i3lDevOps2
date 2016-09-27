SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.prodarev.att1 as 'Product Name', wcprod.skuarev.att1 as 'Stock Name',  
wcprod.prodarev.att17 as 'Pattern Name', 
wcprod.prodarev.num16 as 'SAP Pattern Name', LCSSeasonProductLink2.num17 as 'Initial Quote Date', 
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', wcprod.LCSSeasonProductLink.createStampA2 as 'Added to Season On' 
from wcprod.prodarev, wcprod.LCSSeasonProductLink, wcprod.LCSSeason , wcprod.skuarev, wcprod.LCSSeasonProductLink LCSSeasonProductLink2
where 
wcprod.LCSSeasonProductLink.productMasterId = wcprod.prodarev.idA3masterReference and
wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and
wcprod.LCSSeasonProductLink.seasonLinkType = 'PRODUCT' and
wcprod.LCSSeason.latestiterationInfo = '1' AND 
wcprod.prodarev.latestiterationInfo = '1' AND 
 wcprod.LCSSeasonProductLink.effectOutDate is null AND 
LCSSeasonProductLink2.seasonLinkType = 'SKU' AND
LCSSeasonProductLink2.seasonremoved = 0 AND
LCSSeasonProductLink2.effectOutDate is null AND
wcprod.skuarev.latestiterationInfo=1 AND
wcprod.LCSSeason.branchIditerationInfo = LCSSeasonProductLink2.seasonRevId AND
LCSSeasonProductLink2.skuARevId = wcprod.skuarev.branchIditerationInfo AND
wcprod.skuarev.placeholder= 0 AND 
wcprod.skuarev.idA3A12 = wcprod.prodarev.idA3masterReference AND 
wcprod.LCSSeason.att1 like '%2016 Spring Cole Haan%Footwear%';


select distinct LCSSKUSourcingLink.idA2A2
from LCSSourcingConfig, LCSSourcingConfigMaster,
 LCSSourceToSeasonLink, LCSSourceToSeasonLinkMaster, LCSSKUSourcingLink,
 LCSSKU sku, LCSSeason
  where 
LCSSourcingConfig.idA3masterReference = LCSSourcingConfigMaster.idA2A2 
and LCSSourcingConfigMaster.idA2A2 = LCSSourceToSeasonLinkMaster.idA3A6
and LCSSourceToSeasonLinkMaster.idA3A6 = LCSSourceToSeasonLinkMaster.idA3A6
and LCSSourceToSeasonLinkMaster.idA2A2 = LCSSourceToSeasonLink.idA3masterReference
and LCSSourcingConfigMaster.idA2A2 = LCSSKUSourcingLink.idA3B5
and LCSSourcingConfig.latestiterationInfo = 1
and LCSSourceToSeasonLink.latestiterationInfo = 1
and LCSSKUSourcingLink.idA3A7 = LCSSeason.idA3masterReference
and sku.idA3masterReference = LCSSKUSourcingLink.idA3A5
and sku.latestiterationInfo =1
and LCSSeason.idA3masterReference = LCSSourceToSeasonLinkMaster.idA3B6
and LCSSeason.latestiterationInfo = 1
and sku.placeholder = 0
and LCSSourceToSeasonLinkMaster.primarySTSL = 0

select * from LCSSourcingConfigMaster

select * from LCSProduct

select * from WTPartMaster

select distinct wcprod.LCSSeason.att1 as 'Season Name' , LCSSourcingConfig.branchIditerationInfo, 
LCSSourcingConfig.att1 as 'Sourcing Config Name' , WTPartMaster.name as 'Part name', LCSProduct.att1 as 'Product Name', 
LCSSourcingConfig.num3 as 'Factory' from LCSSourcingConfig,
LCSSourcingConfigMaster, LCSSourceToSeasonLink, LCSSourceToSeasonLinkMaster, LCSSKUSourcingLink, 
 LCSSeason, WTPartMaster, LCSProduct
 where 
LCSSourcingConfig.idA3masterReference = LCSSourcingConfigMaster.idA2A2 
and LCSSourcingConfigMaster.idA2A2 = LCSSourceToSeasonLinkMaster.idA3A6
and LCSSourceToSeasonLinkMaster.idA3A6 = LCSSourceToSeasonLinkMaster.idA3A6
and LCSSourceToSeasonLinkMaster.idA2A2 = LCSSourceToSeasonLink.idA3masterReference
and LCSSourcingConfigMaster.idA2A2 = LCSSKUSourcingLink.idA3B5
and LCSSourcingConfig.latestiterationInfo = 1
and LCSSourceToSeasonLink.latestiterationInfo = 1
and LCSSKUSourcingLink.idA3A7 = LCSSeason.idA3masterReference 
and LCSSeason.idA3masterReference = LCSSourceToSeasonLinkMaster.idA3B6
and LCSSourcingConfigMaster.idA3A6 = WTPartMaster.idA2A2
and LCSProduct.idA3masterReference  = WTPartMaster.idA2A2
and LCSSeason.latestiterationInfo = 1 
and LCSProduct.latestiterationInfo = 1
and LCSSourceToSeasonLinkMaster.primarySTSL = 0;





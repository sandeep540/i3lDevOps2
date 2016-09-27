Update LCSSKUSourcingLink  set att7 = 'No' where LCSSKUSourcingLink.idA2A2 in 
(--select  distinct sku.att1, sku.att20, LCSSourcingConfig.att1, LCSSourceToSeasonLinkMaster.primarySTSL, LCSSKUSourcingLink.att7, LCSSKUSourcingLink.idA2A2, LCSSeason.att1 
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
and LCSSourceToSeasonLinkMaster.primarySTSL = 0)
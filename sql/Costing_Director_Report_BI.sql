-- Get All Product details

CREATE VIEW V_SEASON_STYLE_DATA as 
SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId', wcprod.prodarev.att1 as 'Product Name', wcprod.LCSSKU.att1 as 'Stock Name',  
wcprod.prodarev.att17 as 'Pattern Name', 
wcprod.prodarev.num16 as 'SAP Pattern Name', LCSSeasonProductLink2.num17 as 'Initial Quote Date', 
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', 
LCSSeasonProductLink3.createStampA2 as 'Added to Season On' , wcprod.LCSSKU.idA2A2 ,  
wcprod.LCSSKU.versionIdA2versionInfo 
from wcprod.prodarev, wcprod.LCSSeasonProductLink, wcprod.LCSSeason , wcprod.LCSSKU, 
wcprod.LCSSeasonProductLink LCSSeasonProductLink2, wcprod.LCSSeasonProductLink LCSSeasonProductLink3
where 
wcprod.LCSSeasonProductLink.productMasterId = wcprod.prodarev.idA3masterReference and
wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and
wcprod.LCSSeasonProductLink.seasonLinkType = 'PRODUCT' and
wcprod.LCSSeason.latestiterationInfo = '1' AND 
wcprod.prodarev.latestiterationInfo = '1' AND 
 wcprod.LCSSeasonProductLink.effectOutDate is null AND 
LCSSeasonProductLink2.seasonLinkType = 'SKU' AND
LCSSeasonProductLink2.seasonRemoved = 0 AND
LCSSeasonProductLink2.effectOutDate is null AND
wcprod.LCSSKU.latestiterationInfo=1 AND
wcprod.LCSSeason.branchIditerationInfo = LCSSeasonProductLink2.seasonRevId AND
LCSSeasonProductLink2.skuARevId = wcprod.LCSSKU.branchIditerationInfo AND
wcprod.LCSSKU.placeholder= 0 AND 
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND 
LCSSeasonProductLink3.effectSequence = 0 AND
LCSSeasonProductLink3.skuARevId = LCSSeasonProductLink2.skuARevId AND
LCSSeasonProductLink3.seasonRevId = LCSSeasonProductLink2.seasonRevId AND
wcprod.LCSSeason.flexTypeIdPath = '\50294\58843';


CREATE VIEW V_PRODUCT_SOURCE_DATA as
select a.branchIditerationInfo as 'Product Id', a.att1 as 'Product Name', 
 b.primarySource as 'Primary Source', c.att1 as 'Source Name', c.num3 as 'Factory ID'  from 
wcprod.LCSProduct a, wcprod.LCSSourcingConfigMaster b, wcprod.LCSSourcingConfig c  where
a.latestiterationInfo = 1 AND
a.versionIdA2versionInfo like 'A' AND 
a.idA3masterReference = b.idA3A6 AND 
c.idA3masterReference = b.idA2A2 AND
c.latestiterationInfo = 1 AND
b.primarySource = 1 AND
a.flexTypeIdPath = '\50289\58226' 

CREATE VIEW V_SUPPLIER_FACTORY as
select branchIditerationInfo as 'Factory Id', att1 as 'Factory Name' from wcprod.LCSSupplier
where latestiterationInfo = 1 and flexTypeIdPath = '\50300\51316'

CREATE VIEW V_IQD_VIEW as
select idA2A2 as 'IQD Id', att1 as 'IQD Name' from wcprod.LCSLifecycleManaged
where  flexTypeIdPath = '\50340\57066'

CREATE VIEW V_PATTERN_NAME as
select idA2A2 as 'Pattern Id', att1 as 'SAP Pattern Name' from wcprod.LCSLifecycleManaged
where  flexTypeIdPath = '\50340\5265322'















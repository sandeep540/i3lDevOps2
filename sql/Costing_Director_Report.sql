-- Get All Product details
SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId', wcprod.prodarev.att1 as 'Product Name', 
wcprod.LCSSKU.att1 as 'Stock Name',  
wcprod.prodarev.att17 as 'Pattern Name', 
wcprod.prodarev.num16 as 'SAP Pattern Name', LCSSeasonProductLink2.num17 as 'Initial Quote Date', 
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', 
LCSSeasonProductLink3.createStampA2 as 'Added to Season On' , wcprod.LCSSKU.idA2A2 ,  
wcprod.LCSSKU.versionIdA2versionInfo 
into wcprod.#CostingTempTable 
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
wcprod.LCSSeason.att1 like '%2016 Spring Cole Haan%Footwear%';


-- Get All Product/Source details
SELECT distinct A.*, B.att1 as 'Factory' into wcprod.#SourceTempTable from (select distinct 
wcprod.prodarev.branchIditerationInfo as 'ProductId', 
wcprod.prodarev.att1 as 'Product Name', wcprod.LCSSourcingConfig.num3 as 'Factory Code' 
from 
wcprod.prodarev, wcprod.WTPartMaster, wcprod.LCSSourcingConfigMaster, wcprod.LCSSourcingConfig 
, wcprod.LCSSeason, wcprod.LCSSourceToSeasonLinkMaster 
where wcprod.prodarev.idA3masterReference = wcprod.WTPartMaster.idA2A2 AND
wcprod.LCSSourcingConfigMaster.idA3A6 = wcprod.WTPartMaster.idA2A2 AND
wcprod.LCSSourcingConfig.idA3masterReference = wcprod.LCSSourcingConfigMaster.idA2A2 AND 
wcprod.prodarev.latestiterationInfo = 1 AND 
wcprod.LCSSourcingConfig.latestiterationInfo = 1 AND 
wcprod.LCSSeason.latestiterationInfo = 1 AND 
wcprod.LCSSeason.idA3masterReference = LCSSourceToSeasonLinkMaster.idA3B6 AND 
wcprod.LCSSourcingConfigMaster.idA2A2 = wcprod.LCSSourceToSeasonLinkMaster.idA3A6 AND  
wcprod.LCSSeason.att1 like '%2016 Spring Cole Haan%Footwear%') A LEFT JOIN wcprod.LCSSupplier B 
ON A.[Factory Code] = B.branchIditerationInfo;
	
-- Verify Temp Table
select * from wcprod.#CostingTempTable;
-- Verify Temp Table
select * from wcprod.#SourceTempTable


-- Final Output
select L.[Season Name],L.[Product Name],L.[Stock Name],L.[Pattern Name], L.[SAP Pattern Name1],
 L.[Initial Quote Date1], L.[Colorway Season Status], L.[Added to Season On], 
 M.[Factory] from (select X.*, Y.att1 as 'Initial Quote Date1' from 
 (select A.*, B.att1 as 'SAP Pattern Name1' from  wcprod.#CostingTempTable A left join wcprod.LCSLifecycleManaged B 
on A.[SAP Pattern Name] = B.idA2A2 ) X left join wcprod.LCSLifecycleManaged Y
on X.[Initial Quote Date] = Y.idA2A2) L left join wcprod.#SourceTempTable M 
on L.[ProductId] = M.[ProductId];






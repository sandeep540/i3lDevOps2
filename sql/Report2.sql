SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.prodarev.att1 as 'Product Name', wcprod.LCSSKU.att1 as 'Stock Name',  
wcprod.prodarev.att17 as 'Pattern Name', 
wcprod.prodarev.num16 as 'SAP Pattern Name', LCSSeasonProductLink2.num17 as 'Initial Quote Date', 
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', 
LCSSeasonProductLink3.createStampA2 as 'Added to Season On' , wcprod.LCSSKU.idA2A2 , , wcprod.LCSSKU.versionA2
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
--wcprod.LCSSKU.seasonRevId = LCSSeason.branchIditerationInfo AND
wcprod.LCSSeason.branchIditerationInfo = LCSSeasonProductLink2.seasonRevId AND
LCSSeasonProductLink2.skuARevId = wcprod.LCSSKU.branchIditerationInfo AND
wcprod.LCSSKU.placeholder= 0 AND 
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND 
LCSSeasonProductLink3.effectSequence = 0 AND
LCSSeasonProductLink3.skuARevId = LCSSeasonProductLink2.skuARevId AND
LCSSeasonProductLink3.seasonRevId = LCSSeasonProductLink2.seasonRevId AND
wcprod.LCSSeason.att1 like '%2016 Spring Cole Haan%Footwear%';

--select * from LCSSeasonProductLink;

select att1, branchIditerationInfo, idA2A2, createStampA2 from LCSSKU where idA2A2 = 225292523;

select * from LCSSKU where branchIditerationInfo = 225292522;

select * from LCSSKU where att1 like '%C12819%';

select * from LCSSeason where branchIditerationInfo = 8319176;
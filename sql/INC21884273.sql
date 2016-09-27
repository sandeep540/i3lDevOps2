select season.att1 as 'Season Name', prod.att1 as 'Product Name',  sku.att1 as 'Colorway Name' , sku.att13 as 'Stock', 
sku.createStampA2 as 'Colorway Create Date' , skulink.createStampA2 as 'Link Create Date', 
skulink.att2 as 'Carryover Status' 
from wcprod.LCSSeasonProductLink skulink, wcprod.LCSSKU sku,wcprod.LCSSeason season, wcprod.LCSProduct prod 
where
skulink.seasonRevId=season.branchIditerationInfo and skulink.skuARevId=sku.branchIditerationInfo
and skulink.seasonLinkType='SKU' and skulink.seasonRemoved=0 and 
skulink.effectLatest='1' and skulink.idA3C6=272097135 
and skulink.productARevId = prod.branchIditerationInfo
and skulink.effectSequence = 1 
-- and skulink.att2='New' and  skulink.seasonProductRevision != 'B'
and season.latestiterationInfo=1 and season.versionIdA2versionInfo= 'A'
and sku.latestiterationInfo=1 and sku.versionIdA2versionInfo='A'
and prod.latestiterationInfo=1 and prod.versionIdA2versionInfo='A'
and skulink.createStampA2 >= '2015-10-10'
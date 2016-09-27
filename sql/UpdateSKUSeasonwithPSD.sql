select idA3masterReference from wcprod.ProductSizeCategory where idA2A2 = 185237159
select * from wcprod.ProductSizeCategoryMaster where idA2A2 = 104544581 --1398980
select idA3masterReference from wcprod.ProdSizeCategoryToSeason
select * from wcprod.ProdSizeCategoryToSeasonMaster where idA2A2 = 1398998

select * from wcprod.ProdSizeCategoryToSeasonMaster where idA2A2 = 1398998

select * from wcprod.WTPartMaster where idA2A2 = 10804276

select idA2A2, att50, effectSequence from wcprod.LCSSeasonProductLink where
effectOutDate is null AND effectLatest = 1 AND seasonLinkType = 'SKU' and att50 is NULL
 
 select * from wcprod.LCSSeasonProductLink where idA2A2 = 7037042

select distinct a.idA2A2, b.att1, f.att1,  d.sizeCategoryType, e.sizeCategoryType, e.name 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e , wcprod.prodarev f 
where b.idA3masterReference = c.idA3B6 AND a.productARevId = f.branchIditerationInfo and f.idA3masterReference = d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL



select distinct a.idA2A2, b.att1,  d.sizeCategoryType, e.sizeCategoryType, e.name 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL

select a.idA2A2, a.effectSequence, a.skuARevId,  d.sizeCategoryType, e.sizeCategoryType, e.name 
from wcprod.LCSSeasonProductLink a,  wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where   
a.seasonLinkType = 'SKU' 
AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL
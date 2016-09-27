select distinct att1 from wcprod.LCSSeason where att1 like '2015%Footwear' OR att1 like '2016%Footwear' ;

CREATE VIEW V_ACTIVE_SEASONS as ( select branchIditerationInfo , att1, createStampA2 from wcprod.LCSSeason where att1 
in ('2015 Fall Cole Haan Men''s Footwear',  '2015 Fall Cole Haan Women''s Footwear', 
 '2015 Holiday Cole Haan Men''s Footwear',  '2015 Holiday Cole Haan Women''s Footwear', 
  '2016 Fall Cole Haan Men''s Footwear',  '2016 Fall Cole Haan Women''s Footwear',  '2016 Spring Cole Haan Men''s Footwear',
    '2016 Spring Cole Haan Women''s Footwear',  '2016 Summer Cole Haan Men''s Footwear',  '2016 Summer Cole Haan Women''s Footwear') and
	latestiterationInfo = 1);


	select LCSSeason.att1 as 'Season Name', 
 LCSSKU.branchIditerationInfo as 'SKU Id', LCSSKU.createStampA2, 
 wcprod.LCSSeasonProductLink.att2 as 'SKU CarryOver Status', spl2.att2 as 'Product CarryOver Status', 
 wcprod.LCSSeasonProductLink.att17 as 'SKU Status', wcprod.LCSSeasonProductLink.att40 as 'SAP Status' , 
 wcprod.LCSSeasonProductLink.skuSeasonRevId as 'SKU-Season' from 
  wcprod.LCSSeason, wcprod.LCSSeasonProductLink, wcprod.LCSSeasonProductLink spl2, 
wcprod.LCSSKU   where wcprod.LCSSeason.latestiterationInfo = 1 and wcprod.LCSSKU.latestiterationInfo = 1 
and wcprod.LCSSeasonProductLink.skuMasterId = wcprod.LCSSKU.idA3masterReference and  wcprod.LCSSKU.versionIdA2versionInfo='A' 
and wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and wcprod.LCSSeasonProductLink.seasonLinkType = 'SKU' 
and wcprod.LCSSeasonProductLink.effectOutDate is null and spl2.seasonLinkType = 'PRODUCT' 
and spl2.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and  wcprod.LCSSeasonProductLink.productARevId = spl2.productARevId 
and spl2.effectOutDate is null and LCSSeason.branchIditerationInfo in (select branchIditerationInfo from wcprod.V_ACTIVE_SEASONS) 
order by  wcprod.LCSSeasonProductLink.skuSeasonRevId


select branchIditerationInfo , att1, createStampA2 from wcprod.LCSSeason where att1 
in ('2015 Fall Cole Haan Men''s Footwear',  '2015 Fall Cole Haan Women''s Footwear', 
 '2015 Holiday Cole Haan Men''s Footwear',  '2015 Holiday Cole Haan Women''s Footwear', 
  '2016 Fall Cole Haan Men''s Footwear',  '2016 Fall Cole Haan Women''s Footwear',  '2016 Spring Cole Haan Men''s Footwear',
    '2016 Spring Cole Haan Women''s Footwear',  '2016 Summer Cole Haan Men''s Footwear',  '2016 Summer Cole Haan Women''s Footwear') and
	latestiterationInfo = 1 order by createStampA2


select LCSSeason.att1 as 'Season Name', LCSSeason.createStampA2 as 'Season Created Date', LCSProduct.branchIditerationInfo as 'Product Id', wcprod.LCSSeasonProductLink.att2 as 'CarryOver Status',
  wcprod.LCSProduct.att20 as 'Product Status' from  wcprod.LCSSeason, wcprod.LCSSeasonProductLink, wcprod.LCSProduct  
 where wcprod.LCSSeason.latestiterationInfo = 1 and wcprod.LCSProduct.latestiterationInfo = 1 
and wcprod.LCSSeasonProductLink.productMasterId = wcprod.LCSProduct.idA3masterReference and  wcprod.LCSProduct.versionIdA2versionInfo='A'
and wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo and wcprod.LCSSeasonProductLink.seasonLinkType = 'PRODUCT' 
and wcprod.LCSSeasonProductLink.effectOutDate is null and LCSSeason.branchIditerationInfo in (select branchIditerationInfo from wcprod.V_ACTIVE_SEASONS)
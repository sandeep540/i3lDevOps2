SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.LCSSeason.branchIditerationInfo as 'SeasonId', wcprod.LCSSeason.idA3masterReference as 'SeasonMasterRef',
wcprod.prodarev.att1 as 'Product Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId',
wcprod.LCSSKU.att1 as 'Stock Name', wcprod.LCSSKU.att13 as 'Stock No' , 
wcprod.LCSSKU.branchIditerationInfo as 'SKUId', wcprod.LCSSKU.idA3masterReference as 'SKUMasterRef',
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', LCSSeasonProductLink2.createStampA2 as 'Link Create Date' ,
LCSSeasonProductLink2.effectInDate as 'Effect In Date', LCSSeasonProductLink2.effectOutDate as 'Effect Out Date',
LCSSeasonProductLink2.effectLatest as 'Effect Latest Flag', LCSSeasonProductLink2.effectSequence as 'Effect Sequence',
LCSSeasonProductLink2.att16 as 'SAP Costing Valid', LCSSeasonProductLink2.att22 as 'SAP Costing Valididation Message',
LCSSeasonProductLink2.att23 as 'SAP Custom Valid', LCSSeasonProductLink2.att24 as 'SAP Custom Valididation Message',
LCSSeasonProductLink2.att25 as 'SAP Stock Valid', LCSSeasonProductLink2.att26 as 'SAP Stock Valididation Message', 
wcprod.LCSSKUSourcingLink.att4 as 'SAP Sourcing Valid', wcprod.LCSSKUSourcingLink.att5 as 'SAP Sourcing Validation Message', 
LCSSeasonProductLink2.date5 as 'Date first sent to SAP', LCSSeasonProductLink2.date6 as 'Date last sent to SAP',
LCSSeasonProductLink2.att40 as 'SAP Status', LCSSeasonProductLink2.att27 as 'Ready for SAP', 
LCSSeasonProductLink2.att33 as 'SAP Push Value', LCSSeasonProductLink2.att12 as 'SAP Validation Comments' 
from wcprod.prodarev, wcprod.LCSSeasonProductLink, wcprod.LCSSeason , wcprod.LCSSKU, 
 wcprod.LCSSeasonProductLink LCSSeasonProductLink2 , wcprod.LCSSKUSourcingLink 
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
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND
wcprod.LCSSKU.idA3masterReference = wcprod.LCSSKUSourcingLink.idA3A5 AND
wcprod.LCSSKUSourcingLink.idA3A7 = wcprod.LCSSeason.idA3masterReference;


SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.LCSSeason.branchIditerationInfo as 'SeasonId', wcprod.LCSSeason.idA3masterReference as 'SeasonMasterRef',
wcprod.prodarev.att1 as 'Product Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId',
wcprod.LCSSKU.att1 as 'Stock Name', wcprod.LCSSKU.att13 as 'Stock No' , 
wcprod.LCSSKU.branchIditerationInfo as 'SKUId', wcprod.LCSSKU.idA3masterReference as 'SKUMasterRef',
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', LCSSeasonProductLink2.createStampA2 as 'Link Create Date' ,
LCSSeasonProductLink2.effectInDate as 'Effect In Date', LCSSeasonProductLink2.effectOutDate as 'Effect Out Date',
LCSSeasonProductLink2.effectLatest as 'Effect Latest Flag', LCSSeasonProductLink2.effectSequence as 'Effect Sequence',
LCSSeasonProductLink2.att16 as 'SAP Costing Valid', LCSSeasonProductLink2.att22 as 'SAP Costing Valididation Message',
LCSSeasonProductLink2.att23 as 'SAP Custom Valid', LCSSeasonProductLink2.att24 as 'SAP Custom Valididation Message',
LCSSeasonProductLink2.att25 as 'SAP Stock Valid', LCSSeasonProductLink2.att26 as 'SAP Stock Valididation Message', 
--wcprod.LCSSKUSourcingLink.att4 as 'SAP Sourcing Valid', wcprod.LCSSKUSourcingLink.att5 as 'SAP Sourcing Validation Message', 
LCSSeasonProductLink2.date5 as 'Date first sent to SAP', LCSSeasonProductLink2.date6 as 'Date last sent to SAP',
LCSSeasonProductLink2.att40 as 'SAP Status', LCSSeasonProductLink2.att27 as 'Ready for SAP', 
LCSSeasonProductLink2.att33 as 'SAP Push Value', LCSSeasonProductLink2.att12 as 'SAP Validation Comments' 
from wcprod.prodarev, wcprod.LCSSeasonProductLink, wcprod.LCSSeason , wcprod.LCSSKU, 
 wcprod.LCSSeasonProductLink LCSSeasonProductLink2 
--  , wcprod.LCSSKUSourcingLink 
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
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND
--wcprod.LCSSKU.idA3masterReference = wcprod.LCSSKUSourcingLink.idA3A5 AND
--wcprod.LCSSKUSourcingLink.idA3A7 = wcprod.LCSSeason.idA3masterReference;












SELECT top 5 wcprod.LCSSeason.att1 as 'Season Name' , wcprod.LCSSeason.branchIditerationInfo as 'SeasonId', wcprod.LCSSeason.idA3masterReference as 'SeasonMasterRef',
wcprod.prodarev.att1 as 'Product Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId',
wcprod.LCSSKU.att1 as 'Stock Name', wcprod.LCSSKU.att13 as 'Stock No' , 
wcprod.LCSSKU.branchIditerationInfo as 'SKUId', wcprod.LCSSKU.idA3masterReference as 'SKUMasterRef',
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', LCSSeasonProductLink2.createStampA2 as 'Link Create Date' ,
LCSSeasonProductLink2.effectInDate as 'Effect In Date', LCSSeasonProductLink2.effectOutDate as 'Effect Out Date',
LCSSeasonProductLink2.effectLatest as 'Effect Latest Flag', LCSSeasonProductLink2.effectSequence as 'Effect Sequence',
LCSSeasonProductLink2.att16 as 'SAP Costing Valid', LCSSeasonProductLink2.att22 as 'SAP Costing Valididation Message',
LCSSeasonProductLink2.att23 as 'SAP Custom Valid', LCSSeasonProductLink2.att24 as 'SAP Custom Valididation Message',
LCSSeasonProductLink2.att25 as 'SAP Stock Valid', LCSSeasonProductLink2.att26 as 'SAP Stock Valididation Message',  
LCSSeasonProductLink2.date5 as 'Date first sent to SAP', LCSSeasonProductLink2.date6 as 'Date last sent to SAP',
LCSSeasonProductLink2.att40 as 'SAP Status', LCSSeasonProductLink2.att27 as 'Ready for SAP', 
LCSSeasonProductLink2.att33 as 'SAP Push Value', LCSSeasonProductLink2.att12 as 'SAP Validation Comments' 
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
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND 
wcprod.LCSSKU.att13 = 'C13382' AND
wcprod.LCSSeason.att1 = '2015 Fall Cole Haan%Footwear%' order by LCSSeasonProductLink2.effectSequence desc;




SELECT wcprod.LCSSeason.att1 as 'Season Name' , wcprod.LCSSeason.branchIditerationInfo as 'SeasonId', wcprod.LCSSeason.idA3masterReference as 'SeasonMasterRef',
wcprod.prodarev.att1 as 'Product Name' , wcprod.prodarev.branchIditerationInfo as 'ProductId',
wcprod.LCSSKU.att1 as 'Stock Name', wcprod.LCSSKU.att13 as 'Stock No' , 
wcprod.LCSSKU.branchIditerationInfo as 'SKUId', wcprod.LCSSKU.idA3masterReference as 'SKUMasterRef',
wcprod.LCSSeasonProductLink.att18 as 'Colorway Season Status', LCSSeasonProductLink2.createStampA2 as 'Link Create Date' ,
LCSSeasonProductLink2.effectInDate as 'Effect In Date', LCSSeasonProductLink2.effectOutDate as 'Effect Out Date',
LCSSeasonProductLink2.effectLatest as 'Effect Latest Flag', LCSSeasonProductLink2.effectSequence as 'Effect Sequence',
LCSSeasonProductLink2.att16 as 'SAP Costing Valid', LCSSeasonProductLink2.att22 as 'SAP Costing Valididation Message',
LCSSeasonProductLink2.att23 as 'SAP Custom Valid', LCSSeasonProductLink2.att24 as 'SAP Custom Valididation Message',
LCSSeasonProductLink2.att25 as 'SAP Stock Valid', LCSSeasonProductLink2.att26 as 'SAP Stock Valididation Message',  
LCSSeasonProductLink2.date5 as 'Date first sent to SAP', LCSSeasonProductLink2.date6 as 'Date last sent to SAP',
LCSSeasonProductLink2.att40 as 'SAP Status', LCSSeasonProductLink2.att27 as 'Ready for SAP', 
LCSSeasonProductLink2.att33 as 'SAP Push Value', LCSSeasonProductLink2.att12 as 'SAP Validation Comments' ,
ROW_NUMBER() OVER (PARTITION BY wcprod.LCSSKU.att13 ORDER BY LCSSeasonProductLink2.effectSequence DESC as ROWNUM
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
wcprod.LCSSKU.idA3A12 = wcprod.prodarev.idA3masterReference AND 
-- wcprod.LCSSKU.att13 = 'C13382' AND
wcprod.LCSSeason.att1 = '2015 Fall Cole Haan%Footwear%' 

-- order by LCSSeasonProductLink2.effectSequence desc;















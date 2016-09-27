select distinct a.idA2A2, b.att1, a.att50, d.sizeCategoryType, e.sizeCategoryType, e.name 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
-- AND a.att50 is NULL



select distinct a.idA2A2 as 'ID', b.att1 as 'Season_Name', e.name as 'Size_Category' into wcprod.#SizingTempTable 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL


DECLARE @MyCursor CURSOR;
DECLARE @MyId int;
DECLARE @MySize varchar;
BEGIN
    SET @MyCursor = CURSOR FOR
    select ID, Size_Category from wcprod.#SizingTempTable

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @MyId, @MySize

    WHILE @@FETCH_STATUS = 0
    BEGIN
    -- YOUR ALGORITHM GOES HERE 
			UPDATE wcprod.LCSSeasonProductLink set att15 = @MySize where idA2A2 = @MyId
    END; 

    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;


select distinct a.idA2A2 as 'ID', b.att1 as 'Season_Name', e.name as 'Size_Category' into wcprod.#SizingTempTable 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL

declare @ID int
declare @MySize varchar

while exists (select ID, Size_Category from wcprod.#SizingTempTable)
begin

    select top 1 @ID = ID, @MySize = Size_Category
    from wcprod.#SizingTempTable
    order by ID asc

	UPDATE wcprod.LCSSeasonProductLink set att15 = @MySize where idA2A2 = @ID

	delete #wcprod.#SizingTempTable where ID = @ID
	
end

drop table #wcprod.#SizingTempTable




SELECT * INTO wcprod.LCSSeasonProductLink_bkp_03_09
FROM wcprod.LCSSeasonProductLink;














drop table #wcprod.#SizingTempTable

select distinct a.idA2A2 as 'ID', b.att1 as 'Season_Name', e.name as 'Size_Category' into wcprod.#SizingTempTable 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
AND a.att50 is NULL



declare @ID int
declare @MySize nvarchar(150)

while exists (select ID, Size_Category from wcprod.#SizingTempTable)
begin

    select top 1 @ID = ID, @MySize = Size_Category
    from wcprod.#SizingTempTable
    order by ID asc

	UPDATE wcprod.LCSSeasonProductLink set att50 = @MySize where idA2A2 = @ID

	delete #wcprod.#SizingTempTable where ID = @ID
	
end

select * from wcprod.#SizingTempTable

select distinct a.idA2A2, b.att1, a.att50, d.sizeCategoryType, e.sizeCategoryType, e.name 
from wcprod.LCSSeasonProductLink a, wcprod.LCSSeason b, wcprod.ProdSizeCategoryToSeasonMaster c,
wcprod.ProductSizeCategoryMaster d, wcprod.ProductSizeCategoryMaster e 
where b.idA3masterReference = c.idA3B6 AND a.productMasterId =  d.idA3B6 AND 
b.latestiterationInfo = 1 AND 
a.seasonLinkType = 'SKU' AND
a.seasonRevId = b.branchIditerationInfo AND a.effectOutDate is null AND a.effectLatest = 1 AND 
c.idA3A6 = d.idA2A2 and d.idA3C6 = e.idA2A2 and d.sizeCategoryType like 'INSTANCE' and e.sizeCategoryType like 'TEMPLATE'
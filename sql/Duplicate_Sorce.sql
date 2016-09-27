
-- Footwear Products
drop table wcprod.#sourcedata_footwear

select a.branchIditerationInfo as 'id', a.att1 as 'name', a.att28 as 'gender', a.att21 as 'Proto' ,
 b.primarySource as 'primary_source', c.att1 as 'source_name', c.num3 as 'factory' into #sourcedata_footwear from 
wcprod.LCSProduct a, wcprod.LCSSourcingConfigMaster b, wcprod.LCSSourcingConfig c  where
a.latestiterationInfo = 1 AND
a.versionIdA2versionInfo like 'A' AND 
a.idA3masterReference = b.idA3A6 AND 
c.idA3masterReference = b.idA2A2 AND
c.latestiterationInfo = 1 AND
a.flexTypeIdPath = '\50289\58226' ; 


-- Licesed Products
drop table wcprod.#sourcedata_licensed

select a.branchIditerationInfo as 'id', a.att1 as 'name', a.att28 as 'gender', a.att21 as 'Proto' ,
 b.primarySource as 'primary_source', c.att1 as 'source_name', c.num3 as 'factory' into #sourcedata_licensed from 
wcprod.LCSProduct a, wcprod.LCSSourcingConfigMaster b, wcprod.LCSSourcingConfig c  where
a.latestiterationInfo = 1 AND
a.versionIdA2versionInfo like 'A' AND 
a.idA3masterReference = b.idA3A6 AND 
c.idA3masterReference = b.idA2A2 AND
c.latestiterationInfo = 1 AND
a.flexTypeIdPath = '\50289\58377' ; 

select count(1) from wcprod.#sourcedata_footwear
select count(1) from wcprod.#sourcedata_licensed;

select A.*, B.att1 from wcprod.#sourcedata_footwear A LEFT JOIN wcprod.LCSSupplier B ON A.factory = B.branchIditerationInfo
AND B.latestiterationInfo = 1

select A.*, B.att1 from wcprod.#sourcedata_licensed A LEFT JOIN wcprod.LCSSupplier B ON A.factory = B.branchIditerationInfo
AND B.latestiterationInfo = 1


select * from wcprod.LCSSupplier

drop table wcprod.#finalsourcedata_footwear
drop table wcprod.#finalsourcedata_licensed

select A.name, A.gender, A.Proto, A.primary_source, A.source_name, B.att1 as 'Factory' into #finalsourcedata_footwear
from wcprod.#sourcedata A LEFT JOIN wcprod.LCSSupplier B ON A.factory = B.branchIditerationInfo
AND B.latestiterationInfo = 1 ;

select A.name, A.gender, A.Proto, A.primary_source, A.source_name, B.att1 as 'Factory' into #finalsourcedata_licensed;
from wcprod.#sourcedata A LEFT JOIN wcprod.LCSSupplier B ON A.factory = B.branchIditerationInfo
AND B.latestiterationInfo = 1 ;


select * from wcprod.#finalsourcedata

select Proto, count(source_name) from wcprod.#finalsourcedata GROUP BY Proto having count(source_name) > 1;
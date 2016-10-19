select LCSProduct.att1 as 'Product Name', LCSProduct.num11 as 'Mold Ref', LCSProduct.branchIditerationInfo as 'Product Id' from
wcprod.LCSProduct where latestiterationInfo = 1 and versionIdA2versionInfo = 'A'

select LCSRevisableEntity.att1 as 'Mold Name', LCSRevisableEntity.num6 as 'Mold Factory Ref' from wcprod.LCSRevisableEntity
where flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Mold') and latestiterationInfo = 1

select LCSSupplier.att1, LCSSupplier.att2, LCSSupplier.idA2A2, LCSSupplier.branchIditerationInfo from wcprod.LCSSupplier where
flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Factory') and latestiterationInfo = 1;



select C.*, D.* from (select A.*, B.* from ( select LCSProduct.att1 as 'Product Name', LCSProduct.num11 as 'Mold Ref', LCSProduct.branchIditerationInfo as 'Product Id' from
wcprod.LCSProduct where latestiterationInfo = 1 and versionIdA2versionInfo = 'A' ) A LEFT JOIN
(select LCSRevisableEntity.att1 as 'Mold Name', LCSRevisableEntity.num6 as 'Mold Factory Ref', LCSRevisableEntity.branchIditerationInfo as 'Mold Id'
 from wcprod.LCSRevisableEntity
where flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Mold') and latestiterationInfo = 1) B
ON A.[Mold Ref] = B.[Mold Id]) C LEFT JOIN
(select LCSSupplier.att1 as 'Supplier Name 1', LCSSupplier.att2 as 'Supplier Name 2', LCSSupplier.idA2A2 as 'Supplier ver Id',
 LCSSupplier.branchIditerationInfo as 'Supplier Id' from wcprod.LCSSupplier where
flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Factory') and latestiterationInfo = 1) D
ON C.[Mold Factory Ref] = D.[Supplier Id]

select C.*, D.* from (select A.*, B.* from ( select LCSProduct.att1 as 'Product Name', LCSProduct.num11 as 'Mold Ref', LCSProduct.branchIditerationInfo as 'Product Id' from
wcprod.LCSProduct where latestiterationInfo = 1 and versionIdA2versionInfo = 'A' and LCSProduct.num11 <> 0) A LEFT JOIN
(select LCSRevisableEntity.att1 as 'Mold Name', LCSRevisableEntity.num6 as 'Mold Factory Ref', LCSRevisableEntity.branchIditerationInfo as 'Mold Id'
 from wcprod.LCSRevisableEntity
where flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Mold') and latestiterationInfo = 1) B
ON A.[Mold Ref] = B.[Mold Id]) C

LEFT JOIN ON
(select LCSProduct.branchIditerationInfo as 'Product Id', LCSProduct.att1 as 'Product Name',
 LCSSourcingConfigMaster.primarySource as 'Primary Source', LCSSourcingConfig.att1 as 'Source Name',
  LCSSourcingConfig.num4 as 'Mold 1' , LCSSourcingConfig.idA2A2 as 'Source Ver Id',
  LCSSourcingConfig.branchIditerationInfo as 'Source Id' from
wcprod.LCSProduct , wcprod.LCSSourcingConfigMaster , wcprod.LCSSourcingConfig   where
LCSProduct.latestiterationInfo = 1 AND
LCSProduct.versionIdA2versionInfo like 'A' AND
LCSProduct.idA3masterReference = LCSSourcingConfigMaster.idA3A6 AND
LCSSourcingConfig.idA3masterReference = LCSSourcingConfigMaster.idA2A2 AND
LCSSourcingConfig.latestiterationInfo = 1 and LCSSourcingConfigMaster.primarySource = 1) D
ON


select LCSProduct.branchIditerationInfo as 'Product Id', LCSProduct.att1 as 'name', a.att28 as 'gender', a.att21 as 'Proto' ,
 b.primarySource as 'primary_source', c.att1 as 'source_name', c.num3 as 'factory' into #sourcedata_footwear from
wcprod.LCSProduct a, wcprod.LCSSourcingConfigMaster b, wcprod.LCSSourcingConfig c  where
a.latestiterationInfo = 1 AND
a.versionIdA2versionInfo like 'A' AND
a.idA3masterReference = b.idA3A6 AND
c.idA3masterReference = b.idA2A2 AND
c.latestiterationInfo = 1 AND
a.flexTypeIdPath = '\50289\58226' ;



select C.*, D.* from (select A.*, B.* from ( select LCSProduct.att1 as 'Product Name', LCSProduct.att21 as 'Proto Number', LCSProduct.num11 as 'Mold Ref',
LCSProduct.branchIditerationInfo as 'Product Id' from
wcprod.LCSProduct where latestiterationInfo = 1 and versionIdA2versionInfo = 'A' and LCSProduct.num11 <> 0) A LEFT JOIN
(select LCSRevisableEntity.att1 as 'Mold Name', LCSRevisableEntity.num6 as 'Mold Factory Ref', LCSRevisableEntity.branchIditerationInfo as 'Mold Id'
from wcprod.LCSRevisableEntity
where flexTypeIdPath in (select typeIdPath from wcprod.FlexType where typeName like 'Mold') and latestiterationInfo = 1) B
ON A.[Mold Ref] = B.[Mold Id]) C
LEFT JOIN
(select LCSProduct.branchIditerationInfo as 'Product Id', LCSProduct.att1 as 'Product Name',
LCSSourcingConfigMaster.primarySource as 'Primary Source', LCSSourcingConfig.att1 as 'Source Name',
LCSSourcingConfig.num4 as 'Mold 1' , LCSSourcingConfig.idA2A2 as 'Source Ver Id',
LCSSourcingConfig.branchIditerationInfo as 'Source Id' from
wcprod.LCSProduct , wcprod.LCSSourcingConfigMaster , wcprod.LCSSourcingConfig   where
LCSProduct.latestiterationInfo = 1 AND
LCSProduct.versionIdA2versionInfo like 'A' AND
LCSProduct.idA3masterReference = LCSSourcingConfigMaster.idA3A6 AND
LCSSourcingConfig.idA3masterReference = LCSSourcingConfigMaster.idA2A2 AND
LCSSourcingConfig.latestiterationInfo = 1 and LCSSourcingConfigMaster.primarySource = 1) D
ON C.[Product Id] = D.[Product Id]

SELECT     X.[Stock Number], X.[Season Year], X.[Season], X.[Group], X.[Season Name], X.[Phased], (CASE WHEN (X.[SKU_Status] IS NULL OR
X.[SKU_Status] LIKE '') THEN X.[Product_Status] ELSE X.[SKU_Status] END) AS Status, X.[Size Created From], B.[IQD Display] as 'IQD Date',
C.[Risk Factor Display] as 'Risk Factor', D.[Channel Display] as 'Channel',
(CASE WHEN (X.[SKU Wholesale Price] IS NULL OR X.[SKU Wholesale Price] LIKE '') THEN X.[Product Wholesale Price] ELSE X.[SKU Wholesale Price] END) AS [Wholesale Price],
(CASE WHEN (X.[SKU Retail Price] IS NULL OR X.[SKU Retail Price] LIKE '') THEN X.[Product Retail Price] ELSE X.[SKU Retail Price] END) AS [Retail Price],
(CASE WHEN (X.[SKU Canadian Retail Price] IS NULL OR X.[SKU Canadian Retail Price] LIKE '') THEN X.[Product Canadian Retail Price] ELSE X.[SKU Canadian Retail Price] END) AS [Canadian Retail Price]
FROM         (SELECT     wcprod.LCSSKU.att13 AS 'Stock Number', wcprod.LCSSeason.att3 AS 'Season Year', wcprod.LCSSeason.att4 AS 'Season',
wcprod.LCSSeason.att6 AS 'Group', wcprod.LCSSeason.att1 AS 'Season Name', wcprod.LCSSeasonProductLink.att18 AS 'SKU_Status',
spl2.att18 AS 'Product_Status', wcprod.LCSSeasonProductLink.att8 AS 'Phased', wcprod.LCSSeasonProductLink.att51 as 'Size Created From',
wcprod.LCSSeasonProductLink.num17 as 'IQD', wcprod.LCSSKU.att11 as 'Risk Factor', spl2.att78 as 'Channel',
wcprod.LCSSeasonProductLink.num26 as 'SKU Wholesale Price', spl2.num26 as 'Product Wholesale Price',
wcprod.LCSSeasonProductLink.num25 as 'SKU Retail Price', spl2.num25 as 'Product Retail Price',
wcprod.LCSSeasonProductLink.num27 as 'SKU Canadian Retail Price', spl2.num27 as 'Product Canadian Retail Price'
FROM          wcprod.LCSSKU INNER JOIN
wcprod.LCSSeasonProductLink ON wcprod.LCSSKU.idA3masterReference = wcprod.LCSSeasonProductLink.skuMasterId INNER JOIN
wcprod.LCSSeason ON wcprod.LCSSeasonProductLink.seasonRevId = wcprod.LCSSeason.branchIditerationInfo INNER JOIN
wcprod.LCSSeasonProductLink AS spl2 ON wcprod.LCSSeason.branchIditerationInfo = spl2.seasonRevId AND
wcprod.LCSSeasonProductLink.productARevId = spl2.productARevId
WHERE      (wcprod.LCSSeason.latestiterationInfo = 1) AND (wcprod.LCSSKU.latestiterationInfo = 1) AND (wcprod.LCSSKU.versionIdA2versionInfo = 'A') AND
(wcprod.LCSSeasonProductLink.seasonRemoved = 0) AND (spl2.seasonRemoved = 0) AND (wcprod.LCSSeasonProductLink.seasonLinkType = 'SKU') AND
(wcprod.LCSSeasonProductLink.effectOutDate IS NULL) AND (spl2.seasonLinkType = 'PRODUCT') AND (spl2.effectOutDate IS NULL) AND
(wcprod.LCSSKU.att13 NOT LIKE '%X%')) AS X

 LEFT JOIN (select idA2A2, att1 as 'IQD Display', flexTypeIdPath from wcprod.LCSLifecycleManaged
  where  idA3A8 in (select idA2A2 from wcprod.FlexType where typeName like 'IQD Date')) B ON X.IQD = B.idA2A2

  LEFT JOIN
  (select Y.valueKey as 'Key', Y.display as 'Risk Factor Display' from (select A.idA2A2, A.idA3G4, A.attKey, A.attDisplay,
 A.attObjectLevel, A.attScope, B.typeClass, B.typeName from
wcprod.FlexTypeAttribute A, wcprod.FlexType B where  idA3G4 <> 0 and
attHidden = 0 and attVariableType like 'choice' and A.idA3A4 = B.idA2A2 and
A.idA3G4 in (select idA2A2 from wcprod.AttributeValueList)) X join wcprod.AttributeValueStore Y on
X.idA3G4 = Y.idA3A4 and
attKey like 'chRiskFactor' and X.typeName like 'Product' and locale like 'VALUE') C ON X.[Risk Factor] = C.[Key]

LEFT JOIN
(select Y.valueKey as 'Channel Key', Y.display as 'Channel Display' from (select A.idA2A2, A.idA3G4, A.attKey, A.attDisplay,
 A.attObjectLevel, A.attScope, B.typeClass, B.typeName from
wcprod.FlexTypeAttribute A, wcprod.FlexType B where  idA3G4 <> 0 and
attHidden = 0 and attVariableType like 'choice' and A.idA3A4 = B.idA2A2 and
A.idA3G4 in (select idA2A2 from wcprod.AttributeValueList)) X join wcprod.AttributeValueStore Y on
X.idA3G4 = Y.idA3A4 and
attKey like 'chChannel' and X.typeName like 'Product' and locale like 'VALUE') D ON X.[Channel] = D.[Channel Key]

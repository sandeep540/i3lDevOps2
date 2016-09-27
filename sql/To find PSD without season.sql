SELECT DISTINCT ProductSizeCategoryMaster.name as Size_Definition_Name, LCSSeason.att1 as Season_Name,
WTPartMaster.name as Product_Name, ProductSizeCategory.sizeValues as Size_Values
  FROM ((((wcprod.ProductSizeCategoryMaster LEFT OUTER JOIN wcprod.ActivePSDToSeasonMaster ON ProductSizeCategoryMaster.idA2A2 = ActivePSDToSeasonMaster.idA3A6) 
  LEFT OUTER JOIN
   wcprod.productseasonlink LCSSeasonProductLink ON ActivePSDToSeasonMaster.idA3B6 = LCSSeasonProductLink.idA3B5)
    LEFT OUTER JOIN
       wcprod.ProdSizeCategoryToSeason ON ActivePSDToSeasonMaster.idA2A2 = ProdSizeCategoryToSeason.idA3masterReference) 
        LEFT OUTER JOIN
         wcprod.LCSSeason ON LCSSeasonProductLink.idA3B5 = LCSSeason.idA3masterReference),
       wcprod.ProductSizeCategory,wcprod.SizeCategory,wcprod.FullSizeRange,wcprod.WTPartMaster,wcprod.WTUser CREATOR,wcprod.WTUser MODIFIER,wcprod.FlexType 
        WHERE SizeCategory.idA2A2 = ProductSizeCategoryMaster.idA3A6 AND FullSizeRange.idA2A2 = ProductSizeCategoryMaster.idA3D6 
        AND ProductSizeCategoryMaster.idA2A2 = ProductSizeCategory.idA3masterReference AND ProductSizeCategoryMaster.idA3B6 = WTPartMaster.idA2A2
         AND ProductSizeCategory.idA3D2iterationInfo = CREATOR.idA2A2 AND ProductSizeCategory.idA3B2iterationInfo = MODIFIER.idA2A2 
         AND ProductSizeCategory.idA3A10 = FlexType.idA2A2 AND UPPER(ProductSizeCategoryMaster.sizeCategoryType) = 'INSTANCE' 
         AND ( ProductSizeCategory.idA3A10 = 50392 OR ProductSizeCategory.idA3A10 = 58950 OR ProductSizeCategory.idA3A10 = 1511910 )
          AND ProductSizeCategory.latestiterationInfo = '1' AND ProductSizeCategory.statecheckoutInfo <> 'wrk' 
          AND ( ProdSizeCategoryToSeason.latestiterationInfo = '1' OR ProdSizeCategoryToSeason.latestiterationInfo IS NULL  )
           AND ( ProdSizeCategoryToSeason.statecheckoutInfo <> 'wrk' OR ProdSizeCategoryToSeason.statecheckoutInfo IS NULL  )
              AND ( LCSSeason.latestiterationInfo = '1' OR LCSSeason.latestiterationInfo IS NULL  ) 
               AND ( LCSSeason.statecheckoutInfo <> 'wrk' OR LCSSeason.statecheckoutInfo IS NULL  )   ORDER BY ProductSizeCategoryMaster.name ASC, LCSSeason.att1
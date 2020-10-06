*Imputation for GFR

preserve

misstable summarize gestage_new blength if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength 

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength = gfr_MDRD sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
 *Model 0 Multi Level Modeling with Imputation (2 Levels)
mi estimate: regress gfr_MDRD bwt_std blength gestage_new place_birth if ckd_miss== 0

restore

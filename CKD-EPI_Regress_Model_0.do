*Imputation for GFR CKD-EPI

preserve

misstable summarize gestage_new blength if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength 

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength = gfr_ckd_epi sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
 *Model 0 Regression with Imputation (2 Levels)
mi estimate: regress gfr_ckd_epi bwt_std blength gestage_new place_birth if ckd_miss== 0

restore

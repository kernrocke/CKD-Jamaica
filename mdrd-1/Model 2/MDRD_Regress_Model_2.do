*Imputation for GFR MDRD

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2

 set seed 293900 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 = gfr_MDRD sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 2 Multi Level Modeling with Imputation (2 Levels)
mi estimate: regress gfr_MDRD bwt_std blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 place_birth if ckd_miss== 0

restore

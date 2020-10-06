*Imputation for GFR Schwarz 2009

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2

 set seed 293900 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 (regress) ageatbrth (ologit) edcat3 (ologit) occ_cat_mom1a (logit) htn_preg (logit) smoker = gfr_SW sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 3 Multi Level Modeling with Imputation (2 Levels)
mi estimate: regress gfr_SW bwt_std blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker place_birth if ckd_miss== 0

restore

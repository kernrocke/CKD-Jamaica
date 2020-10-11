*Imputation for GFR

preserve

misstable summarize gestage_new blength preterm bmi own_education own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker mn23sbp2 mn23dbp2 q115chol q116fat fastglu q47smok1 if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker q115chol q116fat fastglu  

 set seed 29390 
 
 mi impute  chained (regress) gestage_new (regress) blength (logit) preterm (regress) bmi (ologit) own_occup_cat2 (regress) ageatbrth (ologit) edcat3 (ologit) occ_cat_mom1a (logit) htn_preg (logit) smoker (regress) q115chol (regress) q116fat (regress) fastglu  = gfr_ckd_epi sex_new q112age bwt_std  if ckd_miss == 0, add(20)
 
 *Model 0 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

*Model 1 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age  if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

*Model 2 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

*Model 3 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

*Model 5 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23sbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

*Model 5 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || place_birth :,  covariance(independent) vce(robust) 

 restore
 

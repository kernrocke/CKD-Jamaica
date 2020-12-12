*Imputation for Albumin

preserve

misstable summarize gestage_new blength preterm bmi own_education own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker mn23sbp2 mn23dbp2 q115chol q116fat fastglu q47smok1 if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker q115chol q116fat fastglu  

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) q115chol (regress) q116fat (regress) bmi (regress) fastglu (regress) ageatbrth (logit, augment) htn_preg (logit, augment) smoker (ologit, augment) own_occup_cat2  (ologit, augment) edcat3 (ologit, augment) occ_cat_mom1a = log_alb sex_new q112age bwt_std  if ckd_miss== 0, add(3) force
 
 *Model 0 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 

*Model 1 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new i.sex_new q112age  if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 

*Model 2 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 

*Model 3 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 

*Model 4 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23sbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 

*Model 5 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed log_alb bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(independent) vce(robust) 
  

 restore

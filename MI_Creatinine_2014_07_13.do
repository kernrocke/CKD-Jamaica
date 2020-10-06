***Multiple Imputation for Creatinine***

*Model 0

preserve

misstable summarize gestage_new blength if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength 

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
 *Model 0 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity) 

restore
********************************************************************************

*Model 1

preserve

misstable summarize gestage_new blength if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength 

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 1 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new i.sex_new q112age  if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************

*Model 2

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 2 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************

*Model 3

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2 ageatbrth edcat3 occ_cat_mom1a htn_preg smoker

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 (regress) ageatbrth (ologit) edcat3 (ologit) occ_cat_mom1a (logit) htn_preg (logit, augment) smoker = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 3 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************

*Model 4

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 mn23sbp2 q115chol q116fat fastglu q47smok1  if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2 mn23sbp2 q115chol q116fat fastglu q47smok1

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 (regress) mn23sbp2 (regress) q115chol (regress) q116fat (regress) fastglu (logit) q47smok1 = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 4 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23sbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************

*Model 5

preserve

misstable summarize gestage_new blength bmi own_education own_occup_cat2 mn23dbp2 q115chol q116fat fastglu q47smok1  if ckd_miss==0

mi set mlong

 mi register imputed  gestage_new blength preterm bmi own_education own_occup_cat2 mn23dbp2 q115chol q116fat fastglu q47smok1

 set seed 29390 
 
 mi impute chained (regress) gestage_new (regress) blength (regress) bmi (ologit) own_education (ologit) own_occup_cat2 (regress) mn23dbp2 (regress) q115chol (regress) q116fat (regress) fastglu (logit) q47smok1 = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 5 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed q1117cre bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************

*Model 6

preserve

misstable summarize gestage_new own_education mn23sbp2 mn23dbp2 q115chol q116fat edcat3 occ_cat_mom1a if ckd_miss==0

mi set mlong

 mi register imputed gestage_new own_education mn23sbp2 mn23dbp2 q115chol q116fat edcat3 occ_cat_mom1a

 set seed 29390 
 
 mi impute chained (regress) gestage_new (ologit) own_education (regress)  mn23sbp2 (regress) mn23dbp2 (regress) q115chol (regress) q116fat (ologit) edcat3 (ologit) occ_cat_mom1a = q1117cre sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Model 6 Multi Level Modeling with Imputation (2 Levels)-Final Model
mi estimate: xtmixed q1117cre bwt_std gestage_new i.sex_new q112age i.own_education mn23sbp2 mn23dbp2 q115chol q116fat i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
****************************************************************************************************************************************************************


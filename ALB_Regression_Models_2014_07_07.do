*Regression Models for Albumin

*****Model 0- No Imputation******

*Model 0- No Multi Level Modeling 
regress alb_v g6a blength if singleton==1
regress alb_v bwt_std blength if singleton==1

*Model 0 Multi Level Modeling (2 Levels)
xtmixed alb_v g6a blength if singleton==1, || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength if singleton==1, || hospital_type~w :, covariance(independent) vce(robust)

*Model 0 Multi Level Modeling (3 Levels)
xtmixed alb_v g6a blength if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 0- Multiple Imputation******

*Model 0- Multiple Imputation No Multi Level Modeling
mi estimate: regress alb_v g6a blength if singleton==1
mi estimate: regress alb_v bwt_std blength if singleton==1

*Model 0 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed alb_v g6a blength if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 0 Multi Level Modeling with Imputation (3 Levels)
mi estimate: xtmixed alb_v g6a blength if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 1- No Imputation******

*Model 1- No Multi Level Modeling 
regress alb_v g6a blength i.sex_new q112age  if singleton==1
regress alb_v bwt_std blength i.sex_new q112age  if singleton==1

*Model 1 Multi Level Modeling (2 Levels)
xtmixed alb_v g6a blength i.sex_new q112age if singleton==1 , || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age if singleton==1 , || hospital_type~w :, covariance(independent) vce(robust) 

*Model 1 Multi Level Modeling (3 Levels)
xtmixed alb_v g6a blength i.sex_new q112age if singleton==1 ,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age if singleton==1 , || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 1- Multiple Imputation******

*Model 1- Multiple Imputation No Multi Level Modeling
mi estimate: regress alb_v g6a blength  i.sex_new q112age  if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age  if singleton==1

*Model 1 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age  if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age  if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 1 Multi Level Modeling with Imputation (3 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age  if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age  if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)



*****Model 2- No Imputation******

*Model 2- No Multi Level Modeling 
regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1
regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1

regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1
regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1

*Model 2 Multi Level Modeling (2 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 2 Multi Level Modeling (3 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 2- Multiple Imputation******

*Model 2- Multiple Imputation No Multi Level Modeling
mi estimate: regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1

mi estimate: regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1

*Model 2 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 2 Multi Level Modeling with Imputation (3 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 3- No Imputation******

*Model 3- No Multi Level Modeling 
regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1
regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1

regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1
regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1

*Model 3 Multi Level Modeling (2 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 3 Multi Level Modeling (3 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 3- Multiple Imputation******

*Model 3- Multiple Imputation No Multi Level Modeling
mi estimate: regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1

mi estimate: regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1

*Model 3 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 3 Multi Level Modeling with Imputation (3 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.pretermageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 4- No Imputation******

*Model 4- No Multi Level Modeling 
regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1
regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1

regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1
regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1

*Model 4 Multi Level Modeling (2 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 4 Multi Level Modeling (3 Levels)
xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


*****Model 4- Multiple Imputation******

*Model 4- Multiple Imputation No Multi Level Modeling
mi estimate: regress alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1

mi estimate: regress alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1
mi estimate: regress alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1

*Model 4 Multi Level Modeling with Imputation (2 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || hospital_type~w :, covariance(independent) vce(robust) 

*Model 4 Multi Level Modeling with Imputation (3 Levels)
mi estimate: xtmixed alb_v g6a blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1, || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age bmi i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)

mi estimate: xtmixed alb_v g6a blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)
mi estimate: xtmixed alb_v bwt_std blength i.sex_new q112age i.overwt i.own_education i.own_occup_cat2 i.preterm mn23sbp2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if singleton==1,  || parish_cat4:, covariance(independent)  || hospital_type~w :, covariance(independent) vce(robust)


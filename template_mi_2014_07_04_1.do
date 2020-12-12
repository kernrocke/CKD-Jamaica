mi set M = 0
 mi set mlong
 mi unregister    gfr_ckd_epi
 mi register imputed  gfr_ckd_epi
 set seed 29390
 mi impute regress gfr_ckd_epi =   sex_new q112age   if singleton == 1, add(2) noisily force
  mi impute regress gfr_ckd_epi =   sex_new q112age   if singleton == 1, add(2)  
 mi estimate: regress  gfr_ckd_epi  mn23sbp2 sex_new q112age g6a if singleton == 1
 /*
 mi estimate: regress  mn23sbp2 bwt_std i.sex_new gestage_new q112age bmi if include2 ==1
 

 
 ** Model a2 bwt, gender, BP gestational age, current age, bmi - multi-level (2 levels - participant + parish of birth
 
 mi estimate: xtmixed  mn23sbp2 bwt_std i.sex_new gestage_new q112age  if include2 ==1 || parish_cat4:,  covariance(independent)
 mi estimate: xtmixed  mn23sbp2 bwt_std i.sex_new gestage_new q112age bmi  if include2 ==1 || parish_cat4:,  covariance(independent)
 
 ** Model a2 bwt, gender, BP gestational age, current age, bmi - multi-level (3 levels - participant + parish of birth + place of birth
 
 mi estimate: xtmixed  mn23sbp2 bwt_std i.sex_new gestage_new q112age  if include2 ==1 || parish_cat4:,  covariance(independent)|| place_birth: , covariance(independent)
 mi estimate: xtmixed  mn23sbp2 bwt_std i.sex_new gestage_new q112age bmi if include2 ==1 || parish_cat4:, covariance(independent) || place_birth: , covariance(independent)

*******Creation of Multiple Imputations for GFR and Albumin



*GFR Imuputation

mi set M = 0
 mi set mlong
 mi unregister    gfr_ckd_epi
 mi register imputed  gfr_ckd_epi
 set seed 29390
 mi impute regress gfr_ckd_epi =   sex_new q112age   if singleton == 1, add(20) noisily

 
 *Albumin Imputation
 
 mi set M = 0
 mi set mlong
 mi unregister    alb_v
 mi register imputed  alb_v
 set seed 29390
 mi impute regress alb_v =   sex_new q112age   if singleton == 1, add(20) noisily 

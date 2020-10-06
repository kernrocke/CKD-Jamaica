** Model a2 - a1 bwt, gender, BP,  gestational age, birth length, parity with imputed values - 2 level
 ***Results for Model 1 Table 2****
 preserve
 misstable summarize gestage_new blength parity_new  if include2 ==1 // information on number of missing values in each variable 
 mi set mlong
 mi register imputed  gestage_new blength parity_new //register values as imputed
 set seed 29390 // starts at set point
 
 //Imputation step - missising values imputed 
 mi impute  chained (regress) gestage_new  (regress) blength (ologit) parity_new = mn23sbp2 sex_new q112age bwt_std  if include2 == 1, add(20)
 
 // estimation step - analyses performed.// Does not need to be sex specific 
 mi estimate: xtmixed  mn23sbp2 bwt_std gestage_new blength parity_new  if include2 ==1 & sex_new==0 || place_birth :,  covariance(independent)
 mi estimate: xtmixed  mn23sbp2 bwt_std gestage_new blength parity_new  if include2 ==1 & sex_new==1 || place_birth :,  covariance(independent)
 
 restore
 
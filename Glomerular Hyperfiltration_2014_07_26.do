*Creating Glomerular Hyperfiltration Variable
gen hyper_g=.
replace hyper_g= gfr_lyon
recode hyper_g (min/149.44444=0) (149.44445/max=1) (.=.)
label var hyper_g "Glomerular Hyperfiltration"
label define hyper_g 0"No" 1"Yes
label value hyper_g hyper_g

*Multiple Imputation for Glomerular Hyperfiltration
preserve

misstable summarize  edcat3 occ_cat_mom1a  if ckd_miss==0

mi set mlong

 mi register imputed  edcat3 occ_cat_mom1a 

 set seed 29390 
 
 mi impute  chained (ologit)edcat3 (ologit) occ_cat_mom1a  = hyper_g sex_new q112age bwt_std  if ckd_miss== 0, add(20) 
 
*Glomerular Hyperfiltration Multi Level Modeling with Imputation (2 Levels)- Final Model
mi estimate, or: meqrlogit hyper_g bwt_std i.sex_new q112age  i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

restore
********************************************************************************


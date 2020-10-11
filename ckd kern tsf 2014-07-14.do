use "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-11].dta", clear
use13 "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-11].dta", clear
hist gfr_SW
hist log_GFR_SW
hist alb_v
hist log_alb
sum alb_v
sum alb_v, d
browse alb_v
tab micro_alb
sum gfr_SW, detail
count if gfr_SW <68.04614
count if gfr_SW <60
count if gfr_SW <60 | micro_alb ==1
dis exp(-.0084517 )
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
tab own_edu
tab own_edu, nolabel
xtmixed log_GFR_SW bwt_std i.sex_new q112age i.own_education mn23dbp2 q115chol q116fat i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)
est store A
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 q115chol q116fat i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

est store B
lrtest A B
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 q115chol q116fat  i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

est store C
lrtest B C
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 q115chol q116fat  i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 q115chol q116fat i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)

impute q115chol log_GFR_SW bwt_std, gen(i_q115chol)
drop _est_A _est_B _est_C
save "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-14].dta"
impute edcat3 log_GFR_SW bwt_std, gen(i_edcat3)
tab edcat3 i_edcat3
tab edcat3
tab  i_edcat3
sum  i_edcat3
gen edcat3_m = edcat3
tab edcat3_m
recode edcat3_m .=4
tab edcat3_m
impute  q116fat  log_GFR_SW bwt_std, gen(i_ q116fat )
impute  q116fat  log_GFR_SW bwt_std, gen(i_q116fat )
gen occ_cat_mom1a_m = occ_cat_mom1a
tab oc occ_cat_mom1a
tab occ_cat_mom1a
tab occ_cat_mom1a, nolab
recode occ_cat_mom1a_m .=5
drop i_edcat3
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 i_q115chol i_q116fat i.edcat3_m i.occ_cat_mom1a_m if ckd_miss== 0, || place_birth :,  covariance(identity)
est store A
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 i_q115chol i_q116fat  i.occ_cat_mom1a_m if ckd_miss== 0, || place_birth :,  covariance(identity)

est store B
lrtest A B
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
est store C
lrtest A C
lrtest B C
corr mn23sbp2 mn23dbp2
xtmixed log_GFR_SW bwt_std i.sex_new q112age mn23sbp2 mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
est store D
lrtest C D
dis exp(.0112674)
dis exp( -.3031994 )
xtmixed log_GFR_SW bwt_std i.sex_new q112age bmi mn23sbp2 mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
lookfor height
xtmixed log_GFR_SW bwt_std i.sex_new q112age q72hgt mn23sbp2 mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)

drop _est_A _est_B _est_C _est_D
prop micro_alb, over(sex)
prop micro_alb, over(own_education)
test [Yes]_subpop_1= [Yes]secondary = [Yes]_subpop_3
test [Yes]_subpop_1= [Yes]secondary
save "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-14].dta", replace
exit, clear
use "C:\Users\Trevor\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-14].dta", clear
impute edcat3 log_GFR_SW bwt_std, gen(i_edcat3)
gen i_edcat3r = round(i_edcat3, 1)
sum i_edcat3r i_edcat3
tab i_edcat3r
tab edcat3
browse i_edcat3
drop i_edcat3r i_edcat3
exit, clear

xtmixed log_gfr_lyon bwt_std gestage_new i.sex_new q112age bmi i.own_education mn23sbp2 mn23dbp2 q115chol q116fat i.edcat3 i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon bwt_std if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
lookfor i_gestage_new
xtmixed log_gfr_lyon bwt_std i_gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
misstable summ bmi
misstable summ bmi if ckd_miss==0
impute bmi log_gfr_lyon q112age sex_new bwt_std, gen(i_bmi)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
impute own_education log_gfr_lyon q112age sex_new bwt_std, gen(i_own_education)
tab i_own_education
impute edcat3 log_GFR_SW bwt_std, gen(i_edcat3)
gen i_edcat3r = round(i_edcat3, 1)
gen i_own_educationr = round(i_own_education , 1)
drop i_edcat3 i_edcat3r
tab i_own_educationr
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
impute mn23sbp2 log_gfr_lyon q112age sex_new bwt_std, gen(i_mn23sbp2)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
impute mn23dbp2 log_gfr_lyon q112age sex_new bwt_std, gen(i_mn23dbp2)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
misstable summ q115chol if ckd_miss==0
lookfor i_q115chol
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store C
lrtest B C
drop _est_A _est_B _est_C
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
drop i_own_education i_own_educationr
impute own_education log_gfr_lyon q112age sex_new bwt_std, gen(i_own_education)
gen i_own_educationr = round(i_own_education , 1)
impute edcat3 log_gfr_lyon q112age sex_new bwt_std, gen(i_edcat3)
gen i_edcat3r = round(i_edcat3 , 1)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat i_edcat3r if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat i_edcat3r if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
impute occ_cat_mom1a log_gfr_lyon q112age sex_new bwt_std, gen(i_occ_cat_mom1a)
gen i_occ_cat_mom1ar = round(i_occ_cat_mom1a , 1)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat i_edcat3r i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age i_bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_own_education if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 i_q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store A
lookfor chol
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 i_q116fat i_q115chol if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 i_q116fat i_edcat3r if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
xtmixed log_alb bwt_std  i_gestage_new sex_new q112age bmi i_mn23sbp2 i_mn23dbp2 i_q116fat i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
estimates store B
lrtest A B
drop _est_A _est_B
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age sex_new#c.i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat i_edcat3r i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb bwt_std gestage_new i.sex_new q112age bmi sex_new#c.i_own_educationr mn23sbp2 mn23dbp2 q116fat  if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon bwt_std i_gestage_new sex_new q112age i_own_educationr i_bmi i_mn23sbp2 i_mn23dbp2 i_q115chol i_q116fat i_edcat3r i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon bwt_std sex_new#c.i_gestage_new sex_new sex_new#c.q112age sex_new#c.i_own_educationr sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol sex_new#c.i_q116fat sex_new#c.i_edcat3r sex_new#c.i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.i_gestage_new sex_new#c.q112age sex_new#c.i_own_educationr sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol sex_new#c.i_q116fat sex_new#c.i_edcat3r sex_new#c.i_occ_cat_mom1ar
xtmixed log_alb bwt_std sex_new#c.i_gestage_new i.sex_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q116fat  if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.i_gestage_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q116fat
xtmixed log_alb sex_new#c.bwt_std sex_new#c.i_gestage_new i.sex_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q116fat  if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.i_gestage_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q116fat
xtmixed q1117cre sex_new#c.bwt_std sex_new#c.i_gestage_new i.sex_new sex_new#c.q112age sex_new#c.i_own_educationr sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol sex_new#c.i_q116fat sex_new#c.i_edcat3r sex_new#c.i_occ_cat_mom1ar if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.i_gestage_new sex_new#c.q112age sex_new#c.i_own_educationr sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol sex_new#c.i_q116fat sex_new#c.i_edcat3r sex_new#c.i_occ_cat_mom1ar
impute fastglu log_gfr_lyon q112age sex_new bwt_std, gen(i_fastglu)
melogit micro_alb bwt_std i.sex_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_fastglu sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol if ckd_miss== 0, || place_birth :,  covariance(identity) or
melogit micro_alb sex_new#c.bwt_std i.sex_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_fastglu sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol if ckd_miss== 0, || place_birth :,  covariance(identity) or
contrast sex_new#c.bwt_std sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_fastglu sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol
melogit ckd_kdigo sex_new#c.bwt_std i.sex_new sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_fastglu sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol if ckd_miss== 0, || place_birth :,  covariance(identity) or
contrast sex_new#c.bwt_std sex_new#c.q112age sex_new#c.i_bmi sex_new#c.i_fastglu sex_new#c.i_mn23sbp2 sex_new#c.i_mn23dbp2 sex_new#c.i_q115chol

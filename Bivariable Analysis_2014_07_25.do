*******Bivariable Analysis Table 7**********

**log eGFR

xtmixed log_gfr_lyon bwt_std if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_gfr_lyon blength if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_gfr_lyon gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_gfr_lyon i.sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon q112age  if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.own_education if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon ageatbrth if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.edcat3 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.htn_preg if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon q115chol if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon fastglu if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_gfr_lyon i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)

********************************************************************************


**Log Albumin

xtmixed log_alb bwt_std if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_alb blength if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_alb gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity) 
xtmixed log_alb i.sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb q112age  if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.own_education if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb ageatbrth if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.edcat3 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.htn_preg if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb q115chol if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb fastglu if ckd_miss== 0, || place_birth :,  covariance(identity)
xtmixed log_alb i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)

********************************************************************************

**CKD

melogit ckd_kdigo bwt_std if ckd_miss== 0, || place_birth :,  covariance(identity) 
melogit ckd_kdigo blength if ckd_miss== 0, || place_birth :,  covariance(identity) 
melogit ckd_kdigo gestage_new if ckd_miss== 0, || place_birth :,  covariance(identity) 
melogit ckd_kdigo i.sex_new if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo q112age  if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo bmi if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.own_education if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo ageatbrth if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.edcat3 if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.occ_cat_mom1a if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.htn_preg if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo mn23sbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo mn23dbp2 if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo q115chol if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo q116fat if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo fastglu if ckd_miss== 0, || place_birth :,  covariance(identity)
melogit ckd_kdigo i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)

********************************************************************************

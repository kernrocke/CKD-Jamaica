*Linear Regression for GFR

regress gfr_ckd_epi g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1
regress log_gfr g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1

*Logistic Regression for GFR using Quintiles and Low/Normal Renal Function based on Quintiles

logistic quin_gfr g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1
logistic quin_gfr2 g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1

*Linear Regresssion for Albumin

regress alb_v g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1
regress log_alb g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1

*Logistic Regression for Albuminuria

logistic micro_alb g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1

*Forward and Backward Stepwise Regression for GFR
*Linear
stepwise, pe(0.2): regress gfr_ckd_epi g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): regress gfr_ckd_epi g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

stepwise, pe(0.2): regress log_gfr g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): regress log_gfr g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

*Logistic
stepwise, pe(0.2): logistic quin_gfr g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): logistic quin_gfr g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

stepwise, pe(0.2): logistic quin_gfr2 g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): logistic quin_gfr2 g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

*Forward and Backward Stepwise Regression for Albumin
*Linear
stepwise, pe(0.2): regress alb_v g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): regress alb_v g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

stepwise, pe(0.2): regress log_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): regress log_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

*Logistic
stepwise, pe(0.2): logistic micro_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): logistic micro_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1

stepwise, pe(0.2): logistic micro_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1
stepwise, pr(0.2): logistic micro_alb g6a blength gestage_new ponderal_index lowbwt bmi overwt waist_hip sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  smoker ageatbrth own_education occ_cat_mom1a own_occup_cat2 if singleton==1



*Relationship between GFR and Birth Weight Categories 

regress gfr_ckd_epi i.bwt_500a if singleton==1
regress log_gfr i.bwt_500a if singleton==1

*Relationship between Albumin and Birth Weight Categories 

regress alb_v i.bwt_500a if singleton==1
regress log_alb i.bwt_500a if singleton==1

*Multi-Level Model after imputation on gfr (2 levels- Participant + Hospital Type Recoded)

mi estimate: xtmixed gfr_ckd_epi g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1 || hospital_type~w:, covariance(independent)

*Multi-Level Model after imputation on gfr (3 levels- Participant + Hospital Type Recoded + Parish Categories)

mi estimate: xtmixed gfr_ckd_epi g6a bwt_std blength gestage_new ponderal_index i.lowbwt bmi i.overwt waist_hip i.sex_new q112age mn23sbp mn23dbp  q111glu q115chol q116fat  i.smoker ageatbrth i.own_education i.occ_cat_mom1a i.own_occup_cat2 if singleton==1 || hospital_type~w:, covariance(independent) || parish_cat4:, covariance(independent)


*gfr_ckd_epi

regress gfr_ckd_epi g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1
stepwise, pe(0.2): regress gfr_ckd_epi g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1
stepwise, pr(0.2): regress gfr_ckd_epi g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1
xtreg gfr_ckd_epi g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1, re 
xtmixed gfr_ckd_epi g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1 || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
logistic quin_gfr g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1
xtlogit quin_gfr g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)
xtlogit quin_gfr g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)or
logistic quin_gfr2 g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1
xtlogit quin_gfr2 g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)
xtlogit quin_gfr2 g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)or


*alb_v

regress alb_v g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1
stepwise, pe(0.2): regress alb_v g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1
stepwise, pr(0.2): regress alb_v g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1
xtreg alb_v g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1, re
xtmixed alb_v g6a blength lowbwt sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat overwt if singleton==1 || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
logistic micro_alb g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1
xtlogit micro_alb g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)
xtlogit micro_alb g6a blength i.lowbwt i.sex_new q112age bmi waist_hip mn23sbp mn23dbp fastglu q115chol q116fat i.overwt if singleton==1, vce(robust)or


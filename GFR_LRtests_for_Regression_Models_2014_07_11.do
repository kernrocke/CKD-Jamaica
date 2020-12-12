*Likelihood Tests for each model

xtmixed gfr_ckd_epi bwt_std  if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep blength

xtmixed gfr_ckd_epi bwt_std blength if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength gestage_new if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep gestage_new

xtmixed gfr_ckd_epi bwt_std blength gestage_new if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep sex_new

xtmixed gfr_ckd_epi bwt_std blength gestage_new sex_new if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age  if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep q112age

xtmixed gfr_ckd_epi bwt_std blength gestage_new sex_new q112age if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age bmi if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep bmi

xtmixed gfr_ckd_epi bwt_std blength gestage_new sex_new q112age bmi if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep i.own_education i.own_occup_cat2

xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 ageatbrth i.edcat3 i.occ_cat_mom1a i.htn_preg i.smoker if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep model 3

xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23sbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep model 4

xtmixed gfr_ckd_epi bwt_std  blength gestage_new sex_new q112age bmi i.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store A
xtmixed gfr_ckd_epi bwt_std blength gestage_new i.sex_new q112age bmi i.own_education i.own_occup_cat2 mn23dbp2 q115chol q116fat fastglu i.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(independent)vce(robust)
estimates store B
lrtest A B, force
drop _est_A _est_B

*keep model 5

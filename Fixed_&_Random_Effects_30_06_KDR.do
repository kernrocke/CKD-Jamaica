scatter gfr_ckd_epi
scatter gfr_ckd_epi q112hae1
pwcorr gfr_ckd_epi q112hae1 if singleton==1, obs sig
lookfor hosp
tab hosptype
tab hospital_type~w
tab hospital_type~w
tab hospital_type
xtreg gfr_ckd_epi , i(hospital_type)
xttest0
xt reg gfr_ckd_epi g6a, fe
xtreg gfr_ckd_epi g6a, fe
estimates store fixed
xtreg gfr_ckd_epi g6a, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi bwt_std if singleton==1, fe
xtreg gfr_ckd_epi g6a if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi g6a if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi bwt_std if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi bwt_std if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi blength if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi blength if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi gestage_new if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi gestage_new if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi ponderal_index if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi ponderal_index if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random
xtreg gfr_ckd_epi , i(hospital_type)
xtmixed: gfr_ckd_epi if singleton==1 || hospital_type:
xtmixed gfr_ckd_epi if singleton==1 || hospital_type:
xtmixed gfr_ckd_epi if singleton==1 || hospital_type~w :

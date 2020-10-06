*Hausman Fixed and Random Effects test for birth weight

xtreg gfr_ckd_epi g6a if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi g6a if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

xtreg alb_v g6a if singleton==1, fe
estimates store fixed
xtreg alb_v g6a if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

*Hausman Fixed and Random Effects test for standardized birth weight

xtreg gfr_ckd_epi bwt_std if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi bwt_std if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

xtreg alb_v bwt_std if singleton==1, fe
estimates store fixed
xtreg alb_v bwt_std if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

*Hausman Fixed and Random Effects test for birth length

xtreg gfr_ckd_epi blength if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi blength if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

xtreg alb_v blength if singleton==1, fe
estimates store fixed
xtreg alb_v blength if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

*Hausman Fixed and Random Effects test for gestational age

xtreg gfr_ckd_epi gestage_new if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi gestage_new if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

xtreg alb_v gestage_new if singleton==1, fe
estimates store fixed
xtreg alb_v gestage_new if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

*Hausman Fixed and Random Effects test for ponderal index

xtreg gfr_ckd_epi ponderal_index if singleton==1, fe
estimates store fixed
xtreg gfr_ckd_epi ponderal_index if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

xtreg alb_v ponderal_index if singleton==1, fe
estimates store fixed
xtreg alb_v ponderal_index if singleton==1, re
estimates store random
hausman fixed random
drop _est_fixed _est_random

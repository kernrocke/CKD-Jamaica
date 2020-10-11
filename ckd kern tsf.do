use "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[2014_01_09][No Names][Match2014_902only] (2).dta", clear
xtmixed  bwt_std   if include2 ==1 || place_birth:,  covariance(independent)
xtmixed  bwt_std   if include2 ==1 || place_birth:,  covariance(identity) robust

xtmixed  bwt_std mn23sbp2  if include2 ==1 || place_birth:,  covariance(identity) robust

xtmixed  bwt_std mn23sbp2  if include2 ==1 || place_birth:,  covariance(identity)
do "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Renal_Function.do"
xtmixed gfr_ckd_epi, || place_birth:

xtmixed bwt_std, || place_birth:
*xtmixed bwt_std  || place_birth:
lookfor include1
tab singleton
notes include2
xtmixed bwt_std if singleton==1  || place_birth:
xtset place_birth
xtreg: bwt_std if singleton==1
xtreg bwt_std if singleton==1
xset0
xttest0
xtreg gfr_ckd_epi if singleton==1
xttest0
anova bwt_std place_birth
count if g6a !=. & singleton !=. & q1117cre !=. & alb_v !=.
count if g6a !=. & singleton !=. & q1117cre !=. & alb_v !=.
count if g6a !=. & singleton !=. & alb_v !=.
count if gfr_ckd_epi <60
tab micro_alb
tab micro_alb_new
gen ckd_miss = .
drop ckd_miss = .
drop ckd_miss
egen ckd_miss = rowmiss(g6a singleton q1117cre alb_v)
tab ckd_miss
save "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-07].dta"
recode ckd_miss 1/4=1
tab ckd_miss
ttest g6a, by(ckd_miss)
histogram gfr_ckd_epi
histogram gfr_ckd_epi, normal
gladder
gladder gfr_ckd_epi
ladder
ladder gfr_ckd_epi
gladder alb_v
regress gfr_ckd_epi bwt_std
tab lowbwt
sdtest gfr_ckd_epi lowbwt if ckd_miss==0, by(sex_new)
sdtest gfr_ckd_epi  if ckd_miss==0, by(lowbwt)
ttest gfr_ckd_epi  if ckd_miss==0, by(lowbwt)
sampsi 143.2 140.2 , p(0.8) r(2) sd1(21.6) sd2(23.2)
sampsi 143.2 140.2 , p(0.8) sd1(21.6) sd2(23.2)
sampsi 143.2 140.2 , p(0.8) r(5) sd1(21.6) sd2(23.2)
dis 143.1887 -  21.57855
sampsi 143.2 121.61015 , p(0.8) r(10) sd1(21.6) sd2(23.2)
sampsi 121.61015 143.2  , p(0.8) r(10) sd1(23.2) sd2(21.6)
sampsi 143.2 131.61015 , p(0.8) r(10) sd1(21.6) sd2(23.2)
sampsi 143.2 121.61015 , n1(658) n2(57) sd1(21.6) sd2(23.2)
sampsi 143.2 138 , n1(658) n2(57) sd1(21.6) sd2(23.2)
sampsi 143.2 133 , n1(658) n2(57) sd1(21.6) sd2(23.2)
regress gfr_ckd_epi bwt_std if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new if ckd_miss==0
regress gfr_ckd_epi c.bwt_std##sex_new if ckd_miss==0
contrast
contrast sex_new#c.bwt_std
regress gfr_ckd_epi bwt_std sex_new q112age if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new##c.q112age if ckd_miss==0
contrast sex_new#c.q112age
contrast q112age sex_new#c.q112age
contrast c.q112age sex_new#c.q112age
regress gfr_ckd_epi bwt_std sex_new q112age if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new q112age bmi  if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2 if ckd_miss==0
regress log_alb bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2 if ckd_miss==0
tab occ_cat_mom1a
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2 occ_cat_mom1a if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2 i.occ_cat_mom1a if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2 i.edcat3 if ckd_miss==0
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0
regress log_alb bwt_std sex_new q112age bmi  mn23sbp2  if ckd_miss==0
scatter g6a gfr_ckd_epi
scatter g6a gfr_ckd_epi,  || lfit g6a gfr_ckd_epi
xtmixed gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0 || place_birth:
*regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2 mn23dbp2  i.edcat3  if ckd_miss==0
lookfor hospital
tab hospital_type~w
tab hospital_type
anova gfr_ckd_epi hospital_type
xtmixed gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0 || place_birth: mle
xtmixed gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0 || place_birth: , mle
est store A
regress gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0
est B
est store B
lrtest A B
xtmixed gfr_ckd_epi bwt_std sex_new q112age bmi  mn23sbp2  i.occ_cat_mom1a if ckd_miss==0 || place_birth: , mle robust
drop _est_A _est_B
save "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-07].dta", replace
exit, clear

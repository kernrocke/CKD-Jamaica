log using "C:\Users\Kern\Desktop\Project_Analysis_23_06_2014_KDR.log"
use "C:\Users\Kern\Desktop\Perinatal_fu_1820_Merged834matched_03Apr2013[2014_01_09][No Names][Match2014_902only] (2).dta", clear
bysort singleton: tabstat g6a weight_c blength bwt_std gestage_new gestage pond_ind ponderal_index, by(sex_new) stat(mean sd)
proportion lowbwt, over(singleton sex_new)
proportion preterm, over(singleton sex_new)
proportion parish_cat4 , over(singleton sex_new)
tab lowbwt sex_new, chi2
tab preterm sex_new, chi2
tab parish_cat4 sex_new, chi2
bysort singleton: ttest q112age, by(lowbwt)
bysort singleton: ttest q72hgt, by(lowbwt)
bysort singleton: ttest q71wgt, by(lowbwt)
bysort singleton: ttest bmi, by(lowbwt)
bysort singleton: ttest mn23sbp, by(lowbwt)
bysort singleton: ttest  mn23dbp, by(lowbwt)
bysort singleton: ttest q111glu, by(lowbwt)
bysort singleton: ttest q115chol , by(lowbwt)
bysort singleton: ttest q116fat , by(lowbwt)
bysort singleton: ttest q1124alb  , by(lowbwt)
bysort singleton: ttest q1117cre  , by(lowbwt)
bysort singleton: ttest gfr_ckd_epi, by(lowbwt)
bysort singleton: ttest q112age, by(sex_new)
bysort singleton: ttest q72hgt, by(sex_new)
bysort singleton: ttest q71wgt, by(sex_new)
bysort singleton: ttest bmi, by(sex_new)
bysort singleton: ttest mn23sbp, by(sex_new)
bysort singleton: ttest  mn23dbp, by(sex_new)
bysort singleton: ttest q111glu, by(sex_new)
bysort singleton: ttest q115chol , by(sex_new)
bysort singleton: ttest q116fat , by(sex_new)
bysort singleton: ttest q1124alb  , by(sex_new)
bysort singleton: ttest q1117cre  , by(sex_new)
bysort singleton: ttest gfr_ckd_epi, by(sex_new)
proportion own_education , over(singleton lowbwt)
proportion own_education , over(singleton sex_new)
proportion own_education , over(singleton)
proportion own_occup_cat2  , over(singleton sex_new)
proportion own_occup_cat2  , over(singleton lowbwt)
proportion own_occup_cat2, over(singleton)
proportion q47smok1  , over(singleton lowbwt)
proportion q47smok1  , over(singleton sex_new)
proportion q47smok1  , over(singleton)
proportion hypert_new, over(singleton sex_new)
proportion hypert_new, over(singleton lowbwt)
proportion hypert_new, over(singleton)
proportion overwt, over(singleton sex_new)
proportion overwt, over(singleton lowbwt)
proportion overwt, over(singleton)
proportion micro_alb , over(singleton lowbwt)
proportion micro_alb , over(singleton sex_new)
proportion micro_alb , over(singleton)
tab own_education sex_new, chi2
tab own_occup_cat2 sex_new, chi2
tab q47smok1 sex_new, chi2
tab hypert_new sex_new, chi2
tab overwt sex_new, chi2
tab micro_alb sex_new, chi2
tab own_education lowbwt, chi2
tab own_occup_cat2 lowbwt, chi2
tab q47smok1 lowbwt, chi2
tab hypert_new lowbwt, chi2
tab overwt lowbwt, chi2
tab micro_alb lowbwt, chi2
bysort singleton: ttest ageatbrth, by(lowbwt)
bysort singleton: ttest ageatbrth, by(sex_new)
bysort singleton: ttest mat_height, by(lowbwt)
bysort singleton: ttest mat_height, by(sex_new)
proportion htn_preg , over(singleton lowbwt)
proportion htn_preg , over(singleton sex_new)
proportion htn_preg , over(singleton)
proportion occ_cat_mom1a , over(singleton lowbwt)
proportion occ_cat_mom1a , over(singleton sex_new)
proportion occ_cat_mom1a , over(singleton)
proportion edcat3 , over(singleton lowbwt)
proportion edcat3 , over(singleton sex_new)
proportion edcat3 , over(singleton)
tab htn_preg lowbwt, chi2
tab occ_cat_mom1a lowbwt, chi2
tab edcat3 lowbwt, chi2
tab htn_preg sex_new, chi2
tab occ_cat_mom1a sex_new, chi2
ttest g6a, by( gfr_missing)
ttest g6a, by( alb_missing)
ttest weight_c, by( gfr_missing)
ttest weight_c, by( alb_missing)
ttest blength, by( gfr_missing)
ttest blength, by( alb_missing)
ttest bwt_std , by( gfr_missing)
ttest bwt_std , by( alb_missing)
ttest gestage_new  , by( gfr_missing)
ttest gestage_new  , by( alb_missing)
ttest ponderal_index  , by( gfr_missing)
ttest ponderal_index  , by( alb_missing)
*Independant t-test analysis for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation.
ranksum g6a, by( gfr_missing)
median g6a, by( gfr_missing) exact
ranksum g6a, by( alb_missing)
median g6a, by( alb_missing) exact
ranksum weight_c, by( gfr_missing)
median weight_c, by( gfr_missing) exact
ranksum weight_c, by( alb_missing)
median weight_c, by( alb_missing) exact
ranksum blength, by( gfr_missing)
ranksum blength, by( alb_missing)
median blength, by( gfr_missing) exact
median blength, by( alb_missing) exact
ranksum bwt_std , by( gfr_missing)
ranksum bwt_std , by( alb_missing)
median bwt_std , by( gfr_missing) exact
median bwt_std , by( alb_missing) exact
ranksum gestage_new  , by( gfr_missing)
ranksum gestage_new  , by( alb_missing)
median gestage_new  , by( gfr_missing) exact
median gestage_new  , by( alb_missing) exact
ranksum ponderal_index  , by( gfr_missing)
ranksum ponderal_index  , by( alb_missing)
median ponderal_index  , by( gfr_missing) exact
median ponderal_index  , by( alb_missing) exact
*Mann-Whitney U and Median test for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation. 
pwcorr gfr_ckd_epi log_gfr q1124alb log_alb g6a blength bwt_std gestage_new ponderal_index, obs sig star(.05)
*Pairwise-correlations between primary/ secondary outcomes and explanatory variables.
bysort sex_new: ttest q112age if singleton==1, by(lowbwt)
bysort sex_new: ttest q72hgt if singleton==1, by(lowbwt)
bysort sex_new: ttest q71wgt if singleton==1, by(lowbwt)
bysort sex_new: ttest bmi if singleton==1, by(lowbwt)
bysort sex_new: ttest hipcirc if singleton==1, by(lowbwt)
bysort sex_new: ttest waistcirc2 if singleton==1, by(lowbwt)
bysort sex_new: ttest waist_hip if singleton==1, by(lowbwt)
bysort sex_new: ttest mn23sbp if singleton==1, by(lowbwt)
bysort sex_new: ttest mn23dbp if singleton==1, by(lowbwt)
bysort sex_new: ttest q111glu if singleton==1, by(lowbwt)
bysort sex_new: ttest q115chol if singleton==1, by(lowbwt)
bysort sex_new: ttest q116fat if singleton==1, by(lowbwt)
bysort sex_new: ttest q1117cre if singleton==1, by(lowbwt)
bysort sex_new: ttest q1124alb if singleton==1, by(lowbwt)
bysort sex_new: ttest gfr_ckd_epi if singleton==1, by(lowbwt)
ttest hipcirc if singleton==1, by(lowbwt)
ttest waistcirc2 if singleton==1, by(lowbwt)
ttest waist_hip if singleton==1, by(lowbwt)
bysort sex_new: ranksum q112age if singleton==1, by(lowbwt)
bysort sex_new: ranksum q72hgt if singleton==1, by(lowbwt)
bysort sex_new: ranksum q71wgt if singleton==1, by(lowbwt)
bysort sex_new: ranksum bmi if singleton==1, by(lowbwt)
bysort sex_new: ranksum hipcirc if singleton==1, by(lowbwt)
bysort sex_new: ranksum waistcirc2 if singleton==1, by(lowbwt)
bysort sex_new: ranksum waist_hip if singleton==1, by(lowbwt)
bysort sex_new: ranksum mn23sbp if singleton==1, by(lowbwt)
bysort sex_new: ranksum mn23dbp if singleton==1, by(lowbwt)
bysort sex_new: ranksum q111glu if singleton==1, by(lowbwt)
bysort sex_new: ranksum q115chol if singleton==1, by(lowbwt)
bysort sex_new: ranksum q116fat if singleton==1, by(lowbwt)
bysort sex_new: ranksum q1117cre if singleton==1, by(lowbwt)
bysort sex_new: ranksum q1124alb if singleton==1, by(lowbwt)
bysort sex_new: ranksum gfr_ckd_epi if singleton==1, by(lowbwt)
*Updated Descriptives for Characteristics of Participants 18-20 years
pwcorr q1124alb gfr_ckd_epi log_gfr log_alb g6a_kg bwt_std blength weight_c ageatbrth g6a ponderal_index if singleton==1, obs sig
*Partial Correlation between outcomes (gfr albumin, log gfr and log albumin) and exposures (birth weights, lengths, gestational age and ponderal index).

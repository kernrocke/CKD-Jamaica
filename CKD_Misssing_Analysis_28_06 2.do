*Creation of estimated gfr values using the CKD-EPI Formula (Levy et al. Annals of Int Med 2009; 150 (9): 604-12)
gen gfr_ckd_epi =.
label variable gfr_ckd_epi "GFR using CKD-EPI Formulae"
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-1.209*(0.993)^q112age if sex_new==0 & q1117cre >61.9 & q1117cre !=.
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-0.329*(0.993)^q112age if sex_new==0 & q1117cre <=61.9 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-1.209*(0.993)^q112age if sex_new==1 & q1117cre>79.6 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-0.411*(0.993)^q112age if sex_new==1 & q1117cre <=79.6 & q1117cre !=.
replace gfr_ckd_epi = . if q112age <18

*Creation of Transformed Log GFR values
gen log_gfr= log(gfr_ckd_epi)
label variable log_gfr "Log GFR"

*Creation of Transformed log albumin values.
gen log_alb= log( q1124alb)
label variable log_alb "Log Albumin"

*Creation of Albuminuria variale Yes No and Albuminuria specified by micro and macro albuminuria.
gen micro_alb=.
replace micro_alb= q1124alb
recode micro_alb 0.00/29.99=0 30.00/999.99=1
label variable micro_alb "Albuminuria"
label define micro_alb 0 "No" 1"Yes"
label value micro_alb micro_alb
gen micro_alb_new=.
replace micro_alb_new= q1124alb
recode micro_alb_new 0.00/29.99=0 30.00/300.44=1 300.45/999.99=2
label variable micro_alb_new "Micro & Macro-Albuminuria"
label define micro_alb_new 0 "Normal" 1"Microalbuminuria" 2"Macroalbuminuria"
label values micro_alb_new micro_alb_new

*Creating Binnary Variables for missing and non missing gfr and albumin values as basis for further analysis for missing at random for multiple imputation.
gen gfr_missing=.
label variable gfr_missing "Missing values for GFR"
replace gfr_missing= gfr_ckd_epi
recode gfr_missing (nonmissing=0) (missing=1)
label define gfr_missing 0 "Non-missing" 1"Missing"
label value gfr_missing gfr_missing
gen alb_missing=.
label variable alb_missing "Missing values for Urinary Albumin"
replace alb_missing= q1124alb
recode alb_missing (nonmissing=0) (missing=1)
label define alb_missing 0 "Non-missing" 1"Missing"
label value alb_missing alb_missing


*Independant t-test analysis for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation.

*Mann-Whitney U and Median test for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation. 

describe g6a blength bwt_std gestage_new ponderal_index

* Tests for Missing at random for Birth Weight by Presence or Absence of missing values for GFR and albumin
ttest g6a, by( gfr_missing)
ranksum g6a, by( gfr_missing)
median g6a, by( gfr_missing) exact
ttest g6a, by( alb_missing)
ranksum g6a, by( alb_missing)
median g6a, by( alb_missing) exact
* Tests for Missing at random for Birth Length by Presence or Absence of missing values for GFR and albumin
ttest blength, by( gfr_missing)
ranksum blength, by( gfr_missing)
median blength, by( gfr_missing) exact
ttest blength, by( alb_missing)
ranksum blength, by( alb_missing)
median blength, by( alb_missing) exact
* Tests for Missing at random for Standardized Birth Weights by Presence or Absence of missing values for GFR and albumin
ttest bwt_std , by( gfr_missing)
ranksum bwt_std , by( gfr_missing)
median bwt_std , by( gfr_missing) exact
ttest bwt_std , by( alb_missing)
ranksum bwt_std , by( alb_missing)
median bwt_std , by( alb_missing) exact
* Tests for Missing at random for Gestational Age by Presence or Absence of missing values for GFR and albumin
ttest gestage_new  , by( gfr_missing)
ranksum gestage_new  , by( gfr_missing)
median gestage_new  , by( gfr_missing) exact
ttest gestage_new  , by( alb_missing)
ranksum gestage_new  , by( alb_missing)
median gestage_new  , by( alb_missing) exact
* Tests for Missing at random for Ponderal Index by Presence or Absence of missing values for GFR and albumin
ttest ponderal_index  , by( gfr_missing)
ranksum ponderal_index  , by( gfr_missing)
median ponderal_index  , by( gfr_missing) exact
ttest ponderal_index  , by( alb_missing)
ranksum ponderal_index  , by( alb_missing)
median ponderal_index  , by( alb_missing) exact

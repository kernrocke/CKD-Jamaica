gen gfr_ckd_epi =.
label variable gfr_ckd_epi "GFR using CKD-EPI Formulae"
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-1.209*(0.993)^q112age if sex_new==0 & q1117cre >61.9 & q1117cre !=.
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-0.329*(0.993)^q112age if sex_new==0 & q1117cre <=61.9 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-1.209*(0.993)^q112age if sex_new==1 & q1117cre>79.6 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-0.411*(0.993)^q112age if sex_new==1 & q1117cre <=79.6 & q1117cre !=.
replace gfr_ckd_epi = . if q112age <18
*Creation of estimated gfr values using the CKD-EPI Formula (Levy et al. Annals of Int Med 2009; 150 (9): 604-12)
gen alb_v=.
replace alb_v= q1124alb
label variable alb_v "Albumin (mg/ g creat)"
*Creation of new variable for albumin values
xtile quin_gfr= gfr_ckd_epi, nq(5)
recode quin_gfr (1 = 4) (2 = 3) (3 = 2) (4 = 1) (5 = 0)
label define quin_gfr 4 "Quintile 1" 3"Quintile 2" 2"Quintile 3" 1"Quintile 4" 0"Quintile 5"
label value quin_gfr quin_gfr
*Creation of Quintiles for eGFR
gen quin_gfr2=.
replace quin_gfr2= quin_gfr
recode quin_gfr2 0/3=0 4=1
label variable quin_gfr2 "Low GFR based on Quintiles"
label define quin_gfr2 0 "Normal GFR" 1"Low GFR"
label value quin_gfr2 quin_gfr2
*Creation of new variable for categories of low and normal gfr based on gfr quintile categories.
gen log_gfr= log(gfr_ckd_epi)
label variable log_gfr "Log GFR"
*Creation of Transformed Log GFR values
gen log_alb= log( q1124alb)
label variable log_alb "Log Albumin"
*Creation of Transformed log albumin values.
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
*Creation of Albuminuria variale Yes No and Albuminuria specified by micro and macro albuminuria.
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
*Creating Binnary Variables for missing and non missing gfr and albumin values as basis for further analysis for missing at random for multiple imputation.
gen waist_hip=.
label var waist_hip "Wasit to Hip Ratio"
replace waist_hip= waistcirc2/hipcirc
*Creating Waist to Hip Ratio Variable
egen ckd_miss = rowmiss(g6a singleton q1117cre alb_v q72hgt)
tab ckd_miss
recode ckd_miss 1/4=1
*Creation of Variable to specifiy persons with complete data for birth weight singleton creatinine and albumin
recode smoker 9=.
*Recoding smoker variable 

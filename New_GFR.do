*Calculating eGFR using the Modified Diet for Renal Disease equation
gen gfr_MDRD=.
replace gfr_MDRD = 32788*(q1117cre^-1.154)*q112age^-0.203 * 1.210 * 0.742 if sex_new==0 & q1117cre !=.
replace gfr_MDRD = 32788*(q1117cre^-1.154)*q112age^-0.203 * 1.210  if sex_new==1 & q1117cre !=.
replace gfr_MDRD = . if q112age <18
label var gfr_MDRD " MDRD"

**Calculating eGFR using the Schwartz Equation
gen gfr_SW=.
replace gfr_SW= 36.5 * q72hgt/q1117cre
label var gfr_SW " Schwartz 2009"

*Generating log of eGFR using the MDRD Equation
gen log_GFR_MDRD = log(gfr_MDRD)
label var log_GFR_MDRD " Log MDRD"

*Generating log of eGFR using the Schwartz Equation
gen log_GFR_SW= log(gfr_SW)
label var log_GFR_SW " Log Schwarz 2009"

*Relabelling CKD-EPI and Log CKD-EPI
label var gfr_ckd_epi " CKD-EPI"
label var log_gfr "Log CKD-EPI"

*Labelling ckd_miss (This is persons with complete information with respect to birth weight, creatinine and being that of a singleton birth)
label var ckd_miss "Singleton Birth with Complete information on Birth weight and creatinine"

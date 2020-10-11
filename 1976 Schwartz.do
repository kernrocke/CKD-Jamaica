gen cre_new=.
replace cre_new= q1117cre/88.4
label var cre_new "Creatinine in mg/dL"
gen gfr_SW_1976=.
replace gfr_SW_1976= (0.70*q72hgt )/ cre_new if sex_new==1
replace gfr_SW_1976= (0.55*q72hgt )/ cre_new if sex_new==0
label var gfr_SW_1976 "Schwartz 1976"
*Generating log of eGFR using the Schwartz Equation 1976
gen log_1976= log(gfr_SW_1976)
label var log_1976 " Log Schwarz 1976"

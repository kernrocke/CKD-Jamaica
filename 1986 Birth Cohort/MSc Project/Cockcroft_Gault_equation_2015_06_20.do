
****** Calculation of BSA and eGFR using Cockcroft-Gault Equation ***********

*Calculation of Body Surface Area
gen bsa=.
label var bsa "Body Surface Area"
replace bsa= q72hgt^0.725 * q71wgt^0.425 * 0.007184
ttest bsa , by(sex_new)

*Modifed Cockcroft-Gault eGFR equation
gen CG=.
label var CG "Modified Cockcroft-Gault without Adjustment for BSA"
replace CG= [1.23*(140-q112age)*q71wgt]/q1117cre if sex_new==1
replace CG= [1.04*(140-q112age)*q71wgt]/q1117cre if sex_new==0

*Modified Cockcroft_Gault eGFR equation
gen gfr_CG=.
label var gfr_CG "Cockcroft-Gault with Adjustment for BSA"
replace gfr_CG= (CG*1.73)/bsa

ttest gfr_CG , by(sex_new)

*Log Cockcroft-Gault eGFR Equation after adjusting for BSA
gen log_gfr_CG= log(gfr_CG)
label var log_gfr_CG "Log Cockcroft-Gault Equation"

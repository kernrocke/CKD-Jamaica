*Creation of Low Renal Function (GFR <60 ml/min per 1.73m2) variable

gen low_ren_f=.
recode low_ren_f (min/59.9999=1) (60.0000/max=0)
label var low_ren_f "Low Renal Function (GFR <60 ml/min per 1.73m2)"
label define low_ren_f 1"Yes" 0"No"
label value low_ren_f low_ren_f

*Creation of CKD by GFR categories using the KDIGO 2012 Guidelines

gen ckd_class=.
replace ckd_class= gfr_SW
recode ckd_class (min/14.9999=5) (15.0000/29.4444=4) (29.4445/44.4444=3) (44.4445/59.4444=2) (59.4445/89.4444=1) (89.4445/max=0)
label var ckd_class "GFR Categories in CKD"
label define ckd_class 0"Normal or high" 1 "Mildly decreased" 2 "Mildly to moderately decreased" 3 "Moderately to severely decreased" 4 "Severely decreased" 5"Kidney failure"
label value ckd_class ckd_class

*Creation of Presence of CKD using the KDIGO Guideline

gen ckd_kdigo=.
replace ckd_kdigo= 0 if low_ren_f==0 | micro_alb==0
replace ckd_kdigo= 1 if low_ren_f==1 | micro_alb==1
label var ckd_kdigo "CKD KDIGO Guidelines"
label define ckd_kdigo 0"No" 1 "Yes"
label value ckd_kdigo ckd_kdigo


*Creation of GFR Schwartz-Lyon Formula

gen gfr_lyon=.
replace gfr_lyon= 37 * (q72hgt/q1117cre) if sex_new==1
replace gfr_lyon= 33 * (q72hgt/q1117cre) if sex_new==0
label var gfr_lyon " Schwartz-Lyon"

*Generating log of eGFR using the Schwartz-Lyon Equation
gen log_gfr_lyon= log(gfr_lyon)
label var log_gfr_lyon " Log Schwartz-Lyon"


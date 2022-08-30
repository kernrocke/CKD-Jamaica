
clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_007.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	20/05/2021
**	Date Modified: 	20/05/2021
**  Algorithm Task: DCreating CKD by 10 year age bands 


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 150


preserve

use "/Users/kernrocke/Downloads/jhls3_subset with ckd& albuminuria_ckd data analysis_27-02-2021.dta", replace
gen age10 = 10 * ceil(age_last_bd/10)
gen age10_cat = .
replace age10_cat = 1 if age10 == 20
replace age10_cat = 2 if age10 == 30
replace age10_cat = 3 if age10 == 40
replace age10_cat = 4 if age10 == 50
replace age10_cat = 5 if age10 == 60
replace age10_cat = 6 if age10 == 70
replace age10_cat = 7 if age10 == 80
replace age10_cat = 8 if age10 >= 90

label define age10_cat 1"<=20" 2"21-30" 3"31-40" 4"41-50" 5"51-60" 6"61-70" 7"71-80" 8">80"
label value age10_cat age10_cat

gen ckd_new = .
replace ckd_new = 1 if ckd ==1
replace ckd_new = 0 if ckd ==0
replace ckd_new = 0 if ckd ==.

rename N12observedsex01 gender
replace low_renal=low_renal*100


gen ckd_male = low_renal if gender==0
gen ckd_female = low_renal if gender==1

#delimit;
graph bar (mean) ckd_male ckd_female low_renal [pweight = sampwt_1_adj] , 

	over(age10_cat) blabel(bar, format(%9.1f)) 
	
	ylab(0(10)50, angle(verticle) nogrid)
	
	bar(1, fcolor(edkblue) fintensity(inten70) lcolor(black)) 
	bar(2, fcolor(orange_red) fintensity(inten70) lcolor(black))
	bar(3, fcolor(mint) fintensity(inten70) lcolor(black))
	
	bargap(10)
	
	xsize(10)
	
	ytitle("Prevalence (%)", color(black) size(medsmall))
	title("Prevalence of CKD (reduced eGFR of <60mL/min/1.732m2) by 10-Year Bands", color(black) size(medium))
	
	
	legend(order(1 "Male" 2 "Female" 3 "Both") 
			row(1) region(fcolor(gs16) lw(vthin) margin(l=2 r=2 t=2 b=2))
			)
	
	 plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
     graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
     bgcolor(white) 
	
	caption("Estimates are Survey Weight Adjusted", color(black) size(small))
	
	name(CKD_country, replace)
	;
#delimit cr

restore

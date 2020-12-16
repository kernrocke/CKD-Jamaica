

clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_002.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	14/12/2020
**	Date Modified: 	14/12/2020
**  Algorithm Task: Creating Equiplots for CKD Prevalence


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 150


*Setting working directory

*-------------------------------------------------------------------------------
** Dataset to encrypted location

*MAC OS
local datapath "/Users/kernrocke/OneDrive - The University of the West Indies/Manuscripts/CKD JHLS"

*-------------------------------------------------------------------------------

** Logfiles to unencrypted location

*MAC OS
local logpath "/Users/kernrocke/OneDrive - The University of the West Indies/Manuscripts/CKD JHLS"

*-------------------------------------------------------------------------------

**Aggregated output path

*MAC OS
local outputpath "/Users/kernrocke/OneDrive - The University of the West Indies/Manuscripts/CKD JHLS"

*-------------------------------------------------------------------------------

*Open log file to store results
log using "`logpath'/Log/CKD_JHLS_001.2og",  replace

*-------------------------------------------------------------------------------

*Load in data
import excel "`datapath'/Data/ckd.xlsx", sheet("Sheet1") firstrow clear

*Convert CKD proportion to percentages
replace CKD = CKD*100

*Reshape Data
reshape wide CKD, i(Age) j(Sex) string

*Create age categories variable
gen age = . 
replace age = 1 if Age == "Overall"
replace age = 2 if Age == "15-24"
replace age = 3 if Age == "25-34"
replace age = 4 if Age == "35-44"
replace age = 5 if Age == "45-54"
replace age = 6 if Age == "55-64"
replace age = 7 if Age == "65-74"
replace age = 8 if Age == ">=75"

drop Age
rename age Age

*Save dataset
save "`datapath'/Data/Unadjusted_equiplot_CKD.dta", replace

*-------------------------------------------------------------------------------
*Equiplot
#delimit;

	graph twoway
		(rspike CKDFemale CKDMale Age, hor lc(gs6) lw(0.25))
		(sc Age CKDMale , msize(3) m(o) mlc(gs0) mfc("blue") mlw(0.1))
        (sc Age CKDFemale , msize(3) m(o) mlc(gs0) mfc("red") mlw(0.1))
        (sc Age CKDBoth , msize(3) m(o) mlc(gs0) mfc("green") mlw(0.1))
		
		,
            plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
            graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
            bgcolor(white) 
			
			title("Undjusted", c(black) size(medium))
          
			
			xscale(fill)
			xlab(10(5)45, labs(4) nogrid glc(gs16))
			xtitle("Prevalence of CKD (%)", size(4) margin(l=2 r=2 t=5 b=2))
			xmtick(10(5)45, tl(1.5))
			
			ylab(1"Overall" 2"15-24" 3"25-34" 4"35-44" 5"45-54" 6"55-64"
				 7"65-74" 8">=75"
			,
			angle(0) nogrid glc(gs16))
			ytitle("", size(2.5) margin(l=2 r=5 t=2 b=2)) 
			yscale(reverse)
			
			legend(size(4) position(3) ring(0) bm(t=1 b=4 l=5 r=0) colf cols(1)
                region(fcolor(gs16) lw(vthin) margin(l=2 r=2 t=2 b=2)) 
                order(2 3 4) 
                lab(2 "Male") lab(3 "Female")  lab(4 "Both")
                )
			
			name(Unadjusted)
			saving("`outputpath'/Graphs/Unadjusted", replace)
			
               ;
#delimit cr

*-------------------------------------------------------------------------------


*Load in data
import excel "`datapath'/Data/ckd.xlsx", sheet("Sheet3") firstrow clear

*Convert CKD proportion to percentages
replace CKD = CKD*100

*Reshape Data
reshape wide CKD, i(Age) j(Sex) string

*Create age categories variable
gen age = . 
replace age = 1 if Age == "Overall"
replace age = 2 if Age == "15-24"
replace age = 3 if Age == "25-34"
replace age = 4 if Age == "35-44"
replace age = 5 if Age == "45-54"
replace age = 6 if Age == "55-64"
replace age = 7 if Age == "65-74"
replace age = 8 if Age == ">=75"

drop Age
rename age Age

*Save dataset
save "`datapath'/Data/Adjusted_equiplot_CKD.dta", replace

*-------------------------------------------------------------------------------

*Equiplot
#delimit;

	graph twoway
		(rspike CKDFemale CKDMale Age, hor lc(gs6) lw(0.25))
		(sc Age CKDMale , msize(3) m(o) mlc(gs0) mfc("blue") mlw(0.1))
        (sc Age CKDFemale , msize(3) m(o) mlc(gs0) mfc("red") mlw(0.1))
        (sc Age CKDBoth , msize(3) m(o) mlc(gs0) mfc("green") mlw(0.1))
		
		,
            plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
            graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
            bgcolor(white) 
			
			title("Adjusted", c(black) size(medium))
          
			
			xscale(fill)
			xlab(10(5)45, labs(4) nogrid glc(gs16))
			xtitle("Prevalence of CKD (%)", size(4) margin(l=2 r=2 t=5 b=2))
			xmtick(10(5)45, tl(1.5))
			
			ylab(1"Overall" 2"15-24" 3"25-34" 4"35-44" 5"45-54" 6"55-64"
				 7"65-74" 8">=75"
			,
			angle(0) nogrid glc(gs16))
			ytitle("", size(2.5) margin(l=2 r=5 t=2 b=2)) 
			yscale(reverse)
			
			legend(size(4) position(3) ring(0) bm(t=1 b=4 l=5 r=0) colf cols(1)
                region(fcolor(gs16) lw(vthin) margin(l=2 r=2 t=2 b=2)) 
                order(2 3 4) 
                lab(2 "Male") lab(3 "Female")  lab(4 "Both")
                )
				
				name(Adjusted)
				saving("`outputpath'/Graphs/Adjusted", replace)
			
               ;
#delimit cr

*-------------------------------------------------------------------------------

*Combine Graphs

#delimit;
		graph combine
		"`outputpath'/Graphs/Unadjusted"
		"`outputpath'/Graphs/Adjusted"
		,
		
		plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
        graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin))
		
		col(2)
		
		name(combined)
		caption("Note: Adjusted using Survey weight accounting for population sex and age distribution" 
				, position(5) 
				size(vsmall) color(black) ring(3.5) span)
		
               ;
#delimit cr		


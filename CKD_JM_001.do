clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JM_001.do
**  Project:      	Renal Function and Birth Weight Project (MSc Epi- Kern)
**	Sub-Project:	Comparison of eGFR equations
**  Analyst:		Kern Rocke
**	Date Created:	06/10/2020
**	Date Modified: 	08/10/2020
**  Algorithm Task: Compare eGFR equations among young adults (1986 Birth Cohort)


** DO-FILE SET UP COMMANDS
version 13
clear all
macro drop _all
set more 1
set linesize 150

*Setting working directory

*-------------------------------------------------------------------------------
** Dataset to encrypted location

*WINDOWS OS
local datapath "X:/OneDrive - The UWI - Cave Hill Campus"

*MAC OS
*local datapath "/Volumes/Secomba/kernrocke/Boxcryptor/OneDrive - The University of the West Indies"

*-------------------------------------------------------------------------------

** Logfiles to unencrypted location

*WINDOWS
local logpath "X:/OneDrive - The UWI - Cave Hill Campus"

*MAC OS
*local logpath "/Volumes/Secomba/kernrocke/Boxcryptor/OneDrive - The University of the West Indies"

*-------------------------------------------------------------------------------

**Aggregated output path

*WINDOWS
local outputpath "X:/OneDrive - The UWI - Cave Hill Campus"

*MAC OS
*local outputpath "/Volumes/Secomba/kernrocke/Boxcryptor/OneDrive - The University of the West Indies"

*-------------------------------------------------------------------------------

*Open log file to store results
log using "`logpath'/Manuscripts/Renal Function/Data/3-output/CKD_JM_001.log",  replace

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------


/*
Analysis notes

This algorithm seeks to compare different equations used to estimate glomerular
filtration rate among young adults

Equations which will be used are as follows:
1) MDRD - Modified Renal Diet Equation
2) Schwartz 1976
3) CKD-EPI
4) Schwartz 2009
5) Schwartz-Lyon
6) Cockcroft-Gault

Prevalence estimates of reduced renal function
Comparisons will be made using bland altman agreement plots.

NOTE: 
creatinine = q1117cre  
microalbumin = q1124alb 

*/



*Load in data from encrypted location
use "`datapath'/Manuscripts/Renal Function/Data/1-input/Perinatal_fu_1820_Merged834matched_03Apr2013[2014_01_09][No Names][Match2014_902only] .dta" , clear

*Check for extreme creatinine levels
ssc install extremes // user driven command
extremes q1117cre

*Remove outliers from analysis
drop if q1117cre >200
drop if q1117cre <=20

*****************Create eGFR using different equations**************************

*Examining the distribution of creatinine among sample (overall; male; female)
histogram q1117cre, normal // Overall
histogram q1117cre if sex_new == 0 , normal // Female
histogram q1117cre if sex_new == 1 , normal // Male

*Create eGFR estimates
**MDRD
gen gfr_MDRD=.
replace gfr_MDRD = 32788*(q1117cre^-1.154)*q112age^-0.203 * 1.210 * 0.742 if sex_new==0 & q1117cre !=.
replace gfr_MDRD = 32788*(q1117cre^-1.154)*q112age^-0.203 * 1.210  if sex_new==1 & q1117cre !=.
replace gfr_MDRD = . if q112age <18
label var gfr_MDRD "MDRD"


**Schwartz 1976
gen cre_new=.
replace cre_new= q1117cre/88.4
label var cre_new "Creatinine in mg/dL"
gen gfr_SW_1976=.
replace gfr_SW_1976= (0.70*q72hgt )/ cre_new if sex_new==1
replace gfr_SW_1976= (0.55*q72hgt )/ cre_new if sex_new==0
label var gfr_SW_1976 "Schwartz 1976"

**CKD-EPI
gen gfr_ckd_epi =.
label variable gfr_ckd_epi "GFR using CKD-EPI Formulae"
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-1.209*(0.993)^q112age if sex_new==0 & q1117cre >61.9 & q1117cre !=.
replace gfr_ckd_epi = 166*(q1117cre/61.9)^-0.329*(0.993)^q112age if sex_new==0 & q1117cre <=61.9 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-1.209*(0.993)^q112age if sex_new==1 & q1117cre>79.6 & q1117cre !=.
replace gfr_ckd_epi = 163*(q1117cre/79.6)^-0.411*(0.993)^q112age if sex_new==1 & q1117cre <=79.6 & q1117cre !=.
replace gfr_ckd_epi = . if q112age <18


**Schwartz 2009
gen gfr_SW=.
replace gfr_SW= 36.5 * q72hgt/q1117cre
label var gfr_SW " Schwartz 2009"

**Schwartz-Lyon
gen gfr_lyon=.
replace gfr_lyon= 37 * (q72hgt/q1117cre) if sex_new==1
replace gfr_lyon= 33 * (q72hgt/q1117cre) if sex_new==0
label var gfr_lyon " Schwartz-Lyon"

**Cockcroft-Gault

*Calculation of Body Surface Area
gen bsa=.
label var bsa "Body Surface Area"
replace bsa= q72hgt^0.725 * q71wgt^0.425 * 0.007184

*Modifed Cockcroft-Gault eGFR equation
gen CG=.
label var CG "Modified Cockcroft-Gault without Adjustment for BSA"
replace CG= [1.23*(140-q112age)*q71wgt]/q1117cre if sex_new==1
replace CG= [1.04*(140-q112age)*q71wgt]/q1117cre if sex_new==0
*Modified Cockcroft_Gault eGFR equation
gen gfr_CG=.
label var gfr_CG "Cockcroft-Gault with Adjustment for BSA"
replace gfr_CG= (CG*1.73)/bsa

*-------------------------------------------------------------------------------
*Examine normality of eGFR measures (Shapario Wilks test)
swilk gfr_MDRD gfr_SW_1976 gfr_ckd_epi gfr_SW gfr_lyon gfr_CG

*Identify extreme values
ssc install extremes
extremes gfr_MDRD gfr_SW_1976 gfr_ckd_epi gfr_SW gfr_lyon gfr_CG
foreach x in gfr_MDRD gfr_SW_1976 gfr_ckd_epi gfr_SW gfr_lyon gfr_CG {
	extremes `x'
	}
/*
*Examine types of transformations 
foreach x in gfr_MDRD gfr_SW_1976 gfr_ckd_epi gfr_SW gfr_lyon gfr_CG {
	ladder `x'
	gladder `x'
	}
*/

*Data not normally distributed, in addressing this data was transformed to its natural logrithim 

gen ln_MDRD = ln(gfr_MDRD)
label var ln_MDRD "Log eGFR MDRD"

gen ln_SW_1976 = ln(gfr_SW_1976)
label var ln_SW_1976 "Log Swartz 1976"

gen ln_CG = ln(gfr_CG)
label var ln_CG "Log eGFR Cockcroft-Gault"

gen ln_ckd_epi = ln(gfr_ckd_epi)
label var ln_ckd_epi "Log eGFR CKD EPI"

gen ln_SW = ln(gfr_SW)
label var ln_SW "Log eGFR Swartz 2009"

gen ln_lyon = ln(gfr_lyon)
label var ln_lyon "Log eGFR Swartz-Lyon"

*-------------------------------------------------------------------------------
*Summary statistics
tabstat gfr_MDRD gfr_SW_1976 gfr_ckd_epi gfr_SW gfr_lyon gfr_CG, stat(mean median sd sem) col(stat) long

*Boxplot of eGFR equations
#delimit ;
			graph hbox gfr_MDRD gfr_CG gfr_ckd_epi gfr_SW_1976 gfr_SW gfr_lyon , 
			
				nooutsides
				name(eGRR_box)
				title("Boxplot of eGFR equations")
				ytitle("estimated Glomerular Filtration Rate (eGFR)")
				ylab(, nogrid)
				plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
				graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
    ;
#delimit cr					

*Comparing Schwartz-Lyon to other eGFR measures
signrank gfr_lyon = gfr_MDRD
signrank gfr_lyon = gfr_CG
signrank gfr_lyon = gfr_ckd_epi
signrank gfr_lyon = gfr_SW_1976
signrank gfr_lyon = gfr_SW

*Comparing Log Schwartz-Lyon to other eGFR measures
signrank ln_lyon = ln_MDRD
signrank ln_lyon = ln_CG
signrank ln_lyon = ln_SW_1976
signrank ln_lyon = ln_ckd_epi
signrank ln_lyon = ln_SW

*-------------------------------------------------------------------------------
*Percent Agreement Plots with Trend

*1) MDRD vs Swartz-Lyon
#delimit ;
batplot gfr_MDRD gfr_lyon, 
								name(MDRD_lyon_trend)  
								ytitle("MDRD - Swartz-Lyon") xtitle("Mean of MDRD & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/MDRD_Lyon_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*2) CG vs Swartz-Lyon
#delimit ;
batplot gfr_CG gfr_lyon, 
								name(CG_lyon_trend)  
								ytitle("CG - Swartz-Lyon") xtitle("Mean of CG & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/CG_Lyon_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*3) CKD-EPI vs Swartz-Lyon
#delimit ;
batplot gfr_ckd_epi gfr_lyon, 
								name(CKD_EPI_lyon_trend)  
								ytitle("CKD-EPI - Swartz-Lyon") xtitle("Mean of CKD-EPI & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/CKD_EPI_Lyon_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*4) Swartz 1976 vs Swartz-Lyon
#delimit ;
batplot gfr_SW_1976 gfr_lyon, 
								name(SW_1976_lyon_trend)  
								ytitle("Swartz 1976 - Swartz-Lyon") xtitle("Mean of Swartz 1976 & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_1976_Lyon_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*4) Swartz 2009 vs Swartz-Lyon
#delimit ;
batplot gfr_SW gfr_lyon, 
								name(SW_2009_lyon_trend)  
								ytitle("Swartz 2009 - Swartz-Lyon") xtitle("Mean of Swartz 2009 & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_2009_Lyon_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------
*Combine Graphs

#delimit ;
graph combine 
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/MDRD_Lyon_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/CG_Lyon_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/CKD_EPI_Lyon_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_1976_Lyon_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_2009_Lyon_trend"
				
				,
				name(Trend_eGR_combine)
				title(Limits of Agreement for eGFR Equations (MDRD, CG, CKD-EPI, SW-1976, SW-2009) vs SW-Lyon, 
				color(black) size(small)) 
				caption("MDRD - Modified Renal Diet; CG - Cockcroft-Gault"
						"CKD-EPI - Chronic Kidney Disease Epidemiology Collaboration"
						"SW - Swartz" 
						, position(5) 
				size(vsmall) color(black) ring(3.5) span)
				plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin))
				graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
				col(3)
				saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/combine_trend", replace)
				
    ;
#delimit cr
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*Percent Agreement Plots with No Trend

*1) MDRD vs Swartz-Lyon
#delimit ;
batplot gfr_MDRD gfr_lyon, notrend
								name(MDRD_lyon_no_trend)  
								ytitle("MDRD - Swartz-Lyon") xtitle("Mean of MDRD & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/MDRD_Lyon_no_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*2) CG vs Swartz-Lyon
#delimit ;
batplot gfr_CG gfr_lyon, notrend
								name(CG_lyon_no_trend)  
								ytitle("CG - Swartz-Lyon") xtitle("Mean of CG & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/CG_Lyon_no_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*3) CKD-EPI vs Swartz-Lyon
#delimit ;
batplot gfr_ckd_epi gfr_lyon, notrend
								name(CKD_EPI_lyon_no_trend)  
								ytitle("CKD-EPI - Swartz-Lyon") xtitle("Mean of CKD-EPI & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/CKD_EPI_Lyon_no_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*4) Swartz 1976 vs Swartz-Lyon
#delimit ;
batplot gfr_SW_1976 gfr_lyon, notrend
								name(SW_1976_lyon_no_trend)  
								ytitle("Swartz 1976 - Swartz-Lyon") xtitle("Mean of Swartz 1976 & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_1976_Lyon_no_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------

*4) Swartz 2009 vs Swartz-Lyon
#delimit ;
batplot gfr_SW gfr_lyon, notrend
								name(SW_2009_lyon_no_trend)  
								ytitle("Swartz 2009 - Swartz-Lyon") xtitle("Mean of Swartz 2009 & Swartz-Lyon")
								ylab(, nogrid)
								moptions(mlabp(5)) sc(jitter(6))
								plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin)) 
								graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
								saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_2009_Lyon_no_trend", replace)
    ;
#delimit cr	

*-------------------------------------------------------------------------------
*Combine Graphs

#delimit ;
graph combine 
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/MDRD_Lyon_no_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/CG_Lyon_no_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/CKD_EPI_Lyon_no_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_1976_Lyon_no_trend"
				"`outputpath'/Manuscripts/Renal Function/Data/3-output/SW_2009_Lyon_no_trend"
				
				,
				name(No_Trend_eGFR)
				title(Limits of Agreement for eGFR Equations (MDRD, CG, CKD-EPI, SW-1976, SW-2009) vs SW-Lyon, 
				color(black) size(small)) 
				caption("MDRD - Modified Renal Diet; CG - Cockcroft-Gault"
						"CKD-EPI - Chronic Kidney Disease Epidemiology Collaboration"
						"SW - Swartz" 
						, position(5) 
				size(vsmall) color(black) ring(3.5) span)
				plotregion(c(gs16) ic(gs16) ilw(thin) lw(thin))
				graphregion(color(gs16) ic(gs16) ilw(thin) lw(thin)) 
				col(3)
				saving("`outputpath'/Manuscripts/Renal Function/Data/3-output/combine_no_trend", replace)
				
    ;
#delimit cr
*-------------------------------------------------------------------------------

*Close log file 
log close

*------------------------------END----------------------------------------------








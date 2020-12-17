

clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_001.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	14/12/2020
**	Date Modified: 	16/12/2020
**  Algorithm Task: Dealing with missing variables


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
log using "`logpath'/Log/CKD_JHLS_001.log",  replace

*-------------------------------------------------------------------------------

*Load in dataset
use "`datapath'/Data/jhls3_subset with ckd& albuminuria_ckd data analysis_LFisher_2020_12_09_2 (2).dta", clear

*Declare dataset as a complex survey dataset
svyset psu_1 [pweight= sampwt_1_adj], strata(postrata) vce(linearized) singleunit(certainty)

*Describe survey dataset
svydescribe

*-------------------------------------------------------------------------------
*Minor cleaning
drop gfr_lyon egfr_ckdepi egfr_low gfr_ckd_epi sbp_mean dbp_mean

*Age categories
gen age_cat = . 
replace age_cat = 1 if age_last_bd <=24
replace age_cat = 2 if age_last_bd >24 & age_last_bd <=34
replace age_cat = 3 if age_last_bd >34 & age_last_bd <=44
replace age_cat = 4 if age_last_bd >44 & age_last_bd <=54
replace age_cat = 5 if age_last_bd >54 & age_last_bd <=64
replace age_cat = 6 if age_last_bd >64 & age_last_bd <=74		
replace age_cat = 7 if age_last_bd >=75 
replace age_cat = . if age_last_bd == .
label var age_cat "Age Categories"
label define age_cat 1"15-24" 2"25-34" 3"35-44" 4"45-54" 5"55-64" 6"65-74" 7">/=75"
label value age_cat age_cat	

*-------------------------------------------------------------------------------

*eGFR Preparation (Using CKD-EPI and Swartz-Lyon equations)
gen egfr = . 
replace egfr = 166*(SCREAT_n /61.9)^-1.209*(0.993)^age_last_bd if N12observedsex01==0 & SCREAT_n >61.9 & SCREAT_n !=.
replace egfr = 166*(SCREAT_n /61.9)^-0.329*(0.993)^age_last_bd if N12observedsex01==0 & SCREAT_n <=61.9 & SCREAT_n !=.
replace egfr = 163*(SCREAT_n /79.6)^-1.209*(0.993)^age_last_bd if N12observedsex01==1 & SCREAT_n >79.6 & SCREAT_n !=.
replace egfr = 163*(SCREAT_n /79.6)^-0.411*(0.993)^age_last_bd if N12observedsex01==1 & SCREAT_n <=79.6 & SCREAT_n !=.
replace egfr = . if age_last_bd <=20
replace egfr= 37 * (height_cm /SCREAT_n) if N12observedsex01==1 & age_last_bd <=20
replace egfr= 33 * (height_cm /SCREAT_n) if N12observedsex01==0 & age_last_bd <=20
label var egfr"Estimated Glomerular Filtration Rate"

mean egfr, over(N12observedsex01)

*Low renal function
gen low_renal = .
replace low_renal = 0 if egfr>=60 & egfr!=.
replace low_renal = 1 if egfr<60 & egfr!=.
label var low_renal "Low Renal Function"
label define low_renal 0"Normal" 1"Low Renal Function"
label value low_renal low_renal

tab low_renal

*CKD
drop ckd
gen ckd = .
replace ckd = 1 if low_renal == 1
replace ckd = 1 if Microalbuminmg_yn_20 == 1
replace ckd = 0 if low_renal == 0 & Microalbuminmg_yn_20 == 0
label var ckd "Chronic Kidney Disease"
label define ckd 0"Normal" 1"CKD"
label value ckd ckd


tab Microalbuminmg_yn_20
tab ckd, miss

svy: proportion ckd, missing
svy: proportion ckd, missing over(N12observedsex01)
svy: proportion ckd, missing over(age_cat)
svy: proportion ckd, missing over(N12observedsex01 age_cat)

*-------------------------------------------------------------------------------
*SES Data Preparation

**Possession Score
egen noposs2 = rowtotal(N121electricstove N121refrigeratororfreezer ///
			   N121microwaveoven N121airconditioner N121fan N121radiocassette ///
			   N121GamingEquipment N121videoDVD N121washingmachine N121clothesdryer ///
			   N121televisionset N121cabletv N121waterheater N121watertank N121bicycle ///
			   N121motorcycle N121carSUVtruck N121computertablet N121computeraccessories ///
			   N121smartPhone N121internetservice), missing

centile noposs2 , centile(33 66 100)



gen possess_cat3 = noposs2
recode possess_cat3 0/6 = 0 7/9 = 1 10/20 =2 

label var possess_cat3 "Possession Tertiles"
label define possess_cat3 0 "<= 6 items" 1 "7 - 9 items"  2 "10-20 items" 
lab val possess_cat3 possess_cat3

tab possess_cat3 , miss

*-------------------------------------------------------------------------------

**Education

*Use Less than high school; high school; post high school

gen education = . 
replace education = 1 if N16whatisyourhighestlevelorgrade == 0 | N16whatisyourhighestlevelorgrade == 1 | N16whatisyourhighestlevelorgrade == 2 | N16whatisyourhighestlevelorgrade == 3
replace education = 2 if N16whatisyourhighestlevelorgrade == 4
replace education = 3 if N16whatisyourhighestlevelorgrade == 5  | N16whatisyourhighestlevelorgrade == 6

label var education "Education Categories"
label define education 1"Less than high school" ///
					   2"High school" ///
					   3"Post high school"
label value education education

tab education , miss

*-------------------------------------------------------------------------------

**Smoking Status

*Use Never smoker; Past Smoker; Current Smoker

gen smoking_status = .
replace smoking_status = 0 if n1012smokeanytobaccocigaret == 0
replace smoking_status = 1 if n1012smokeanytobaccocigaret == 1 
replace smoking_status = 2 if n1012smokeanytobaccocigaret == 2 | n1012smokeanytobaccocigaret == 3 

label var smoking_status "Smoking Status"
label define smoking_status 0"Never" 1"Past Smoker" 2"Current Smoker"
label value smoking_status smoking_status

tab smoking_status , miss

*-------------------------------------------------------------------------------

*Hypertension

gen sbp_mean = (sbp_new1 + sbp_new2+ sbp_new3) /3
gen dbp_mean = (dbp_new1 + dbp_new2+ dbp_new3) /3

gen htn = . 
replace htn = 1 if sbp_mean>=140 & dbp_mean>=90
replace htn = 0 if sbp_mean<140 | dbp_mean <90
replace htn = 1 if N31dhighbloodpressure == 1
replace htn = . if sbp_mean == . | dbp_mean == .

label var htn "Hypertension"
label define htn 0"Normal" 1"Hypertensive"
label value htn htn

tab htn , miss

*-------------------------------------------------------------------------------

*Diabetes

gen diabetes = .
replace diabetes = 0 if f35fastingglucoselevel_new ==. & f39glycohbresult_new ==. & N31bdiabetesmellitus == 0
replace diabetes = 0 if f35fastingglucoselevel_new <7 | f39glycohbresult_new <6.5 & N31bdiabetesmellitus == 0

replace diabetes = 1 if f39glycohbresult_new >= 6.5 & f39glycohbresult_new != .
replace diabetes = 1 if N31bdiabetesmellitus == 1 
replace diabetes = 1 if f35fastingglucoselevel_new >=7 & f35fastingglucoselevel_new !=.

label var diabetes "Diabetes"
label define diabetes 0"Normal" 1"Diabetes"
label value diabetes diabetes diabetes

tab diabetes , miss

*-------------------------------------------------------------------------------

*Create variable for non-missing and missing on the main outcome of interest (eGFR)
gen gfr_miss = .
replace gfr_miss = 0 if egfr != .
replace gfr_miss = 1 if egfr == .
label var gfr_miss "eGFR Missing"
label define gfr_miss 0"Non-missing" 1"Missing"
label value gfr_miss gfr_miss

*Check for differences in intended imputed variables acrossing missing categories
foreach x in bmi_new f36totalcholesterollevels_new {
ttest `x', by(gfr_miss)
	}

foreach y in education possess_cat3 Microalbuminmg_yn_20 htn {
tab `y' gfr_miss, col chi2
		}

*Create missing indicator for variables to be imputed
gen miss_impute = missing(bmi_new, f36totalcholesterollevels_new, education, possess_cat3, ///
						 Microalbuminmg_yn_20, htn)
tab miss_impute if egfr!=.

*ttest looking at differnces
#delimit;
for var bmi_new f36totalcholesterollevels_new: 
		ttest X if egfr != . , by(miss_impute) unequal
;
#delimit cr

*Pearson Chi-square
#delimit;
for var education possess_cat3 Microalbuminmg_yn_20 htn:
		tab X miss_impute if egfr != ., row chi
;
#delimit cr
*-------------------------------------------------------------------------------

/*
Create imputations

Note: Imputations are not needed for egfr, sex and age variables

Complex chained equations to be used for analysis

Variables to impute: 

bmi_new
f36totalcholesterollevels_new
education
possess_cat3
n1012smokeanytobaccocigaret

*/

*-------------------------------------------------------------------------------
*							DATASET with One IMPUTATION							

*Distribution of missing data for key variables
misstable summarize bmi_new f36totalcholesterollevels_new education possess_cat3 ///
					Microalbuminmg_yn_20 htn smoking_status diabetes ///
					f35fastingglucoselevel_new f39glycohbresult_new ///
					N31bdiabetesmellitus ht_m_new weight mn23sbp_new ///
					mn23dbp_new N31dhighbloodpressure if egfr!=.
					
*Prepare dataset for imputation
mi set flong

*Set complex survey dataset for imputation
mi svyset psu_1 [pweight= sampwt_1_adj], strata(postrata) vce(linearized) singleunit(certainty)


*Register dataset for imputation
 mi register imputed  bmi_new f36totalcholesterollevels_new education possess_cat3 ///
					  Microalbuminmg_yn_20 htn smoking_status diabetes ///
					  f35fastingglucoselevel_new f39glycohbresult_new ///
					  N31bdiabetesmellitus ht_m_new weight mn23sbp_new ///
					  mn23dbp_new N31dhighbloodpressure
					  
*Setting seed for reproducability of results
 set seed 1234 

*Imputation using complex chained equations
 mi impute  chained (regress) bmi_new (regress) f36totalcholesterollevels_new ///
					(ologit) education (ologit) possess_cat3  ///
					(logit) Microalbuminmg_yn_20 (logit) htn (ologit) smoking_status ///
				    (regress) f35fastingglucoselevel_new ///
					(regress) f39glycohbresult_new (ologit) N31bdiabetesmellitus ///
					(regress) ht_m_new (regress) weight (regress) mn23sbp_new ///
					(regress) mn23dbp_new (ologit) N31dhighbloodpressure ///
					= egfr N12observedsex01 age_last_bd if egfr!=. , ///
					add(1) augment ///
					savetrace("`datapath'/Data/ckd_impute_1", replace) ///
					rseed(1234)	

*-------------------------------------------------------------------------------
*							DATASET with 43 IMPUTATIONS	

*Remove existing mi set
mi unset
drop if mi_m != 0
drop mi_*

*Distribution of missing data for key variables
misstable summarize bmi_new f36totalcholesterollevels_new education possess_cat3 ///
					Microalbuminmg_yn_20 htn smoking_status diabetes ///
					f35fastingglucoselevel_new f39glycohbresult_new ///
					N31bdiabetesmellitus ht_m_new weight mn23sbp_new ///
					mn23dbp_new N31dhighbloodpressure if egfr!=.
					
*Prepare dataset for imputation
mi set flong

*Set complex survey dataset for imputation
mi svyset psu_1 [pweight= sampwt_1_adj], strata(postrata) vce(linearized) singleunit(certainty)


*Register dataset for imputation
 mi register imputed  bmi_new f36totalcholesterollevels_new education possess_cat3 ///
					  Microalbuminmg_yn_20 htn smoking_status diabetes ///
					  f35fastingglucoselevel_new f39glycohbresult_new ///
					  N31bdiabetesmellitus ht_m_new weight mn23sbp_new ///
					  mn23dbp_new N31dhighbloodpressure
					  
*Setting seed for reproducability of results
 set seed 1234 

*Imputation using complex chained equations
 mi impute  chained (regress) bmi_new (regress) f36totalcholesterollevels_new ///
					(ologit) education (ologit) possess_cat3  ///
					(logit) Microalbuminmg_yn_20 (logit) htn (ologit) smoking_status ///
				    (regress) f35fastingglucoselevel_new ///
					(regress) f39glycohbresult_new (ologit) N31bdiabetesmellitus ///
					(regress) ht_m_new (regress) weight (regress) mn23sbp_new ///
					(regress) mn23dbp_new (ologit) N31dhighbloodpressure ///
					= egfr N12observedsex01 age_last_bd if egfr!=. ,  ///
					add(43) augment ///
					savetrace("`datapath'/Data/ckd_impute_43", replace) ///
					rseed(1234)

*-------------------------------------------------------------------------------

*Create CKD variable	

*Low renal function
drop low_renal
mi passive: gen low_renal = .
mi passive: replace low_renal = 0 if egfr>=60 & egfr!=.
mi passive: replace low_renal = 1 if egfr<60 & egfr!=.
label var low_renal "Low Renal Function"
label define low_renal 0"Normal" 1"Low Renal Function"
label value low_renal low_renal

*CKD
drop ckd
mi passive: gen ckd = .
mi passive: replace ckd = 1 if low_renal == 1
mi passive: replace ckd = 1 if Microalbuminmg_yn_20 == 1
mi passive: replace ckd = 0 if low_renal == 0 & Microalbuminmg_yn_20 == 0
label var ckd "Chronic Kidney Disease"
label define ckd 0"Normal" 1"CKD"
label value ckd ckd

*-------------------------------------------------------------------------------

*Age categories
drop age_cat
mi passive: gen age_cat = . 
mi passive: replace age_cat = 1 if age_last_bd <=24
mi passive: replace age_cat = 2 if age_last_bd >24 & age_last_bd <=34
mi passive: replace age_cat = 3 if age_last_bd >34 & age_last_bd <=44
mi passive: replace age_cat = 4 if age_last_bd >44 & age_last_bd <=54
mi passive: replace age_cat = 5 if age_last_bd >54 & age_last_bd <=64
mi passive: replace age_cat = 6 if age_last_bd >64 & age_last_bd <=74		
mi passive: replace age_cat = 7 if age_last_bd >=75 
mi passive: replace age_cat = . if age_last_bd == .
label var age_cat "Age Categories"
label define age_cat 1"15-24" 2"25-34" 3"35-44" 4"45-54" 5"55-64" 6"65-74" 7">/=75"
label value age_cat age_cat	

*-------------------------------------------------------------------------------

*Hypertension

drop htn
mi passive: gen htn = . 
mi passive: replace htn = 1 if mn23sbp_new>=140 & mn23dbp_new>=90
mi passive: replace htn = 0 if mn23sbp_new<140 | mn23dbp_new <90
mi passive: replace htn = 1 if N31dhighbloodpressure == 1
mi passive: replace htn = . if mn23sbp_new == . | mn23dbp_new == .
label var htn "Hypertension"
label define htn 0"Normal" 1"Hypertensive"
label value htn htn

*-------------------------------------------------------------------------------

*Diabetes

drop diabetes
mi passive: gen diabetes = .
mi passive: replace diabetes = 0 if f35fastingglucoselevel_new ==. & f39glycohbresult_new ==. & N31bdiabetesmellitus == 0
mi passive: replace diabetes = 0 if f35fastingglucoselevel_new <7 | f39glycohbresult_new <6.5 & N31bdiabetesmellitus == 0
mi passive: replace diabetes = 1 if f39glycohbresult_new >= 6.5 & f39glycohbresult_new != .
mi passive: replace diabetes = 1 if N31bdiabetesmellitus == 1 
mi passive: replace diabetes = 1 if f35fastingglucoselevel_new >=7 & f35fastingglucoselevel_new !=.

label var diabetes "Diabetes"
label define diabetes 0"Normal" 1"Diabetes"
label value diabetes diabetes diabetes

*-------------------------------------------------------------------------------

*BMI

drop bmi_new
mi passive: gen bmi = weight/(ht_m_new^2)
label var bmi "BMI"

*BMI Categories
drop bmi_cat
mi passive: gen bmi_cat = . 
mi passive: replace bmi_cat = 0 if bmi >=18.50 & bmi <25.00 & bmi !=. // Normal
mi passive: replace bmi_cat = 1 if bmi <18.50 & bmi != . // Underweight
mi passive: replace bmi_cat = 2 if bmi >=25.00 & bmi <30.00 & bmi !=. // Pre-Obese
mi passive: replace bmi_cat = 3 if bmi >=30.00 & bmi !=. // Obese
label var bmi_cat "BMI Categories"
label define bmi_cat 0"Normal" 1"Underweight" 2"Pre-obese" 3"Obese"
label value bmi_cat bmi_cat

*-------------------------------------------------------------------------------

*Obtaining estimates for CKD variables

**CKD
tab ckd if _mi_m == 0, miss
proportion ckd if _mi_m == 0, missing
mi estimate: proportion ckd, missing
mi estimate: svy: proportion ckd, missing
mi estimate: svy: proportion ckd, missing over(N12observedsex01)
mi estimate: svy: proportion ckd, missing over(age_cat)
mi estimate: svy: proportion ckd, missing over(N12observedsex01 age_cat)

*-------------------------------------------------------------------------------

*GFR Bivariate models

foreach x in bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new i.education i.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status {

mi estimate: svy: regress egfr `x'
mi estimate: mixed egfr `x' || parish_new: || ed_new_rev:
}

*-------------------------------------------------------------------------------


*CKD Bivariate models

foreach x in bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new i.education i.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status {

mi estimate, or: svy: logistic ckd `x', or
mi estimate, or : melogit ckd `x' || parish_new: || ed_new_rev:, or
}


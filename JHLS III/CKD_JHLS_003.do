
clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_003.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	17/12/2020
**	Date Modified: 	17/12/2020
**  Algorithm Task: Bivariable Regression Models (Un-imputed/Complete Case-Analysis)


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

*Load in dataset with non-imputed data
use "`datapath'/Data/CKD_JHLS_III.dta", clear

*-------------------------------------------------------------------------------

*Open log file to store linear regression results
log using "`logpath'/Log/CKD_JHLS_003_egfr.log",  replace

*-------------------------------------------------------------------------------

*****************************eGFR***********************************************

*Linear regression models

foreach x in i.N12observedsex01 age_last_bd i.age_cat ///
			 bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new ib3.education ib3.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status {
			 
*Linear Regression
regress egfr `x' if egfr != . , vce(robust)

*Multi-Level Regression
mixed egfr `x' if egfr != . || parish_new: || ed_new_rev: , vce(robust)

*Complex survey regression
svy: regress egfr `x' if egfr != .

}


*Close log file
log close

*-------------------------------------------------------------------------------

*Open log file to store logistic regression results
log using "`logpath'/Log/CKD_JHLS_003_ckd.log",  replace

*-------------------------------------------------------------------------------

*****************************CKD************************************************

*Logistic regression models

foreach x in i.N12observedsex01 age_last_bd i.age_cat ///
			 bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new ib3.education ib3.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status {
			 
*Logistic Regression
logistic ckd `x' if ckd != . , vce(robust)

*Multi-Level Regression
melogit ckd `x' if ckd != . || parish_new: || ed_new_rev: , vce(robust) or

*Complex survey regression
svy: logistic ckd `x' if ckd != .

}


*Close log file
log close

*-------------------------------------------------------------------------------

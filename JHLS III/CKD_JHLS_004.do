

clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_004.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	21/12/2020
**	Date Modified: 	21/12/2020
**  Algorithm Task: Bivariate Regression Models (Imputed)


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

*Load in dataset
use "`datapath'/Data/CKD_JHLS_III_MI_43.dta", clear

*-------------------------------------------------------------------------------

*Open log file to store results
log using "`logpath'/Log/CKD_JHLS_001_Bivariable MI Regreession_eGFR.log",  replace name(egfr)

*-------------------------------------------------------------------------------
foreach x in bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new i.education i.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status i.sickle /// 
			 f38triglyceridelevels_new i.high_trig ///
			 f36totalcholesterollevels_new  ///
			 N12observedsex01 age_last_bd i.age_cat{

mi estimate: svy: regress egfr `x' if egfr != .
}

*Close log file
log close egfr

*-------------------------------------------------------------------------------

*Open log file to store results
log using "`logpath'/Log/CKD_JHLS_001_Bivariable MI Regreession_ckd.log",  replace name(ckd)

*-------------------------------------------------------------------------------
foreach x in bmi i.bmi_cat f35fastingglucoselevel_new f39glycohbresult_new ///
			 f36totalcholesterollevels_new i.education i.possess_cat3 ///
			 mn23sbp_new mn23dbp_new ///
			 i.htn i.diabetes i.smoking_status i.sickle /// 
			 f38triglyceridelevels_new i.high_trig ///
			 f36totalcholesterollevels_new  ///
			 N12observedsex01 age_last_bd i.age_cat{

mi estimate, or: svy: logistic ckd `x' if ckd != .
}
*-------------------------------------------------------------------------------

*Close log file
log close ckd

*-------------------------------------------------------------------------------

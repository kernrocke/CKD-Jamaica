clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_006.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	21/12/2020
**	Date Modified: 	21/12/2020
**  Algorithm Task: Multivariable Regression Models (Imputed)


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
log using "`logpath'/Log/CKD_JHLS_006.log",  replace

*-------------------------------------------------------------------------------

*Load in dataset
use "`datapath'/Data/CKD_JHLS_III_MI_43.dta", clear

*-------------------------------------------------------------------------------

/*
Variables to include in the final model based on results from bivariate analyses

Sex - N12observedsex01
Age - age_last_bd age_cat
BMI - bmi
Diabetes - diabetes
Cholesterol - f36totalcholesterollevels_new
Education - education
Posessions - possess_cat3
Blood Pressure/Hypertension - mn23sbp_new mn23dbp_new htn
Smoking - smoking_status
Sickle Cell Disease - sickle

*/

*-------------------------------------------------------------------------------

*Mutivariate survey adjusted model eGFR

*Both
mi estimate: svy: regress egfr i.N12observedsex01##c.age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != .

*Male						  
mi estimate: svy: regress egfr age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 0	
						  
*Female						  
mi estimate: svy: regress egfr age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 1	
						  
*-------------------------------------------------------------------------------

*Multi-level Mutivariate model eGFR

*Both
mi estimate: mixed egfr i.N12observedsex01##c.age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . || parish_new: || ed_new_rev:, ///
						  nolog

						  
*Male
mi estimate: mixed egfr   age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 0	///
						  || parish_new: || ed_new_rev:, ///
						  nolog
*Female
mi estimate: mixed egfr   age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 1	///
						  || parish_new: || ed_new_rev:, ///
						  nolog	
						  
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************

*-------------------------------------------------------------------------------

*Mutivariate survey adjusted model CKD

*Both
mi estimate: svy: logistic ckd i.N12observedsex01##c.age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != .

*Male						  
mi estimate: svy: logistic ckd age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 0	
						  
*Female						  
mi estimate: svy: logistic ckd age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 1	
						  
*-------------------------------------------------------------------------------

*Multi-level Mutivariate model eGFR

*Both
mi estimate, or: melogit ckd i.N12observedsex01##c.age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . || parish_new: || ed_new_rev:, ///
						  nolog

						  
*Male
mi estimate, or: melogit ckd age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 0	///
						  || parish_new: || ed_new_rev:, ///
						  nolog
*Female
mi estimate, or: melogit ckd age_last_bd bmi i.diabetes ///
						  f36totalcholesterollevels_new ib3.education ///
						  ib2.possess_cat3 i.htn i.smoking_status ///
						  i.sickle if egfr != . & N12observedsex01 == 1	///
						  || parish_new: || ed_new_rev:, ///
						  nolog	
						  
*-------------------------------------------------------------------------------
						  
*Close log file
log close

*-------------------------------------------------------------------------------

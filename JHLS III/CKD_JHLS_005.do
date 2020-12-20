

clear
capture log close
cls


**  GENERAL DO-FILE COMMENTS
**  Program:		CKD_JHLS_005.do
**  Project:      	Jamaica Health and Lifestyle Survey III
**	Sub-Project:	CKD in Jamaica (Lori FIsher HREP paper)
**  Analyst:		Kern Rocke
**	Date Created:	18/12/2020
**	Date Modified: 	20/12/2020
**  Algorithm Task: Senstivity Models


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

*Open log file to store ANCOVA results
log using "`logpath'/Log/CKD_JHLS_005_0.log",  replace

*-------------------------------------------------------------------------------

/*
Preamble
This algorithm focuses on conducting senstiviity analyses for the association between
eGFR/CKD and known predictors.

Senstivity models are as follows:
1) ANCOVA - Analysis of Covariance
2) Unadjusted linear and logitstic regression models
3) Survey adjusted linear and logistic regression models
4) Multi-Level linear and logistic regression models

*****************************eGFR***********************************************

*eGRR (Non sex specific)
anova egfr i.N12observedsex01 c.age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if egfr!=.
regress, baselevels
						  
						 
*Male						  
anova egfr age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 0 & egfr!=.		
regress, baselevels
						  
*Female						  
anova egfr age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 1 & egfr!=.
regress, baselevels
		
*****************************CKD************************************************

*eGRR (Non sex specific)
anova ckd i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if ckd!=.
regress, baselevels

*Male						  
anova ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 0 & ckd!=.
regress, baselevels
						  
*Female						  
anova ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 1 & ckd!=.
regress, baselevels

*-------------------------------------------------------------------------------
		
*Close log file
log close

*-------------------------------------------------------------------------------

*Open log file to store case-wise regression results
log using "`logpath'/Log/CKD_JHLS_005_1.log",  replace

*-------------------------------------------------------------------------------

*****************************eGFR***********************************************

*eGRR (Non sex specific)
regress egfr i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if egfr!=.

*Male						  
regress egfr age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 0 & egfr!=.
						  
*Female						  
regress egfr age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 1 & egfr!=.
		
*****************************CKD************************************************

*eGRR (Non sex specific)
logistic ckd i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if ckd!=.

*Male						  
logistic ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 0 & ckd!=.
						  
*Female						  
logistic ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 1 & ckd!=.

*-------------------------------------------------------------------------------
		
*Close log file
log close
*-------------------------------------------------------------------------------

*Open log file to store complex survey regression results
log using "`logpath'/Log/CKD_JHLS_005_2.log",  replace

*-------------------------------------------------------------------------------

*****************************eGFR***********************************************

*eGRR (Non sex specific)
svy linearized: regress egfr i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if egfr!=.

*Male						  
svy linearized: regress egfr age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if N12observedsex01 == 0 & egfr!=.
						  
*Male						  
svy linearized: regress egfr age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if N12observedsex01 == 1 & egfr!=.

		
*****************************CKD************************************************

*eGRR (Non sex specific)
svy linearized: logistic ckd i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if ckd!=.

*Male						  
svy linearized: logistic ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 0 & ckd!=.
						  
*Female						  
svy linearized: logistic ckd age_last_bd ib2.possess_cat3 ///
		ib3.education i.htn i.diabetes i.smoking_status ///
		if N12observedsex01 == 1 & ckd!=.

*-------------------------------------------------------------------------------

*Close log file
log close

*-------------------------------------------------------------------------------

*Open log file to store multi-level regression results
log using "`logpath'/Log/CKD_JHLS_005_3.log",  replace

*-------------------------------------------------------------------------------

*****************************eGFR***********************************************

*eGRR (Non sex specific)
mixed egfr i.N12observedsex01 age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if egfr!=. || parish_new: || ed_new_rev:, nolog

*Male						  
mixed egfr age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if N12observedsex01 == 0 & egfr!=. || parish_new: || ed_new_rev:, nolog
						  
*Male						  
mixed egfr age_last_bd ib2.possess_cat3 ///
						  ib3.education i.htn i.diabetes i.smoking_status ///
						  if N12observedsex01 == 1 & egfr!=. || parish_new: || ed_new_rev:, nolog

		
*****************************CKD************************************************

*eGRR (Non sex specific)
melogit ckd age_last_bd i.N12observedsex01 ib2.possess_cat3 ib3.education i.htn i.diabetes ///
		i.smoking_status if ckd!= . || parish_new: || ed_new_rev:, ///
		nolog or

*Male						  
melogit ckd age_last_bd ib2.possess_cat3 ib3.education i.htn i.diabetes ///
		i.smoking_status if N12observedsex01 == 0 || parish_new: || ed_new_rev:, ///
		nolog or
						  
*Female						  
melogit ckd age_last_bd ib2.possess_cat3 ib3.education i.htn i.diabetes ///
		i.smoking_status if N12observedsex01 == 1 || parish_new: || ed_new_rev:, ///
		nolog or
		 
		 


*-------------------------------------------------------------------------------

*Close log file
log close


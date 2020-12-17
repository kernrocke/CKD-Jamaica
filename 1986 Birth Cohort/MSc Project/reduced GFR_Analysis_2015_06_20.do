gen re_CG= gfr_CG
gen re_MDRD= gfr_MDRD
gen re_SW= gfr_SW
gen re_SW_1976= gfr_SW_1976
gen re_ckd_epi= gfr_ckd_epi
gen re_lyon= gfr_lyon
recode re_CG (min/89.9999=1) (90.0000/max=0)
recode re_MDRD (min/89.9999=1) (90.0000/max=0)
recode re_SW (min/89.9999=1) (90.0000/max=0)
recode re_SW_1976 (min/89.9999=1) (90.0000/max=0)
recode re_ckd_epi (min/89.9999=1) (90.0000/max=0)
recode re_lyon (min/89.9999=1) (90.0000/max=0)

label var re_CG "Reduced (90) GFR Cockcroft-Gault"
label define re_CG 0"Normal" 1"Reduced eGFR (<90) "
label value re_CG re_CG

label var re_MDRD "Reduced (<90) GFR MDRD"
label define re_MDRD 0"Normal" 1"Reduced eGFR (<90) "
label value re_MDRD re_MDRD

label var re_SW "Reduced (<90) GFR Schwartz 2009"
label define re_SW 0"Normal" 1"Reduced eGFR (<90)"
label value re_SW re_SW

label var re_SW_1976 "Reduced (<90) GFR Schwartz 1976"
label define re_SW_1976 0"Normal" 1"Reduced eGFR (<90)"
label value re_SW_1976 re_SW_1976

label var re_ckd_epi "Reduced (<90) GFR CKD EPI Collaboration"
label define re_ckd_epi 0"Normal" 1"Reduced eGFR (<90)"
label value re_ckd_epi re_ckd_epi

label var re_lyon "Reduced (<90) GFR Schwartz-Lyon"
label define re_lyon 0"Normal" 1"Reduced eGFR (<90)"
label value re_lyon re_lyon

********************************************************************************
gen re_60_CG= gfr_CG
gen re_60_MDRD= gfr_MDRD
gen re_60_SW= gfr_SW
gen re_60_SW_1976= gfr_SW_1976
gen re_60_ckd_epi= gfr_ckd_epi
gen re_60_lyon= gfr_lyon
recode re_60_CG (min/59.9999=1) (60.0000/max=0)
recode re_60_MDRD (min/59.9999=1) (60.0000/max=0)
recode re_60_SW (min/59.9999=1) (60.0000/max=0)
recode re_60_SW_1976 (min/59.9999=1) (60.0000/max=0)
recode re_60_ckd_epi (min/59.9999=1) (60.0000/max=0)
recode re_60_lyon (min/59.9999=1) (60.0000/max=0)

label var re_60_CG "Reduced (60) GFR Cockcroft-Gault"
label define re_60_CG 0"Normal" 1"Reduced eGFR (<60) "
label value re_60_CG re_60_CG

label var re_60_MDRD "Reduced (<60) GFR MDRD"
label define re_60_MDRD 0"Normal" 1"Reduced eGFR (<60)"
label value re_60_MDRD re_60_MDRD

label var re_60_SW "Reduced (<60) GFR Schwartz 2009"
label define re_60_SW 0"Normal" 1"Reduced eGFR (<60)"
label value re_60_SW re_60_SW

label var re_60_SW_1976 "Reduced (<60) GFR Schwartz 1976"
label define re_60_SW_1976 0"Normal" 1"Reduced eGFR (<60)"
label value re_60_SW_1976 re_60_SW_1976

label var re_60_ckd_epi "Reduced (<60) GFR CKD EPI Collaboration"
label define re_60_ckd_epi 0"Normal" 1"Reduced eGFR (<60)"
label value re_60_ckd_epi re_60_ckd_epi

label var re_60_lyon "Reduced (<60) GFR Schwartz-Lyon"
label define re_60_lyon 0"Normal" 1"Reduced eGFR (<60)"
label value re_60_lyon re_60_lyon


********************************************************************************
*Note sex_new 0= Female & 1= Male


*****Reduced eGFR (<90)****************

*Cockcroft-Gault
tab re_CG  if cre_miss==0
tab re_CG if sex_new==0 & cre_miss==0
tab re_CG if sex_new==1 & cre_miss==0

*MDRD
tab re_MDRD  if cre_miss==0
tab re_MDRD if sex_new==0 & cre_miss==0
tab re_MDRD if sex_new==1 & cre_miss==0

*CKD-EPI Collaboration
tab re_ckd_epi  if cre_miss==0
tab re_ckd_epi if sex_new==0 & cre_miss==0
tab re_ckd_epi if sex_new==1 & cre_miss==0

*Schwartz 1976
tab re_SW_1976  if cre_miss==0
tab re_SW_1976 if sex_new==0 & cre_miss==0
tab re_SW_1976 if sex_new==1 & cre_miss==0

*Schwartz 2009
tab re_SW  if cre_miss==0
tab re_SW if sex_new==0 & cre_miss==0
tab re_SW if sex_new==1 & cre_miss==0

*Schwartz-Lyon
tab re_lyon  if cre_miss==0
tab re_lyon if sex_new==0 & cre_miss==0
tab re_lyon if sex_new==1 & cre_miss==0

********************************************************************************

*****Reduced eGFR (<60)****************

*Cockcroft-Gault
tab re_60_CG  if cre_miss==0
tab re_60_CG if sex_new==0 & cre_miss==0
tab re_60_CG if sex_new==1 & cre_miss==0

*MDRD
tab re_60_MDRD  if cre_miss==0
tab re_60_MDRD if sex_new==0 & cre_miss==0
tab re_60_MDRD if sex_new==1 & cre_miss==0

*CKD-EPI Collaboration
tab re_60_ckd_epi  if cre_miss==0
tab re_60_ckd_epi if sex_new==0 & cre_miss==0
tab re_60_ckd_epi if sex_new==1 & cre_miss==0

*Schwartz 1976
tab re_60_SW_1976  if cre_miss==0
tab re_60_SW_1976 if sex_new==0 & cre_miss==0
tab re_60_SW_1976 if sex_new==1 & cre_miss==0

*Schwartz 2009
tab re_60_SW  if cre_miss==0
tab re_60_SW if sex_new==0 & cre_miss==0
tab re_60_SW if sex_new==1 & cre_miss==0

*Schwartz-Lyon
tab re_60_lyon  if cre_miss==0
tab re_60_lyon if sex_new==0 & cre_miss==0
tab re_60_lyon if sex_new==1 & cre_miss==0

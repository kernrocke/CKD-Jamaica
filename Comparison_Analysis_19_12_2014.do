gen ckd_diff=.
replace ckd_diff= gfr_ckd_epi- gfr_lyon
label var ckd_diff "Difference between CKD-EPI and Schwartz-Lyon"
label value ckd_diff ckd_diff
gen MDRD_diff=.
replace MDRD_diff= gfr_MDRD - gfr_lyon
label var MDRD_diff "Difference between MDRD and Schwartz-Lyon"
label value MDRD_diff MDRD_diff
gen SW_1976_diff=.
replace SW_1976_diff= gfr_SW_1976 - gfr_lyon
label var SW_1976_diff "Difference between Schwartz 1976 and Schwartz-Lyon"
label value SW_1976_diff SW_1976_diff
gen SW_2009_diff=.
replace SW_2009_diff= gfr_SW - gfr_lyon
label var SW_2009_diff "Difference between Schwartz 2009 and Schwartz-Lyon"
label value SW_2009_diff SW_2009_diff

********************************************************************************

sktest ckd_diff MDRD_diff SW_1976_diff SW_2009_diff
sktest ckd_diff MDRD_diff SW_1976_diff SW_2009_diff if ckd_miss==0
gladder ckd_diff if ckd_miss==0
ladder ckd_diff if ckd_miss==0
gladder MDRD_diff if ckd_miss==0
ladder MDRD_diff if ckd_miss==0
gladder SW_1976_diff if ckd_miss==0
ladder SW_1976_diff if ckd_miss==0
gladder SW_2009_diff if ckd_miss==0
ladder SW_2009_diff if ckd_miss==0

********************************************************************************

gen log_ckd_diff= log( ckd_diff)
label var log_ckd_diff "Log of Difference between CKD-EPI and Schwartz-Lyon"
label value log_ckd_diff log_ckd_diff
gen log_MDRD_diff= log(MDRD_diff)
label var log_MDRD_diff "Log of Difference between MDRD and Schwartz-Lyon"
label value log_MDRD_diff log_MDRD_diff
gen log_SW_1976_diff= log(SW_1976_diff)
label var log_SW_1976_diff "Log of Difference between Schwartz 1976 and Schwartz-Lyon"
label value log_SW_1976_diff log_SW_1976_diff
gen log_SW_2009_diff= log(SW_2009_diff)
label var log_SW_2009_diff "Log of Difference between Schwartz 2009 and Schwartz-Lyon"
label value log_SW_2009_diff log_SW_2009_diff

sktest log_ckd_diff log_MDRD_diff log_SW_1976_diff log_SW_2009_diff
sktest log_ckd_diff log_MDRD_diff log_SW_1976_diff log_SW_2009_diff if ckd_miss==0

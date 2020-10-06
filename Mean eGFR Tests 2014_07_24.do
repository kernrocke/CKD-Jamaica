mean gfr_MDRD gfr_lyon if ckd_miss==0
test gfr_MDRD = gfr_lyon

mean gfr_SW_1976 gfr_lyon if ckd_miss==0
test gfr_SW_1976 = gfr_lyon

mean gfr_ckd_epi gfr_lyon if ckd_miss==0
test gfr_ckd_epi = gfr_lyon

mean gfr_SW gfr_lyon if ckd_miss==0
test gfr_SW = gfr_lyon

*************************************************************
 mean gfr_MDRD gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_MDRD = gfr_lyon

mean gfr_MDRD gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_MDRD = gfr_lyon

 mean gfr_SW_1976 gfr_lyon if ckd_miss==0 & sex_new==0
 test gfr_SW_1976 = gfr_lyon

mean gfr_SW_1976 gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_SW_1976 = gfr_lyon

mean gfr_ckd_epi gfr_lyon if ckd_miss==0 & sex_new==0
 test gfr_ckd_epi = gfr_lyon

mean gfr_ckd_epi gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_ckd_epi = gfr_lyon

mean gfr_SW gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_SW = gfr_lyon

mean gfr_SW gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_SW = gfr_lyon









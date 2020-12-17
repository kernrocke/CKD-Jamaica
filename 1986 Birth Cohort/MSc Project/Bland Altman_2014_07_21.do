****************Log************

*Bland Altman

**Using batplot

batplot  log_gfr_lyon log_gfr  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  log_gfr_lyon log_GFR_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  log_gfr_lyon log_GFR_SW  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  log_gfr_lyon log_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info

*No trend (Orginal Bland Altman)

batplot  log_gfr_lyon log_gfr  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  log_gfr_lyon log_GFR_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  log_gfr_lyon log_GFR_SW  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  log_gfr_lyon log_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend


*Bland Altman

**Using baplot

baplot  log_gfr_lyon log_gfr  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_GFR_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_GFR_SW  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500

*No trend (Orginal Bland Altman)

baplot  log_gfr_lyon log_gfr  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_GFR_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_GFR_SW  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  log_gfr_lyon log_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500


***********No Log******************

*Bland Altman 

**Using batplot

batplot  gfr_lyon gfr_ckd_epi if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  gfr_lyon gfr_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  gfr_lyon gfr_SW if ckd_miss==0 & q1117cre >6 & q1117cre <500, info
batplot  gfr_lyon gfr_SW_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info

*No trend (Orginal Bland Altman)

batplot  gfr_lyon gfr_ckd_epi  if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  gfr_lyon gfr_MDRD if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  gfr_lyon gfr_SW if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend
batplot  gfr_lyon gfr_SW_1976 if ckd_miss==0 & q1117cre >6 & q1117cre <500, info notrend

*Bland Altman 

**Using baplot

baplot  gfr_lyon gfr_ckd_epi  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_SW  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_SW_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500

*No trend (Orginal Bland Altman)

baplot  gfr_lyon gfr_ckd_epi  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_MDRD  if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_SW if ckd_miss==0 & q1117cre >6 & q1117cre <500
baplot  gfr_lyon gfr_SW_1976  if ckd_miss==0 & q1117cre >6 & q1117cre <500

********************************************************************************
*Dr. Younger Analysis

gen diff1 = gfr_SW_1976- gfr_lyon
egen  meangfr1 = rowmean(  gfr_SW_1976 gfr_lyon)
regress diff1  meangfr1

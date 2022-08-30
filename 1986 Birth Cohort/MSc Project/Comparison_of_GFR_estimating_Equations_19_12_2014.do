*Comparing GFR Estimating Equations in Young Afro-Caribbean Adults

*Distribution of glomerular filtration rate (GFR) estimated using the Schwartz-Lyon Equation

histogram gfr_lyon if ckd_miss==0, frequency normal ylab(0(25)160) xlab(50(25)325)

*Descriptive Creatinine and eGFR Estimating Equations

tabstat q1117cre gfr_MDRD gfr_ckd_epi gfr_SW gfr_lyon if ckd_miss==0, stat(mean sd median iqr min max) col(stat)

*Descriptive Creatinine and eGFR Estimating Equations by Sex
tabstat q1117cre gfr_MDRD gfr_ckd_epi gfr_SW gfr_lyon if ckd_miss==0, by(sex_new) stat(mean sd median iqr min max) col(stat)

*Missing Data Analysis

misstable summarize q1117cre gfr_MDRD gfr_ckd_epi gfr_SW gfr_lyon

*Pairwise Correlation between creatinine and eGFR estimatiing equations

pwcorr q1117cre gfr_MDRD gfr_ckd_epi gfr_SW gfr_lyon if ckd_miss==0, obs sig

********************************************************************************

*******CKD-EPI*******

***Mean Tests

*Female

mean gfr_ckd_epi gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_ckd_epi = gfr_lyon

*Male

mean gfr_ckd_epi gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_ckd_epi = gfr_lyon


*Bland-Altman Plot
batplot gfr_ckd_epi gfr_lyon if ckd_miss==0, info
batplot gfr_ckd_epi gfr_lyon if ckd_miss==0, info notrend

batplot gfr_ckd_epi gfr_lyon if ckd_miss==0, title(Agreement between CKD-EPI and Scwartz-Lyon) info notrend xlab(64(50)300) moptions(mlabp(9))

********************************************************************************

*******MDRD*********

***Mean Tests

*Female

mean gfr_MDRD gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_MDRD = gfr_lyon

*Male

mean gfr_MDRD gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_MDRD = gfr_lyon

*Bland-Altman Plot

batplot gfr_MDRD gfr_lyon if ckd_miss==0, info
batplot gfr_MDRD gfr_lyon if ckd_miss==0, info notrend

batplot gfr_MDRD gfr_lyon if ckd_miss==0, title(Agreement between MDRD and Scwartz-Lyon) info notrend xlab(62(50)550) moptions(mlabp(9))

********************************************************************************

******Schwartz 1976******

***Mean Tests

*Female

mean gfr_SW_1976 gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_SW_1976 = gfr_lyon

*Male

mean gfr_SW_1976 gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_SW_1976 = gfr_lyon


*Bland-Altman Plot

batplot gfr_SW_1976 gfr_lyon if ckd_miss==0, info
batplot gfr_SW_1976 gfr_lyon if ckd_miss==0, info notrend

batplot gfr_SW_1976 gfr_lyon if ckd_miss==0, title(Agreement between Schwartz 1976 and Scwartz-Lyon) info notrend xlab(60(50)440) moptions(mlabp(9))

********************************************************************************

******Schwartz 2009******

***Mean Tests

*Female

mean gfr_SW gfr_lyon if ckd_miss==0 & sex_new==0
test gfr_SW = gfr_lyon

*Male

mean gfr_SW gfr_lyon if ckd_miss==0 & sex_new==1
test gfr_SW = gfr_lyon


*Bland-Altman Plot

batplot gfr_SW gfr_lyon if ckd_miss==0, info
batplot gfr_SW gfr_lyon if ckd_miss==0, info notrend

batplot gfr_SW gfr_lyon if ckd_miss==0, title(Agreement between Schwartz 2009 and Scwartz-Lyon) info notrend xlab(50(30)330) moptions(mlabp(9))


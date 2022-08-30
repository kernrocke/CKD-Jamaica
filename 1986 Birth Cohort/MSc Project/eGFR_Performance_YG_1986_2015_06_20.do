*Performance of eGFR estimating equations in Afro_Caribbean Young Adults: An Analysis of the Jamaican 1986 Birth Cohort

*Deletion of observations with extreme creatinine levels of 5.2 and 512. 
drop in 682
drop in 836

*Creating on Creatinine and BSA non-missing variable."

egen float cre_miss = rowmiss (q1117cre bsa q112age)
recode cre_miss (2=1)
label var cre_miss "Complete information on Creatinine, Age and BSA"

*Summary Statistics for eGFR equations
summ q1117cre gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976  gfr_SW  gfr_lyon if cre_miss==0
tabstat q1117cre gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976  gfr_SW  gfr_lyon if cre_miss==0, statistics( count mean sd min max median iqr ) columns(statistics)
tabstat q1117cre gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976  gfr_SW  gfr_lyon if cre_miss==0, by(sex_new) statistics( count mean sd min max median iqr ) columns(statistics)

*Paired t-test and Wilcoxon Rank Sum Analysis

*Overall
ttest gfr_CG = gfr_lyon if cre_miss==0
signrank gfr_CG = gfr_lyon if cre_miss==0
ttest gfr_ckd_epi = gfr_lyon if cre_miss==0
signrank gfr_ckd_epi = gfr_lyon if cre_miss==0
ttest gfr_MDRD = gfr_lyon if cre_miss==0
signrank gfr_MDRD = gfr_lyon if cre_miss==0
ttest gfr_SW_1976 = gfr_lyon if cre_miss==0
signrank gfr_SW_1976 = gfr_lyon if cre_miss==0
ttest gfr_SW = gfr_lyon if cre_miss==0
signrank gfr_SW = gfr_lyon if cre_miss==0

*Female
ttest gfr_CG = gfr_lyon if sex_new==0 & cre_miss==0
signrank gfr_CG = gfr_lyon if sex_new==0 & cre_miss==0
ttest gfr_ckd_epi = gfr_lyon if sex_new==0 & cre_miss==0
signrank gfr_ckd_epi = gfr_lyon if sex_new==0 & cre_miss==0
ttest gfr_MDRD = gfr_lyon if sex_new==0 & cre_miss==0
signrank gfr_MDRD = gfr_lyon if sex_new==0 & cre_miss==0
ttest gfr_SW_1976 = gfr_lyon if sex_new==0 & cre_miss==0
signrank gfr_SW_1976 = gfr_lyon if sex_new==0 & cre_miss==0
ttest gfr_SW = gfr_lyon if sex_new==0 & cre_miss==0
signrank gfr_SW = gfr_lyon if sex_new==0 & cre_miss==0

*Male
ttest gfr_CG = gfr_lyon if sex_new==1 & cre_miss==0
signrank gfr_CG = gfr_lyon if sex_new==1 & cre_miss==0
ttest gfr_ckd_epi = gfr_lyon if sex_new==1 & cre_miss==0
signrank gfr_ckd_epi = gfr_lyon if sex_new==1 & cre_miss==0
ttest gfr_MDRD = gfr_lyon if sex_new==1 & cre_miss==0
signrank gfr_MDRD = gfr_lyon if sex_new==1 & cre_miss==0
ttest gfr_SW_1976 = gfr_lyon if sex_new==1 & cre_miss==0
signrank gfr_SW_1976 = gfr_lyon if sex_new==1 & cre_miss==0
ttest gfr_SW = gfr_lyon if sex_new==1 & cre_miss==0
signrank gfr_SW = gfr_lyon if sex_new==1 & cre_miss==0


*Overall
ttest log_gfr_CG = log_gfr_lyon if cre_miss==0
signrank log_gfr_CG = log_gfr_lyon if cre_miss==0
ttest log_gfr = log_gfr_lyon if cre_miss==0
signrank log_gfr = log_gfr_lyon if cre_miss==0
ttest log_GFR_MDRD = log_gfr_lyon if cre_miss==0
signrank log_GFR_MDRD = log_gfr_lyon if cre_miss==0
ttest log_1976 = log_gfr_lyon if cre_miss==0
signrank log_1976 = log_gfr_lyon if cre_miss==0
ttest log_GFR_SW = log_gfr_lyon if cre_miss==0
signrank log_GFR_SW = log_gfr_lyon if cre_miss==0

*Female
ttest log_gfr_CG = log_gfr_lyon if sex_new==0 & cre_miss==0
signrank log_gfr_CG = log_gfr_lyon if sex_new==0 & cre_miss==0
ttest log_gfr = log_gfr_lyon if sex_new==0 & cre_miss==0
signrank log_gfr = log_gfr_lyon if sex_new==0 & cre_miss==0
ttest log_GFR_MDRD = log_gfr_lyon if sex_new==0 & cre_miss==0
signrank log_GFR_MDRD = log_gfr_lyon if sex_new==0 & cre_miss==0
ttest log_1976 = log_gfr_lyon if sex_new==0 & cre_miss==0
signrank log_1976 = log_gfr_lyon if sex_new==0 & cre_miss==0
ttest log_GFR_SW = log_gfr_lyon if sex_new==0 & cre_miss==0
signrank log_GFR_SW = log_gfr_lyon if sex_new==0 & cre_miss==0

*Male
ttest log_gfr_CG = log_gfr_lyon if sex_new==1 & cre_miss==0
signrank log_gfr_CG = log_gfr_lyon if sex_new==1 & cre_miss==0
ttest log_gfr = log_gfr_lyon if sex_new==1 & cre_miss==0
signrank log_gfr = log_gfr_lyon if sex_new==1 & cre_miss==0
ttest log_GFR_MDRD = log_gfr_lyon if sex_new==1 & cre_miss==0
signrank log_GFR_MDRD = log_gfr_lyon if sex_new==1 & cre_miss==0
ttest log_1976 = log_gfr_lyon if sex_new==1 & cre_miss==0
signrank log_1976 = log_gfr_lyon if sex_new==1 & cre_miss==0
ttest log_GFR_SW = log_gfr_lyon if sex_new==1 & cre_miss==0
signrank log_GFR_SW = log_gfr_lyon if sex_new==1 & cre_miss==0

********************************************************************************

*Bland Altman Analysis

batplot gfr_CG gfr_lyon if cre_miss==0, info
batplot gfr_CG gfr_lyon if cre_miss==0, info notrend
batplot gfr_MDRD gfr_lyon if cre_miss==0, info
batplot gfr_MDRD gfr_lyon if cre_miss==0, info notrend
batplot gfr_ckd_epi gfr_lyon if cre_miss==0, info
batplot gfr_ckd_epi gfr_lyon if cre_miss==0, info notrend
batplot gfr_SW_1976 gfr_lyon if cre_miss==0, info
batplot gfr_SW_1976 gfr_lyon if cre_miss==0, info notrend
batplot gfr_SW gfr_lyon if cre_miss==0, info
batplot gfr_SW gfr_lyon if cre_miss==0, info notrend

batplot log_gfr_CG log_gfr_lyon if cre_miss==0, info
batplot log_gfr_CG log_gfr_lyon if cre_miss==0, info notrend
batplot log_GFR_MDRD log_gfr_lyon if cre_miss==0, info
batplot log_GFR_MDRD log_gfr_lyon if cre_miss==0, info notrend
batplot log_gfr log_gfr_lyon if cre_miss==0, info notrend
batplot log_gfr log_gfr_lyon if cre_miss==0, info
batplot log_gfr log_gfr_lyon if cre_miss==0, info notrend
batplot log_GFR_SW log_gfr_lyon if cre_miss==0, info
batplot log_1976 log_gfr_lyon if cre_miss==0, info
batplot log_1976 log_gfr_lyon if cre_miss==0, info notrend
batplot log_GFR_SW log_gfr_lyon if cre_miss==0, info
batplot log_GFR_SW log_gfr_lyon if cre_miss==0, info notrend

********************************************************************************

gen diff0 = gfr_CG- gfr_lyon 
egen  mean0 = rowmean( gfr_CG gfr_lyon)
gen log_diff0 = log_gfr_CG - log_gfr_lyon
egen log_mean0 = rowmean (log_gfr_CG log_gfr_lyon)

gen diff1 = gfr_MDRD - gfr_lyon
egen  mean1 = rowmean( gfr_MDRD gfr_lyon)
gen log_diff1 = log_GFR_MDRD - log_gfr_lyon
egen log_mean1 = rowmean (log_GFR_MDRD log_gfr_lyon)

gen diff2 = gfr_ckd_epi - gfr_lyon
egen  mean2 = rowmean( gfr_ckd_epi gfr_lyon)
gen log_diff2 = log_gfr - log_gfr_lyon
egen log_mean2 = rowmean (log_gfr log_gfr_lyon)

gen diff3 = gfr_SW_1976 - gfr_lyon
egen  mean3 = rowmean( gfr_SW_1976 gfr_lyon)
gen log_diff3 = log_1976 - log_gfr_lyon
egen log_mean3 = rowmean (log_1976 log_gfr_lyon)

gen diff4 = gfr_SW - gfr_lyon
egen  mean4 = rowmean( gfr_SW gfr_lyon)
gen log_diff4 = log_GFR_SW - log_gfr_lyon
egen log_mean4 = rowmean (log_GFR_SW log_gfr_lyon)

********************************************************************************
*One Sample t-test for differences between eGFR equations and Schwartz-Lyon Equation

*Determination if there are signifcant differences between measurements or vary from 0.

ttest diff0==0 if cre_miss==0
ttest diff1==0 if cre_miss==0
ttest diff2==0 if cre_miss==0
ttest diff3==0 if cre_miss==0
ttest diff4==0 if cre_miss==0
ttest log_diff0==0 if cre_miss==0
ttest log_diff1==0 if cre_miss==0
ttest log_diff2==0 if cre_miss==0
ttest log_diff3==0 if cre_miss==0
ttest log_diff4==0 if cre_miss==0

********************************************************************************

*Simple Linear Regression Model of differences with Means

regress diff0 mean0 if cre_miss==0
regress diff1 mean1 if cre_miss==0
regress diff2 mean2 if cre_miss==0
regress diff3 mean3 if cre_miss==0
regress diff4 mean4 if cre_miss==0
regress log_diff0 log_mean0 if cre_miss==0
regress log_diff1 log_mean1 if cre_miss==0
regress log_diff2 log_mean2 if cre_miss==0
regress log_diff3 log_mean3 if cre_miss==0
regress log_diff4 log_mean4 if cre_miss==0

*Female
regress diff0 mean0 if sex_new==0 & cre_miss==0
regress diff1 mean1 if sex_new==0 & cre_miss==0
regress diff2 mean2 if sex_new==0 & cre_miss==0
regress diff3 mean3 if sex_new==0 & cre_miss==0
regress diff4 mean4 if sex_new==0 & cre_miss==0
regress log_diff0 log_mean0 if sex_new==0 & cre_miss==0
regress log_diff1 log_mean1 if sex_new==0 & cre_miss==0
regress log_diff2 log_mean2 if sex_new==0 & cre_miss==0
regress log_diff3 log_mean3 if sex_new==0 & cre_miss==0
regress log_diff4 log_mean4 if sex_new==0 & cre_miss==0

*Male
regress diff0 mean0 if sex_new==1 & cre_miss==0
regress diff1 mean1 if sex_new==1 & cre_miss==0
regress diff2 mean2 if sex_new==1 & cre_miss==0
regress diff3 mean3 if sex_new==1 & cre_miss==0
regress diff4 mean4 if sex_new==1 & cre_miss==0
regress log_diff0 log_mean0 if sex_new==1 & cre_miss==0
regress log_diff1 log_mean1 if sex_new==1 & cre_miss==0
regress log_diff2 log_mean2 if sex_new==1 & cre_miss==0
regress log_diff3 log_mean3 if sex_new==1 & cre_miss==0
regress log_diff4 log_mean4 if sex_new==1 & cre_miss==0

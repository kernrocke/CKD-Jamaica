*Performance of eGFR estimating equations in Afro_Caribbean Young Adults: An Analysis of the Jamaican 1986 Birth Cohort


*Paired t-test and Wilcoxon Rank Sum Analysis

*Overall
ttest gfr_CG = gfr_lyon 
signrank gfr_CG = gfr_lyon
ttest gfr_ckd_epi = gfr_lyon 
signrank gfr_ckd_epi = gfr_lyon 
ttest gfr_MDRD = gfr_lyon 
signrank gfr_MDRD = gfr_lyon 
ttest gfr_SW_1976 = gfr_lyon 
signrank gfr_SW_1976 = gfr_lyon 
ttest gfr_SW = gfr_lyon 
signrank gfr_SW = gfr_lyon 

*Female
ttest gfr_CG = gfr_lyon if sex_new==0
signrank gfr_CG = gfr_lyon if sex_new==0
ttest gfr_ckd_epi = gfr_lyon if sex_new==0
signrank gfr_ckd_epi = gfr_lyon if sex_new==0
ttest gfr_MDRD = gfr_lyon if sex_new==0
signrank gfr_MDRD = gfr_lyon if sex_new==0
ttest gfr_SW_1976 = gfr_lyon if sex_new==0
signrank gfr_SW_1976 = gfr_lyon if sex_new==0
ttest gfr_SW = gfr_lyon if sex_new==0
signrank gfr_SW = gfr_lyon if sex_new==0

*Male
ttest gfr_CG = gfr_lyon if sex_new==1
signrank gfr_CG = gfr_lyon if sex_new==1
ttest gfr_ckd_epi = gfr_lyon if sex_new==1
signrank gfr_ckd_epi = gfr_lyon if sex_new==1
ttest gfr_MDRD = gfr_lyon if sex_new==1
signrank gfr_MDRD = gfr_lyon if sex_new==1
ttest gfr_SW_1976 = gfr_lyon if sex_new==1
signrank gfr_SW_1976 = gfr_lyon if sex_new==1
ttest gfr_SW = gfr_lyon if sex_new==1
signrank gfr_SW = gfr_lyon if sex_new==1


*Overall
ttest log_gfr_CG = log_gfr_lyon
signrank log_gfr_CG = log_gfr_lyon
ttest log_gfr = log_gfr_lyon 
signrank log_gfr = log_gfr_lyon 
ttest log_GFR_MDRD = log_gfr_lyon 
signrank log_GFR_MDRD = log_gfr_lyon 
ttest log_1976 = log_gfr_lyon 
signrank log_1976 = log_gfr_lyon 
ttest log_GFR_SW = log_gfr_lyon 
signrank log_GFR_SW = log_gfr_lyon 

*Female
ttest log_gfr_CG = log_gfr_lyon if sex_new==0
signrank log_gfr_CG = log_gfr_lyon if sex_new==0
ttest log_gfr = log_gfr_lyon if sex_new==0
signrank log_gfr = log_gfr_lyon if sex_new==0
ttest log_GFR_MDRD = log_gfr_lyon if sex_new==0
signrank log_GFR_MDRD = log_gfr_lyon if sex_new==0
ttest log_1976 = log_gfr_lyon if sex_new==0
signrank log_1976 = log_gfr_lyon if sex_new==0
ttest log_GFR_SW = log_gfr_lyon if sex_new==0
signrank log_GFR_SW = log_gfr_lyon if sex_new==0

*Male
ttest log_gfr_CG = log_gfr_lyon if sex_new==1
signrank log_gfr_CG = log_gfr_lyon if sex_new==1
ttest log_gfr = log_gfr_lyon if sex_new==1
signrank log_gfr = log_gfr_lyon if sex_new==1
ttest log_GFR_MDRD = log_gfr_lyon if sex_new==1
signrank log_GFR_MDRD = log_gfr_lyon if sex_new==1
ttest log_1976 = log_gfr_lyon if sex_new==1
signrank log_1976 = log_gfr_lyon if sex_new==1
ttest log_GFR_SW = log_gfr_lyon if sex_new==1
signrank log_GFR_SW = log_gfr_lyon if sex_new==1

********************************************************************************

*Bland Altman Analysis

batplot gfr_CG gfr_lyon, info
batplot gfr_CG gfr_lyon, info notrend
batplot gfr_MDRD gfr_lyon, info
batplot gfr_MDRD gfr_lyon, info notrend
batplot gfr_ckd_epi gfr_lyon, info
batplot gfr_ckd_epi gfr_lyon, info notrend
batplot gfr_SW_1976 gfr_lyon, info
batplot gfr_SW_1976 gfr_lyon, info notrend
batplot gfr_SW gfr_lyon, info
batplot gfr_SW gfr_lyon, info notrend

batplot log_gfr_CG log_gfr_lyon, info
batplot log_gfr_CG log_gfr_lyon, info notrend
batplot log_GFR_MDRD log_gfr_lyon, info
batplot log_GFR_MDRD log_gfr_lyon, info notrend
batplot log_gfr log_gfr_lyon, info notrend
batplot log_gfr log_gfr_lyon, info
batplot log_gfr log_gfr_lyon, info notrend
batplot log_GFR_SW log_gfr_lyon, info
batplot log_1976 log_gfr_lyon, info
batplot log_1976 log_gfr_lyon, info notrend
batplot log_GFR_SW log_gfr_lyon, info
batplot log_GFR_SW log_gfr_lyon, info notrend

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

ttest diff0==0
ttest diff1==0 
ttest diff2==0 
ttest diff3==0 
ttest diff4==0 
ttest log_diff0==0
ttest log_diff1==0 
ttest log_diff2==0 
ttest log_diff3==0 
ttest log_diff4==0 

********************************************************************************

*Simple Linear Regression Model of differences with Means

regress diff0 mean0
regress diff1 mean1 
regress diff2 mean2 
regress diff3 mean3 
regress diff4 mean4 
regress log_diff0 log_mean0
regress log_diff1 log_mean1 
regress log_diff2 log_mean2 
regress log_diff3 log_mean3 
regress log_diff4 log_mean4 

*Female
regress diff0 mean0 if sex_new==0
regress diff1 mean1 if sex_new==0
regress diff2 mean2 if sex_new==0
regress diff3 mean3 if sex_new==0
regress diff4 mean4 if sex_new==0
regress log_diff0 log_mean0 if sex_new==0
regress log_diff1 log_mean1 if sex_new==0
regress log_diff2 log_mean2 if sex_new==0
regress log_diff3 log_mean3 if sex_new==0
regress log_diff4 log_mean4 if sex_new==0

*Male
regress diff0 mean0 if sex_new==1
regress diff1 mean1 if sex_new==1
regress diff2 mean2 if sex_new==1
regress diff3 mean3 if sex_new==1
regress diff4 mean4 if sex_new==1
regress log_diff0 log_mean0 if sex_new==1
regress log_diff1 log_mean1 if sex_new==1
regress log_diff2 log_mean2 if sex_new==1
regress log_diff3 log_mean3 if sex_new==1
regress log_diff4 log_mean4 if sex_new==1

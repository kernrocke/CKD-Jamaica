use "E:\1986_Birth_Cohort_MSc_Epi_2014_07_18.dta", clear
use13 "E:\1986_Birth_Cohort_MSc_Epi_2014_07_18.dta", clear
ssc install  use13
use13 "E:\1986_Birth_Cohort_MSc_Epi_2014_07_18.dta", clear
help baplot
help bat
ssc install batplot
sysuse auto, clear
sysuse auto, clear
batplot mpg turn
baplot mpg turn
baplot mpg turn
use13 "E:\1986_Birth_Cohort_MSc_Epi_2014_07_18.dta", clear
baplot  gfr_SW_1976 gfr_lyon, info notrend
batplot  gfr_SW_1976 gfr_lyon, info notrend
dis (94.3402766386227 - 53.14469853116755)/1.96
gen diff 1 = gfr_SW_1976- gfr_lyon
gen diff1 = gfr_SW_1976- gfr_lyon
ci diff1
summ  diff1
batplot  gfr_SW_1976 gfr_lyon, info notrend
batplot  gfr_SW_1976 gfr_lyon, info
egen  meangfr1 = rowmean(  gfr_SW_1976 gfr_lyon)
regress diff1  meangfr1
batplot  gfr_SW  gfr_lyon, info
batplot  gfr_SW_1976 gfr_lyon, info
batplot  gfr_SW  gfr_lyon, info
gen diff2 = gfr_SW- gfr_lyon
egen  meangfr2 = rowmean(  gfr_SW gfr_lyon)
regress diff2  meangfr2
batplot  gfr_SW  gfr_lyon, info notrend
baplot  gfr_SW  gfr_lyon
tab ckd_kdigo
logistic ckd_kdigo gfr_SW
mark ckd_gfr_SW if  gfr_SW < 60
recode ckd_gfr_SW 0=. if  gfr_SW == .
logistic ckd_kdigo ckd_gfr_SW
roctab    ckd_kdigo ckd_gfr_SW
roctab    ckd_kdigo   gfr_SW
roctab    ckd_kdigo   gfr_lyon
roctab    ckd_kdigo   gfr_lyon gfr_SW
roccomp    ckd_kdigo   gfr_lyon gfr_SW
batplot  gfr_MDRD  gfr_lyon, info notrend
batplot  gfr_MDRD  gfr_lyon, info
baplot  gfr_MDRD  gfr_lyon
regress diff1
log close

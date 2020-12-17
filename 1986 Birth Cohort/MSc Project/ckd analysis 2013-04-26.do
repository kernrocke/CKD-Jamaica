use "C:\Documents and Settings\10018377\My Documents\DATA\CHRC Diabetic Foot\Complete Datasets\Diabetic Foot Study Dataset  2010.10.06 Anonymized188[2012.09.13]+FW+Occup.dta", clear
save "C:\Documents and Settings\10018377\My Documents\DATA\CHRC Diabetic Foot\Complete Datasets\Diabetic Foot Study Dataset  2010.10.06 Anonymized188[2013.04.26]+FW+Occup.dta"
lookfor creat
sum last creat, detail
sum lastcreat, detail
lookfor age
sum age
count if age <18
gen gfr_ckd_epi =.
lookfor race
browse lastcreat sex age
dis 166*(84/61.9)^-0.329*(0.993)^44
dis 0.993^44
dis 84/61.9
dis 1.3570275^-0.329
dis 1.3570275^0.329
dis 1.3570275^-0.329
dis 166*.90443703*.73411979
dis 1/0.329
1.3570275^3.0395137
dis 1.3570275^3.0395137
dis 1.3570275^-0.329
display 166*(84/61.9)^-0.329*(0.993)^44
display 166*(84/61.9)^-1.209*(0.993)^44
count if lastcreat <=61.9
*replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if
codebook sex
lookfor sex
lookfor sex2
codebook sex2
*replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat <=61.9
preserve
replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat <=61.9
count if lastcreat <=61.9
count if lastcreat <=61.9 & sex==2
restore
sum gfr_ckd_epi
preserve
*replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat >61.9 & last creat !=.
count if sex==2 & lastcreat >61.9 & last creat !=.
count if sex==2 & lastcreat >61.9 & lastcreat !=.
replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat >61.9 & last creat !=.
replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat >61.9 & lastcreat !=.
sum gfr_ckd_epi
replace gfr_ckd_epi = 166*(lastcreat/61.9)^-0.329*(0.993)^age if sex==2 & lastcreat <=61.9 & lastcreat !=.
sum gfr_ckd_epi
*replace gfr_ckd_epi = 163*(lastcreat/79.6)^-1.209*(0.993)^age if sex==1 & lastcreat >79.6 & lastcreat !=.
count if sex==1 & lastcreat >79.6 & lastcreat !=.
*replace gfr_ckd_epi = 163*(lastcreat/79.6)^-1.209*(0.993)^age if sex==1 & lastcreat >79.6 & lastcreat !=.
replace gfr_ckd_epi = 163*(lastcreat/79.6)^-1.209*(0.993)^age if sex==1 & lastcreat >79.6 & lastcreat !=.
sum gfr_ckd_epi
replace gfr_ckd_epi = 163*(lastcreat/79.6)^-0.411*(0.993)^age if sex==1 & lastcreat <=79.6 & lastcreat !=.
sum gfr_ckd_epi
replace gfr_ckd_epi = . if age <18
count if age <18
sum gfr_ckd_epi
browse lastcreat sex age gfr_ckd_epi
sum gfr_ckd_epi, detail
count if gfr_ckd_epi <60 & gfr_ckd_epi !=.
dis 38/162
notes gfr_ckd_epi: Variable created TS for estimated GFR, for persons 18 years and older, using the CKD-EPI equation (Levy et al. Annals of Int Med 2009; 150 (9): 604-12). Commands stored in do file "CKD\ckd analysis 2013-04-26.do". Equation for SI units taken from National Kidney Education Programme document available at:  http://nkdep.nih.gov/lab-evaluation/gfr/estimating.shtml. Commands used were:   replace gfr_ckd_epi = 166*(lastcreat/61.9)^-1.209*(0.993)^age if sex==2 & lastcreat >61.9 & lastcreat !=. ;  replace gfr_ckd_epi = 166*(lastcreat/61.9)^-0.329*(0.993)^age if sex==2 & lastcreat <=61.9 & lastcreat !=. ; replace gfr_ckd_epi = 163*(lastcreat/79.6)^-1.209*(0.993)^age if sex==1 & lastcreat >79.6 & lastcreat !=. ;  replace gfr_ckd_epi = 163*(lastcreat/79.6)^-0.411*(0.993)^age if sex==1 & lastcreat <=79.6 & lastcreat !=. ;  replace gfr_ckd_epi = . if age <18
save "C:\Documents and Settings\10018377\My Documents\DATA\CHRC Diabetic Foot\Complete Datasets\Diabetic Foot Study Dataset  2010.10.06 Anonymized188[2013.04.26]+FW+Occup.dta", replace
varmanage
label variable gfr_ckd_epi "eGFR (CKD-EPI Equation)"
save "C:\Documents and Settings\10018377\My Documents\DATA\CHRC Diabetic Foot\Complete Datasets\Diabetic Foot Study Dataset  2010.10.06 Anonymized188[2013.04.26]+FW+Occup.dta", replace
lookfor kidney
tab nephropath
tab nephrotype
tab nepnrother
tab nephrother
tab albumiuria
tab albuminuria
exit, clear

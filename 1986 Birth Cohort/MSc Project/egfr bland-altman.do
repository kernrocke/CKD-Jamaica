use "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-17].dta", clear
use13 "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-17].dta", clear
sum gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976
bysort sex_new: sum gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976
bysort sex_new: mean gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976
mean gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976
test gfr_ckd_epi = gfr_MDRD
test gfr_ckd_epi = gfr_SW
test gfr_ckd_epi = gfr_lyon
test gfr_ckd_epi = gfr_SW_1976
test gfr_SW = gfr_lyon
test gfr_SW = gfr_SW_1976
mean gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976 if sex_new ==0
test gfr_ckd_epi = gfr_MDRD
test gfr_ckd_epi = gfr_SW
test gfr_ckd_epi = gfr_lyon
test gfr_SW = gfr_lyon
test gfr_SW = gfr_SW_1976
mean gfr_ckd_epi gfr_MDRD gfr_SW gfr_lyon gfr_SW_1976 if sex_new ==1
test gfr_ckd_epi = gfr_MDRD
test gfr_ckd_epi = gfr_SW
test gfr_ckd_epi = gfr_lyon
test gfr_SW = gfr_lyon
test gfr_SW = gfr_SW_1976
findit batplot
findit baplot
help baplot
use col_icp
baplot icp colorime, avlab("ICPOES vs Colorimetry)
baplot icp colorime, avlab("ICPOES vs Colorimetry")
use13 "C:\Users\10018377\Dropbox\Kern Rocke- MSc Epidemiology (Research Project)\Perinatal_fu_1820_Merged834matched_03Apr2013[No Names][CKD][2014-07-17].dta", clear
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
do "C:\Users\10018377\AppData\Local\Temp\STD00000000.tmp"
exit, clear

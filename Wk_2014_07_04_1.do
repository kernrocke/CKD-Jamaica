use "F:\WorkPC\NovieYounger\Teaching\MScEpi\2013-14\Projects\KernRocke\Perinatal_fu_1820_Merged834matched_03Apr2013[2014_01_09][No Names][Match2014_902only] (2).dta", clear
log close
use "F:\WorkPC\NovieYounger\Teaching\MScEpi\2013-14\Projects\KernRocke\Perinatal_fu_1820_Merged834matched_03Apr2013[2014_01_09][No Names][Match2014_902only] (2).dta", clear
lookfor include
misstable bwt_std gfr_ckd_epi g6a
misstable patterns  bwt_std gfr_ckd_epi g6a
misstable patterns  bwt_std gfr_ckd_epi g6a  sbp
lookfor sys
notes high_sbp
lookfor bp
misstable patterns  bwt_std gfr_ckd_epi g6a  sbp mn23sbp
misstable patterns  bwt_std gfr_ckd_epi g6a   mn23sbp
misstable summ   bwt_std gfr_ckd_epi g6a   mn23sbp
count
dis 0.82*902
misstable patterns  bwt_std gfr_ckd_epi g6a   mn23sbp if include2 == 1
misstable summ  bwt_std gfr_ckd_epi g6a   mn23sbp if include2 == 1
misstable summ  bwt_std gfr_ckd_epi g6a   mn23sbp if singleton == 1
misstable pattern  bwt_std gfr_ckd_epi g6a   mn23sbp if singleton == 1
summ gfr_ckd_epi
summ gfr_ckd_epi if singleton == 1
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
browse _mi*
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
pwcorr gfr_ckd_epi mn23sbp2 if singleton == 1, obs sig
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
browse
browse gfr_ckd_epi  mn23sbp2 sex_new q112age _mi* if singleton = 1
browse gfr_ckd_epi  mn23sbp2 sex_new q112age _mi* if singleton == 1
mi estimate: regress  gfr_ckd_epi  mn23sbp2 sex_new q112age if singleton == 1
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
do "C:\Users\10015497\AppData\Local\Temp\STD07000000.tmp"
mi test sex_new
exit, clear

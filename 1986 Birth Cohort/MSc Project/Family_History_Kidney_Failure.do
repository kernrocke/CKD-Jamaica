q71wgt q72hgt bsa bmi mn23sbp mn23dbp fam_kidf cre_new q1117cre

gen fam_kidf= q28kdn1 +q28kdn2 + q28kdn3 + q28kdn4 + q28kdn5 + q28kdn6
recode fam_kidf (1/max=1)
label var fam_kidf "Family History of Kidney Failure"
label define fam_kidf 0"No" 1"Yes"
label value fam_kidf fam_kidf
tab fam_kidf


********************************************************************************

*Table 1 General Characteristics of Young Adult (18-20 years) Participatns (n=851)

ttest q71wgt if cre_miss==0, by(sex_new)
ttest q72hgt if cre_miss==0, by(sex_new)
ttest bsa if cre_miss==0, by(sex_new)
ttest bmi if cre_miss==0, by(sex_new)
ttest mn23sbp if cre_miss==0, by(sex_new)
ttest mn23dbp if cre_miss==0, by(sex_new)
tab fam_kidf sex_new, row chi2
ttest cre_new if cre_miss==0, by(sex_new)
ttest q1117cre if cre_miss==0, by(sex_new)


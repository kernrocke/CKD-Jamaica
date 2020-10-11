*SUMMARY STATISTICS FOR MSc. EPIDEMIOLOGY RESEARCH PROJECT

*Tabulation of distribution of sex among the population

tab sex_new if ckd_miss==0

********************************************************************************

*Table 1 (Participant's Characteristics at Birth)

ttest g6a if ckd_miss==0, by(sex_new)
ranksum g6a if ckd_miss==0, by(sex_new)

ttest bwt_std if ckd_miss==0, by(sex_new)
ranksum bwt_std if ckd_miss==0, by(sex_new)

ttest blength if ckd_miss==0, by(sex_new)
ranksum blength if ckd_miss==0, by(sex_new)

ttest gestage_new if ckd_miss==0, by(sex_new)
ranksum gestage_new if ckd_miss==0, by(sex_new)

ttest ponderal_index if ckd_miss==0, by(sex_new)
ranksum ponderal_index if ckd_miss==0, by(sex_new)

proportion lowbwt if ckd_miss==0, over(sex_new)
proportion lowbwt if ckd_miss==0

proportion preterm if ckd_miss==0, over(sex_new)
proportion preterm if ckd_miss==0

********************************************************************************

*Table 2 (Maternal Characteristics at Child's Birth)

ttest ageatbrth if ckd_miss==0, by(sex_new)
ranksum ageatbrth if ckd_miss==0, by(sex_new)

proportion htn_preg if ckd_miss==0, over(sex_new)
proportion htn_preg if ckd_miss==0

proportion occ_cat_mom1a if ckd_miss==0, over(sex_new)
proportion occ_cat_mom1a if ckd_miss==0

proportion edcat3 if ckd_miss==0, over(sex_new)
proportion edcat3 if ckd_miss==0

proportion htn_preg if ckd_miss==0, over(sex_new)
proportion htn_preg if ckd_miss==0

proportion smoker if ckd_miss==0, over (sex_new)
proportion smoker if ckd_miss==0

********************************************************************************

*Table 3 (Anthropometric Characteristics of Participants at age 18-20 Years)

ttest q112age if ckd_miss==0, by(sex_new)
ranksum q112age if ckd_miss==0, by(sex_new)

ttest q72hgt if ckd_miss==0, by(sex_new)
ranksum q72hgt if ckd_miss==0, by(sex_new)


ttest q71wgt  if ckd_miss==0, by(sex_new)
ranksum q71wgt  if ckd_miss==0, by(sex_new)

ttest bmi  if ckd_miss==0, by(sex_new)
ranksum bmi  if ckd_miss==0, by(sex_new)

ttest hipcirc   if ckd_miss==0, by(sex_new)
ranksum hipcirc   if ckd_miss==0, by(sex_new)


ttest waistcirc2 if ckd_miss==0, by(sex_new)
ranksum waistcirc2 if ckd_miss==0, by(sex_new)

ttest waist_hip if ckd_miss==0, by(sex_new)
ranksum waist_hip if ckd_miss==0, by(sex_new)

********************************************************************************

*Table 4 (Physiologic and Biochemical Characteristics of Participants at 18-20 Years)

ttest mn23sbp2 if ckd_miss==0, by(sex_new)
ranksum mn23sbp2 if ckd_miss==0, by(sex_new)

ttest mn23dbp2 if ckd_miss==0, by(sex_new)
ranksum mn23dbp2 if ckd_miss==0, by(sex_new)

ttest fastglu if ckd_miss==0, by(sex_new)
ranksum fastglu if ckd_miss==0, by(sex_new)

ttest q115chol if ckd_miss==0, by(sex_new)
ranksum q115chol if ckd_miss==0, by(sex_new)

ttest q116fat if ckd_miss==0, by(sex_new)
ranksum q116fat if ckd_miss==0, by(sex_new)

ttest q1117cre if ckd_miss==0, by(sex_new)
ranksum q1117cre if ckd_miss==0, by(sex_new)

ttest alb_v if ckd_miss==0, by(sex_new)
ranksum alb_v if ckd_miss==0, by(sex_new)

ttest gfr_ckd_epi if ckd_miss==0, by(sex_new)
ranksum gfr_ckd_epi if ckd_miss==0, by(sex_new)

ttest gfr_MDRD if ckd_miss==0, by(sex_new)
ranksum gfr_MDRD if ckd_miss==0, by(sex_new)

ttest gfr_SW if ckd_miss==0, by(sex_new)
ranksum gfr_SW if ckd_miss==0, by(sex_new)

ttest gfr_lyon if ckd_miss==0, by(sex_new)
ranksum gfr_lyon if ckd_miss==0, by(sex_new)

proportion own_education if ckd_miss==0, over(sex_new)
proportion own_education if ckd_miss==0

proportion own_occup_cat2 if ckd_miss==0, over(sex_new)
proportion own_occup_cat2 if ckd_miss==0

proportion low_ren_f if ckd_miss==0, over(sex_new)
proportion low_ren_f if ckd_miss==0

proportion micro_alb if ckd_miss==0, over(sex_new)
proportion micro_alb if ckd_miss==0

proportion ckd_class if ckd_miss==0, over(sex_new)
proportion ckd_class if ckd_miss==0

proportion ckd_kdigo if ckd_miss==0, over(sex_new)
proportion ckd_kdigo if ckd_miss==0

proportion overwt if ckd_miss==0, over(sex_new)
proportion overwt if ckd_miss==0

proportion q47smok1 if ckd_miss==0, over(sex_new)
proportion q47smok1 if ckd_miss==0

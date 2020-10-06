*SUMMARY STATISTICS FOR MSc. EPIDEMIOLOGY RESEARCH PROJECT


*Test for Normality of Summary Measures

sktest q112age q72hgt q71wgt bmi hipcirc waistcirc2 waist_hip mn23sbp mn23dbp fastglu q115chol q116fat q1117cre alb_v gfr_ckd_epi


****Table 1 Demographic and Antrhopometric Characteristcs of Participants****


*Age
bysort sex_new: ttest q112age if singleton==1, by(lowbwt)
bysort sex_new: ranksum q112age, by(lowbwt)


*Height (cm)
bysort sex_new: ttest q72hgt if singleton==1, by(lowbwt)
bysort sex_new: ranksum q72hgt if singleton==1, by(lowbwt)


*Weight
bysort sex_new: ttest q71wgt if singleton==1, by(lowbwt)
bysort sex_new: ranksum q71wgt if singleton==1, by(lowbwt)


*BMI
bysort sex_new: ttest bmi if singleton==1, by(lowbwt)
bysort sex_new: ranksum bmi if singleton==1, by(lowbwt)


*Hip Circumference
bysort sex_new: ttest hipcirc if singleton==1, by(lowbwt)
bysort sex_new: ranksum hipcirc if singleton==1, by(lowbwt)


*Waist Circumference
bysort sex_new: ttest waistcirc2 if singleton==1, by(lowbwt)
bysort sex_new: ranksum waistcirc2 if singleton==1, by(lowbwt)


*Waist to Hip Ratio
bysort sex_new: ttest waist_hip if singleton==1, by(lowbwt)
bysort sex_new: ranksum waist_hip if singleton==1, by(lowbwt)



*****Table 2 Physiologic and Biochemical Characteristcs of Participants*******


*Systolic Blood Pressure
bysort sex_new: ttest mn23sbp if singleton==1, by(lowbwt)
bysort sex_new: ranksum mn23sbp if singleton==1, by(lowbwt)


*Diastolic Blood Pressure
bysort sex_new: ttest mn23dbp if singleton==1, by(lowbwt)
bysort sex_new: ranksum mn23dbp if singleton==1, by(lowbwt)


*Fasting Blood Glucose
bysort sex_new: ttest fastglu if singleton==1, by(lowbwt)
bysort sex_new: ranksum fastglu if singleton==1, by(lowbwt)


*HDL
bysort sex_new: ttest q115chol if singleton==1, by(lowbwt)
bysort sex_new: ranksum q115chol if singleton==1, by(lowbwt)


*Triglycerides
bysort sex_new: ttest q116fat if singleton==1, by(lowbwt)
bysort sex_new: ranksum q116fat if singleton==1, by(lowbwt)


*Creatinine
bysort sex_new: ttest q1117cre if singleton==1, by(lowbwt)
bysort sex_new: ranksum q1117cre if singleton==1, by(lowbwt)


*Urinary Albumin
bysort sex_new: ttest alb_v if singleton==1, by(lowbwt)
bysort sex_new: ranksum alb_v if singleton==1, by(lowbwt)


*Estimated Glomerular Filtration Rate
bysort sex_new: ttest gfr_ckd_epi if singleton==1, by(lowbwt)
bysort sex_new: ranksum gfr_ckd_epi if singleton==1, by(lowbwt)



*****Table 3 Proportion Estimates for eGFR Quintiles, Albuminuria and Overweight/Obesity*******

*eGFR Quintiles
proportion quin_gfr if singleton==1 & sex_new==1, over(lowbwt)
proportion quin_gfr if singleton==1 & sex_new==0, over(lowbwt)
proportion quin_gfr if singleton==1, over(lowbwt)


*Albuminuria
proportion micro_alb if singleton==1 & sex_new==1, over(lowbwt)
proportion micro_alb if singleton==1 & sex_new==0, over(lowbwt)
proportion micro_alb if singleton==1, over(lowbwt)


*Overweight/Obesity
proportion overwt if singleton==1 & sex_new==1, over(lowbwt)
proportion overwt if singleton==1 & sex_new==0, over(lowbwt)
proportion overwt if singleton==1, over(lowbwt)

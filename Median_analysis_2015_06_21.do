**** Median Analysis by Gender *******
       
*Creatinine
median q1117cre if cre_miss==0, by(sex_new)
median q1117cre if cre_miss==0, by(sex_new) exact
median q1117cre if cre_miss==0, by(sex_new) medianties(below)
median q1117cre if cre_miss==0, by(sex_new) medianties(above)
median q1117cre if cre_miss==0, by(sex_new) medianties(drop)
median q1117cre if cre_miss==0, by(sex_new) medianties(split)

*eGFR Cockcroft-Gault
median gfr_CG if cre_miss==0, by(sex_new)
median gfr_CG if cre_miss==0, by(sex_new) exact
median gfr_CG if cre_miss==0, by(sex_new) medianties(below)
median gfr_CG if cre_miss==0, by(sex_new) medianties(above)
median gfr_CG if cre_miss==0, by(sex_new) medianties(drop)

*eGFR Modification of Diet in Renal Disease
median gfr_MDRD if cre_miss==0, by(sex_new)
median gfr_MDRD if cre_miss==0, by(sex_new) exact
median gfr_MDRD if cre_miss==0, by(sex_new) medianties(below)
median gfr_MDRD if cre_miss==0, by(sex_new) medianties(above)
median gfr_MDRD if cre_miss==0, by(sex_new) medianties(drop)
median gfr_MDRD if cre_miss==0, by(sex_new) medianties(split)

*eGFR Chronic Kidney Disease Colllaboration Epidemiology
median gfr_ckd_epi if cre_miss==0, by(sex_new)
median gfr_ckd_epi if cre_miss==0, by(sex_new) exact
median gfr_ckd_epi if cre_miss==0, by(sex_new) medianties(below)
median gfr_ckd_epi if cre_miss==0, by(sex_new) medianties(above)
median gfr_ckd_epi if cre_miss==0, by(sex_new) medianties(drop)
median gfr_ckd_epi if cre_miss==0, by(sex_new) medianties(split)

*eGFR Schwartz 1976
median gfr_SW_1976 if cre_miss==0, by(sex_new)
median gfr_SW_1976 if cre_miss==0, by(sex_new) exact
median gfr_SW_1976 if cre_miss==0, by(sex_new) medianties(below)
median gfr_SW_1976 if cre_miss==0, by(sex_new) medianties(above)
median gfr_SW_1976 if cre_miss==0, by(sex_new) medianties(drop)

*eGFR Schwartz 2009
median gfr_SW if cre_miss==0, by(sex_new)
median gfr_SW if cre_miss==0, by(sex_new) exact
median gfr_SW if cre_miss==0, by(sex_new) medianties(below)
median gfr_SW if cre_miss==0, by(sex_new) medianties(above)
median gfr_SW if cre_miss==0, by(sex_new) medianties(drop)

*eGFR Schwartz-Lyon
median gfr_lyon if cre_miss==0, by(sex_new)
median gfr_lyon if cre_miss==0, by(sex_new) exact
median gfr_lyon if cre_miss==0, by(sex_new) medianties(below)
median gfr_lyon if cre_miss==0, by(sex_new) medianties(above)
median gfr_lyon if cre_miss==0, by(sex_new) medianties(drop)

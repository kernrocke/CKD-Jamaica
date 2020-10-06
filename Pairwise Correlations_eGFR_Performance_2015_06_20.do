***** Pair-wise Correlations with GFR-Lyon as the reference group******

*Overall Sample
pwcorr gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976 gfr_SW gfr_lyon if cre_miss==0, obs sig star(0.05)

*Female
pwcorr gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976 gfr_SW gfr_lyon if sex_new==0 & cre_miss==0 , obs sig star(0.05)

*Male
pwcorr gfr_CG gfr_MDRD gfr_ckd_epi gfr_SW_1976 gfr_SW gfr_lyon if sex_new==1 & cre_miss==0, obs sig star(0.05)


*Interaction Analysis Creatinine

*Interaction for Sex

*Model 1
xtmixed q1117cre sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age  if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age

*Model 2

xtmixed q1117cre sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2

*Model 3

xtmixed q1117cre bwt_std blength gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.ageatbrth sex_new#c.edcat3 sex_new#c.occ_cat_mom1a sex_new#c.htn_preg sex_new#c.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast  sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.ageatbrth sex_new#c.edcat3 sex_new#c.occ_cat_mom1a sex_new#c.htn_preg sex_new#c.smoker

*Model 4

xtmixed q1117cre bwt_std blength gestage_new sex_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.mn23sbp2 sex_new#c.q115chol sex_new#c.q116fat sex_new#c.fastglu sex_new#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.mn23sbp2 sex_new#c.q115chol sex_new#c.q116fat sex_new#c.fastglu sex_new#c.q47smok1

*Model 5

xtmixed q1117cre bwt_std blength gestage_new sex_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.mn23dbp2 sex_new#c.q115chol sex_new#c.q116fat sex_new#c.fastglu sex_new#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast sex_new#c.bwt_std sex_new#c.blength sex_new#c.gestage_new sex_new#c.q112age sex_new#c.bmi sex_new#c.own_education sex_new#c.own_occup_cat2 sex_new#c.mn23dbp2 sex_new#c.q115chol sex_new#c.q116fat sex_new#c.fastglu sex_new#c.q47smok1


*Interaction for Participant's Education


*Model 1

xtmixed q1117cre own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age 

*Model 2

xtmixed q1117cre own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi i.own_education own_education#c.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi own_education#c.own_occup_cat2

*Model 3

xtmixed q1117cre own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi own_education own_education#c.own_occup_cat2 own_education#c.ageatbrth own_education#c.edcat3 own_education#c.occ_cat_mom1a own_education#c.htn_preg own_education#c.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new  own_education#c.q112age own_education#c.bmi own_education#c.own_occup_cat2  own_education#c.ageatbrth own_education#c.edcat3 own_education#c.occ_cat_mom1a own_education#c.htn_preg own_education#c.smoker

*Model 4

xtmixed q1117cre own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi i.own_education own_education#c.own_occup_cat2  own_education#c.mn23sbp2 own_education#c.q115chol own_education#c.q116fat own_education#c.fastglu own_education#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast  own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi own_education#c.own_occup_cat2 own_education#c.mn23sbp2 own_education#c.q115chol own_education#c.q116fat own_education#c.fastglu own_education#c.q47smok1

*Model 5

xtmixed q1117cre own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi i.own_education own_education#c.own_occup_cat2  own_education#c.mn23dbp2 own_education#c.q115chol own_education#c.q116fat own_education#c.fastglu own_education#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast  own_education#c.bwt_std own_education#c.blength own_education#c.gestage_new own_education#c.sex_new own_education#c.q112age own_education#c.bmi own_education#c.own_occup_cat2 own_education#c.mn23dbp2 own_education#c.q115chol own_education#c.q116fat own_education#c.fastglu own_education#c.q47smok1


*Interaction for Participant's Occupation


*Model 1

xtmixed q1117cre own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age 

*Model 2

xtmixed q1117cre own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education i.own_occup_cat2 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education

*Model 3

xtmixed q1117cre own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education i.own_occup_cat2 own_occup_cat2#c.ageatbrth own_occup_cat2#c.edcat3 own_occup_cat2#c.occ_cat_mom1a own_occup_cat2#c.htn_preg own_occup_cat2#c.smoker if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education own_occup_cat2#c.ageatbrth own_occup_cat2#c.edcat3 own_occup_cat2#c.occ_cat_mom1a own_occup_cat2#c.htn_preg own_occup_cat2#c.smoker

*Model 4

xtmixed q1117cre own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education i.own_occup_cat2 own_occup_cat2#c.mn23sbp2 own_occup_cat2#c.q115chol own_occup_cat2#c.q116fat own_occup_cat2#c.fastglu own_occup_cat2#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education own_occup_cat2#c.mn23sbp2 own_occup_cat2#c.q115chol own_occup_cat2#c.q116fat own_occup_cat2#c.fastglu own_occup_cat2#c.q47smok1

*Model 5

xtmixed q1117cre own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education i.own_occup_cat2 own_occup_cat2#c.mn23dbp2 own_occup_cat2#c.q115chol own_occup_cat2#c.q116fat own_occup_cat2#c.fastglu own_occup_cat2#c.q47smok1 if ckd_miss== 0, || place_birth :,  covariance(identity)
contrast own_occup_cat2#c.bwt_std own_occup_cat2#c.blength own_occup_cat2#c.gestage_new own_occup_cat2#c.sex_new own_occup_cat2#c.q112age own_occup_cat2#c.bmi own_occup_cat2#c.own_education own_occup_cat2#c.mn23dbp2 own_occup_cat2#c.q115chol own_occup_cat2#c.q116fat own_occup_cat2#c.fastglu own_occup_cat2#c.q47smok1

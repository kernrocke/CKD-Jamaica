*Independant t-test analysis for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation.

*Mann-Whitney U and Median test for explanatory variables by missing gfr and alb values. To be used for basis of missing at random for multiple imputation. 

describe g6a blength bwt_std gestage_new ponderal_index

* Tests for Missing at random for Birth Weight by Presence or Absence of missing values for GFR and albumin
ttest g6a, by(ckd_miss)
ranksum g6a, by( ckd_miss)
median g6a, by( ckd_miss) exact
ttest g6a, by( ckd_miss)
ranksum g6a, by( ckd_miss)
median g6a, by( ckd_miss) exact
* Tests for Missing at random for Birth Length by Presence or Absence of missing values for GFR and albumin
ttest blength, by( ckd_miss)
ranksum blength, by(ckd_miss)
median blength, by( ckd_miss) exact
ttest blength, by( ckd_miss)
ranksum blength, by( ckd_miss)
median blength, by( ckd_miss) exact
* Tests for Missing at random for Standardized Birth Weights by Presence or Absence of missing values for GFR and albumin
ttest bwt_std , by( ckd_miss)
ranksum bwt_std , by(ckd_miss)
median bwt_std , by(ckd_miss) exact
ttest bwt_std , by(ckd_miss)
ranksum bwt_std , by( ckd_miss)
median bwt_std , by(ckd_miss) exact
* Tests for Missing at random for Gestational Age by Presence or Absence of missing values for GFR and albumin
ttest gestage_new  , by(ckd_miss)
ranksum gestage_new  , by( ckd_miss)
median gestage_new  , by( ckd_miss) exact
ttest gestage_new  , by( ckd_miss)
ranksum gestage_new  , by( ckd_miss)
median gestage_new  , by( ckd_miss) exact
* Tests for Missing at random for Ponderal Index by Presence or Absence of missing values for GFR and albumin
ttest ponderal_index  , by(ckd_miss)
ranksum ponderal_index  , by(ckd_miss)
median ponderal_index  , by(ckd_miss) exact
ttest ponderal_index  , by(ckd_miss)
ranksum ponderal_index  , by(ckd_miss)
median ponderal_index  , by(ckd_miss) exact

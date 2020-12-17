*hosptype
xtmixed gfr_ckd_epi if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength if singleton==1, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)

*hospital_type 
xtmixed gfr_ckd_epi if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength if singleton==1, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)

*hospital_type~w 
xtmixed gfr_ckd_epi if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength if singleton==1, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)

*parish_birth 
xtmixed gfr_ckd_epi if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength if singleton==1, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)

*place_birth
xtmixed gfr_ckd_epi if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength if singleton==1, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)

*parish_cat4
xtmixed gfr_ckd_epi if singleton==1, || parish_cat4:
xtmixed gfr_ckd_epi g6a if singleton==1, || parish_cat4:
xtmixed gfr_ckd_epi blength if singleton==1, || parish_cat4:
xtmixed gfr_ckd_epi g6a blength if singleton==1, || parish_cat4:

xtmixed alb_v if singleton==1, || parish_cat4:
xtmixed alb_v g6a if singleton==1, || parish_cat4:
xtmixed alb_v blength if singleton==1, || parish_cat4:
xtmixed alb_v g6a blength if singleton==1, || parish_cat4:

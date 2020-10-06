*hosptype
xtmixed gfr_ckd_epi, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength, || hosptype:, covariance(independent) || parish_cat4:, covariance(independent)

*hospital_type 
xtmixed gfr_ckd_epi, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength, || hospital_type:, covariance(independent) || parish_cat4:, covariance(independent)

*hospital_type~w 
xtmixed gfr_ckd_epi, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength, || hospital_type~w :, covariance(independent) || parish_cat4:, covariance(independent)

*parish_birth 
xtmixed gfr_ckd_epi, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength, || parish_birth :, covariance(independent) || parish_cat4:, covariance(independent)

*place_birth
xtmixed gfr_ckd_epi, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi blength, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed gfr_ckd_epi g6a blength, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)

xtmixed alb_v, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v blength, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)
xtmixed alb_v g6a blength, || place_birth:, covariance(independent) || parish_cat4:, covariance(independent)

*parish_cat4
xtmixed gfr_ckd_epi, || parish_cat4:
xtmixed gfr_ckd_epi g6a, || parish_cat4:
xtmixed gfr_ckd_epi blength, || parish_cat4:
xtmixed gfr_ckd_epi g6a blength, || parish_cat4:

xtmixed alb_v, || parish_cat4:
xtmixed alb_v g6a, || parish_cat4:
xtmixed alb_v blength, || parish_cat4:
xtmixed alb_v g6a blength, || parish_cat4:

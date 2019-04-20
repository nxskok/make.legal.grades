# create grade boundaries
grade_boundaries=readr::read_csv("data-raw/grade_points.csv")
usethis::use_data(grade_boundaries, overwrite=T)

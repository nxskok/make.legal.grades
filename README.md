
<!-- README.md is generated from README.Rmd. Please edit that file -->

# make.legal.grades

Turn unrounded course marks into rounded ones, not awarding grades one
less than a letter-grade boundary.

## Installation

You can install the released version of make.legal.grades from Github
with:

``` r
devtools::install_github("nxskok/make.legal.grades")
```

## Example

The default `nogood` has 79 as one of the grades not to award:

``` r
library(make.legal.grades)
makelegal(c(79.6, 79.4))
#> [1] 80 78
makelegal(79.4, fudge=0.5)
#> [1] 80
makelegal(c(81.6, 81.4, 79.4), nogood=81)
#> [1] 82 80 79
```

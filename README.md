# make.legal.grades

Turn unrounded course marks into rounded ones, not awarding grades one less than a letter-grade boundary.

## Installation

You can install the released version of make.legal.grades from Github with:

``` r
devtools::install_github("nxskok/make.legal.grades")
```

## Examples

``` r
makelegal(c(79.6, 79.4))
makelegal(79.4, fudge=0.5)
makelegal(c(81.4, 79.4), nogood=81)
```



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

The University of Toronto makes us submit number (percent) grades for
our students, which for GPA purposes are then converted into [letter
grades](https://www.utsc.utoronto.ca/registrar/u-t-grading-scheme).
Students don’t like getting a number grade one below a letter-grade
boundary. Giving one is a sure-fire way to receive emails from students
asking to be rounded up (to which the answer is “no”).

The default `nogood` (see below) has 79 as one of the grades not to
award, since 80 is an A- here. This is what I do:

``` r
library(make.legal.grades)
makelegal(c(79.6, 79.4))
#> [1] 80 78
```

79.6 rounds up to 80, 79.4 rounds down to 79, so I round it down one
further, sending the message “you didn’t get to 80”.

Other possibilities can be handled by supplying a `fudge` factor, which
is added to the input before it is rounded:

``` r
makelegal(c(79.4, 79.1), fudge=0.5)
#> [1] 80 80
```

This rounds all 79s up to 80. Or you can specify one or more number
grades not to award:

``` r
makelegal(c(81.6, 81.4, 79.4), nogood=81)
#> [1] 82 80 79
```

81.6 rounds up to 82; 81.4 rounds down to 81 and is rounded down again
(because I don’t want to award 81). There is now no problem with
awarding a 79, which is what 79.4 rounds to.

An additional use of `fudge` is to allow students who are very close to
get the higher grade:

``` r
makelegal(c(79.4, 79.49))
#> [1] 78 78
makelegal(c(79.4, 79.49), fudge=0.02)
#> [1] 78 80
```

The reason for writing this package is that I always had to find last
semester’s R code and copy the function. No more\!

## Other possibilities

One of my colleagues sets harder exams, and then rounds each student
(except, presumably, for the ones who fail) up to the next letter-grade
boundary. That would require another function, which I guess I now have
to write.

Also, I would like to expose the list of forbidden grades, or perhaps
the lowest number grade to achieve a certain letter grade, in the
package also. I have to remember how to do that.

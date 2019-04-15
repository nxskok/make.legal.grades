#' adjust grades to be "legal", not one short of a letter grade boundary
#'
#' Convert possibly decimal grades to integers not in a forbidden set, which can be specied by the user, with optional "fudge factor" (see Details)
#'
#' Default `nogood` are grades one below a GPA boundary at University of Toronto. My standard practice is to say that anything
#' that would round to one less than a grade boundary goes down to the next integer below (ie. 79.6 rounds up to 80, but 79.4
#' rounds to 79 and is rounded one more down to 78). If you prefer some other behaviour, adjust `fudge` appropriately. For example,
#' `fudge=0.5` would round anything bigger than 79 up to 80, `fudge=-0.5` would round anything less than 80 down, and a tiny
#' adjustment like `fudge=0.01` would give students just below 79 a chance to receive 80.
#'
#' @param x vector of decimal grades (on scale to be reported)
#' @param nogood vector of grades not to be awarded
#' @param fudge fudge factor (see Details)
#'
#' @examples
#' makelegal(c(79.6, 79.4))
#' makelegal(79.4, fudge=0.5)
#' makelegal(c(81.4, 79.4), nogood=81)
#'
#' @export
makelegal=function(x, nogood=c(89, 84, 79, 76, 72, 69, 66, 62, 59, 56, 52, 49), fudge=0) {
  z=round(x+fudge)
  ifelse(z %in% nogood, z-1, z)
}

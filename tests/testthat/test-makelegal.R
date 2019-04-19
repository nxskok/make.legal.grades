context("test-makelegal")

test_that("proper behaviour with default marks to omit", { # 62 is not allowed
 expect_equal(makelegal(c(79.6, 79.4, 62.1, 61.8, 62.4, 62.6)), c(80, 78, 61, 61, 61, 63))
})

test_that("user specified marks to omit",{
  expect_equal(makelegal(c(65, 65.7, 64.8), nogood=65), c(64, 66, 64))
})

test_that("fudge factor works properly", {
  expect_equal(makelegal(c(61.8, 62.4, 62.6), fudge=0.5), c(61, 63, 63))
})

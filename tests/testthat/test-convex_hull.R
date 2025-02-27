test_that("convex_hull works", {
  xy <- cbind(c(0, 1, 2, 3, 4, 0, 1, 2, 3, 1, 2), c(0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2))
  vp <- convex_hull(xy)
  expect_that(vp$resverts, equals(c(1, 6, 10, 11, 5)))
  expect_that(vp$rescoords, equals(xy[vp$resverts, ]))
})

test_that("convex_hull uses 1-based indexing, #613", {
  set.seed(45)
  n <- 10
  xy <- cbind(runif(n), runif(n))
  vp <- convex_hull(xy)
  expect_that(vp$resverts, equals(c(8, 10, 7, 2, 1)))
})

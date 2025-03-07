test_that("biconnected_components works", {
  g <- make_full_graph(5) + make_full_graph(5)
  clu <- components(g)$membership
  g <- add_edges(g, c(match(1, clu), match(2, clu)))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list <- lapply(list, as.vector)
    list[order(sapply(list, paste, collapse = "x"))]
  }

  bc <- biconnected_components(g)
  expect_that(bc$no, equals(3))
  expect_that(sortlist(bc$tree_edges), equals(list(
    c(11, 15, 18, 20),
    c(1, 5, 8, 10), 21
  )))
  expect_that(sortlist(bc$component_edges), equals(list(11:20, 1:10, 21)))
  expect_that(sortlist(bc$components), equals(list(1:5, c(1, 6), 6:10)))
  expect_that(sort(as.vector(bc$articulation_points)), equals(c(1, 6)))
})

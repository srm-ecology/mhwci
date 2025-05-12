#' MHWCI testing
#' 

test_that("partioning works", {
  start_year= 2040
  decade_partitions = create_partition_df(partition_size_years=3, start_year = start_year, end_year = 2069)
  expect_equal(10, nrow(decade_partitions))
  expect_equal(start_year, decade_partitions$partition_start[1])
  expect_equal(as.character(tail(decade_partitions$partition_end_date,1)[1]), "2069-12-31")

})

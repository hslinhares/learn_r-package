library(tidyverse)

path = 'data/'

localize_beach <- function(dat) {
  lookup_table <- read_csv(
    paste0(path, "beach-lookup-table.csv")   
  ,
  col_types = cols(where = "c", english = "c")
  )
  left_join(dat, lookup_table, by = "where")
}

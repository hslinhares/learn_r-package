library(tidyverse)

infile <-  'swin.csv'

path = 'C:/Users/Henrique/Documents/learn_R/data/'

dat <-  read_csv(paste0(path, infile), col_types = cols(name = "c",
                 where = "c", temp = "d"))


lookup_table <- tribble(
  ~where, ~english,
  "beach",     "US",
  "coast",     "US",
  "seashore",   "UK",
  "seaside",    "UK"
)

dat <- dat |> 
  left_join(lookup_table)

f_to_c <- function(x) (x - 32) * 5/9

dat <- dat |> 
  mutate(temp = if_else(english == "US", f_to_c(temp), temp))


now <- Sys.time()

timestamp <- function(time) format(time, "%Y-%B-%d_%H-%M-%S")

outfile_path <- function(infile) {
  paste0(path, timestamp(now), "_", sub("(.*)([.]csv$)", "\\1_clean\\2", infile))
}

write_csv(dat, outfile_path(infile))



library(tidyverse)
library(magrittr)


source("rpackage_5.3_cleaning_helpers.R")

infile <-  'swin.csv'
path = 'data/'

dat <-  read_csv(paste0(path, infile),
                 col_types = cols(name = "c",
                                  where = "c", temp = "d"))


dat <- dat |> localize_beach()

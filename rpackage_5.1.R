library(devtools)

infile <-  'swin.csv'

path = 'data/'

dat <-  read.csv(paste0(path, infile))

dat$english[dat$where == "beach"] <- "US"
dat$english[dat$where == "coast"] <- "US"
dat$english[dat$where == "seashore"] <- "UK"
dat$english[dat$where == "seaside"] <- "UK"

dat$temp[dat$english == "US"] <- (dat$temp[dat$english == "US"] - 32) * 5/9


now <-  Sys.time()
timestamp <- format(now, "%Y-%B-%d_%H-%M-%S")
(outfile <- paste0(timestamp, "_",  sub("(.*)([.]csv$)", "\\1_clean\\2", infile)))

write.csv(dat, file = paste0(path,outfile), quote = FALSE, row.names = FALSE )


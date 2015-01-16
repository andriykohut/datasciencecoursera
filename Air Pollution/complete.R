cc_count_per_file <- function(file) {
  frame <- read.csv(file)
  cc <- frame[complete.cases(frame),]
  nrow(cc)
}

complete <- function(directory, id = 1:332) {
  output <- data.frame(id=numeric(), nobs=numeric())
  index <- 1
  for (i in id) {
    fpath <- file.path(directory, sprintf("%03d.csv", i))
    output[index,] <- c(i, cc_count_per_file(fpath))
    index <- index + 1
  }
  output
}
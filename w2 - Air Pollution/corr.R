complete_per_file <- function(file) {
  frame <- read.csv(file)
  frame[complete.cases(frame),]
}

corr <- function(directory, threshold = 0) {
  result <- c()
  filenames <- list.files(directory, pattern = "*.csv", full.names=T)
  for (filename in filenames) {
    cc <- complete_per_file(filename)
    if (nrow(cc) > threshold) {
      result <- c(result, cor(cc$sulfate, cc$nitrate))
    }
  }
  result
}
combine_csv <- function(directory, id) {
  fpaths <- lapply(id, function (x) file.path(directory, sprintf("%03d.csv", x)))
  frames <- lapply(fpaths, read.csv)
  Reduce(function(...) rbind(...), frames)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  raw_frame <- combine_csv(directory, id)
  pollutant_only <- raw_frame[,c(pollutant, "ID")]
  complete <- complete.cases(pollutant_only)
  mean(pollutant_only[complete,][[pollutant]])
}
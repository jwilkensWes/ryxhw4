print.ryx <- function(x, ...){
  if(!inherits(x, "ryx")) stop("Must be class ryx")
  y <- x[1]
  title <- paste("Correlations of ", y, " with", sep = "")
  cat(title)
  cat("\n")
  print(x$df, row.names = FALSE)
}

#' @title summary.ryx
#' @description Generic summary function specified for the ryx() function
#' @param x The output of ryx()
#' @param ... Any additional passed arguments
#' @return A summary of the output of the ryx() function in words.
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  summary(x)
#'  }
#' }
#' @rdname summary.ryx
#' @export

summary.ryx <- function(x, ...){
  if(!inherits(x, "ryx")) stop("Must be class ryx")
  y = x$y
  vars = x$x
  cat("Correlating", y, "with", vars, sep = " ")
  cat("\n")
  data <- x$df
  r <- data$r
  rabs <- abs(data$r)
  med <- round(median(rabs), 3)
  low <- round(min(r), 3)
  high <- round(max(r), 3)
  cat("The median absolute correlation was", med, "with a range from", low,
      "to", high, sep = " ")
  cat("\n")
  total <- length(r)
  fil <- data[ data$sigif == "***", ]
  sig <- length(data$r)
  cat(sig, "out of", total, "variables were significant at the p < 0.05 level.",
      sep = " ")
}

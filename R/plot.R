#' @title plot.ryx
#' @description Generic plot function specified for the ryx() function
#' @param x The output of ryx()
#' @param ... Any additional passed arguments
#' @return A plot showing the absolute value of the correlation coefficients
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  plot(x)
#'  }
#' }
#' @rdname plot.ryx
#' @export

plot.ryx <- function(x, ...){
  if(!inherits(x, "ryx")) stop("Must be class ryx")
  data <- x$df
  data <- data[order(abs(data$r)),]
  data$direct <- factor(ifelse(data$r > 0, "Positive", "Negative"))
  data$direct
  dotchart(abs(data$r), labels = data$variable,
           groups = data$direct,
           xlim = c(0, 1),
           offset = 1/4,
           main = paste("Correlations with", x$y, sep = " "),
           xlab = "Correlation (absolute value)",
           ylab = "Variables")
}

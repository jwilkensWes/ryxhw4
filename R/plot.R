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

#' @title print.ryx
#' @description Generic print function specified for the ryx() function
#' @param x The output of ryx()
#' @param ... Any additional passed arguments
#' @return A table showing the output of the ryx() function
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  print(x)
#'  }
#' }
#' @rdname print.ryx
#' @export

print.ryx <- function(x, ...){
  if(!inherits(x, "ryx")) stop("Must be class ryx")
  y <- x[1]
  title <- paste("Correlations of ", y, " with", sep = "")
  cat(title)
  cat("\n")
  print(x$df, row.names = FALSE)
}

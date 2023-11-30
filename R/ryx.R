#' @title ryx
#' @description Create correlation measure between two or more variables
#' @param data Dataframe containing variables
#' @param y Variable to measure correlations against
#' @param x Variable(s) to test against y
#' @return A list of length 3. 1. The y variables. 2. The x variable(s). 3. A dataframe containing the correlation measures with significance checks.
#' @details
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  library(MASS)
#'  x <- ryx(Boston, y = "medv")
#'  }
#' }
#' @rdname ryx
#' @export

ryx <- function(data, y, x){
  if(missing(x)){
    x <- names(data)[sapply(data, class)=="numeric"]
    x <- setdiff(x, y)
  }
  df <- data.frame()
  for (var in x){
    res <- cor.test(data[[y]], data[[var]])
    df_temp <- data.frame(variable = var,
                          r = res$estimate,
                          p = res$p.value)
    df <- rbind(df, df_temp)
    df <- df[order(-abs(df$r)),]
  }

  df$sigif <- ifelse(df$p < .001, "***",
                     ifelse(df$p < .01, "**",
                            ifelse(df$p < .05, "*", " ")))
  results <- list(y=y, x=x, df=df)
  class(results) <- "ryx"
  return(results)
}

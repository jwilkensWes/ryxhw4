
# ryxhw4

<img src="star.jpg" width="200"/>

<!-- badges: start -->
<!-- badges: end -->

The goal of ryxhw4 is to easily calculate and display correlations between variables.

## Installation

You can install the development version of ryxhw4 with:

``` r
remotes::install_github("jwilkensWes/ryxhw4")

```

## Example

This is a basic example which shows you how to use the package with the Boston dataset from the MASS package:

``` r
library(ryxhw4)
library(MASS)
x <- ryx(Boston, y = "medv")
```


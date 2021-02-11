#' ----
#' title: "My demo"
#' author: "Ismail Nambunga"
#' date: '`r format(Sys.Date(), "%B %d %Y")`'
#' output: html_document
#' ----

#' A very important demo

library(NambungaBCI)

# Generate data
data <- data.frame(R = 1:5, fun = c(1:5)^2)

# Plot results
my_plot(data, R, fun, "Plot showing how fun increases with R")

#' We've shown that as R increases (to 5 at least), fun also increases.
#' 
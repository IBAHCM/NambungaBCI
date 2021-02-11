#' my_plot
#' 
#' A very simple plotting function
#' 
#' @param data \code{data.frame} containing data
#' @param x column containing x-axis data
#' @param y column containing y-axis data
#' @param title \code{string} containing plot title
#' 
#' @return Returns a \code{ggplot} object
#' @export
#' 
#' @examples 
#' # Generate data
#' data <- data.frame(R = 1:5, fun = c(1:5)^2)
#' # Plot results
#' my_plot(data, R, fun, "Plot showing how fun increases with R)
#' 
my_plot <- function(data, x, y, title) {
  ggplot2::ggplot(data, ggplot2::aes(x = {{ x }},
                                     y = {{ y }})) +
    ggplot2::theme_linedraw() +
    ggplot2::geom_point() +
    ggplot2::geom_line() +
    ggplot2::labs(title = title)
}

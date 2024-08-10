#' Clean up plotly legend
#' 
#' @param plot plotly; your plotly plot
#' @param legend_title bol; should the legend title be removed, defaults to TRUE
#' @export 


clean_plotly_legend <- function(plot,
                                legend_title = T){
  
  l <- length(plot$x$data)
  
  for(i in 1:l){
    
    plot$x$data[[i]]$name <- gsub("\\(|,1)", "", plot$x$data[[i]]$name )
    
  }
  
  if(legend_title){
    
    plot %>%
      layout(
        legend = list(
          title = "",  # Remove legend title
          titlefont = list(size = 0)
        ))
    
  } else {
    
    plot
    
  }
  
}

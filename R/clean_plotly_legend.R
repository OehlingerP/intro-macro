#' Clean up plotly legend
#' 
#' @param plot plotly; your plotly plot
#' @param legend_title bol; should the legend title be removed, defaults to TRUE
#' @export 


clean_plotly_legend <- function(plot,
                                legend_title = T,
                                legend_bottom = T){
  
  l <- length(plot$x$data)
  
  for(i in 1:l){
    
    plot$x$data[[i]]$name <- gsub("\\(|,1)", "", plot$x$data[[i]]$name )
    
  }
  
  if(legend_title){
    
    plot <- plot %>%
      layout(
        legend = list(
          title = "",  # Remove legend title
          titlefont = list(size = 0)
        ))
    
  } 
  
  if(legend_bottom){
    
    plot <- plot %>%
      layout(
        legend = list(
          orientation = 'h',  # Horizontal orientation
          yanchor = 'top',    # Anchor at the top of the legend
          #y = 0.2,           # Adjust vertical position
          xanchor = 'center', # Center the legend horizontally
          x = 0.5             # Center the legend horizontally
        )
      )
    
  }
  
  plot
  
}

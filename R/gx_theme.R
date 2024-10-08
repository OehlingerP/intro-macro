#' Initialize my ggplot theme.
#'
#' @param plot ggplot object. By default Null and gx_theme can be assigned to plot but otherwise gx_theme will create it's own plot.
#' @param print_x Show x-axis. By default TRUE.
#' @param print_y Show y-axis. By default TRUE.
#' @param legend_title Whether to include a legend title or not default is FALSE.
#' @param legend_position Legend position. Default is bottom.
#' @param text_size Fontsize. Default is 14.
#' @param theme "dark" or "light" theme. Defaults to "light".
#' @param text_colour Text colour. Default is black.
#' @param legend_line_width Width of line in legend.
#' @param rect_line_colours Colour of horizontal help lines. Default is #7F7F7F.
#' @param rect_line_width Width of major grid lines. Different widths needed for various outputs; by default 0.0001.
#' @param panel_background Background colour of plot area. Default is white.
#' @param colours Colours that should be used for aes color in ggplot. Default is gx_colors(). If both aes, fill and color, are used, by default both will start with yellow so one needs to choose the colours manually using on of the arguments (colour or fill_colour).
#' @param fill_colours Colours that should be used for aes fill in ggplot. Default is gx_colors(). If both aes, fill and color, are used, by default both will start with yellow so one needs to choose the colours manually using on of the arguments (colour or fill_colour).
#' @param legend_rows How many rows should the legend have. Does only work if plot is not null.
#' @param title Add plot title. Does only work if plot is not null.
#' @param subtitle add subtitle. Only works if plot is not nll.
#' @param x_title x-axis title. Does only work if plot is not null.
#' @param y1_title y1-axis title. Does only work if plot is not null.
# @param scale_y_continuous If TRUE the y-axis is adjusted such that grid lines are at the bottom and top of the graph (as in Excel). Only applies if plot is not NULL. Default is TRUE.
# @param scale_x_auto If TRUE then x axis will be scaled automatically. Currently only works with Date, continous and discrete. Others might be problematic (such as yearqtr-format).
#' @param language Format of Date and decimal point. By default NULL. In the default case system settings will be applied.
#'
#' @return Return RBI theme to add to ggplot object.
#' @export
#' @import grDevices
#' @import lubridate
#' @examples
#' library( "ggplot2" )
#' plot <- ggplot( data = iris,
#'                 aes( x     = Sepal.Length,
#'                      y     = Sepal.Width,
#'                      color = Species ) ) +
#'           geom_line()
#' # change the main theme to RBI corporate design (colors are not changed)
#' \dontrun{
#' plot + gx_theme()
#' # change theme including colors
#' gx_theme( plot )
#' }

gx_theme <- function( plot               = NULL,
                      print_x            = TRUE,
                      print_y            = TRUE,
                      legend_title       = FALSE,
                      legend_position    = "bottom",
                      text_size          = 10,
                      theme              = "light",
                      text_colour        = "#919397",
                      legend_line_width  = 1.2,
                      rect_line_colours  = "#919397",
                      rect_line_width    = 0.1,
                      plot_background    = "#fffaf5",
                      colours            = gx_colors(),
                      fill_colours       = gx_colors(),
                      legend_rows        = 1,
                      title              = NULL,
                      subtitle           = NULL,
                      x_title            = NULL,
                      y1_title           = NULL,
                      #scale_y_continuous = TRUE,
                      #scale_x_auto       = TRUE,
                      language           = NULL ){

  # language and system settings -----------------------------------------------
  dec_separator <- "."
  tsd_separator <- ","

  if( !is.null( language ) ){

    switch( language,
            "EN" = Sys.setlocale( category = "LC_ALL", locale = "english" ),
            "DE" = Sys.setlocale( category = "LC_ALL", locale = "german" ),
            Sys.setlocale( category = "LC_ALL", locale = "english" ) )

    dec_separator <- switch( language,
                             "EN" = ".",
                             "DE" = ",",
                             "." )

    tsd_separator <- switch( language,
                             "EN" = ",",
                             "DE" = ".",
                             "," )


  }

  if( theme == "dark" ){

    plot_background    = "#1f2022"
    text_colour        = "#d0d3d8"
    rect_line_colours  = "#d0d3d8"
    colours            = gx_colors( theme = "dark" )
    fill_colours       = gx_colors( theme = "dark")
  }

  # extrafont::loadfonts( quiet = TRUE )
  #
  # if( .Platform$OS.type == "windows" ){
  #
  #   windowsFonts( "Amalia" = windowsFont( "Amalia" ) )
  #   font <- "Amalia"
  #
  # }

  # theme layout ---------------------------------------------------------------
  out <- ggplot2::theme(
    plot.background    = ggplot2::element_rect( fill   = plot_background ),
    panel.background   = ggplot2::element_rect( fill   = plot_background ),
    legend.background  = ggplot2::element_rect( fill   = plot_background ),
    panel.border       = ggplot2::element_blank(),
    panel.grid.minor   = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line( colour = rect_line_colours,
                                                size   = rect_line_width ),
    panel.grid.major.x = ggplot2::element_line( colour = rect_line_colours,
                                                size   = rect_line_width ),
    legend.position    = legend_position,
    legend.title       = ggplot2::element_blank(),
    legend.key         = ggplot2::element_rect( fill   = NA ),
    legend.text        = ggplot2::element_text( size   = text_size
                                                ,colour = text_colour
                                                #,family = font
                                                ),
    plot.title         = ggplot2::element_text( size   = text_size
                                                ,colour = text_colour
                                                ,face   = "bold"
                                                #,family = font
                                                ),
    plot.subtitle      = ggplot2::element_text( size   = text_size
                                                ,colour = text_colour
                                                #,family = font
                                                ),
    axis.text          = ggplot2::element_text( size   = text_size
                                                ,colour = text_colour
                                                #,family = font
                                                ),
    axis.text.x        = element_text( vjust = -0.5 ),
    axis.title         = ggplot2::element_text( size   = text_size
                                                ,colour = text_colour
                                                #,family = font
                                                ),
    axis.line.x        = ggplot2::element_blank(),
    axis.ticks.x       = ggplot2::element_blank(),
    axis.ticks.y       = ggplot2::element_blank() )



  if( print_x == TRUE ){

    out <- out +
      ggplot2::theme( axis.text = ggplot2::element_text( size   = text_size
                                                         ,colour = text_colour
                                                         #,family = font
                                                         ) )

  } else {

    out <- out +
      ggplot2::theme( axis.title.x = ggplot2::element_blank(),
                      axis.text.y  = ggplot2::element_text( size   = text_size
                                                            ,colour = text_colour
                                                            #,family = font
                                                            ) )

  }

  if( print_y == FALSE ){

    out <- out +
      ggplot2::theme( axis.title.y = element_blank() )

  }

  if( legend_title == TRUE ){

    out <- out + ggplot2::theme(
      legend.title = ggplot2::element_text( size   = text_size
                                            ,colour = text_colour
                                            #,family = font
                                            ) )

  }

  if( !is.null( plot ) ){

    out <- plot + out

    out <- out +
      ggplot2::ggtitle( label = title, subtitle = subtitle )

    suppressMessages(

      out <- out +
        ggplot2::scale_colour_manual( values = colours,
                                      guide  = ggplot2::guide_legend( nrow = legend_rows,
                                                                      override.aes = list( size = legend_line_width ) ) )

    )

    suppressMessages(

      out <- out +
        ggplot2::scale_fill_manual( values = fill_colours,
                                    guide  = ggplot2::guide_legend( nrow = legend_rows,
                                                                    override.aes = list( size = legend_line_width ) ) )
    )

    if( !is.null( x_title ) ){

      out <- out + ggplot2::xlab( x_title )

    } else {

      out <- out + ggplot2::theme( axis.title.x = ggplot2::element_blank() )

    }

    if( !is.null( y1_title ) ){

      out <- out + ggplot2::ylab( y1_title )

    } else {

      out <- out + ggplot2::theme( axis.title.y.left = ggplot2::element_blank() )

    }

    # extract data from plot to scale y-axis properly (and x-axis later on)
    plot_data <- do.call( rbind, lapply( ggplot_build( plot )$data, function( DATA ){

      if( "x" %in% colnames( DATA ) & "y" %in% colnames( DATA ) ){

        df <- DATA[ , c( "x", "y" ) ]
        df

      } else {

        NULL

      }

    }) )

    # if( scale_y_continuous == TRUE ){
    #
    #   # adjustment for geoms that start at 0 (bar, col, area)
    #   if( min( plot_data$y, na.rm = T ) > 0 | min( plot_data$y, na.rm = T ) < 0 ){
    #
    #     GEOMS <- do.call( c, lapply( plot$layers, function( LAYER ){
    #
    #       class( LAYER$geom )
    #
    #     }) )
    #
    #     if( !all( is.na( match( c( "GeomArea", "GeomCol", "GeomArea" ), GEOMS ) ) ) ){
    #
    #       idx <- which( plot_data$y == min( plot_data$y, na.rm = T ) )[ 1 ]
    #
    #       plot_data$y[ idx ] <- 0
    #
    #     }
    #
    #   }
    #
    #   # scale y-axis such that it fits to the corporate layout
    #   suppressMessages(
    #
    #     out <- out +
    #       ggplot2::scale_y_continuous( expand = c( 0, 0 ),
    #                                    limits = range( scales::extended_breaks( only.loose = TRUE )( plot_data$y ) ),
    #                                    breaks = scales::extended_breaks( only.loose = TRUE )( plot_data$y ),
    #                                    labels = function( x ) format( x,
    #                                                                   big.mark     = tsd_separator,
    #                                                                   decimal.mark = dec_separator,
    #                                                                   scientific   = FALSE ) )
    #
    #   )
    #
    # }
    #
    # if( scale_x_auto & class( layer_scales( out )$x )[ 1 ] == "ScaleContinuousPosition" ){
    #
    #   suppressMessages( out <- out + ggplot2::scale_x_continuous( expand = c( 0, 0 ) ) )
    #
    # }
    #
    # if( scale_x_auto & class( layer_scales( out )$x )[ 1 ] == "ScaleDiscretePosition" ){
    #
    #   suppressMessages( out <- out + ggplot2::scale_x_discrete( expand = c( 0, 0 ) ) )
    #
    # }
    #
    # if( scale_x_auto & class( layer_scales( out )$x )[ 1 ] == "ScaleContinuousDate" ){
    #
    #   plot_data$x <- as.Date( plot_data$x, origin = "1970-01-01" )
    #
    #   min_date <- min( as.Date( plot_data[ , "x" ] ) )
    #   max_date <- max( as.Date( plot_data[ , "x" ] ) )
    #
    #   if( lubridate::year( min_date ) == lubridate::year( max_date ) ){
    #
    #     suppressWarnings( out <- out + ggplot2::scale_x_date( date_labels = "%d %b", expand = c( 0, 0 ) ) )
    #
    #   }
    #
    #   if( lubridate::year( min_date ) != lubridate::year( max_date ) ){
    #
    #     suppressWarnings( out <- out + ggplot2::scale_x_date( date_labels = "%b-%y", expand = c( 0, 0 ) ) )
    #
    #   }
    #
    # }

  }

  return( out )

}

#' Round up to the next number divisible by m.
#'
#' @param x Some Number.
#' @param m Divisor.
#' @return Rounded number.
#' @export

round_up <- function( x, m ){

  m * ceiling( x / m )

}


#' Round down to the next number divisible by m.
#'
#' @param x Some Number.
#' @param m Divisor.
#' @return Rounded number.
#' @export

round_down <- function( x, m ){

  m * floor( x / m )

}

#' Works like the collaps function in STATA. However, only one aggregate function is allowed.
#'
#' @param data dataset which should be collapsed
#' @param group.by Varible by which it should be grouped.
#' @param FUNCTION Function to apply, by default sum( x, na.rm = TRUE )
#' @param ... extra arguments. Currently ignored.
#' @export

collapse <- function( data, group.by, FUNCTION = function( x ) sum( x, na.rm = TRUE ), ... ){

  index_group.by <- which( colnames( data ) == group.by )
  groups <- unique( data[ , group.by ] )

  group_results <- lapply( groups, function( group ){

    df <- data[ which( data[ , index_group.by ] == group ), ]

    partial_result <- apply( df[ , -index_group.by, drop = FALSE ], 2, FUNCTION )

    partial_result

  })

  group_results <- as.data.frame( do.call( rbind, group_results ) )

  final_result <- cbind(
    groups,
    group_results )

  return( final_result )

}

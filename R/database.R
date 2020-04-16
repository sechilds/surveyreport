# Database functions for survey reports.
#
# A function to connect to the database and a function
# to close that connection.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Open connection to the PostgreSQL database
#'
#' @return A list containing the database driver and connection.
#' @export
db_connection <- function() {
  pw <- "nssedata"

  drv <- DBI::dbDriver("PostgreSQL")
  con <- DBI::dbConnect(drv, dbname = "postgres",
                        host = "db", port = 5432,
                        user = "postgres", password = pw)
  return(list(drv = drv, con = con))
}

#' Close the connection to the PostgreSQL database
#'
#' @param drv database driver
#' @param con database connection
#' @export
db_close <- function(drv, con) {
  DBI::dbDisconnect(con)
  all_cons <- DBI::dbListConnections(drv)
  for (cn in all_cons) {
    DBI::dbDisconnect(cn)
  }
  DBI::dbUnloadDriver(drv)
}

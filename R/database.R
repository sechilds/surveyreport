# Database functions for survey reports.
#
# A function to connect to the database and a function
# to close that connection.
# which prints 'Hello, world!'.
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


db_connection <- function() {
  pw <- "nssedata"

  drv <- DBI::dbDriver("PostgreSQL")
  con <- DBI::dbConnect(drv, dbname = "postgres",
                        host = "db", port = 5432,
                        user = "postgres", password = pw)
  list(drv = drv, con = con)
}

db_close <- function(drv, con) {
  DBI::dbDisconnect(con)
  DBI::dbUnloadDriver(drv)
}

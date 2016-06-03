library(RSQLite)
sql_init <- function(file) {
  if (missing(file)) {
    connection <<- dbConnect(drv = SQLite())
  }
  else connection <<- dbConnect(drv = SQLite(), file)
}


# testing the function


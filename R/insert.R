sql_insert <- function() {
  if (missing(file)) {
    connection <<- dbConnect(drv = SQLite())
  }
  else connection <<- dbConnect(drv = SQLite(), file)
}

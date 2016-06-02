sql_droptable <- function() {
  if (missing(connection)) {
    stop("There is no connection open.")
  }
  else connection <<- dbConnect(drv = SQLite(), file)
}

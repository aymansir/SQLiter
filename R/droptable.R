sql_droptable <- function(table_name) {
  if (missing(connection)) {
    stop("There is no connection open.")
  }
  else {
    table_name <- table_name
    dbSendQuery(conn = connection, paste("DROP TABLE ", table_name))
  }
}

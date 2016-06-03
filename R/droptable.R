#'Deletes data from tables with SQL queries
#'
#'@param table the table to delete from
#'@param where_condition a string of conditions used to specify, need to use escape key for quotes
#'
#'@examples
#'sql_delete("people", c("name = \"Maria\" OR age = 28 AND gender = \"female\"")
#'sql_delete("car", c("make = \"Toyota\" AND model = \"Camry\""))
#'@export

sql_droptable <- function(table_name) {
  if (missing(connection)) {
    stop("There is no connection open.")
  }
  else {
    table_name <- table_name
    dbSendQuery(conn = connection, paste("DROP TABLE ", table_name))
  }
}

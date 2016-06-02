#'Deletes data from tables with SQL queries
#'
#'@param table the table to delete from
#'@param where_condition a string of conditions used to specify, need to use escape key for quotes
#'
#'@examples
#'sql_delete("people", c("name = \"Maria\" OR age = 28 AND gender = \"female\"")
#'sql_delete("car", c("make = \"Toyota\" AND model = \"Camry\""))
#'@export

sql_delete <- function(table, where_condition = "*"){

  if(missing(connection)){
    stop("There is no connection")
  }

  input <- sprintf("DELETE FROM %s WHERE %s", table, where_condition)

  dbSendQuery(connection, input)
  print("Successful deletion!")
}


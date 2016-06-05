#'Removes the database connection
#'
#'@example
#'sql_end
#'
#'@export

sql_end() <- function(){
  rm(connection)
}

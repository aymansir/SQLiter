#'Removes the database connection
#'
#'@examples
#'sql_end()
#'
#'@export

sql_end <- function(){
  rm(connection)
}

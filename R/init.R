#' Initiatilize a global database connection
#'
#'@param file - path to database file
#'@return Function returns nothing but creates a global database connection necessary to use other SQLiter functions
#'@examples
#'sql_init('data.db')
#'sql_init()
#'@export

library(RSQLite)
sql_init <- function(file) {
  if (missing(file)) {
    connection <<- dbConnect(dbDriver("SQLite"))
    print("A connection has been made to a temporary database that will be deleted once the session ends.")
  }
  else {
    connection <<- dbConnect(dbDriver("SQLite"), file)
  }
  if(file.exists(file)){
    print("A connection has been made to an existing database!")
  }
  else print("A connection has been made to a new database with the specified file name!")
}


# testing the function

sql_init('data.db')

sql_init()

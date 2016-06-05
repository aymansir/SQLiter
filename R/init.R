#'Creates a global connection to a database
#'
#'@param file - the name of the file to connect to
#'
#'@examples
#'sql_init()
#'sql_init("my_first_database.sqlite")
#'
#'@export

library(RSQLite)
sql_init <- function(file) {
  fileExists = file.exists(file)
  if (missing(file)) {
    connection <<- dbConnect(drv = SQLite())
    print("You've connected to a new temporary database, this will be deleted at the end of your session.")
  }
  else connection <<- dbConnect(drv = SQLite(), file)
  if(fileExists){
    print("Successful connection the specified database!")
  }
  else{
    print("Successful connection to a new database with your specified name!")
  }
}


# testing the function


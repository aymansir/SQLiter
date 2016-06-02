#'Inserts data into tables
#'
#'@param table the name of the table to insert into
#'@param columns a vector of the columns to insert into
#'@param values a vector of the values to insert
#'@examples
#'sql_insert("people", c("name", "sex", "age"), c("Maria", "female", "28"))
#'@export

sql_insert <- function(table, columns, values)

  if(missing(connection)){
    stop("There is no connection")
  }

  columns_str <- paste(columns, collapse = ",")
  values_str <- paste(columns, collapse = ",")

  input <- sprintf("INSERT INTO %s (%s) VALUES %s", table, columns_str, values_str)

  dbSendQuery(connection, input)
  print("Successful insert!")

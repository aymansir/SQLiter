#'Updates the table with parameter
#'
#'@param table connection where the function is  acting on
#'@param columns a list of columns to update
#'@param values a list of values to be updated that must be the same size as the columns
#'
#'@examples
#'sql_delete("people", c("name = \"Maria\" OR age = 28 AND gender = \"female\"")
#'sql_delete("car", c("make = \"Toyota\" AND model = \"Camry\""))
#'@export


sql_update <- function(table_name, columns=-1, values=-1, where_column=-1, where_value=-1) {
  if (!exists("connection")) stop("There i's no connection open.")
  if (columns== -1) stop("Column was not defined")
  if (values== -1) stop("Values was not defined")
  if (where_column==-1) stop("Where column was not defined")
  if (where_value==-1) stop("Where value was not defined")


  else {
    # Checks if the length of column is the same length as values
    if(length(columns)==(length(values))) {
      stop("The list of columns should be the same length as the list of values.")
    }
    dbSendQuery(conn = connection, paste("UPDATE ", table_name, " SET",get_query(columns, values),
                                    " WHERE ", where_column, "=", where_value))
  }
}

get_query <- function(columns,value) {

  string <- ''
  for (i in 1:length(columns)) {
    print(i)
    string <- paste(string, columns[i], '=', value[i])
  }
  return(string)
}

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

library(stringr)
car_data_frame <- data.frame(car = c('Civic', 'Sentra', 'Encore'), brand = c('Honda', 'Nissan', 'Buick'), make = c('2002', '2006', '1997'))
sql_update <- function(table_name, data) {
  if (!exists("connection")) stop("There is no connection open.")
  sqlUpdateBuilder(table_name, data)
}

sqlUpdateBuilder <- function(table, data, where, where_equals) {

  row_names <- names(data)

  if(!(class(data) == 'data.frame' ||'matrix')) stop('Please use a data frame')

  for (i in 1:nrow(data)) {
    sql <- paste('update',table)
    set_sql <- ' set '
    where_sql <- ' where '
    equal_sql <- '='
    comma_sql <- "'"
    sql_set = ''

    for (j in 1:ncol(data)) {
      sql_set <- paste(sql_set, row_names[j],'=\'', data[i,j], '\'', ', ', sep='')

    }

    if(i == nrow(data)) {
      dataFrame <- paste(sql)
    }
    else {
      dataFrame <- paste(sql, ' set ', sql_set, sep = '')

    }
    dataFrame <- paste(substring(dataFrame, 1, (nchar(dataFrame)-2)))
    dataFrame <- paste(dataFrame,' where ', where, '=','\'', where_equals,'\'', ';', sep='' )
    print(dataFrame)
    results <- dbSendQuery(connection, dataFrame)


  }

}







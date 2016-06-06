#'Updates an existing data table
#'
#'@param table A string that is the name of the table
#'@param data a matrix that's m is the bulk of observations and n is the number of features
#'@param where the column that you are matching
#'@param the value that is being matched
#'
#'@examples
#'sql_update('Cars', car_data_frame, 'Car', 'honda')
#'@export

library(stringr)
sql_update <- function(table_name, data, where, where_equals) {
  if (!exists("connection")) stop("There is no connection open.")
  sqlUpdateBuilder(table_name, data, where, where_equals)
}

sqlUpdateBuilder <- function(table, data, where, where_equals) {

  row_names <- names(data)

  if(!(class(data) == 'data.frame' ||'matrix')) stop('Please use a data frame')

  for (i in 1:nrow(data)) {
    sql <- paste('update',table)
    set_sql <- ' set '

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







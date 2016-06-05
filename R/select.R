#' Runs a SQL Select query
#'
#'@param tbl - the table to run the query on
#'@param cols - a vector of the column names you'd like to select, default is all of them
#'@param where - a single string with the where conditions for the query
#'@param orderby - a vector of the column names you'd like to order by in the query
#'@param orderType - the type of ordering (ASC | DESC), DESC is default
#'@param groupBy -a vector of the column names you'd like to group by in the query
#'@param having -a single string with the having conditions for the query
#'
#'@return a dataframe with the results of the query
#'
#'@examples
#'sql_select(table)
#'sqL_select(table, c("col1", "col2"), "col1>10 AND col2<10")
#'
#'@export

sql_select <- function(tbl, cols = "*", where = -1, orderby = -1, orderType = "DESC", groupBy = -1, having = -1){
  if(!exists("connection")){
    stop("There is no connection")
  }

  #starts of the query
  query <- "SELECT"
  #adds the column names for the select query
  cols_final <- paste(cols, collapse = ", ")
  query <- paste(query, cols_final, collapse = " ")
  #adds the where conditions for the query
  if(where!=-1){
    query <- paste(query, where, collapse = " ")
  }
  #adds the orderby conditions for the query -if specified
  if(orderby!=-1){
    orderby_final <- paste(orderby, collapse = ", ")
    paste(query, orderby, toupper(orderType))
  }
  #adds the group_by conditions for the query - if specified
  if(groupBy!=-1){
    groupBy_final <- paste(groupBy, collapse = ", ")
    query <- paste(query, groupBy_final, collapse = " ")

   #adds the having conditions for the query - if specified
    if(having!=-1){
      query <- paste(query, having, collapse = " ")
    }
  }
  paste(query, ";")
  #runs the query
  results <- dbSendQuery(connection, query)
  dbFetch(results)
}

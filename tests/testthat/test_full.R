library(SQLiteR)

context("Full Test")

#new temp database
test_that("db initialization - new temp", expect_message(sql_init(),"You've connected to a new temporary database, this will be deleted at the end of your session."))

#new db with name x
test_that("db initialization - new w/name", expect_message(sql_init("brand_new_file.sqlite"), "Successful connection to a new database with your specified name!"))

#connect to db with name x
test_that("db initialization - existing", expect_message(sql_init("brand_new_file.sqlite"), "Successful connection to the specified database!"))

#make a new table
test_that("Creating a new table", expect_message(sql_createtable("Table_1", c("c1", "c2"), rep("INTEGER", 2)),"Successful table creation!"))

#fill the table with data
test_that("Inserting into a table", expect_message(sql_insert("Table_1", data.frame(c1 = 1:20, c2= 120:101)), "Successful insert!"))

#select data from the table
test_that("Selecting from a table", expect_equal(sql_select("Table_1", where = "c1 >10"), data.frame(c1 = 11:20, c2 = 110:101)))

#delete date from teh table
test_that("Deleting from a table", expect_message(sql_delete("Table_1"), "Successful deletion!"))

#drop table
test_that("Dropping a table", expect_message(sql_droptable("Table_1"), "Drop successfull!"))

#end connection
test_that("Ending a connection", expect_message(sql_end(),"Connection has been terminated!"))



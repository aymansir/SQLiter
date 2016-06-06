# SQLiter
SQLiter is a wrapper for the RSQLite package.

---
##Introduction
As a vision for simplifying how developers can access SQLite, we made it easier to do a lot of the grunt work of having to move between a R data frame format and writing to RSQLite

---
## Features 

* The package has many methods that wrap around common SQL to interact with your database.

* Support for data frame and matrices

* Familiar syntax/uses  SQL vocabulary in function names

---

## How to use

*  All functions have a prefix of "sql_"
*  Install and clone this Github Repository to your project or global directory
*  Call 
	```library(SQLiter)```

---

## Code

```R
sql_update('Cars', car_data_frame, 'Car', 'honda')
```

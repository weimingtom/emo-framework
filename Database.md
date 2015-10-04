# emo.Database #

emo.Database class represents a database for the application. The database is private database so it is only used by the application. Note that the emo.Database class provices some administrative operations only. Use [Preference](Preference.md) class to store the key and values.

## getPath(name) ##

Returns the absolute path for the database with given name. Use DEFAULT\_DATABASE\_NAME to get the path for the default database used by [Preference](Preference.md) database.

```
local database = emo.Database();
// print the path for the default database.
print(database.getPath(DEFAULT_DATABASE_NAME));
```

## getLastError ##

Returns the error code for the latest error of the database command. Error code is an integer value result code defined by SQLite. See [SQLite Result Codes](http://www.sqlite.org/c3ref/c_abort.html) for details.

```
print("database error");
print(format("ERROR CODE: %d", database.getLastError()));
```

## getLastErrorMessage ##

Returns the error message for the latest error of the database command. Error message is an string message issued from SQLite.See [SQLite Result Codes](http://www.sqlite.org/c3ref/c_abort.html) for details.

```
print("database error!");
print(format("ERROR CODE: %d", database.getLastError()));
print(format("ERROR MESSAGE: %s", database.getLastErrorMessage()));
```

## deleteDatabase(name) ##

Deletes the database with given name. Note that this operation completely deletes all of the tables that is used by emo-framework and it cannot be undone. This function might be useful for developing or testing your program.

```
// deletes the default database used by emo-framework.
database.deleteDatabase(DEFAULT_DATABASE_NAME);
```
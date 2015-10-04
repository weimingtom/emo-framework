# emo.Preference #

Preference class represents the simple key-value preference database for the application. Note that the preference is a private database that is only used by the application.

## openOrCreate ##

Open the preference database, if the database has not been created this function creates a new preference database. Returns EMO\_NO\_ERROR if no error occurs.

```
local preference = emo.Preference();
if (preference.openOrCreate() == EMO_NO_ERROR) {
  print("open preference");
} else {
  print("failed to open preference");
}
```

## open ##

Open the preference database, if the database has not been created it returns error with error code: ERR\_DATABASE\_OPEN otherwise returns EMO\_NO\_ERROR.

```
local preference = emo.Preference();
if (preference.open() == EMO_NO_ERROR) {
  print("open preference");
} else {
  print("failed to open preference maybe it is not created yet.");
}
```

## set(key, value) ##

Sets the preference value with given key and value.

```
preference.set("USER_ADDRESS", "London");
```

## get(key) ##

Returns the preference value with given key. If no preference value is set with given key the empty string returns. Note that the all preference value stored in the database is the string value so use tointeger() or tofloat() and so on if numeric value is stored in the preference.

```
local address = preference.get("USER_ADDRESS");
local x       = preference.get("POSITION_X").tointeger();
```

## keys ##

Returns all keys in the preference database.

```
local keys = preference.keys();
for (local i = 0; i < keys.len(); i++) {
  local key = keys[i];
  local value = preference.get(key);
}
```


## del(key) ##

Delete the preference value with given key.

```
preference.del("USER_ADDRESS");
```

## close ##

Close the preference database.

```
local preference = emo.Preference();
if (preference.open() == EMO_NO_ERROR) {
  print("open preference");
  preference.close();
} else {
  print("failed to open preference maybe it is not created yet.");
}
```
# emo.Vec2 #

emo.Vec2 class represents 2d vector that holds x and y variable.

## constructor(x, y) ##

Creates 2d vector instance from given x and y.

```
local v = emo.Vec2(1, 2);

print(v.x); // must return 1
print(v.y); // must return 2
```

## fromArray(arg) ##

Creates 2d vector instance from given array. It uses arg[0](0.md) and arg[1](1.md) to create Vec2 instace.

```
local arr = [];
arr.append(1);
arr.append(2);

local v = emo.Vec2.fromArray(arr);

print(v.x); // must return 1
print(v.y); // must return 2

```
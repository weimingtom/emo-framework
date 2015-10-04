# emo.Line #

emo.Line class represents the singile line.

## constructor ##

Creates the Line instance.

```
local line = emo.Line(); // creates a line
```

## setWidth ##
Line#setWidth sets the width of the line.

```
local line = emo.Line(); // creates a line instance
line.setWidth(2); // set the line width = 2
```

## move(startX, startY, endX, endY); ##

Line#move sets the line coordinates.

```
local line = emo.Line(); // creates a line instance
line.setWidth(2); // set the line width = 2
line.move(0, 0, 100, 100); // sets the line (0, 0) to (100, 100);
```

## load ##

Load the Line instance into the screen. Default line width equals 1 and the default position equals (0, 0, 1, 1) if no parameters is specified by using Line#setWidth and Line#move.

```
local line = emo.Line(); // creates a line instance
line.setWidth(2); // set the line width = 2
line.move(0, 0, 100, 100); // sets the line (0, 0) to (100, 100);
line.load(); // load the line
```
# emo.Rectangle #

emo.Rectangle class represents the rectangle area without texture.

## constructor ##

Creates the Rectangle instance.

```
local rectangle = emo.Rectangle(); // creates rectangle instance
```

## load ##

Load the Rectangle instance into the screen. Default rectangle size equals (width=1, height=1).

```
local rectangle = emo.Rectangle(); // creates rectangle instance
rectangle.setSize(50, 50); // rectangle width=50, height=50
rectangle.load(); // load the rectangle
```

## Rectangle extends Sprite ##

emo.Rectangle class extends the [Sprite](Sprite.md) class so you can use all methods of [Sprite](Sprite.md) with Rectangle. See [Sprite](Sprite.md) for details.
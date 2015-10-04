# emo.TextSprite #

emo.TextSprite class represents a text sprite to display text into the screen. TextSprite is the sprite image as known as sprite sheets.

## constructor(name, textbase, width, height, border = null, margin = null) ##

Creates text sprite with given sprite sheet image, size, border and margin. **Only PNG and PVRTC(iOS) image can be used** to create a sprite. TextSprite constructor is similar to emo.SpriteSheet. The textbase parameter is the sequence of texts that is same text in the sprite sheet. The sprite sheet image for text sprite is something like below:

![http://www.emo-framework.com/images/font_16x16.png](http://www.emo-framework.com/images/font_16x16.png)

Note that currently multibyte characters and unicode characters are not supported. Only ascii character can be used to create the TextSprite instance.

```
// Create 16x16 text sprite with 2 pixel border and 1 pixel margin
text = emo.TextSprite("font_16x16.png",
" !\"c*%#'{}@+,-./0123456789:;[|]?&ABCDEFGHIJKLMNOPQRSTUVWXYZ",
		16, 16, 2, 1);
```

## setText ##

Sets the text of the text sprite with given text. The text of the TextSprite can be changed at any time.

```
text.setText("Hello, World!");
```

## text rotation ##

TextSprite itself can be moved and scaled however it does not support rotation. TextSprite only print errors if rotate function is called.

## TextSprite extends MapSprite ##

emo.TextSprite class extends emo.MapSprite so all function in the MapSprite can be used with TextSprite.
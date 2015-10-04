# emo.FontSprite #

emo.FontSprite class represents a text sprite to display text that are defined in the property file. Unicode characters and TrueType fonts are supported.

## constructor(name, fontsize = null, fontface = null, isBold = false, isItalic = false) ##

Creates text sprite for given name with given fonts. If font parameters are null, the default system font parameters are used.

```
// Create new font sprite.
// The first parameter is the property name for the string.
// The second parameter is the font size.
local text = emo.FontSprite("hello", 30);

// To use with custom TrueType fonts:
text = emo.FontSprite("hello_font", 30, "CustomFonts");
```

The text properties are defined in the property file. Additional place holder strings can be defined like [this file](http://code.google.com/p/emo-framework/source/browse/trunk/Android-Examples/res/values/strings.xml).

```
<!-- Android: res/values/strings.xml  -->
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="hello">Hello, %s!</string>
</resources>
```

For iOS, text properties are defined in the strings.plist in you project Resource. See sample [plist](http://code.google.com/p/emo-framework/source/browse/trunk/iOS-Examples/Resources/strings.plist).

## setParam(param) ##

Sets the parameter of the palceholder text.

```
// the text "Hello, %s!" is replaced by "Hello, World!"
text.setParam("World");
```

## reload ##
## reload(name) ##

Reload the sprite text.

```
// the text "Hello, %s!" is replaced by "Hello, World!"
text.setParam("World");
text.reload();
```
# emo.Sprite #

emo.Sprite class represents basic entity for your game. Sprite class can move, scale and rotates around the screen. Sprite have one texture image that cannot contain multiple frames. If you want to use multiple frames from one image(aka sprite sheet), use SpriteSheet class.

## constructor ##

Create a sprite instance with a parameter for image file name. **Only PNG and PVRTC(iOS) image can be used** to create a sprite.

```
// create a sprite instance from dog.png
local sprite = emo.Sprite("dog.png");
```

## load ##

Load the sprite into the screen. Image file associated with this sprite is loaded into the memory and loaded to the screen. If you want to just load and hide the sprite use Sprite#hide before calling load().

```
local sprite = emo.Sprite("dog.png");
sprite.load(); // the sprite will be loaded immediately to the screen.

local hideSprite = emo.Sprite("dog.png");
hideSprite.hide(); // hide the sprite
hideSprite.load(); // the sprite is loaded but this sprite is not visible.

// .. on later events
hideSprite.show(); // now the sprite is visible

```

Sprite#load returns boolean value to see whether loading is succeeded or not.

```
local sprite = emo.Sprite("dog.png");
if (sprite.load()) {
   print("sprite is loaded");
} else {
   print("something is going wrong");
}
```

## show and hide ##

Show and hide the sprite from the screen. Sprite#hide updates the alpha color of the sprite to 0(transparent) and Sprite#show updates the alpha color of the sprite to 1.

```
local sprite = emo.Sprite("dog.png");
sprite.hide(); // hide the sprite
sprite.show(); // show the sprite
```

## Changing colors ##

Sprite class can change its color (RGB) individually by using Sprite#red, Sprite#green, Sprite#blue. Alpha color also can be changed by Sprite#alpha to change transparency of the sprite. If no parameter has been specified for these functions current color is returned. Each color value is float value from 0 to 1. Sprite#color changes all colors at a time.

```
local sprite = emo.Sprite("dog.png");

sprite.alpha(0); // Just as same as calling hide();
sprite.alpha(1); // Just as same as calling show();

local a = sprite.alpha(); // returns current alpha value ... 1

sprite.color(0, 0, 0, 1); // red=0, green=0, blue=0, alpha=1 ... color equals 'black'

sprite.red(1); // update the red color to 1 ... RGBA(1, 0, 0, 1) = red
local r = sprite.red(); // returns current red value ... 1

sprite.green(1); // update green color to 1 ... RGBA(1, 1, 0, 1) = yellow
local g = sprite.green(); // returns current green value ... 1

sprite.blue(1); // update blue color to 1 ... RGBA(1, 1, 1, 1) = white
local b = sprite.blue(); // returns current blue value ... 1
```

## isLoaded ##

Sprite#isLoaded returns true if the sprite is loaded.

```
local sprite = emo.Sprite("dog.png");
print(sprite.isLoaded()); // must returns false because the sprite is not loaded yet.

sprite.load();

// if loading is succeeded isLoaded returns true
if (sprite.isLoaded()) {
  print("sprite is loaded");
} else {
  print("sprite is not loaded");
}
```

## move(x,y) ##

Sprite#move moves the sprite around the stage. Sprite can be moved outside the screen that makes the sprite invisible.

```
local sprite = emo.Sprite("dog.png");
sprite.move(0, 0); // sprite is now (x=0, y=0)
sprite.move(100, 200); // moves the sprite to (x=100, y=200)
```

## The Position ##

Sprite#getX, getY returns the position of the sprite.

```
local sprite = emo.Sprite("dog.png");
sprite.move(0, 0); // sprite is now (x=0, y=0)

print(sprite.getX()); // returns 0;

sprite.move(100, 200); // moves the sprite to (x=100, y=200)

print(sprite.getX()); // returns 100
print(sprite.getY()); // returns 200
```

## The Z-Order ##

Sprite#setZ and Sprite#getZ sets/gets the sprite's z-order. Z-order is used to specify the order of drawing the sprite.
```
local sprite = emo.Sprite("dog.png");
local background = emo.Sprite("background.png");

background.setZ(0);
sprite.setZ(1);     // the dog will be drew over the background

print(sprite.getZ()); // returns 1
```

## Getting the size ##

Sprite#getWidth and getHeight returns the width and height of the sprite.

```
local sprite = emo.Sprite("dog.png");

print(sprite.getWidth());
print(sprite.getHeight());
```

## Updating the size ##

Sprite#setWidth and setHeight set the width and height of the sprite. Sprite#setSize sets the sprite width and height.

```
local sprite = emo.Sprite("dog.png");

sprite.setWidth(64);   // set the width to 64
sprite.setHeight(128); // set the height to 128

sprite.setSize(64, 128); // width=64, height=128 (same as above)
```

## scale(scaleX, scaleY) ##
## scale(scaleX, scaleY, centerX, centerY) ##

Sprite#scale scales the sprite. The default scale value equals (1, 1). The center for scale (centerX, centerY) is specified by the additional parameter. If the center is not specified the center of the sprite(width/2, height/2) is used to scale the sprite.

```
local sprite = emo.Sprite("dog.png");

sprite.scale(1.5, 1.5); // scales the sprite 1.5 times bigger.
```

## Getting the scale ##

Sprite#getScale, getScaleX, getScaleY returns the scale of the sprite. getScale() is the alias for getScaleX().

```
local sprite = emo.Sprite("dog.png");
print(sprite.getScale()); // returns 1

sprite.scale(1.5, 1.5); // scales the sprite 1.5 times bigger.
print(sprite.getScale());  // returns 1.5

sprite.scale(2, 1); // scales the sprite width: 2 times bigger.
print(sprite.getScaleX()); // returns 2
print(sprite.getScaleY()); // return 1
```

## rotate(angle) ##
## rotate(angle, centerX, centerY) ##

Sprite#rotate rotates the sprite. The first parameter of the angle is the rotation angle(degree). The center position for rotation is specified by additional parameter(centerX, centerY). If the rotation center is not specified the center of the sprite(width/2, height/2) is used to rotate the sprite.

```
local sprite = emo.Sprite("dog.png");
sprite.rotate(30); // rotate the sprite 30 degrees.
```

## Getting the angle ##

Sprite#getAngle() returns the angle(degree) of the sprite. Default angle of the sprite is 0.

```
local sprite = emo.Sprite("dog.png");
print(sprite.getAngle()); // returns 0

sprite.rotate(30); // rotate the sprite 30 degrees.
print(sprite.getAngle()); // returns 30
```

## remove ##

Sprite#remove removes the sprite from the screen. Calling remove() removes internal buffer for the sprite, and remove the sprite from the engine. **The sprite instance can not be re-used after calling remove()**. Use Sprite#hide and Sprite#show if you just want to hide/show the sprite from the screen.

```
local sprite = emo.Sprite("dog.png");
sprite.load();   // load the sprite
sprite.remove(); // remove the sprite
```

## contains(x, y) ##

Sprite#contains(x, y) checks whether the given coordinate is inside the sprite or not. Returns true if the given coordinate is inside the sprite. Note that this function does not take account of the parameters of scale and rotate.

```
local sprite = emo.Sprite("dog.png");
sprite.move(0, 0);       // moves the sprite to (0, 0); 
sprite.setSize(64, 128); // sprite size equals (64, 128);

print(sprite.contains(50, 50));  // returns true;
print(sprite.contains(64, 128)); // returns true;
print(sprite.contains(65, 129)); // returns false;

sprite.move(1, 1);
print(sprite.contains(65, 129)); // returns true;
```

## collidesWith ##

Sprite#collidesWith checks whether the sprite collides with the other sprite or not. Returns true if the given sprite collides with the sprite. Note that this function does not take account of the parameters of scale and rotate.

```
local sprite = emo.Sprite("dog.png");
sprite.move(0, 0);       // moves the sprite to (0, 0); 
sprite.setSize(64, 64); // sprite size equals (64, 64);

local otherSprite = emo.Sprite("dog.png");
otherSprite.move(32, 32);       // moves the sprite to (32, 32); 
otherSprite.setSize(64, 64); // sprite size equals (64, 64);

print(sprite.collidesWith(otherSprite));  // returns true;

otherSprite.move(128, 128);
print(sprite.collidesWith(otherSprite));  // returns false;
```

## getName ##

Sprite#getName returns the name of the sprite. The name of the sprite is not unique because it is the string given by the constructor.

```
local sprite = emo.Sprite("dog.png");
print(sprite.getName()); // returns "dog.png"

local otherSprite = emo.Sprite("dog.png");
print(otherSprite.getName()); // returns "dog.png"
```

## blendFunc ##

The blending function can be specified for individual sprites. blendFunc defines the operation of blending when it is enabled. sfactor specifies which method is used to scale the source color components. dfactor specifies which method is used to scale the destination color components. See [OpenGL documentation](http://www.opengl.org/sdk/docs/man/xhtml/glBlendFunc.xml) for details. The default blending is alpha blending. (sfactor=GL\_SRC\_ALPHA, dfactor=GL\_ONE\_MINUS\_SRC\_ALPHA)

```
local sprite = emo.Sprite("dog.png");
sprite.blendFunc(GL_SRC_ALPHA, GL_ONE);
```
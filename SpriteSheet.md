# emo.SpriteSheet #

emo.SpriteSheet represents the sprite sheet that supports sprite animation. SpriteSheet is an image that can contain multiple sprites. Sprite sheet is also known as "sprite atlas" and 'texture atlas".

## constructor(name, width, height, border = 0, margin=0, frameIndex=0) ##

Creates a sprite sheet with given parameters. border, margin, frameIndex parameters has defualt value(=0) so those can be ommited. **Only PNG and PVRTC(iOS) image can be used** to create a sprite.

```
// create 34x42 sprite sheet with no border and margin, default frame index = 0
local sprite = emo.SpriteSheet("dog.png", 34, 42);

// create 19x19 sprite sheet with 3 border and 2 margin and frame index equals 0.
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
```

## constructor(xml\_formatted\_texture\_atlas\_data) ##

**From version 0.1.7**, sprite sheets accepts xml formatted texture atlas data file that is made by texture packing tool like [TexturePacker](http://www.texturepacker.com/). Currently Sparrow and CEGUI/OGRE data file format is supported.

```
// create new spritesheet from texture atlas data file
local sprite = emo.SpriteSheet("texture_atlas.xml");
```

## setFrame(index) ##

SpriteSheet#setFrame sets the current frame index of the sprite sheet. The default frame index equals 0. Note that this function is only available AFTER sprite is loaded and this function stops the current animation.

```
// creates the sprite sheet instance with given parameters.
local sprite = emo.SpriteSheet("dog.png", 34, 42);
sprite.load();

// sets the frame index equals 1.
sprite.setFrame(1);
```

## selectFrame(frameName) ##

**From version 0.1.7**, sprite sheets accepts texture atlas that is packed with different sprite with different regions. SpriteSheet#selectFrame selects the sprite with name that is defined by the texture atlas data file.

```
// create new spritesheet from texture atlas data file
local sprite = emo.SpriteSheet("texture_atlas.xml");
// select sprite with name
sprite.selectFrame("ball");
```

## animate(startFrame, frameCount, interval, loopCount = 0) ##

SpriteSheet#animate animates the sprite with given parameters. startFrame is the stating frame index for the animation, and frameCount is the number of frames from the startFrame index. interval parameter is the animation frame interval in milliseconds. The default loop count equals 0 that means this sprite animates only once.

```
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
explosion.load();

// animate the sprite from index=1 to index=6, frame interval equals 500 milliseconds(0.5sec) once.  
explosion.animate(1, 5, 500);

// animate the sprite with one loop (that replays the animation once.)
explosion.animate(1, 5, 1);
```

## animate(frame indices, null, interval, loopCount = 0) ##

From emo version 0.1.6, animate() accepts individual frame index. the second parameter is not used and ignored when the first parameter is an array.

```
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
explosion.load();

// animate the sprite, frame indices are [0,2,4,6], frame interval equals 500 milliseconds(0.5sec) once.  
explosion.animate([0,2,4,6], 0, 500);
```

## pause ##

SpriteSheet#pause pauses the animation and stop at the current frame index.

```
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
explosion.load();

explosion.animate(1, 5, 500);

// pauses the animation at current frame.
explosion.pause();
```

## pauseAt ##

SpriteSheet#pauseAt pauses the animation and stop at the given frame index. Note that this function is only available AFTER sprite is loaded.

```
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
explosion.load();

explosion.animate(1, 5, 500);

// pauses the animation at frame index = 0
explosion.pauseAt(0);
```

## stop ##

SpriteSheet#stop stops the animation. This function stops the current animation and reset the frame index to 0.

```
local explosion = emo.SpriteSheet("explosion.png", 19, 19, 3, 2, 0);
explosion.load();

explosion.animate(1, 5, 500);

// stops the animation.
explosion.stop();
```

## load() ##
## load(x, y, frameIndex) ##

SpriteSheet#load loads the sprite sheet into the screen. The default coordinates(x, y) and default frame index can be specified.

```
// creates the sprite sheet instance with given parameters
local sprite = emo.SpriteSheet("dog.png", 34, 42);
// load the sprite into the screen
sprite.load();
// load the sprite into the screen. (x=10, y=20, frame index=1)
// sprite.load(10, 20, 1);
```

## getFrameIndex ##

SpriteSheet#getFrameIndex returns current frame index of the sprite sheet.

```
local idx = sprite.getFrameIndex();
```

## getFrameCount ##

SpriteSheet#getFrameCount returns the frame count of the sprite sheet.

```
local count = sprite.getFrameCount();
```

## isAnimationFinished ##

SpriteSheet#isAnimationFinished returns whether the sprite sheet animation is finished or not.

```
// if the animation is finished, hide the sprite.
if (sprite.isAnimationFinished()) {
  sprite.hide();
}
```

## SpriteSheet extends Sprite ##

As emo.SpriteSheet class extends emo.Sprite, all Sprite functions can be used with SpriteSheet. Check [Sprite](Sprite.md) class documents for details.
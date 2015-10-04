# Modifier #

Modifier is the kind of composition actions that can add to the Sprites. Modifier modifies the sprites state, such as color, transparency, scaling and rotation with given equations. Modifier is known as 'Easing' or 'Tweening' in the world of Flash and Silverlight.

The following links may help you to understand the concept of Easing.

  * http://www.cocos2d-iphone.org/wiki/doku.php/prog_guide:actions_ease
  * http://msdn.microsoft.com/en-us/library/cc189019%28VS.96%29.aspx#easing_functions

emo-framework supports these kind of easing that called 'Modifier'. Below is the example of moving the sprite from (fromX, fromY) to (toX, toY) in 5 seconds using linear equation. Refer to [Easing](Easing.md) for details of the equations.

```
sprite.addModifier(emo.MoveModifier(
  [fromX, fromY],  // from [x, y]
  [toX,   toY],    // to   [x, y]
  5000, emo.easing.Linear));       // duration, equation
```

## sprite.addModifier(from, to, duration, equation, repeatCount=0, startTime = null ##

Add modifier to the sprite with given parameters. repeatCount and startTime can be omitted. startTime can be used to set the same startTime of the multiple modifiers all at once like below.

```
// set the start time of the modifiers because
// there's a 'time lag' between the first modifier and the last modifier's creation time.
local startTime = emo.Runtime().uptime();
for (local i = 0; i < 100; i++) {
  sprite[i].addModifier(emo.AlphaModifier(0, 1, 1000, emo.easing.Linear, 0, startTime));
}
```

The default modifiers are listed below.

## emo.AlphaModifier ##

AlphaModifier changes the alpha color of the sprite.

```
// change alpha color 0 to 1 in 1 second with CubicIn equation
sprite.addModifier(emo.AlphaModifier(0, 1, 1000, emo.easing.CubicIn));
```

## emo.ScaleModifier ##

ScaleModifier changes the scale of the sprite.

```
// scale the sprite by 1 to 2 in 1 second with CubicOut equation
sprite.addModifier(emo.ScaleModifier(1, 2, 1000, emo.easing.CubicOut));
```

## emo.RotateModifier ##

RotateModifier changes the rotation of the sprite.

```
// rotate the sprite 0 degree to 180 degree in 1 second with CubicInOut equation
sprite.addModifier(emo.RotateModifier(0, 180, 1000, emo.easing.CubicInOut));
```

## emo.MoveModifier ##

MoveModifier changes the position of the sprite.

```
// move the sprite from (fromX, fromY) to (toX, toY) in 5 seconds using linear equation.
sprite.addModifier(emo.MoveModifier(
  [fromX, fromY],  // from [x, y]
  [toX,   toY],    // to   [x, y]
  5000, emo.easing.Linear));       // duration, equation
```

## emo.MoveCenterModifier ##

MoveModifier change the position of the sprite using Sprite#moveCenter.

```
// move the sprite center from (fromX, fromY) to (toX, toY) in 5 seconds using linear equation.
sprite.addModifier(emo.MoveCenterModifier(
  [fromX, fromY],  // from [x, y]
  [toX,   toY],    // to   [x, y]
  5000, emo.easing.Linear));       // duration, equation
```

## emo.ColorModifier ##

ColorModifier changes the color of the sprite.

```
// change the color of the sprite in 2 seconds with CubicIn equation
sprite.addModifier(emo.ColorModifier(
  [1, 1, 0],                  // from [rgb]
  [0.7, 0.13, 0.13],          // to   [rgb]
  2000,                       // duration
  emo.easing.CubicIn         // equation
));
```
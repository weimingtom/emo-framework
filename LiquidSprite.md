# emo.LiquidSprite #

emo.LiquidSprite class represents a soft sprite with liquid body that accepts vertex and texture pointers directly.

## constructor(name) ##

Creates liquid sprite for given name.

```
// Create new liquid sprite.
local sprite = emo.LiquidSprite("ball.png");
```

## getSegmentCount ##

Returns segment count of the sprite. The default segment count equals 18.

```
// Create new liquid sprite.
local sprite = emo.LiquidSprite("ball.png");
// Returns current segment count
print(sprite.getSegmentCount());
```

## setSegmentCount(count) ##

Sets segment count of the sprite. The minimum segment count equals 5 (triangle). LiquidSprite has convenient constant for this count, TRIANGLE, RHOMBUS, HEXAGON, OCTAGON, POLYGON10, POLYGON12, CIRCLE.

```
// Create new liquid sprite.
local sprite = emo.LiquidSprite("ball.png");
local i = rand();
switch (i % 5) {
case 0:
  sprite.setSegmentCount(emo.LiquidSprite.TRIANGLE); break;
case 1:
  sprite.setSegmentCount(emo.LiquidSprite.RHOMBUS); break;
case 2:
  sprite.setSegmentCount(emo.LiquidSprite.HEXAGON); break;
case 3:
  sprite.setSegmentCount(emo.LiquidSprite.OCTAGON); break;
case 4:
  sprite.setSegmentCount(emo.LiquidSprite.POLYGON10); break;
case 5:
  sprite.setSegmentCount(emo.LiquidSprite.POLYGON12); break;
case 6:
  sprite.setSegmentCount(emo.LiquidSprite.CIRCLE); break;
}
```

## updateTextureCoords(coords) ##

Updates texture coordinates of the sprite. The parameter coords is the array of Vec2 instance. Note that the array count should not exceed the segment count.

## updateSegmentCoords ##

Updates segment coordinates of the sprite. The parameter coords is the array of Vec2 instance. Note that the array count should not exceed the segment count.
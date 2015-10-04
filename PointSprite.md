# emo.PointSprite #

emo.PointSprite draws group of points with same texture all at once, much faster than emo.Sprite.

## constructor(name = null, points = null) ##

Creates point sprite for given name. The first parameter is a texture name and the second parameter is an array of points (array of emo.Vec2).

```
// Create new point sprite with no texture
local sprite = emo.PointSprite();

// Create new point sprite with texture
local spriteWithNoInitialPoint = emo.PointSprite("flare.png");

// Create new point sprite with texture and initial points
local spriteWithPoint = emo.PointSprite("flare.png", 
    [emo.Vec2(0, 0), emo.Vec2(50, 50), emo.Vec2(100, 100)]
);
```

## setPoints(points) ##

Sets array of points constructed with emo.Vec2.

```
local points = [
  emo.Vec2(0, 0), emo.Vec2(50, 50), emo.Vec2(100, 100)
];

local sprites = emo.PointSprite();
points.setPoints(points);
```

## getPointCount ##

Returns point count of the sprite. If no points has been associated with the point sprite, it returns 1.

```
// Create new point sprite.
local sprite = emo.PointSprite("flare.png");

// Returns current point count
print(sprite.getPointCount());
```

## setPointCount(count) ##

Sets point count of the sprite. The minimum point count equals 1.

## updatePointCoords(coords) ##

Updates point coordinates of the sprite. The parameter coords is the array of Vec2 instance. Note that the array count should not exceed the segment count.
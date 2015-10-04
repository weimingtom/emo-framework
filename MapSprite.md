# emo.MapSprite #

emo.MapSprite class represents the tiled map that can be defined by multidimensional integer arrays.

## constructor(name, frameWidth, frameHeight, border = 0, margin = 0) ##

Creates a map sprite with given parameters. **Only PNG and PVRTC(iOS) image can be used** to create a sprite.

```
// create 34x42 map sprite with no border and margin, default frame index = 0
local citymap = emo.MapSprite("map1.png", 34, 42);

// create 19x19 map sprite with 3 border and 2 margin
local villmap = emo.MapSprite("map2.png", 19, 19, 3, 2);
```

## setMap ##

MapSprite#setMap sets the tiled map raw data defined by multidimensional integer arrays. An empty tile can be defined by the negative integer value: -1.

```
local citymap = emo.MapSprite("map1.png", 34, 42);

// creates 4x4 tiled map with given parameters.
local tiles = [
  [0, 1, -1, 2],
  [0, 3, -1, 2],
  [0, 4, -1, 2],
  [0, 4, -1, 2],
];
citymap.setMap(tiles);
citymap.load();
```

## clearTiles ##

MapSprite#clearTiles clears the current map.

```
// clear the all tiles.
citymap.clearTiles();
```

## addRow ##

MapSprite#addRow adds the tile row with given array. Note that the given array parameter is not multidimensional.

```
// add new row to the tiled map
local tile = [0, 1, 2, 3];
citymap.addRow(tile);
```

## setTileAt(row, column, value) ##

MapSprite#setTileAt sets the tile value to the given tile index (row, column).

```
// sets the tile -1 (empty tile) to the row=0, column=1
citymap.setTileAt(0, 1, -1);
```

## getTileAt(row, column) ##

MapSprite#getTileAt returns the tile value of the given tile index (row, column).

```
// set tile value at (0, 1) = -1
citymap.setTileAt(0, 1, -1);
// tile value at (0, 1) should be -1
local value = citymap.getTileAt(0, 1);
```

## getTileIndexAtCoord(x, y) ##

MapSprite#getTileIndexAtCoord returns the tile index of the given coordinate. The return value contains tile index: row and column.

```
// get the tile index at coord (x=100, y=200)
local coord = citymap.getTileIndexAtCoord(100, 200);

local row    = coord.row;
local column = coord.column;
```

## getTilePositionAtCoord(x, y) ##

MapSprite#getTilePositionAtCoord returns the tile's position of the given coordinate. The return value contains the position of the tile: x, y.

```
// get the tile's original coordinate at coord (x=100, y=200)
local coord = citymap.getTilePositionAtCoord(100, 200);

local x = coord.x;
local y = coord.y;
```

## load() ##
## load(x, y) ##

MapSprite#load loads the map into the screen. The default position of the map is (x=0, y=0) if no coordinates has been specified.

```
local citymap = emo.MapSprite("map1.png", 34, 42);
// load the map into the screen
citymap.load();
```

## rotate and scale ##

MapSprite itself can be moved around the screen however it does not support rotation and scaling. MapSprite only print errors if rotate and scale is called.

## MapSprite extends Sprite ##

emo.MapSprite class extends the [Sprite](Sprite.md) class so you can use all methods of [Sprite](Sprite.md) with MapSprite except rotate and scale. See [Sprite](Sprite.md) for details.
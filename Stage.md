# emo.Stage #

emo.Stage class represents one and only stage for your game. Stage class can be used to load the new level and enter the game loop, dispose the level and proceed to the next level.

## load(nextScene) ##

Stage#load load the level and delegates the event loop to the level. The loaded class can receive the event throught the event delegate functions like onLoad, onGainedFocus, onLostFocus and onDispose. It goes something like this:

```
class Level_1 {
    function onLoad() {
        // load something
    }
    function onDispose() {
        // dispose something
    }
}

emo.Stage.load(Level_1());
```

If the next level are loaded using Stage#load, the current level are disposed before loading the next level.

```
class Level_1 {
    function onLoad() {
        print("Level_1:onLoad");
    }
    function onDispose() {
        print("Level_1:onDispose");
    }
}
class Level_2 {
    function onLoad() {
        print("Level_2:onLoad");
    }
    function onDispose() {
        print("Level_2:onDispose");
    }
}
local stage = emo.Stage();
stage.load(Level_1());
stage.load(Level_2()); // Level_1#onDispose are called automatically before loading Level_2.

```

It prints like below:
```
Level1:onLoad
Level1:onDispose
Level2:onLoad
```

## load(nextScene, currentSceneModifier, nextSceneModifier, immediate) ##

**From emo version 0.1.5**, Stage#load can apply transition effects to the scene. The second parameter currentSceneModifier is the modifier that effects to the current scene transition. The third parameter nextSceneModifier is the modifier that effects to the next scene transition. The last parameter is the flag that indicates the next scene will be loaded immediately. if the immediate flag equals false, the next scene will be loaded after the current scene transition has been ended.

for introduction about the scene transition, see the video below.

http://www.youtube.com/watch?v=_zpzQu3ssyE&

```
// fade out current scene and move in next scene
local currentSceneModifier = emo.AlphaModifier(1, 0, 1000, emo.easing.Linear);
local nextSceneModifier = emo.MoveModifier(
    [0, stage.getWindowHeight()],
    [0, 0],
    2000, emo.easing.BackOut);
stage.load(SceneA(), currentSceneModifier, nextSceneModifier, false);
```

## windowWidth ##

Stage#getWindowWidth returns the screen width. If integer parameter has been set to the Stage#windowWidth window width is updated.

```
local stage = emo.Stage();
local width = stage.getWindowWidth(); // get the window width
stage.windowWidth(320); // set the window width to 320
```


## windowHeight ##

Stage#getWindowHeight returns the screen height. If integer parameter has been set to the Stage#windowHeight window height is updated.

```
local stage = emo.Stage();
local height = stage.getWindowHeight(); // get the window height
stage.windowHeight(240); // set the window height to 240
```

## viewport ##

Stage#viewport sets the viewport of the screen. Stage#viewport is just the proxy calls for OpenGL glViewport command. Default viewport size is just the same size as Stage#windowWidth and Stage#windowHeight.

```
local width  = 480;
local height = 320;
local stage = emo.Stage();
stage.viewport(width, height);
```

## ortho ##

Stage#ortho updates the orthogonal parameters for OpenGL. Stage#ortho is just the proxy calls for OpenGL glOrthof command. Default width and height are just the same size as Stage#windowWidth and Stage#windowHeight.

```
local width  = 480;
local height = 320;
local stage = emo.Stage();
stage.ortho(width, height);
```

## interval ##

Stage#interval updates the draw interval(millisecond) of the screen. This can be used to debug the game or limit the fps(frame per second) while loading heavy assets.

```
local stage = emo.Stage();
stage.interval(100); // change update interval to 100 milliseconds
```

## getCenterX ##

Stage#getCenterX returns the center coordinate X of the current screen. This function is equivalent to Stage#getWindowWidth() x 0.5.

```
local stage = emo.Stage();
local centerX = stage.getCenterX();
```

## getCenterY ##

Stage#getCenterY returns the center coordinate Y of the current screen. This function is equivalent to Stage#getWindowHeight() x 0.5.

```
local stage = emo.Stage();
local centerY = stage.getCenterY();
```

## setContentScale ##

Stage#setContentScale scales the current content. This function is useful to support multiple screen density. This function is equivalent to Stage#ortho(Stage#getWindowWidth() / scale, Stage#getWindowHeight() / scale).

```
// if the screen has large display, scale contents twice
// that makes the stage size by half.
// This examples shows how to display similar-scale images
// on Retina and non-Retina display.
local stage = emo.Stage();
stage.setContentScale(stage.getWindowWidth() / 320);

// if the device has 320x480 screen, the stage size equals 320x480.
// if the device has 640x960 screen, the stage size remains 320x480.
```
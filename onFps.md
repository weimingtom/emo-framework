# onFps #

Called when the FPS(Frame Per Second) callback event occurs. Use emo.Event.enableOnFpsCallback function to enable this event.

## emo.Event.enableOnFpsCallback(msec) ##

Enable the fps callback event with given milliseconds. After enabling the fps callback, onFps event is called at given interval.

```
// onFps event is called at every 5 seconds.
local event = emo.Event();
event.enableOnFpsCallback(5000); 
```

## function onFps(fps) ##

Called when the fps callback event occurs. The first parameter is the frame per second.

```
function onFps(fps) {
  print(format("FPS: %4.2f", fps));
}
```

## emo.Event.disableOnFpsCallback ##

Disable the fps callback event. After disabling the fps callback, onFps event will be never called.

```
// disable onFps event callback
local event = emo.Event();
event.disableOnFpsCallback(); 
```
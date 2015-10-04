# onDrawFrame #

Called when the onDrawFarme callback event occurs. Use emo.Event.enableOnDrawCallback function to enable this event.

## emo.Event.enableOnDrawCallback(msec) ##

Enable the onDraw callback event with given milliseconds. After enabling the callback, onDrawFrame event is called at given interval.

```
// onDrawFrame event is called at every 5 seconds.
local event = emo.Event();
event.enableOnDrawCallback(5000); 
```

## function onDrawFrame(dt) ##

Called when the onDrawFrame callback event is called. The first parameter is the delta time milliseconds.

```
function onDrawFrame(dt) {
  print(format("onDrawFrame: %d", dt));
}
```

## emo.Event.disableOnDrawCallback ##

Disable the onDraw callback event. After disabling the callback, onDrawFrame will be never called.

```
// disable onDrawFrame callback
local event = emo.Event();
event.disableOnDrawCallback(); 
```
# MotionEvent #

MotionEvent class represents the movement events that is fired when user touches the screen. You can get the coordinates of the pointer, action type and so on from the motion event object. emo-framework can handle not only single-touch event but also multiple touch event.

## onMotionEvent(mevent) ##

Called when user touches the screen. you can get motion event information by the given parameter.

```
function onMotionEvent(mevent) {
    print("motion event!");
}
```

## getAction ##

emo-framework can handle following action event. Several action types that related with multiple touches are for Android platform only.

```
function onMotionEvent(mevent) {
  if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
    print("motion event action down!");
  }
}
```

### MOTION\_EVENT\_ACTION\_DOWN ###

A pressed gesture has started, the motion contains the initial starting location.

### MOTION\_EVENT\_ACTION\_UP ###

A pressed gesture has finished, the motion contains the final release location as well as any intermediate points since the last down or move event.

### MOTION\_EVENT\_ACTION\_MOVE ###

A change has happened during a press gesture (between ACTION\_DOWN and ACTION\_UP). The motion contains the most recent point, as well as any intermediate points since the last down or move event.

### MOTION\_EVENT\_ACTION\_CANCEL ###

The current gesture has been aborted. You will not receive any more points in it. You should treat this as an up event, but not perform any action that you normally would.

### MOTION\_EVENT\_ACTION\_OUTSIDE ###

**Android only:** A movement has happened outside of the normal bounds of the UI element. This does not provide a full gesture, but only the initial location of the movement/touch.

### MOTION\_EVENT\_ACTION\_POINTER\_DOWN ###

**Android only:** A non-primary pointer has gone down.

### MOTION\_EVENT\_ACTION\_POINTER\_UP ###

**Android only:** A non-primary pointer has gone up.

## getPointerId ##

Return the pointer identifier associated with this event.

```
function onMotionEvent(mevent) {
  if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
    print(format("pointer id = %d", mevent.getPointerId()));
  }
}
```

## getX ##

Returns the X coordinate of this event.

```
function onMotionEvent(mevent) {
  if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
    print(format("motion event action down at %dx%d",
         mevent.getX(), mevent.getY()));
  }
}
```

## getY ##

Returns the Y coordinate of this event.

```
function onMotionEvent(mevent) {
  if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
    print(format("motion event action down at %dx%d",
         mevent.getX(), mevent.getY()));
  }
}
```
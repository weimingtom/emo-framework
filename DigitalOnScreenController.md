# emo.DigitalOnScreenController #

emo.DigitalOnScreenController represents virtual digital stick controller that accepts user screen input. The controller raises onControlEvent events when the input event occurs.

## constructor(base\_name, knob\_name, alpha=0.5) ##

Creates digital on-screen controller with given image file. The controller consists of two images: base image and knob image. The last parameter alpha is alpha color of the controller and default alpha color equals 0.5.

```
controller = emo.DigitalOnScreenController(
    "controller_base.png", "controller_knob.png");
```

## updateInterval ##

updateInterval represents update interval milliseconds for the controller. The controller event is fired every updateInterval milliseconds at most. The default update interval equals 100 milliseconds.

```
controller = emo.DigitalOnScreenController(
    "controller_base.png", "controller_knob.png");

// onControlEvent is fired on every 16 milliseconds at most.
controller.updateInterval = 16;
```

## onControlEvent(controller, controlX, controlY, hasChanged) ##

onControlEvent is a callback for the controller. The first parameter controller is the Controller instance that you can decide which controller is used when you place multiple controllers into the screen. The controlX and controlY parameters are values of user input. controlX and controlY takes values between -100 to 100. hasChanged is the flag (boolean value) that tells whether the controller value has changed or not. For example, if the previous controller values (X and Y) equals 100 and current controller values remains same, hasChanged equals false. If the controller values (X and Y) has changed due to user input, hasChanged equals true.

```
/*
 * on-screen controller event
 * controlX and controlY takes value from -100 to 100.
 */
function onControlEvent(controller, controlX, controlY, hasChanged) {
    print(format("controller input: X=%d, Y=%d", controlX, controlY));
}
```
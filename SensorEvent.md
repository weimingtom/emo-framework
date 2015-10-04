# SensorEvent #

emo-framework can handle the events from the sensors. Currently only accelerometer sensor event is supported by the framework. First of all you have to register the sensor to the framework by emo.Event class, and enable/disable the sensor when you use the sensor. Enable/Disabling the sensor is important to save the device's cpu power and battery consumption.

```
local event = emo.Event();

function onLoad() {
  event.registerSensors(SENSOR_TYPE_ACCELEROMETER);
}
function onGainedFocus() {
  event.enableSensor(SENSOR_TYPE_ACCELEROMETER, 100);
}
function onLostFocus() {
  event.disableSensor(SENSOR_TYPE_ACCELEROMETER);
}
```

enableSensor takes two parameters: sensor type and the rate that the delivery rate of events in milliseconds for the given sensor.

## onSensorEvent(sevent) ##

onSensorEvent function is called from the framework when the sensor event is fired.

```
function onSensorEvent(sevent) {
  if (sevent.getType() == SENSOR_TYPE_ACCELEROMETER) {
    print("accelerometer event comes in!");
  }
}
```

## getType ##

Returns the sensor type of this event. SENSOR\_TYPE\_ACCELEROMETER is returned when the accelerometer event is fired.

```
function onSensorEvent(sevent) {
  if (sevent.getType() == SENSOR_TYPE_ACCELEROMETER) {
    print("accelerometer event comes in!");
  }
}
```

## getAccelerationX ##
## getAccelerationY ##
## getAccelerationZ ##

Returns the acceleration value for the axis of the device. See [Android Sensor Event](http://developer.android.com/reference/android/hardware/SensorManager.html#registerListener%28android.hardware.SensorEventListener,%20android.hardware.Sensor,%20int%29) documents and [iOS UIAcceleration](http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UIAcceleration_Class/Reference/UIAcceleration.html#//apple_ref/doc/uid/TP40006901) document for details.

```
function onSensorEvent(sevent) {
  if (sevent.getType() == SENSOR_TYPE_ACCELEROMETER) {
    print("accelerometer event comes in!");
    print(format("x=%f,y=%f,z=%f", 
      sevent.getAccelerationX(),
      sevent.getAccelerationY(),
      sevent.getAccelerationZ()
    ));
  }
}
```

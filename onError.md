# onError(message) #

Called when the compile error or runtime error occurs. The message parameter shows the error details. By default the framework shows the error message into the debug log (logcat on Android, Xcode console on iOS) so printing the error message to the debug log by yourself is not necessary. Use onError to catch the error and decide what the app have to do next.

```
function onError(message) {
  // read the error message and decide what we have to do next
}
```
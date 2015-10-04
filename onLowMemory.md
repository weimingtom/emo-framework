# onLowMemory #

Called when the device has encountered low memory warning and trying to free the memory for the application. It is recommended to implement this function to free the memory at onLowMemory event as much as possible.

```
function onLowMemory() {
  print("onLowMemory: too many sprites");
  // free your memory as much as possible
}
```
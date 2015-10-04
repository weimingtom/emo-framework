# KeyEvent #

**Andriod only:** emo-framework can handle key and button events. onKeyEvent is fired by the framework when user presses the key. Note that iOS users cannot handle the key event because iOS has 'Home' button that is only used to finish the application and it is not allowed to customize that behavior.

```
function onKeyEvent(kevent) {
  print("key event!");
  return false;
}
```

## getAction ##

emo-framework is just the proxy that passes the key event fired by Android platform. If you handled the event, return true. If you want to allow the event to be handled by the next receiver, return false.  The action parameter has one of the following value: KEY\_EVENT\_ACTION\_DOWN, KEY\_EVENT\_ACTION\_UP or KEY\_EVENT\_ACTION\_MULTIPLE.

```
function onKeyEvent(kevent) {
  if (kevent.getAction() == KEY_EVENT_ACTION_DOWN) {
    print("key event down!");
  }
  return false;
}
```

## getKeyCode ##

Returns the key code of the key event. The key code has the same name compared to the Android's key event. See [Android KeyEvent](http://developer.android.com/reference/android/view/KeyEvent.html) document for details.

```
function onKeyEvent(kevent) {
  if (kevent.getAction() == KEY_EVENT_ACTION_DOWN) {
    if (kevent.getKeyCode() == KEYCODE_BACK) {
      print("Back button is pressed!");
      // if you want to disable the back button, uncomment below
      // return true;
    }
  }
  return false;
}
```

## getRepeatCount ##

Retrieve the repeat count of the event. See [Android KeyEvent](http://developer.android.com/reference/android/view/KeyEvent.html) document for details.

## getMetaState ##

Returns the state of the meta keys. See [Android KeyEvent](http://developer.android.com/reference/android/view/KeyEvent.html) document for details.
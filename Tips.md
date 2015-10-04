# Tips #

## Keeping the orientation in portrait mode ##

To keep the orientation in portrait mode, set orientation option using Runtime.

```
local runtime = emo.Runtime();
runtime.setOptions(OPT_ORIENTATION_PORTRAIT);
```

For Android, edit the AndroidManifest.xml and set the screenOrientation option.

```
<activity android:name="com.emo_framework.EmoActivity"
    android:label="@string/app_name"
    android:screenOrientation="portrait">
```

For iOS, Open Info.plist of your application and set "Initial interface orientation to portrait(bottom home button). Only 'bottom home button' option is supported for portrait.

![http://www.emo-framework.com/images/xcode_ori_portrait.png](http://www.emo-framework.com/images/xcode_ori_portrait.png)

## Keeping the orientation in landscape mode ##

To keep the orientation in landscape mode, set orientation option using Runtime.

```
local runtime = emo.Runtime();
runtime.setOptions(OPT_ORIENTATION_LANDSCAPE);
```

For Android, edit the AndroidManifest.xml and set the screenOrientation option.

```
<activity android:name="com.emo_framework.EmoActivity"
    android:label="@string/app_name"
    android:screenOrientation="landscape">
```

For iOS, Open Info.plist of your application and set "Initial interface orientation to landscape(**left home button**).

![http://www.emo-framework.com/images/xcode_ori_landscape.png](http://www.emo-framework.com/images/xcode_ori_landscape.png)

If you want the orientation to landscape(**right home button**), set "Initial interface orientation to landscape(**right home button**) and set OPT\_ORIENTATION\_LANDSCAPE\_RIGHT option to Runtime.

```
local runtime = emo.Runtime();
runtime.setOptions(OPT_ORIENTATION_LANDSCAPE_RIGHT);
```

## Changing application life cycle ##

By default, emo for iOS has shipped as 'single task' application. This is because iOS does not properly dispose the application and kill the app unexpectedly at termination when application multitasking is on. For emo, this means **"onDispose" function is never called by iOS** when application multitasking is enabled.

In spite of this fact, you can change application life cycle to be multi tasking application. Edit info.plist and un-check "Application does not run in background".

![http://www.emo-framework.com/images/xcode_enable_multitask.png](http://www.emo-framework.com/images/xcode_enable_multitask.png)
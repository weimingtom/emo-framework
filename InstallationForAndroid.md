# Install project template for Android #

Use Eclipse project template to create new emo project for Android.

Download the latest source distribution from http://code.google.com/p/emo-framework/downloads/list . The project template for Eclipse is in the Android-Template directory.

  * Start your Eclipse
  * Select 'File' -> 'Import' menu
  * Select 'General' -> 'Existing Projects into Workspace'

![http://www.emo-framework.com/images/eclipse_install1.png](http://www.emo-framework.com/images/eclipse_install1.png)

  * Choose 'Select root directory' and browse for the parent directory of the Android-Template directory.

![http://www.emo-framework.com/images/eclipse_install2.png](http://www.emo-framework.com/images/eclipse_install2.png)

  * Check the 'copy projects into workspace' if you want to copy them to your workspace. (Normally you may need to check it.)
  * Check the 'Android-Template' directory and press 'Finish' button

![http://www.emo-framework.com/images/eclipse_install3.png](http://www.emo-framework.com/images/eclipse_install3.png)

Edit package name in the AndroidManifest.xml. Otherwise "com.emo\_framework.examples" is used for your app. (you won't be happy  with it...)
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
        package="com.emo_framework.examples"
        android:versionCode="1"
        android:versionName="1.0">
```

The main script file is **assets/main.nut**. Edit it to create your own game.

![http://www.emo-framework.com/images/eclipse_install4.png](http://www.emo-framework.com/images/eclipse_install4.png)

```
function emo::onLoad() {
  // print log into the logcat
  print("It works!");
  emo.Stage().load(Main());
}
```


# Build examples for Android #

The example for Eclipse is in the Android-Examples directory.

  * Start your Eclipse
  * Select 'File' -> 'Import' menu
  * Select 'General' -> 'Existing Projects into Workspace'

![http://www.emo-framework.com/images/eclipse_install1.png](http://www.emo-framework.com/images/eclipse_install1.png)

  * Choose 'Select root directory' and browse for the parent directory of the Android-Examples directory.

![http://www.emo-framework.com/images/eclipse_install2.png](http://www.emo-framework.com/images/eclipse_install2.png)

  * Check the 'copy projects into workspace' if you want to copy them to your workspace. (Normally you may need to check it.)
  * Check the 'Android-Examples' directory and press 'Finish' button
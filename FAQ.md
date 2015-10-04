# FAQ #

## Will emo-framework replace [e3roid](http://www.e3roid.com/)? ##

Some developers might notice that emo carried some principles from e3roid. Yet, I guess emo will not replace e3roid. Here's some comparison.

### e3roid ###
  * works on Android only
  * Android 2.1 and above
  * **uses Java to develop your game**
  * uses Java to extend the framework
  * all of the Android API can be used
  * use Eclipse IDE and Java to build your game

### emo ###
  * works on both Android and iOS
  * Android 2.3 and above (NativeActivity)
    * this means _there's no GC with emo_
  * Xcode 3.1 and above
  * **uses Scripting language to develop your game**
  * uses C/C++, Objective-C to extend the framework
  * emo has simple and limited API
  * use Eclipse IDE and Java to build your game for Android
  * use Xcode to build your game for iOS
    * (this means you have to buy Mac :|)

With e3roid, you can use all power of Java and Android. emo has simple API compared to Android, and unlike e3roid extending emo
by yourself might be hard because you have to play with five languages: C, C++, Objective-C, Java and Squirrel to extend emo. I am sure that emo has simple but powerful API that you can easily write your game with it. If you would like to write a game that works on both iOS and Android, emo is your choice.

## Is the engine free to use? ##

Yes, of course! Because emo is released under the terms of New BSD License, you can use emo at absolutely no charge. You can even sell it under the terms of the license :-) See [license document](http://code.google.com/p/emo-framework/source/browse/trunk/LICENSE.txt) for details.

## What information would we need to display when distributing our game, logo etc? ##

You don't have to show any logo of emo in your game, and you
don't have to include full license documents in your app. But note
that the New BSD License says 'Redistributions in binary form must reproduce the copyright notice'. The copyright notice must reproduce 'somewhere' else. It is totally all up to you to decide where you place the copyright of emo (webiste, link, etc..), by the your own good faith.
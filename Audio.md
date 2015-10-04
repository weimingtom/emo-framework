# emo.Audio #

emo.Audio represents audio interface to to play audio and music.

## constructor ##
## constructor(channelCount) ##

Prepares new audio channels with given number of channels. If channelCount is emitted three channels are created by default.

```
local audio = emo.Audio(3);
```

## createChannel(channelIndex) ##

Creates new AudioChannel and returns new instance of emo.AudioChannel. You can interact with audios with this channel.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);
local ch1   = audio.createChannel(1);
local ch2   = audio.createChannel(2);
```

See AudioChannel document for details.

## vibrate ##

Audio#vibrate vibrates the device. If the device does not support the vibration, it does nothing.

```
// vibrate the device
emo.Audio.vibrate();
```

**Note:** On Android platform, vibration requires android.permission.VIBRATE permission. it should be defined in your AndroidManifest.xml.

```
<uses-permission android:name="android.permission.VIBRATE"/>
```
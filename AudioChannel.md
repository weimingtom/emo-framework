# emo.AudioChannel #

emo.AudioChannel represents the audio channel that can handle the audio associated with the channel.

## constructor ##

There is no constructor for audio channel. Use emo.Audio#createChannel to create new audio channel. See emo.[Audio](Audio.md) document for details.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);
```

## load(filename) ##

AudioChannel#load loads the audio file with given filename. Every audio files should be placed under the **'Resources/sounds'** folder for iOS, **'assets/sounds'** directory for Android.

### Supported audio format: ###

#### For iOS ####

emo-framework uses 'Extended Audio File Services' for iOS so following format can be loaded through audio channel. AIFF (.aif, .aiff), CAF (.caf), MPEG-1 to 4 (.mp1, .mp2, .mp3, .acc, .m4a, .mp4), WAV (.wav), 3gpp (.3gp), 3gp2 (.3g2).. etc. See [Extended Audio File Services: Built-In Audio File Types](http://developer.apple.com/library/ios/#documentation/MusicAudio/Reference/AudioFileConvertRef/Reference/reference.html#//apple_ref/doc/c_ref/AudioFileTypeID) for details.

#### For Android ####

emo-framework uses 'OpenSL ES" for Android, following format can be loaded through audio channel. WAV PCM, WAV alaw, WAV ulaw, MP3, Ogg Vorbis, AAC LC, HE-AACv1 (aacPlus), HE-AACv2 (enhanced aacPlus), AMR, and FLAC (provided these are supported by the overall platform, and AAC formats must be located within an MP4 or ADTS container). MIDI is not supported. See [OpenSL ES for Android](http://mobilepearls.com/labs/native-android-api/opensles/index.html) for details.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");
```

## play ##
## play(reset = false) ##

Plays the audio associated with the channel. Audio channel is automatically stopped after the audio play ends if no loop has been specified by setLoop. if reset parameter equals true, audio starts at the beginning. if reset parameter equals false or not specified, audio resumes when the audio have been paused by pause().

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.play();
```

## stop ##

Stops the audio associated with the channel. The current seek position is reset to the beginning.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.play();

// stops channel 0
ch0.stop();

// ch0 plays from the beginning
ch0.play();
```


## pause ##

Pauses the audio associated with the channel. The audio is resumed when play() is called.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.play();

// pauses channel 0
ch0.pause();

// ch0 plays from the paused position
ch0.play();
```

## seek(offset) ##

Seek the audio associated with the channel. The offset is milliseconds from the beginning of the audio.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.play();

// seek back to the beginning.
ch0.seek(0);

// ch0 plays from the beginning
ch0.play();
```

## setLoop(flag) ##

Loop the audio associated with the channel.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.setLoop(true);

// audio will be looped
ch0.play();
```

## isLoop ##

Returns whether loop is enabled or not.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.setLoop(true);

print(ch0.isLoop()); // should print true
```

## getState ##

Returns current status of the audio channel: **AUDIO\_CHANNEL\_STOPPED**, **AUDIO\_CHANNEL\_PAUSED** or **AUDIO\_CHANNEL\_PLAYING**.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

ch0.setLoop(true);

local state = ch0.getState();

if (state == AUDIO_CHANNEL_PLAYING) {
  print("playing");
}

```

## getMaxVolume ##

Returns the max volume of the audio channel. Max volume is always 1.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

local maxVol = ch0.getMaxVolume();
```

## getMinVolume ##

Returns the minimum volume of the audio channel. Minimum volume is always 0. Note that the actual range of volume depends on the device. (i.e. iPhone goes silent when the volume equals 0, but some Android devices goes silent when the volume is under 0.9 or so.)

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

local minVol = ch0.getMinVolume();
```

## getVolume ##

Returns the current volume of the audio channel. The volume range is float value: 0 to 1. Note that the actual range of volume depends on the device. (i.e. iPhone goes silent when the volume equals 0, but some Android devices goes silent when the volume is under 0.9 or so.)

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

local volume = ch0.getVolume();
```

## setVolume ##

Sets the current volume of the audio channel. Note that the actual range of volume depends on the device. (i.e. iPhone goes silent when the volume equals 0, but some Android devices goes silent when the volume is under 0.9 or so.) The audio channel will be silent when the minimum volume is set to the audio channel.

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

// set volume to the max
ch0.setVolume(ch0.getMaxVolume());

// set volume to the min (mute)
ch0.setVolume(ch0.getMinVolume());
```

## close ##

Close the audio channel. Audio resource associated with the channel is released after calling close().

```
local audio = emo.Audio(3);
local ch0   = audio.createChannel(0);

ch0.load("bang.wav");

// close audio channel 0
ch0.close();
```
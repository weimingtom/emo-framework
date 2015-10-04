# What is emo framework? #

emo is 2D game engine for Android and iOS.

emo is lightweight game framework that is **driven by Squirrel, object-oriented scripting language for your game logic**. emo has native game engine almost all codes are written in C/C++ for Android and C/C++/Objective-C for iOS that is based on OpenGL for graphic rendering and OpenAL/OpenSL for sound interface.

## NEW: 10/13/2011 A Hands-on Guide to emo-framework is out! ##

### Developing Games for Android & iOS with Squirrel ###

![http://www.emo-framework.com/images/cover_english_small.png](http://www.emo-framework.com/images/cover_english_small.png)
![http://www.emo-framework.com/images/cover_japanese_small.png](http://www.emo-framework.com/images/cover_japanese_small.png)

  * http://www.emo-framework.com/doc/emo_handbook_en.pdf (English)
  * http://d.hatena.ne.jp/infosia/20111012/1318377378 (Japanese)

## NEW: 01/25/2012 version 0.2.0 has been released! ##

  * Add: Scene transition support for Android 3.x devices
  * Add: Sprite.blendFunc: the pixel arithmetic blending
  * Add: SpriteSheet.animate accepts frame names other than frame index
  * Add: emo.Physics.createKinematicSprite
  * Fix: Accelerometer returns wrong values on Android 3.x tablet devices

## NEW: 11/24/2011 version 0.1.9 has been released! ##

  * Add: emo.PointSprite that draws group of points with same texture, much faster than emo.Sprite
  * Fix: LiquidSprite doesn't update last texture coordinate correctly

## NEW: 11/07/2011 version 0.1.8 has been released! ##

  * Add: Support for PowerVR Texture Compression (only on iOS)
  * Add: emo.LiquidSprite: Box2D textured soft body

<a href='http://www.youtube.com/watch?feature=player_embedded&v=5b1CSZ38Akg' target='_blank'><img src='http://img.youtube.com/vi/5b1CSZ38Akg/0.jpg' width='425' height=344 /></a>

### version 0.1.7 delivers: ###

  * Add: Texture packer support (known as texture atlas)
    * Sparrow and CEGUI/OGRE data format is supported.
    * http://www.texturepacker.com/
![http://www.emo-framework.com/images/texturepacker.png](http://www.emo-framework.com/images/texturepacker.png)

  * Add: Unicode characters rendering
  * Add: TrueType fonts rendering
![http://www.emo-framework.com/images/unicode_truetype_small.png](http://www.emo-framework.com/images/unicode_truetype_small.png)

  * Add: build.xml for building with ant
  * Fix: emo.PolygonShape.set accepts only 2 vertices
  * Fix: content scale is reset by calling setContentScale multiple times

### New feature: scene transition ###

<a href='http://www.youtube.com/watch?feature=player_embedded&v=_zpzQu3ssyE' target='_blank'><img src='http://img.youtube.com/vi/_zpzQu3ssyE/0.jpg' width='425' height=344 /></a>

**The previous version 0.1 to 0.1.4 are all deprecated** because they contain some issues.
<br>It is recommended for everyone to upgrade to the latest version.<br>
<br>
Please check out the downloads section.<br>
<br>
<a href='https://code.google.com/p/emo-framework/downloads/list'>https://code.google.com/p/emo-framework/downloads/list</a>

<h2>NEW: 08/25/2011 a practical example has been released!</h2>

<img src='http://www.emo-framework.com/kawazbuster/images/game.png' />

Here I have released a game - kawazbuster-squirrel: a Squirrel port of the addictive Whac-A-Mol like game <a href='http://itunes.apple.com/app/id447763556'>"Kawaz-tan tataki!"</a> as one of the most practical example of emo-framework. kawazbuster-squirrel is entirely driven by Squirrel that is powered by emo-framework. It is open-source project that is released under terms of MIT license so you can see entire source code of this game.<br>
<br>
<a href='http://code.google.com/p/kawazbuster-squirrel/'>http://code.google.com/p/kawazbuster-squirrel/</a>

<h2>The Feature Showcase</h2>

<a href='http://www.youtube.com/watch?feature=player_embedded&v=w0r6Xz5N6Rk' target='_blank'><img src='http://img.youtube.com/vi/w0r6Xz5N6Rk/0.jpg' width='425' height=344 /></a><br>
<br>
<h2>Technical Information</h2>

For more information about technical reference and API documentation, please refer to the <a href='http://code.google.com/p/emo-framework/wiki/Introduction?tm=6'>documentation of emo-framework</a>.<br>
<br>
<h1>What is Squirrel? Why should we use it?</h1>

<blockquote>"Squirrel is a high level imperative, object-oriented programming language, designed to be a light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games." -- squirrel-lang.org</blockquote>

<blockquote><a href='http://www.squirrel-lang.org/'>http://www.squirrel-lang.org/</a></blockquote>

Squirrel is intuitive lightweight object-oriented programming language that fits real-time requirements of your games. <b>You can write all of your game logic by Squirrel programming language</b>. You don't have to learn Objective-C or even Java, you need no knowledge for Apple's Foundation Framework nor Android API. With Squirrel and emo framework, you can write your game once by Squirrel that runs on both Android and iOS!<br>
<br>
<h1>What does it look like?</h1>

The first traditional "HelloWorld" application by emo should look like this:<br>
<br>
<pre><code>print("Hello, World!");<br>
</code></pre>

Remarkably straightforward! :D It prints the string into the logcat(Android) and Xcode Console(iOS).<br>
<br>
Of course you can write your game logic by object-oriented, it goes something like this:<br>
<br>
<pre><code>local stage   = emo.Stage(); // stage class represents your game stage<br>
<br>
/*<br>
 * Level 1 definition<br>
 */<br>
class Level_1 {<br>
<br>
    dogSprite  = emo.Sprite("dog.png");<br>
<br>
    /*<br>
     * called when level 1 started<br>
     */<br>
    function onLoad() {<br>
        dogSprite.load(); // load dog sprite into the screen<br>
    }<br>
<br>
    /*<br>
     * called when level 1 ends.<br>
     */<br>
    function onDispose() {<br>
        dogSprite.remove(); // remove the sprite from the screen<br>
    }<br>
<br>
    /*<br>
     * this block is your game loop. <br>
     */<br>
    function onDrawFrame(dt) {<br>
        // this block is your your game loop<br>
    }<br>
<br>
    /*<br>
     * when the screen is touched down, proceed to the next level.<br>
     */<br>
    function onMotionEvent(motionEvent) {<br>
        if (motionEvent.getAction() == MOTION_EVENT_ACTION_DOWN) {<br>
            stage.load(Level_2());<br>
        }<br>
    }<br>
}<br>
<br>
/*<br>
 * Level 2 definition<br>
 */<br>
class Level_2 {<br>
<br>
    kingSprite = emo.Sprite("king.png");<br>
<br>
    /*<br>
     * called when level 2 started<br>
     */<br>
    function onLoad() {<br>
        kingSprite.load(); // load king sprite into the screen<br>
    }<br>
<br>
    /*<br>
     * this block is your game loop. <br>
     */<br>
    function onDrawFrame(dt) {<br>
        // this block is your your game loop<br>
    }<br>
<br>
    /*<br>
     * called when level 2 ends.<br>
     */<br>
    function onDispose() {<br>
        kingSprite.remove(); // remove the sprite from the screen<br>
    }<br>
}<br>
<br>
/*<br>
 * load Level 1 stage when this script is loaded<br>
 */<br>
function emo::onLoad() {<br>
    stage.load(Level_1());<br>
}<br>
</code></pre>

Squirrel programming language is inspired by languages like Python, Javascript and expecially Lua. Every programmer who get used to Javascript or Lua could easily get into Squirrel in just a second. For more information about Squirrel, see <a href='http://www.squirrel-lang.org/'>http://www.squirrel-lang.org/</a> for details.<br>
<br>
<h1>Integrating with physics</h1>

emo-framework implements physics engine powered by Box2D so you can easily integrate full-scale physics with your game. If you have already experienced Box2D programming you will soon get used to it in a minute because part of Box2D API is ported to emo as it is.<br>
<br>
<ul><li><a href='http://code.google.com/p/box2d/source/browse/trunk/Box2D/HelloWorld/HelloWorld.cpp'>HelloWorld example by Box2D (C++)</a>
</li><li><a href='http://code.google.com/p/emo-framework/source/browse/trunk/iOS-Examples/Resources/box2d_helloworld.nut'>HelloWorld example by emo</a></li></ul>

Looks pretty familiar, right?<br>
<br>
<pre><code>emo.Runtime.import("physics.nut");<br>
<br>
// This is a simple example of building and running a simulation<br>
// using Box2D. Here we create a large ground box and a small dynamic<br>
// box.<br>
// There are no graphics for this example. Box2D is meant to be used<br>
// with your rendering engine in your game engine.<br>
function emo::onLoad() {<br>
    local gravity = emo.Vec2(0, -10);<br>
    local world = emo.physics.World(gravity, true);<br>
    <br>
    local groundBodyDef = emo.physics.BodyDef();<br>
    groundBodyDef.position = emo.Vec2(0, -10);<br>
    <br>
    local groundBody = world.createBody(groundBodyDef);<br>
    <br>
    local groundBox = emo.physics.PolygonShape();<br>
    groundBox.setAsBox(50, 10);<br>
    groundBody.createFixture(groundBox, 0);<br>
<br>
    local bodyDef = emo.physics.BodyDef();<br>
    bodyDef.type = PHYSICS_BODY_TYPE_DYNAMIC;<br>
    bodyDef.position = emo.Vec2(0, 4);<br>
    local body = world.createBody(bodyDef);<br>
    <br>
    local dynamicBox = emo.physics.PolygonShape();<br>
    dynamicBox.setAsBox(1, 1);<br>
    <br>
    local fixtureDef = emo.physics.FixtureDef();<br>
    fixtureDef.shape = dynamicBox;<br>
    fixtureDef.density  = 1;<br>
    fixtureDef.friction = 0.3;<br>
    body.createFixture(fixtureDef);<br>
    <br>
    local timeStep = 1.0 / 60.0;<br>
    local velocityIterations = 6;<br>
    local positionIterations  = 2;<br>
    <br>
    for (local i = 0; i &lt; 60; ++i) {<br>
        world.step(timeStep, velocityIterations, positionIterations);<br>
        world.clearForces();<br>
        <br>
        local position = body.getPosition();<br>
        local angle    = body.getAngle();<br>
        <br>
        print(format("%4.2f %4.2f %4.2f", position.x, position.y, angle));<br>
    }<br>
}<br>
</code></pre>
<h1>What are the requirements for developing with emo?</h1>

<h2>For Android</h2>

emo engine for Android runs on the the top of the Native Activity for Android, so <b>emo runs on Android 2.3 and above</b>. emo can 'not' run on Android 2.1 and 2.2.<br>
<br>
<h2>For iOS</h2>

emo engine for iOS is mostly written in Objective-C that runs on Apple's Foundation Framework. The latest iOS SDK is required to compile/develop your game.
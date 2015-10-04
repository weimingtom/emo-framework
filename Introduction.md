# Introduction #

emo(yee-mow) is 2D game engine for Android and iOS.

emo is lightweight game framework that is driven by Squirrel, object-oriented scripting language for your game logic. emo has native game engine almost all codes are written in C/C++ for Android and C/C++/Objective-C for iOS that is based on OpenGL for graphic rendering and OpenAL/OpenSL for sound interface.

![http://www.emo-framework.com/images/emodesign.png](http://www.emo-framework.com/images/emodesign.png)

## One-minute presentation ##
The following link shows a one minute presentation about emo-framework.

http://prezi.com/xnjyogpegzum/emo-lightweight-2d-game-framework-for-android-and-ios/

<a href='http://www.youtube.com/watch?feature=player_embedded&v=iCaaik7OlW8' target='_blank'><img src='http://img.youtube.com/vi/iCaaik7OlW8/0.jpg' width='425' height=344 /></a>

## What is Squirrel? ##

Squirrel is intuitive lightweight object-oriented programming language that fits real-time requirements of your games. **You can write all of your game logic by Squirrel programming language**. You don't have to learn Objective-C or even Java, you need no knowledge for Apple's Foundation Framework nor Android API. With Squirrel and emo framework, you can write your game once by Squirrel that runs on both Android and iOS.

## Easy to Use ##

As emo has simple and easy to use application programming interface that is running on top of the Squirrel programming language, you don't have to endure the difficulties of learning Objective-C and Java, and you can focus on your game logic by using one programming language. Not only novice programmers but also professional game programmers who are familiar with Lua (famous game programming language in the game industry) will make full use of Squirrel in a minute because Squirrel is much inspired by the language like Lua, JavaScript and Python.

## Lightweight ##

One of the key concepts of emo-framework is to keep it simple and lightweight in many ways. emo is driven by Squirrel that fits in the size, memory bandwidth, and real-time requirements of games. emo has native game engine which almost all codes are written in C/C++ for Android and C/C++/Objective-C for iOS that is based on OpenGL for graphic rendering and OpenAL/OpenSL for sound interface.

## Open source and Free ##

emo is released under the terms of the open-source license: New BSD License. You can use emo framework at absolutely free of charge. You don't have to disclose your source code even in the commercial products. And also you don't have to show any logo or something like that of emo framework in your game. (note: redistributions in binary form must reproduce the copyright notice, see the license document for details.)


## Object-Oriented ##

By using emo framework you can write your game logic by Squirrel: object-oriented programming language. You can write your game level as "class" and define the callback event as methods. It goes something like below:

```
local stage   = emo.Stage(); // stage class represents your game stage

/*
 * Level 1 definition
 */
class Level_1 {

    dogSprite  = emo.Sprite("dog.png");

    /*
     * called when level 1 started
     */
    function onLoad() {
        dogSprite.load(); // load dog sprite into the screen
    }

    /*
     * called when level 1 ends.
     */
    function onDispose() {
        dogSprite.remove(); // remove the sprite from the screen
    }

    /*
     * when the screen is touched down, proceed to the next level.
     */
    function onMotionEvent(motionEvent) {
        if (motionEvent.getAction() == MOTION_EVENT_ACTION_DOWN) {
            stage.load(Level_2());
        }
    }
}

/*
 * Level 2 definition
 */
class Level_2 {

    kingSprite = emo.Sprite("king.png");

    /*
     * called when level 2 started
     */
    function onLoad() {
        kingSprite.load(); // load king sprite into the screen
    }

    /*
     * called when level 2 ends.
     */
    function onDispose() {
        kingSprite.remove(); // remove the sprite from the screen
    }
}

/*
 * load Level 1 stage when this script is loaded
 */
function emo::onLoad() {
    stage.load(Level_1());
}
```

## Physics with Box2d ##

emo-framework implements physics engine powered by Box2D so you can easily integrate full-scale physics with your game. If you have already experienced Box2D programming you will soon get used to it in a minute because part of Box2D API is ported to emo as it is.

  * [HelloWorld example by Box2D (C++)](http://code.google.com/p/box2d/source/browse/trunk/Box2D/HelloWorld/HelloWorld.cpp)
  * [HelloWorld example by emo](http://code.google.com/p/emo-framework/source/browse/trunk/iOS-Examples/Resources/box2d_helloworld.nut)

Looks pretty familiar, right?

```
emo.Runtime.import("physics.nut");

// This is a simple example of building and running a simulation
// using Box2D. Here we create a large ground box and a small dynamic
// box.
// There are no graphics for this example. Box2D is meant to be used
// with your rendering engine in your game engine.
function emo::onLoad() {
    local gravity = emo.Vec2(0, -10);
    local world = emo.physics.World(gravity, true);
    
    local groundBodyDef = emo.physics.BodyDef();
    groundBodyDef.position = emo.Vec2(0, -10);
    
    local groundBody = world.createBody(groundBodyDef);
    
    local groundBox = emo.physics.PolygonShape();
    groundBox.setAsBox(50, 10);
    groundBody.createFixture(groundBox, 0);

    local bodyDef = emo.physics.BodyDef();
    bodyDef.type = PHYSICS_BODY_TYPE_DYNAMIC;
    bodyDef.position = emo.Vec2(0, 4);
    local body = world.createBody(bodyDef);
    
    local dynamicBox = emo.physics.PolygonShape();
    dynamicBox.setAsBox(1, 1);
    
    local fixtureDef = emo.physics.FixtureDef();
    fixtureDef.shape = dynamicBox;
    fixtureDef.density  = 1;
    fixtureDef.friction = 0.3;
    body.createFixture(fixtureDef);
    
    local timeStep = 1.0 / 60.0;
    local velocityIterations = 6;
    local positionIterations  = 2;
    
    for (local i = 0; i < 60; ++i) {
        world.step(timeStep, velocityIterations, positionIterations);
        world.clearForces();
        
        local position = body.getPosition();
        local angle    = body.getAngle();
        
        print(format("%4.2f %4.2f %4.2f", position.x, position.y, angle));
    }
}
```
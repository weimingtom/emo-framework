# emo.physics.World #

emo.physics.World represents the world of physics. Basically the World class implements part of the b2World API of Box2D.  The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2World.h

## constructor(gravity, doSleep) ##

Constructs a physics world with given gravity. gravity parameter is the gravity of the world vector. if doSleep equals true it improves performance by not simulating inactive bodies.

## enableContactListener(enable) ##

Enable the contact listener of the world. The onContact event callback is enabled after enabling the contact listener.

## setGravity(gravity) ##

Change the global gravity vector. the first parameter is the emo.Vec2 instance.

## getGravity ##

Gets the global gravity vector.

## setScale(ptm) ##

Sets the pixel-to-meter scale. The default scale is defined by PTM\_RATIO constant that equals 32. (1 meter equals 32 pixel)

## getScale ##

Gets the pixel-to-meter scale of the world.

## addPhysicsObject(physicsInfo) ##

Adds physics object to the world. The first parameter is the emo.PhysicsInfo object that contains information about box2d body and fixture.

## removePhysicsObject(physicsInfo) ##

Remove physics object from the world.

## createBody(bodyDef) ##

Create a rigid body from given definition. See emo.BodyDef for body definition details. Returns emo.Body instance.

## destroyBody(body) ##

Destory a rigid body.

## createJoint ##

Create a joint to constrain bodies together.

## destroyJoint ##

Destroy a joint. This may cause the connected bodies to begin colliding.

## step ##

Take a time step. This performs collision detection, integration, and constraint solution. timeStep is the amount of time to simulate, this should not vary. velocityIterations is for the velocity constraint solver. positionIterations is for the position constraint solver.

## clearForces ##

Manually clear the force buffer on all bodies. By default, forces are cleared automatically after each call to Step. The default behavior is modified by calling setAutoClearForces. The purpose of this function is to support sub-stepping. Sub-stepping is often used to maintain a fixed sized time step under a variable frame-rate. When you perform sub-stepping you will disable auto clearing of forces and instead clearForces after all sub-steps are complete in one pass of your game loop.

## setAutoClearForces ##

Set flag to control automatic clearing of forces after each time step.

## getAutoClearForces ##

Get the flag that controls automatic clearing of forces after each time step.
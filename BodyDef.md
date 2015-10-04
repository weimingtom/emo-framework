# emo.physics.BodyDef #

A body definition holds all the data needed to construct a rigid [Body](Body.md).
This class is used by via emo.physics.[World](World.md)#createBody.

Basically the BodyDef class implements part of the b2BodyDef API of Box2D.  The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2Body.h

## constructor ##

Creates BodyDef instance.

## type ##

The body type: static, kinematic, or dynamic. Note: if a dynamic body would have zero mass, the mass is set to one.

## position ##

The world position of the body. Avoid creating bodies at the origin since this can lead to many overlapping shapes.

## angle ##

The world angle of the body in radians.

## linearVelocity ##

The linear velocity of the body's origin in world co-ordinates.

## angularVelocity ##

The angular velocity of the body.

## linearDamping ##

Linear damping is use to reduce the linear velocity. The damping parameter can be larger than 1.0f but the damping effect becomes sensitive to the time step when the damping parameter is large.

## angularDamping ##

Angular damping is use to reduce the angular velocity. The damping parameter can be larger than 1.0f but the damping effect becomes sensitive to the time step when the damping parameter is large.

## allowSleep ##

Set this flag to false if this body should never fall asleep. Note that this increases CPU usage.

## awake ##

Is this body initially awake or sleeping?

## fixedRotation ##

Should this body be prevented from rotating? Useful for characters.

## bullet ##

Is this a fast moving body that should be prevented from tunneling through other moving bodies? Note that all bodies are prevented from tunneling through kinematic and static bodies. This setting is only considered on dynamic bodies. Note: You should use this flag sparingly since it increases processing time.

## active ##

Does this body start out active?

## inertiaScale ##

Experimental: scales the inertia tensor.
# emo.physics.Body #

Body represents a rigid body. These are created via emo.physics.[World](World.md)#createBody.

Basically the Body class implements part of the b2Body API of Box2D.  The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2Body.h

## constructor ##

There's no constructor for Body. Use emo.physics.World#createBody to create a rigid body.

The functions below are almost all proxy functions of b2Body. Refer to the following link for API details.
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2Body.h

## createFixture(fixtureDef) ##

Creates a fixture and attach it to this body from [FixtureDef](Fixture.md). Use this function if you need to set some fixture parameters, like friction. Otherwise you can create the fixture directly from a shape. If the density is non-zero, this function automatically updates the mass of the body. Contacts are not created until the next time step.

## destroyFixture(fixture) ##

Destroy a fixture. This removes the fixture from the broad-phase and destroys all contacts associated with this fixture. This will automatically adjust the mass of the body if the body is dynamic and the fixture has positive density. All fixtures attached to a body are implicitly destroyed when the body is destroyed.

## setTransform ##

## getPosition ##

## getAngle ##

## getWorldCenter ##

## getLocalCenter ##

## setLinearVelocity(v) ##

## getLinearVelocity ##

## setAngularVelocity(omega) ##

## getAngularVelocity ##

## applyForce(force, point) ##

## applyTorque ##

## applyLinearImpulse ##

## applyAngularImpulse ##

## getMass ##

## getInertia ##

## getWorldPoint(localPoint) ##

## getWorldVector(localVector) ##

## getLocalPoint(worldPoint) ##

## getLocalVector(worldVector) ##

## getLinearVelocityFromWorldPoint ##

## getLinearVelocityFromLocalPoint ##

## getLinearDamping ##

## setLinearDamping(linearDamping) ##

## getAngularDamping ##

## setAngularDamping(angularDamping) ##

## setType(bodyType) ##

## getType ##

## setBullet(flag) ##

## isBullet ##

## setSleepingAllowed(flag) ##

## isSleepingAllowed ##

## setAwake ##

## isAwake ##

## setActive ##

## isActive ##

## setFixedRotation(flag) ##

## isFixedRotation ##
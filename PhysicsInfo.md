# emo.PhysicsInfo #

PhysicsInfo connects the world of emo-framework and Box2d together.

## constructor(world, sprite, fixture, type) ##

The first parameter world is the emo.World instance. The second and third parameter is the emo.Sprite instance and emo.physics.Fixture instance to be connected together. The type parameter is the PHYSICS\_BODY\_TYPE\_STATIC, PHYSICS\_BODY\_TYPE\_KINEMATIC or PHYSICS\_BODY\_TYPE\_DYNAMIC.

The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2Body.h

# emo.SoftPhysicsInfo #

SoftPhysicsInfo is used with LiquidSprite and Box2d.

## constructor(world, sprite, fixture) ##

The first parameter world is the emo.World instance. The second and third parameter is the emo.Sprite instance and emo.physics.Fixture instance to be connected together.
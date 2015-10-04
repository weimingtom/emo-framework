# emo.physics.Fixture #

A fixture is used to attach a shape to a body for collision detection. A fixture inherits its transform from its parent. Fixtures hold additional non-geometric data such as friction, etc.

Basically the Fixture class represents the b2Fixture API of Box2D.  The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Dynamics/b2Fixture.h

## constructor ##

There is no constructor for Fixture. Use [Body](Body.md)#createFixture to create new Fixture instance.

## getBody ##

Returns body proxy instance for this fixture.

# emo.physics.FixtureDef #

A fixture definition is used to create a fixture. This class defines an abstract fixture definition. You can reuse fixture definitions safely.

## constructor ##

The constructor sets the default fixture definition values.

## shape ##

can create the shape on the stack.

## friction ##

The friction coefficient, usually in the range [0,1].

## restitution ##

The restitution (elasticity) usually in the range [0,1].

## density ##

The density, usually in kg/m^2.

## isSensor ##

A sensor shape collects contact information but never generates a collision response.
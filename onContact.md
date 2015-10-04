# onContact #

Contacts are objects created by Box2D to manage collision between fixtures. There are different kinds of contacts, derived from b2Contact, for managing contact between different kinds of fixtures. For example there is a contact class for managing polygon-polygon collision and another contact class for managing circle-circle collision.

See Box2D document for details.
http://www.box2d.org/manual.html#_Toc258082975

emo-framework handles contacts as onContact event.

## onContact(state, fixtureA, fixtureB, position, normal, normalImpulse, tangentImpulse) ##

state is a contact point state as known as PointState.

> state is one of: PHYSICS\_STATE\_NULL, PHYSICS\_STATE\_ADD, PHYSICS\_STATE\_PERSIST or PHYSICS\_STATE\_REMOVE.

See http://programanddesign.com/box2d/b2Collision_8h.html#0a894e3715ce8c61b7958dd6e083663d for details.

fixtureA and fixtureB is the emo.physics.[Fixtrue](Fixtrue.md) instance that collides with. position is the global world position vector (emo.[Vec2](Vec2.md)) instance that represents the position of collision. normalImpulse is the force applied at a contact point to prevent the shapes from penetrating. For convenience, Box2D works with impulses. The normal impulse is just the normal force multiplied by the time step. tangentImpulse is generated at a contact point to simulate friction. For convenience, this is stored as an impulse.
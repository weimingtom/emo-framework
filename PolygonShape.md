# emo.physics.PolygonShape #

Basically the PolygonShape class represents the b2PolygonShape API of Box2D.  The following links may help you to understand the Box2d world.

  * http://www.box2d.org/manual.html
  * http://www.box2d.org/documentation.html
  * http://code.google.com/p/box2d/source/browse/trunk/Box2D/Box2D/Collision/Shapes/b2PolygonShape.h

## constructor ##

Creates PolygonShape instance.

## set(vertices) ##

Copy vertices. vertices is array of emo.Vec2 instance. This assumes the vertices define a convex polygon. It is assumed that the exterior is the the right of each edge.

## setAsBox(hx, hy, center = null, angle = null) ##

Build vertices to represent an axis-aligned box. hx is the half-width. hy is the half-height. center is the center of the box in local coordinates as emo.Vec2. angle is the rotation of the box in local coordinates.

## setAsEdge(v1, v2) ##

Set this as a single edge. v1 and v2 are emo.Vec2 instance.

## getVertex(index) ##

Get a vertex by index. returns emo.Vec2.

## getVertexCount ##

Get the vertex count.

## radius(radius) ##

Set the b2Shape.raduis
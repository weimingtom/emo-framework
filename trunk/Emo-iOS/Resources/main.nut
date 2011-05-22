emo.Runtime.import("physics.nut");

local stage = emo.Stage();
local physics = emo.Physics();
local world = emo.physics.World(emo.Vec2(0, 10), true);

local fps = 60.0;

class Main {
	ground  = emo.Rectangle();
	block   = emo.Rectangle();
	sprite  = emo.Sprite("block.png");
	
	function onLoad() {
		ground.setSize(stage.getWindowWidth(), 20);
		ground.move(0, stage.getWindowHeight() - ground.getHeight());
		
		block.setSize(10, 20);
		block.move(0, stage.getWindowHeight() - ground.getHeight() - block.getHeight());
	
		sprite.move(stage.getWindowWidth() / 2, 0);
		sprite.rotate(30);

		physics.createStaticSprite(world, ground);
		physics.createStaticSprite(world, block);
		physics.createDynamicSprite(world, sprite);
	
		ground.load();
		sprite.load();
		block.load();
	
		// set OnDrawCallback interval (millisecond)
		emo.Event.enableOnDrawCallback(1000.0 / fps);
	}
	
    function onDrawFrame(dt) {
		// world step interval(second)
		world.step(1.0 / fps, 6, 2);
		world.clearForces();
	}
	
	function onDispose() {
		ground.remove();
		sprite.remove();
	}
}
function emo::onLoad() {
    stage.load(Main());
}
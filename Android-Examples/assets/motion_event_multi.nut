local stage = emo.Stage();

/*
 * This example shows draggable sprites that handles multi-touch
 */
class Main {

	rectangles = {};

	/*
	 * Called when this class is loaded
	 */
    function onLoad() {
        print("onLoad"); 
    }

	/*
	 * Called when the app has gained focus
	 */
    function onGainedFocus() {
        print("onGainedFocus");
    }

	/*
	 * Called when the app has lost focus
	 */
    function onLostFocus() {
        print("onLostFocus"); 
    }

	/*
	 * Called when the class ends
	 */
    function onDispose() {
        print("onDispose");
    }

	/*
	 * touch event
	 */
	function onMotionEvent(mevent) {
		// pointer id is a unique id of the pointer.
		local id = mevent.getPointerId();
		local action = mevent.getAction();

		if (!rectangles.rawin(id)) {
			// if new pointer comes in, create new rectangle
			local rectangle = emo.Rectangle();
			rectangle.setSize(100, 100);
			rectangle.color(1, 0, 0);
			rectangle.moveCenter(mevent.getX(), mevent.getY());
			rectangle.load();
			
			// add rectangle to the hash table.
			rectangles[id] <- rectangle;
		}
		if (action == MOTION_EVENT_ACTION_UP || action == MOTION_EVENT_ACTION_POINTER_UP) {
			print("UP: " + id);
		} else if (action == MOTION_EVENT_ACTION_DOWN || action == MOTION_EVENT_ACTION_POINTER_DOWN) { 
			print("DOWN: " + id);
		}
		handleTouch(rectangles[id], mevent);
	}
	
	/*
	 * move and remove the rectangle
	 */
	function handleTouch(rectangle, mevent) {
		local action = mevent.getAction();
		if (action == MOTION_EVENT_ACTION_DOWN || action == MOTION_EVENT_ACTION_POINTER_DOWN) {
			rectangle.moveCenter(mevent.getX(), mevent.getY());
		} else if (action == MOTION_EVENT_ACTION_MOVE) {
			rectangle.moveCenter(mevent.getX(), mevent.getY());
		} else if (action == MOTION_EVENT_ACTION_UP ||
				   action == MOTION_EVENT_ACTION_CANCEL ||
				   action == MOTION_EVENT_ACTION_OUTSIDE ||
				   action == MOTION_EVENT_ACTION_POINTER_UP) {
			delete rectangles[mevent.getPointerId()];
			rectangle.remove();
		}
	}
}

function emo::onLoad() {
    stage.load(Main());
}
module dsfml.window.event;

import dsfml.window.joystick;
import dsfml.window.keyboard;
import dsfml.window.mouse;

struct SizeEvent {
	uint width;
	uint height;
}

struct KeyEvent {
	Key code;
	bool alt;
	bool control;
	bool shift;
	bool system;
}

struct TextEvent {
	uint unicode;
}

struct MouseMoveEvent {
	int x;
	int y;
}

struct MouseButtonEvent {
	Button button;
	int x;
	int y;
}

struct MouseWheelEvent {
	int delta;
	int x;
	int y;
}

struct JoystickConnectEvent {
	uint joystickId;
}

struct JoystickMoveEvent {
	uint joystickId;
	Axis axis;
	float position;
}

struct JoystickButtonEvent {
	uint joystickId;
	uint button;
}

enum EventType {
	Closed,
	Resized,
	LostFocus,
	GainedFocus,
	TextEntered,
	KeyPressed,
	KeyReleased,
	MouseWheelMoved,
	MouseButtonPressed,
	MouseButtonReleased,
	MouseMoved,
	MouseEntered,
	MouseLeft,
	JoystickButtonPressed,
	JoystickButtonReleased,
	JoystickMoved,
	JoystickConnected,
	JoystickDisconnected,
}

struct Event {
	EventType type;
	
	union {
		SizeEvent				size;
		KeyEvent				key;
		TextEvent				text;
		MouseMoveEvent			mouseMove;
		MouseButtonEvent		mouseButton;
		MouseWheelEvent			mouseWheel;
		JoystickMoveEvent		joystickMove;
		JoystickButtonEvent		joystickButton;
		JoystickConnectEvent	joystickConnect;
	}
	
	// TODO: Go inout for D2.056
	@property
	package final ref sfEvent event() {
		return *(cast(sfEvent*) &this);
	}
	
	@property
	package final ref const(sfEvent) event() const {
		return *(cast(const(sfEvent)*) &this);
	}
}

package extern(C++) {
	struct sfEvent {
		void[Event.sizeof] data = void;
		
		@property
		package final ref const(Event) event() const {
			return *(cast(Event*) &this);
		}
	}
}


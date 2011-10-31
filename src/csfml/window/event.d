module csfml.window.event;

import csfml.window.joystick;
import csfml.window.keyboard;
import csfml.window.mouse;

enum sfEventType {
	sfEvtClosed,
	sfEvtResized,
	sfEvtLostFocus,
	sfEvtGainedFocus,
	sfEvtTextEntered,
	sfEvtKeyPressed,
	sfEvtKeyReleased,
	sfEvtMouseWheelMoved,
	sfEvtMouseButtonPressed,
	sfEvtMouseButtonReleased,
	sfEvtMouseMoved,
	sfEvtMouseEntered,
	sfEvtMouseLeft,
	sfEvtJoystickButtonPressed,
	sfEvtJoystickButtonReleased,
	sfEvtJoystickMoved,
	sfEvtJoystickConnected,
	sfEvtJoystickDisconnected,
}

struct sfKeyEvent {
	sfEventType type;
	sfKeyCode code;
	bool alt;
	bool control;
	bool shift;
	bool system;
}

struct sfTextEvent {
	sfEventType type;
	uint unicode;
}

struct sfMouseMoveEvent {
	sfEventType type;
	int x;
	int y;
}

struct sfMouseButtonEvent {
	sfEventType type;
	sfMouseButton button;
	int x;
	int y;
}

struct sfMouseWheelEvent {
	sfEventType Type;
	int delta;
	int x;
	int y;
}

struct sfJoystickMoveEvent {
	sfEventType type;
	uint joystickId;
	sfJoystickAxis axis;
	float position;
}

struct sfJoystickButtonEvent {
	sfEventType type;
	uint joystickId;
	uint button;
}

struct sfJoystickConnectEvent {
	sfEventType type;
	uint joystickId;
}

struct sfSizeEvent {
	sfEventType type;
	uint width;
	uint height;
}

union sfEvent {
	sfEventType type;
	sfSizeEvent size;
	sfKeyEvent key;
	sfTextEvent text;
	sfMouseMoveEvent mouseMove;
	sfMouseButtonEvent mouseButton;
	sfMouseWheelEvent mouseWheel;
	sfJoystickMoveEvent joystickMove;
	sfJoystickButtonEvent joystickButton;
	sfJoystickConnectEvent joystickConnect;
}


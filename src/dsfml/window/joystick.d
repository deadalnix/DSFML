module dsfml.window.joystick;

enum Axis {
	X,
	Y,
	Z,
	R,
	U,
	V,
	PovX,
	PovY,
}

bool isConnected(uint joystick) {
	return sfJoystick_IsConnected(joystick);
}

uint getButtonCount(uint joystick) {
	return sfJoystick_GetButtonCount(joystick);
}

bool hasAxis(uint joystick, Axis axis) {
	return sfJoystick_HasAxis(joystick, axis);
}

bool isButtonPressed(uint joystick, uint button) {
	return sfJoystick_IsButtonPressed(joystick, button);
}

float getAxisPosition(uint joystick, Axis axis) {
	return sfJoystick_GetAxisPosition(joystick, axis);
}

void update() {
	sfJoystick_Update();
}

package extern(C++) {
	bool sfJoystick_IsConnected(uint joystick);
	uint sfJoystick_GetButtonCount(uint joystick);
	bool sfJoystick_HasAxis(uint joystick, uint axis);
	bool sfJoystick_IsButtonPressed(uint joystick, uint button);
	float sfJoystick_GetAxisPosition(uint joystick, uint axis);
	void sfJoystick_Update();
}


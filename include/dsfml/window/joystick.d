module dsfml.window.joystick;

import csfml.window.joystick;

bool isConnected(uint joystick) {
	return sfJoystick_IsConnected(joystick);
}

uint getButtonCount(uint joystick) {
	return sfJoystick_GetButtonCount(joystick);
}

bool hasAxis(uint joystick, sfJoystickAxis axis) {
	return sfJoystick_HasAxis(joystick, axis);
}

bool isButtonPressed(uint joystick, uint button) {
	return sfJoystick_IsButtonPressed(joystick, button);
}

float getAxisPosition(uint joystick, sfJoystickAxis axis) {
	return sfJoystick_GetAxisPosition(joystick, axis);
}

void update() {
	sfJoystick_Update();
}


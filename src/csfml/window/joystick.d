module csfml.window.joystick;

immutable uint sfJoystickCount = 8;
immutable uint sfJoystickButtonCount = 32;
immutable uint sfJoystickAxisCount = 8;

enum sfJoystickAxis {
	sfJoystickX,
	sfJoystickY,
	sfJoystickZ,
	sfJoystickR,
	sfJoystickU,
	sfJoystickV,
	sfJoystickPovX,
	sfJoystickPovY,
}

extern(C) {
	bool sfJoystick_IsConnected(uint joystick);
	uint sfJoystick_GetButtonCount(uint joystick);
	bool sfJoystick_HasAxis(uint joystick, sfJoystickAxis axis);
	bool sfJoystick_IsButtonPressed(uint joystick, uint button);
	float sfJoystick_GetAxisPosition(uint joystick, sfJoystickAxis axis);
	void sfJoystick_Update();
}


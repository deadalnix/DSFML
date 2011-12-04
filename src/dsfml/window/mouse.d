module dsfml.window.mouse;

import dsfml.window.window;

import std.conv;

enum Button {
	Left,
	Right,
	Middle,
	XButton1,
	XButton2,
	ButtonCount,
}

bool isButtonPressed(Button button) {
	return sfMouse_IsButtonPressed(button);
}

int[2] getPosition() {
	return sfMouse_GetPosition();
}

int[2] getPosition(const Window relativeTo) in {
	assert(relativeTo, "Window " /* ~ to!string(relativeTo) */ ~ " is not usable.");
} body {
	return sfMouse_GetPosition(*relativeTo.window);
}

void setPosition(const int[2] position) {
	sfMouse_SetPosition(position.ptr);
}

void setPosition(const int[2] position, const Window relativeTo) in {
	assert(relativeTo, "Window " ~ /* to!string(relativeTo) ~ */ " is not usable.");
} body {
	sfMouse_SetPosition(position.ptr, *relativeTo.window);
}

package extern(C++) {
	bool sfMouse_IsButtonPressed(uint button);
	int[2] sfMouse_GetPosition();
	int[2] sfMouse_GetPosition(ref const sfWindow relativeTo);
	void sfMouse_SetPosition(const int* position);
	void sfMouse_SetPosition(const int* position, ref const sfWindow relativeTo);
}


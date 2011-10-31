module dsfml.window.mouse;

import csfml.window.mouse;

import dsfml.window.window;

bool isButtonPressed(sfMouseButton button) {
	return sfMouse_IsButtonPressed(button);
}

int[2] getPosition(const Window relativeTo) {
	int[2] position;
	sfMouse_GetPosition(position.ptr, position.ptr + 1, relativeTo.getCWindow());
	return position;
}

void setPosition(const int[2] position, const Window relativeTo = null) {
	sfMouse_SetPosition(position[0], position[1], relativeTo.getCWindow());
}

void setPosition(int x, int y, const Window relativeTo = null) {
	sfMouse_SetPosition(x, y, relativeTo.getCWindow());
}


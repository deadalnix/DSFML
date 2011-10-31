module csfml.window.mouse;

public import csfml.window.types;

enum sfMouseButton {
	sfMouseLeft,
	sfMouseRight,
	sfMouseMiddle,
	sfMouseXButton1,
	sfMouseXButton2,
	sfMouseButtonCount,
}

extern(C) {
	bool sfMouse_IsButtonPressed(sfMouseButton button);
	void sfMouse_GetPosition(int* x, int* y, const sfWindow* relativeTo);
	void sfMouse_SetPosition(int x, int y, const sfWindow* relativeTo);
}


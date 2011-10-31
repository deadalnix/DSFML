module dsfml.window.keyboard;

import csfml.window.keyboard;

bool isKeyPressed(sfKeyCode key) {
	return sfKeyboard_IsKeyPressed(key);
}


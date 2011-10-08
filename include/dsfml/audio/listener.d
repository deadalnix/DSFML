module dsfml.audio.listener;

import csfml.audio.listener;

void setGlobalVolume(float volume) in {
	assert(volume >= 0.f && volume <= 100.f);
} body {
	sfListener_SetGlobalVolume(volume);
}

float getGlobalVolume() {
	return sfListener_GetGlobalVolume();
}

void setPosition(float[3] position) {
	sfListener_SetPosition(position[0], position[1], position[2]);
}

void setPosition(float x, float y, float z) {
	sfListener_SetPosition(x, y, z);
}

float[3] getPosition() {
	float[3] position;
	sfListener_GetPosition(position.ptr, position.ptr + 1, position.ptr + 2);
	return position;
}

void setDirection(float[3] direction) {
	sfListener_SetDirection(direction[0], direction[1], direction[2]);
}

void setDirection(float x, float y, float z) {
	sfListener_SetDirection(x, y, z);
}

float[3] getDirection() {
	float[3] direction;
	sfListener_GetDirection(direction.ptr, direction.ptr + 1, direction.ptr + 2);
	return direction;
}


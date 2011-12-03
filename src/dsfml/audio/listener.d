module dsfml.audio.listener;

import std.conv;

@property
void globalVolume(float volume) in {
	assert(volume >= 0.f && volume <= 100.f, "Volume value(" ~ to!string(volume) ~ ") is incorrect.");
} body {
	sfListener_SetGlobalVolume(volume);
}

@property
float globalVolume() {
	return sfListener_GetGlobalVolume();
}

@property
void position(ref const float[3] position) {
	sfListener_SetPosition(position.ptr);
}

@property
float[3] position() {
	return sfListener_GetPosition();
}

@property
void direction(float[3] direction) {
	sfListener_SetDirection(direction.ptr);
}

@property
float[3] direction() {
	return sfListener_GetDirection();
}

package extern(C++) {
	void sfListener_SetGlobalVolume(float volume);
	float sfListener_GetGlobalVolume();
	
	void sfListener_SetPosition(const float* position);
	float[3] sfListener_GetPosition();
	
	void sfListener_SetDirection(const float* direction);
	float[3] sfListener_GetDirection();
}


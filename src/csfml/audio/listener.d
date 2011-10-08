module csfml.audio.listener;

extern(C) {
	void sfListener_SetGlobalVolume(float volume);
	float sfListener_GetGlobalVolume();
	void sfListener_SetPosition(float x, float y, float z);
	void sfListener_GetPosition(float* x, float* y, float* z);
	void sfListener_SetDirection(float x, float y, float z);
	void sfListener_GetDirection(float* x, float* y, float* z);
}


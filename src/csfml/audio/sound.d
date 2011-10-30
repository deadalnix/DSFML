module csfml.audio.sound;

public import csfml.audio.types;
public import csfml.audio.soundstatus;

extern(C) {
	sfSound* sfSound_Create();
	sfSound* sfSound_Copy(sfSound* sound);
	void sfSound_Destroy(sfSound* sound);
	void sfSound_Play(sfSound* sound);
	void sfSound_Pause(sfSound* sound);
	void sfSound_Stop(sfSound* sound);
	void sfSound_SetBuffer(sfSound* sound, const sfSoundBuffer* buffer);
	const(sfSoundBuffer*) sfSound_GetBuffer(const sfSound* sound);
	void sfSound_SetLoop(sfSound* sound, bool loop);
	bool sfSound_GetLoop(const sfSound* sound);
	sfSoundStatus sfSound_GetStatus(const sfSound* sound);
	void sfSound_SetPitch(sfSound* sound, float pitch);
	void sfSound_SetVolume(sfSound* sound, float volume);
	void sfSound_SetPosition(sfSound* sound, float x, float y, float z);
	void sfSound_SetRelativeToListener(sfSound* sound, bool relative);
	void sfSound_SetMinDistance(sfSound* sound, float distance);
	void sfSound_SetAttenuation(sfSound* sound, float attenuation);
	void sfSound_SetPlayingOffset(sfSound* sound, uint timeOffset);
	float sfSound_GetPitch(const sfSound* sound);
	float sfSound_GetVolume(const sfSound* sound);
	void sfSound_GetPosition(const sfSound* sound, float* x, float* y, float* z);
	bool sfSound_IsRelativeToListener(const sfSound* sound);
	float sfSound_GetMinDistance(const sfSound* sound);
	float sfSound_GetAttenuation(const sfSound* sound);
	uint sfSound_GetPlayingOffset(const sfSound* sound);
}


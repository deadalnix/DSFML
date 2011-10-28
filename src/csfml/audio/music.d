module csfml.audio.music;

public import csfml.audio.types;
public import csfml.audio.soundstatus;

import csfml.system.inputstream;

extern(C) {
	sfMusic* sfMusic_CreateFromFile(const char* filename);
	sfMusic* sfMusic_CreateFromMemory(const void* data, size_t sizeInBytes);
	sfMusic* sfMusic_CreateFromStream(sfInputStream* stream);
	void sfMusic_Destroy(sfMusic* soundStream);
	void sfMusic_Play(sfMusic* soundStream);
	void sfMusic_Pause(sfMusic* soundStream);
	void sfMusic_Stop(sfMusic* soundStream);
	sfSoundStatus sfMusic_GetStatus(const sfMusic* soundStream);
	uint sfMusic_GetChannelsCount(const sfMusic* soundStream);
	uint sfMusic_GetSampleRate(const sfMusic* soundStream);
	void sfMusic_SetPitch(sfMusic* soundStream, float pitch);
	void sfMusic_SetVolume(sfMusic* soundStream, float volume);
	void sfMusic_SetPosition(sfMusic* soundStream, float x, float y, float z);
	void sfMusic_SetRelativeToListener(sfMusic* soundStream, bool relative);
	void sfMusic_SetMinDistance(sfMusic* soundStream, float distance);
	void sfMusic_SetAttenuation(sfMusic* soundStream, float attenuation);
	void sfMusic_SetPlayingOffset(sfMusic* soundStream, uint timeOffset);
	void sfMusic_SetLoop(sfMusic* soundStream, bool loop);
	float sfMusic_GetPitch(const sfMusic* soundStream);
	float sfMusic_GetVolume(const sfMusic* soundStream);
	void sfMusic_GetPosition(const sfMusic* soundStream, float* x, float* y, float* z);
	bool sfMusic_IsRelativeToListener(const sfMusic* soundStream);
	float sfMusic_GetMinDistance(const sfMusic* soundStream);
	float sfMusic_GetAttenuation(const sfMusic* soundStream);
	bool sfMusic_GetLoop(const sfMusic* soundStream);
	uint sfMusic_GetPlayingOffset(const sfMusic* soundStream);
}


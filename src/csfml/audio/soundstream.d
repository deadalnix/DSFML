module csfml.audio.soundstream;

public import csfml.audio.types;
public import csfml.audio.soundstatus;

struct sfSoundStreamChunk {
    short * samples;
    uint nbSamples;
};

extern(C) {
	alias bool function(sfSoundStreamChunk* chunk, void* userData) sfSoundStreamGetDataCallback;
	alias void function(uint position, void* userData) sfSoundStreamSeekCallback;

	sfSoundStream* sfSoundStream_Create(sfSoundStreamGetDataCallback onGetData, sfSoundStreamSeekCallback onSeek, uint channelsCount, uint sampleRate, void* userData);
	void sfSoundStream_Destroy(sfSoundStream* soundStream);
	void sfSoundStream_Play(sfSoundStream* soundStream);
	void sfSoundStream_Pause(sfSoundStream* soundStream);
	void sfSoundStream_Stop(sfSoundStream* soundStream);
	sfSoundStatus sfSoundStream_GetStatus(const sfSoundStream* soundStream);
	uint sfSoundStream_GetChannelsCount(const sfSoundStream* soundStream);
	uint sfSoundStream_GetSampleRate(const sfSoundStream* soundStream);
	void sfSoundStream_SetPitch(sfSoundStream* soundStream, float pitch);
	void sfSoundStream_SetVolume(sfSoundStream* soundStream, float volume);
	void sfSoundStream_SetPosition(sfSoundStream* soundStream, float x, float y, float z);
	void sfSoundStream_SetRelativeToListener(sfSoundStream* soundStream, bool relative);
	void sfSoundStream_SetMinDistance(sfSoundStream* soundStream, float distance);
	void sfSoundStream_SetAttenuation(sfSoundStream* soundStream, float attenuation);
	void sfSoundStream_SetPlayingOffset(sfSoundStream* soundStream, uint timeOffset);
	void sfSoundStream_SetLoop(sfSoundStream* soundStream, bool loop);
	float sfSoundStream_GetPitch(const sfSoundStream* soundStream);
	float sfSoundStream_GetVolume(const sfSoundStream* soundStream);
	void sfSoundStream_GetPosition(const sfSoundStream* soundStream, float* x, float* y, float* z);
	bool sfSoundStream_IsRelativeToListener(const sfSoundStream* soundStream);
	float sfSoundStream_GetMinDistance(const sfSoundStream* soundStream);
	float sfSoundStream_GetAttenuation(const sfSoundStream* soundStream);
	bool sfSoundStream_GetLoop(const sfSoundStream* soundStream);
	uint sfSoundStream_GetPlayingOffset(const sfSoundStream* soundStream);
}


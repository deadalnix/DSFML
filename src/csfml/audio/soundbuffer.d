module csfml.audio.soundbuffer;

public import csfml.audio.types;

import csfml.system.inputstream;

extern(C) {
	sfSoundBuffer* sfSoundBuffer_CreateFromFile(const char* filename);
	sfSoundBuffer* sfSoundBuffer_CreateFromMemory(const void* data, size_t sizeInBytes);
	sfSoundBuffer* sfSoundBuffer_CreateFromStream(sfInputStream* stream);
	sfSoundBuffer* sfSoundBuffer_CreateFromSamples(const short* samples, size_t samplesCount, uint channelsCount, uint sampleRate);
	sfSoundBuffer* sfSoundBuffer_Copy(sfSoundBuffer* soundBuffer);
	void sfSoundBuffer_Destroy(sfSoundBuffer* soundBuffer);
	bool sfSoundBuffer_SaveToFile(const sfSoundBuffer* soundBuffer, const char* filename);
	short* sfSoundBuffer_GetSamples(const sfSoundBuffer* soundBuffer);
	size_t sfSoundBuffer_GetSamplesCount(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetSampleRate(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetChannelsCount(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetDuration(const sfSoundBuffer* soundBuffer);
}


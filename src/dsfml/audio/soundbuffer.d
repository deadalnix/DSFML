module dsfml.audio.soundbuffer;

import dsfml.system.inputstream;
import dsfml.sizes;

import std.string;

struct SoundBuffer {
	private void[soundBufferSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfSoundBuffer* soundBuffer() {
		return cast(sfSoundBuffer*) data.ptr;
	}
	
	@property
	package final const(sfSoundBuffer)* soundBuffer() const {
		return cast(const(sfSoundBuffer)*) data.ptr;
	}
	
	// Wonderfull !
	@disable this();
	
	// Default constructor workaround.
	this(int dummy = 0) {
		sfSoundBuffer_Create(soundBuffer);
	}
	
	~this() {
		sfSoundBuffer_Destroy(soundBuffer);
	}
	
	bool loadFromFile(string filename) {
		return sfSoundBuffer_LoadFromFile(soundBuffer, toStringz(filename));
	}
	
	bool loadFromMemory(const void[] data) {
		assert(data.length > 0);
		
		return sfSoundBuffer_LoadFromMemory(soundBuffer, data.ptr, data.length);
	}
	
	bool loadFromStream(InputStream stream) {
		assert(stream);
		
		return sfSoundBuffer_LoadFromStream(soundBuffer, stream);
	}
	
	bool LoadFromSamples(const short[] samples, uint channelsCount, uint sampleRate) {
		assert(samples.length > 0);
		
		return sfSoundBuffer_LoadFromSamples(soundBuffer, samples.ptr, samples.length, channelsCount, sampleRate);
	}
	
	bool saveToFile(string filename) const {
		return sfSoundBuffer_SaveToFile(soundBuffer, toStringz(filename));
	}
	
	@property
	const(short)[] samples() const {
		return sfSoundBuffer_GetSamples(soundBuffer)[0 .. sfSoundBuffer_GetSamplesCount(soundBuffer)];
	}
	
	@property
	uint sampleRate() const {
		return sfSoundBuffer_GetSampleRate(soundBuffer);
	}
	
	@property
	uint channelsCount() const {
		return sfSoundBuffer_GetChannelsCount(soundBuffer);
	}
	
	@property
	uint duration() const {
		return sfSoundBuffer_GetDuration(soundBuffer);
	}
}

extern(C++) {
	struct sfSoundBuffer {}
	
	void sfSoundBuffer_Create(sfSoundBuffer* soundBuffer);
	// Don't know how to call that in D :'(
	void sfSoundBuffer_Copy(const sfSoundBuffer* soundBuffer, sfSoundBuffer* destination);
	void sfSoundBuffer_Destroy(sfSoundBuffer* soundBuffer);
	
	bool sfSoundBuffer_LoadFromFile(sfSoundBuffer* soundBuffer, const char* filename);
	bool sfSoundBuffer_LoadFromMemory(sfSoundBuffer* soundBuffer, const void* data, size_t sizeInBytes);
	bool sfSoundBuffer_LoadFromStream(sfSoundBuffer* soundBuffer, InputStream stream);
	bool sfSoundBuffer_LoadFromSamples(sfSoundBuffer* soundBuffer, const short* samples, size_t samplesCount, uint channelsCount, uint sampleRate);
	
	bool sfSoundBuffer_SaveToFile(const sfSoundBuffer* soundBuffer, const char* filename);
	
	const(short)* sfSoundBuffer_GetSamples(const sfSoundBuffer* soundBuffer);
	size_t sfSoundBuffer_GetSamplesCount(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetSampleRate(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetChannelsCount(const sfSoundBuffer* soundBuffer);
	uint sfSoundBuffer_GetDuration(const sfSoundBuffer* soundBuffer);
}


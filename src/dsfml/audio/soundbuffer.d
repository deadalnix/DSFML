module dsfml.audio.soundbuffer;

import dsfml.system.inputstream;
import dsfml.sizes;

import std.string;

// Go struct as soon as default onstructor is available ?
final class SoundBuffer {
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
	
	this() {
		sfSoundBuffer_Create(soundBuffer);
	}
	
	this(const SoundBuffer sb) {
		sfSoundBuffer_Copy(sb.soundBuffer, soundBuffer);
	}
	
	~this() {
		sfSoundBuffer_Destroy(soundBuffer);
	}
	
	final bool loadFromFile(string filename) {
		return sfSoundBuffer_LoadFromFile(soundBuffer, toStringz(filename));
	}
	
	final bool loadFromMemory(const void[] data) {
		return sfSoundBuffer_LoadFromMemory(soundBuffer, data.ptr, data.length);
	}
	
	final bool loadFromStream(InputStream stream) {
		assert(stream);
		
		return sfSoundBuffer_LoadFromStream(soundBuffer, stream);
	}
	
	final bool LoadFromSamples(const short[] samples, uint channelsCount, uint sampleRate) {
		return sfSoundBuffer_LoadFromSamples(soundBuffer, samples.ptr, samples.length, channelsCount, sampleRate);
	}
	
	final bool saveToFile(string filename) const {
		return sfSoundBuffer_SaveToFile(soundBuffer, toStringz(filename));
	}
	
	@property
	final const(short)[] samples() const {
		return sfSoundBuffer_GetSamples(soundBuffer)[0 .. sfSoundBuffer_GetSamplesCount(soundBuffer)];
	}
	
	@property
	final uint sampleRate() const {
		return sfSoundBuffer_GetSampleRate(soundBuffer);
	}
	
	@property
	final uint channelsCount() const {
		return sfSoundBuffer_GetChannelsCount(soundBuffer);
	}
	
	@property
	final uint duration() const {
		return sfSoundBuffer_GetDuration(soundBuffer);
	}
}

private extern(C++) {
	// TODO: Opaque struct
	struct sfSoundBuffer {
		void[soundBufferSize] data = void;
	}
	
	void sfSoundBuffer_Create(sfSoundBuffer* soundBuffer);
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


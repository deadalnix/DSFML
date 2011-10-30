module dsfml.audio.soundbuffer;

import csfml.audio.soundbuffer;

import dsfml.system.inputstream;

import std.string;

class SoundBuffer {
	private sfSoundBuffer* soundBuffer;
	
	public this(string filename) {
		if(filename is null || filename.length == 0) throw new Exception("LoadingException : Filename is invalid.");
		
		soundBuffer = sfSoundBuffer_CreateFromFile(toStringz(filename));
	}
	
	public this(const(byte)[] data) {
		if(data is null || data.length == 0) throw new Exception("LoadingException : Memory stream is invalid.");
		
		soundBuffer = sfSoundBuffer_CreateFromMemory(data.ptr, data.length);
	}
	
	
	public this(InputStream inputStream) {
		if(inputStream is null) throw new Exception("LoadingException : InputStream is invalid.");
		
		soundBuffer = sfSoundBuffer_CreateFromStream(inputStream.getCInputStream());
	}
	
	public this(const(short)[] samples, uint channelsCount, uint sampleRate) {
		if (samples is null || samples.length == 0) throw new Exception("LoadingException : Samples array is invalid.");
		
		soundBuffer = sfSoundBuffer_CreateFromSamples(samples.ptr, samples.length, channelsCount, sampleRate);
	}
	
	public this(const(sfSoundBuffer*) soundBuffer) const {
		this.soundBuffer = soundBuffer;
	}
	
	public SoundBuffer clone() {
		return new SoundBuffer(this);
	}
	
	private this(SoundBuffer sb) {
		soundBuffer = sfSoundBuffer_Copy(sb.soundBuffer);
	}
	
	public bool opEqual(const SoundBuffer other) const {
		return other.soundBuffer == soundBuffer;
	}
	
	public sfSoundBuffer* getCSoundBuffer() {
		return soundBuffer;
	}
	
	public ~this() {
		sfSoundBuffer_Destroy(soundBuffer);
	}
	
	public bool saveToFile(string filename) const {
		if(filename is null || filename.length == 0) throw new Exception("LoadingException : Filename is invalid.");
		
		return sfSoundBuffer_SaveToFile(soundBuffer, toStringz(filename));
	}
	
	public const(short)[] getSamples() const {
		const(short)* samples = sfSoundBuffer_GetSamples(soundBuffer);
		
		return samples[0 .. sfSoundBuffer_GetSamplesCount(soundBuffer)];
	}
	
	public uint getSampleRate() const {
		return sfSoundBuffer_GetSampleRate(soundBuffer);
	}
	
	public uint getChannelsCount() const {
		return sfSoundBuffer_GetChannelsCount(soundBuffer);
	}
	
	public uint getDuration() const {
		return sfSoundBuffer_GetDuration(soundBuffer);
	}
}


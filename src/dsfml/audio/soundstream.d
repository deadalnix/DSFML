module dsfml.audio.soundstream;

import dsfml.audio.soundsource;
import dsfml.sizes;

import std.conv;

abstract class SoundStream : SoundSource {
	private void[soundStreamSize - soundSourceSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfSoundStream* soundStream() {
		return cast(sfSoundStream*) soundSource;
	}
	
	@property
	package final const(sfSoundStream)* soundStream() const {
		return cast(const(sfSoundStream)*) soundSource;
	}
	
	protected this() {
		sfSoundStream_Create(soundStream);
	}
	
	protected void initialize(uint channelsCount, uint sampleRate) {
		sfSoundStream_Initialize(soundStream, channelsCount, sampleRate);
	}
	
	final void play() {
		sfSoundStream_Play(soundStream);
	}
	
	final void pause() {
		sfSoundStream_Pause(soundStream);
	}
	
	final void stop() {
		sfSoundStream_Stop(soundStream);
	}
	
	@property
	final uint channelsCount() const {
		return sfSoundStream_GetChannelsCount(soundStream);
	}
	
	@property
	final uint sampleRate() const {
		return sfSoundStream_GetSampleRate(soundStream);
	}
	
	@property
	final Status status() const {
		return sfSoundStream_GetStatus(soundStream);
	}
	
	@property
	final void playingOffset(uint timeOffset) {
		sfSoundStream_SetPlayingOffset(soundStream, timeOffset);
	}
	
	@property
	final uint playingOffset() const {
		return sfSoundStream_GetPlayingOffset(soundStream);
	}
	
	@property
	final void loop(bool loop) {
		sfSoundStream_SetLoop(soundStream, loop);
	}
	
	@property
	final void loop() const {
		return sfSoundStream_GetLoop(soundStream);
	}
	
	protected abstract bool onGetData(ref short[] data);
	protected abstract void onSeek(uint timeOffset);
}

private extern(C++) {
	// Opaque struct ?
	struct sfSoundStream {}
	
	struct sfSoundStreamChunk {
		short* samples;
		uint nbSamples;
	};
	
	bool __dsfml_sfSoundStream_getDataCallback(sfSoundStreamChunk* data, sfSoundStream* soundStream) {
		short[] samples;
		bool ret = getSoundSource!(SoundStream)(soundStream).onGetData(samples);
		data.samples	= samples.ptr;
		
		assert(samples.length < uint.max, "Cannot read more than " ~ to!string(uint.max) ~ " bytes in once.");
		data.nbSamples	= cast(uint) samples.length;
		
		return ret;
	}
	
	void __dsfml_sfSoundStream_seekCallback(uint timeOffset, sfSoundStream* soundStream) {
		getSoundSource!(SoundStream)(soundStream).onSeek(timeOffset);
	}
	
	void sfSoundStream_Create(sfSoundStream* soundStream);
	void sfSoundStream_Initialize(sfSoundStream* soundStream, uint channelsCount, uint sampleRate);
	
	void sfSoundStream_Play(sfSoundStream* soundStream);
	void sfSoundStream_Pause(sfSoundStream* soundStream);
	void sfSoundStream_Stop(sfSoundStream* soundStream);
	
	uint sfSoundStream_GetChannelsCount(const sfSoundStream* soundStream);
	uint sfSoundStream_GetSampleRate(const sfSoundStream* soundStream);
	Status sfSoundStream_GetStatus(const sfSoundStream* soundStream);
	
	void sfSoundStream_SetPlayingOffset(sfSoundStream* soundStream, uint timeOffset);
	uint sfSoundStream_GetPlayingOffset(const sfSoundStream* soundStream);
	
	void sfSoundStream_SetLoop(sfSoundStream* soundStream, bool loop);
	bool sfSoundStream_GetLoop(const sfSoundStream* soundStream,);
}


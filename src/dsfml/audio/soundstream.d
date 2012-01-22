module dsfml.audio.soundstream;

import dsfml.audio.soundsource;
import dsfml.system.time;
import dsfml.sizes;

import std.conv;

abstract class SoundStream : SoundSource {
	private void[soundStreamSize - soundSourceSize] data = void;
	
	@property
	package final inout(sfSoundStream)* soundStream() inout {
		return cast(inout(sfSoundStream)*) soundSource;
	}
	
	protected this() {
		sfSoundStream_Create(soundStream);
	}
	
	~this() {
		sfSoundStream_Destroy(soundStream);
	}
	
	protected final void initialize(uint channelsCount, uint sampleRate) {
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
	override final Status status() const {
		return sfSoundStream_GetStatus(soundStream);
	}
	
	@property
	final void playingOffset(sfTime timeOffset) {
		sfSoundStream_SetPlayingOffset(soundStream, *(cast(sfTime*) &timeOffset));
	}
	
	@property
	final Time playingOffset() const {
		sfTime tmp = sfSoundStream_GetPlayingOffset(soundStream);
		return *(cast(Time*) &tmp);
	}
	
	@property
	final void loop(bool loop) {
		sfSoundStream_SetLoop(soundStream, loop);
	}
	
	@property
	final bool loop() const {
		return sfSoundStream_GetLoop(soundStream);
	}
	
	protected abstract bool onGetData(ref short[] data);
	protected abstract void onSeek(Time timeOffset);
}

private extern(C++) {
	// Opaque struct ?
	struct sfSoundStream {
		void[soundStreamSize] data = void;
	}
	
	struct sfSoundStreamChunk {
		short* samples;
		uint nbSamples;
	};
	
	bool __dsfml_sfSoundStream_getDataCallback(sfSoundStreamChunk* data, sfSoundStream* soundStream) {
		short[] samples;
		
		scope(exit) {
			assert(samples.length < uint.max, "Cannot read more than " ~ to!string(uint.max) ~ " bytes in once.");
			
			data.samples	= samples.ptr;
			data.nbSamples	= cast(uint) samples.length;
		}
		
		return getSoundSource!(SoundStream)(soundStream).onGetData(samples);
	}
	
	void __dsfml_sfSoundStream_seekCallback(sfTime timeOffset, sfSoundStream* soundStream) {
		getSoundSource!(SoundStream)(soundStream).onSeek(*(cast(Time*) &timeOffset));
	}
	
	void sfSoundStream_Create(sfSoundStream* soundStream);
	void sfSoundStream_Destroy(sfSoundStream* soundStream);
	
	void sfSoundStream_Initialize(sfSoundStream* soundStream, uint channelsCount, uint sampleRate);
	
	void sfSoundStream_Play(sfSoundStream* soundStream);
	void sfSoundStream_Pause(sfSoundStream* soundStream);
	void sfSoundStream_Stop(sfSoundStream* soundStream);
	
	uint sfSoundStream_GetChannelsCount(const sfSoundStream* soundStream);
	uint sfSoundStream_GetSampleRate(const sfSoundStream* soundStream);
	Status sfSoundStream_GetStatus(const sfSoundStream* soundStream);
	
	void sfSoundStream_SetPlayingOffset(sfSoundStream* soundStream, sfTime timeOffset);
	sfTime sfSoundStream_GetPlayingOffset(const sfSoundStream* soundStream);
	
	void sfSoundStream_SetLoop(sfSoundStream* soundStream, bool loop);
	bool sfSoundStream_GetLoop(const sfSoundStream* soundStream);
}


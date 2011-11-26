module dsfml.audio.soundstream;

import dsfml.audio.soundsource;

import dsfml.sizes;

abstract class SoundStream : SoundSource {
	private void[soundStreamSize - soundSourceSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	protected final sfSoundStream* soundStream() {
		return cast(sfSoundStream*) soundSource;
	}
	
	@property
	protected final const(sfSoundStream)* soundStream() const {
		return cast(const(sfSoundStream)*) soundSource;
	}
	/*
	public this(uint channelsCount, uint sampleRate) {
		soundStream = sfSoundStream_Create(&soundStreamOnGetData, &soundStreamOnSeek, channelsCount, sampleRate, cast(void*) this);
	}
	
	protected this() {
		soundStream = null;
	}
	
	public ~this() {
		sfSoundStream_Destroy(soundStream);
	}
	*/
	
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
	
	protected abstract bool onGetData(short[] data);
	protected abstract void onSeek(uint timeOffset);
}

private extern(C++) {
	struct sfSoundStream {}
	struct sfSoundStreamChunk {
		short* samples;
		uint nbSamples;
	};
	
	bool __dsfml_sfSoundStream_getDataCallback(sfSoundStreamChunk* data, sfSoundStream* soundStream) {
		return getSoundSource!(SoundStream)(soundStream).onGetData(data.samples[0 .. data.nbSamples]);
	}
	
	void __dsfml_sfSoundStream_seekCallback(uint timeOffset, sfSoundStream* soundStream) {
		getSoundSource!(SoundStream)(soundStream).onSeek(timeOffset);
	}
	
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

/*
private {
	extern(C) {
		bool soundStreamOnGetData(sfSoundStreamChunk* chunck, void* userData) {
			SoundStream soundStream = cast(SoundStream) userData;
			return soundStream.onGetData(chunck.samples[0 .. chunck.nbSamples]);
		};
		
		void soundStreamOnSeek(uint position, void* userData) {
			SoundStream soundStream = cast(SoundStream) userData;
			return soundStream.onSeek(position);
		};
	}
}
*/


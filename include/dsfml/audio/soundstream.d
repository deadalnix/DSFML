module dsfml.audio.soundstream;

import csfml.audio.soundstream;
import dsfml.audio.soundsource;

abstract class SoundStream : SoundSource {
	private sfSoundStream* soundStream;
	
	public this(uint channelsCount, uint sampleRate) {
		soundStream = sfSoundStream_Create(&soundStreamOnGetData, &soundStreamOnSeek, channelsCount, sampleRate, cast(void*) this);
	}
	
	protected this() {
		soundStream = null;
	}
	
	public ~this() {
		sfSoundStream_Destroy(soundStream);
	}
	
	public void play() {
		sfSoundStream_Play(soundStream);
	}
	
	public void pause() {
		sfSoundStream_Pause(soundStream);
	}
	
	public void stop() {
		sfSoundStream_Stop(soundStream);
	}
	
	public uint getChannelsCount() const {
		return sfSoundStream_GetChannelsCount(soundStream);
	}
	
	public uint getSampleRate() const {
		return sfSoundStream_GetSampleRate(soundStream);
	}
	
	public sfSoundStatus getStatus() const {
		return sfSoundStream_GetStatus(soundStream);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfSoundStream_SetPlayingOffset(soundStream, timeOffset);
	}
	
	public uint getPlayingOffset() const {
		return sfSoundStream_GetPlayingOffset(soundStream);
	}
	
	public void setLoop(bool loop) {
		sfSoundStream_SetLoop(soundStream, loop);
	}
	
	public void getLoop() const {
		return sfSoundStream_GetLoop(soundStream);
	}
	
	protected abstract void onSeek(uint timeOffset);
	protected abstract bool onGetData(short[] data);
}

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


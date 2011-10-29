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
	
	public uint getChannelsCount() {
		return sfSoundStream_GetChannelsCount(soundStream);
	}
	
	public uint getSampleRate() {
		return sfSoundStream_GetSampleRate(soundStream);
	}
	
	public sfSoundStatus getStatus() {
		return sfSoundStream_GetStatus(soundStream);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfSoundStream_SetPlayingOffset(soundStream, timeOffset);
	}
	
	public uint getPlayingOffset() {
		return sfSoundStream_GetPlayingOffset(soundStream);
	}
	
	public void setLoop(bool loop) {
		sfSoundStream_SetLoop(soundStream, loop);
	}
	
	public void getLoop() {
		return sfSoundStream_GetLoop(soundStream);
	}
	
	public void setPitch(float pitch) {
		sfSoundStream_SetPitch(soundStream, pitch);
	}
	
	public float getPitch() {
		return sfSoundStream_GetPitch(soundStream);
	}
	
	public void setVolume(float volume) in {
		assert(volume >= 0.f && volume <= 100.f);
	} body {
		sfSoundStream_SetVolume(soundStream, volume);
	}
	
	public float getVolume() {
		return sfSoundStream_GetVolume(soundStream);
	}
	
	public void setPosition(float[3] position) {
		sfSoundStream_SetPosition(soundStream, position[0], position[1], position[2]);
	}
	
	public void setPosition(int x, int y, int z) {
		sfSoundStream_SetPosition(soundStream, x, y, z);
	}
	
	public float[3] getPosition() {
		float[3] position;
		sfSoundStream_GetPosition(soundStream, position.ptr, position.ptr + 1, position.ptr + 2);
		return position;
	}
	
	public void setRelativeToListener(bool relative) {
		sfSoundStream_SetRelativeToListener(soundStream, relative);
	}
	
	public bool isRelativeToListener() {
		return sfSoundStream_IsRelativeToListener(soundStream);
	}
	
	public void setMinDistance(float distance) {
		sfSoundStream_SetMinDistance(soundStream, distance);
	}
	
	public float getMinDistance() {
		return sfSoundStream_GetMinDistance(soundStream);
	}
	
	public void setAttenuation(float attenuation) {
		sfSoundStream_SetAttenuation(soundStream, attenuation);
	}
	
	public float getAttenuation() {
		return sfSoundStream_GetAttenuation(soundStream);
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


module dsfml.audio.music;

import csfml.audio.music;

import dsfml.audio.soundstream;
import dsfml.system.inputstream;

import std.string;

class Music : SoundStream {
	private sfMusic* music;
	
	public this(string filename) {
		if(filename is null || filename.length == 0) throw new Exception("LoadingException : Filename is invalid.");
		
		music = sfMusic_CreateFromFile(toStringz(filename));
	}
	
	public this(const byte[] data) {
		if(data is null || data.length == 0) throw new Exception("LoadingException : Memory stream is invalid.");
		music = sfMusic_CreateFromMemory(data.ptr, data.length);
	}
	
	public this(InputStream inputStream) {
		if(inputStream is null) throw new Exception("LoadingException : InputStream is invalid.");
		music = sfMusic_CreateFromStream(inputStream.getCInputStream());
	}
	
	public ~this() {
		sfMusic_Destroy(music);
	}
	
	public void play() {
		sfMusic_Play(music);
	}
	
	public void pause() {
		sfMusic_Pause(music);
	}
	
	public void stop() {
		sfMusic_Stop(music);
	}
	
	public uint getChannelsCount() {
		return sfMusic_GetChannelsCount(music);
	}
	
	public uint getSampleRate() {
		return sfMusic_GetSampleRate(music);
	}
	
	public sfSoundStatus getStatus() {
		return sfMusic_GetStatus(music);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfMusic_SetPlayingOffset(music, timeOffset);
	}
	
	public uint getPlayingOffset() {
		return sfMusic_GetPlayingOffset(music);
	}
	
	public void setLoop(bool loop) {
		sfMusic_SetLoop(music, loop);
	}
	
	public void getLoop() {
		return sfMusic_GetLoop(music);
	}
	
	public void setPitch(float pitch) {
		sfMusic_SetPitch(music, pitch);
	}
	
	public float getPitch() {
		return sfMusic_GetPitch(music);
	}
	
	public void setVolume(float volume) in {
		assert(volume >= 0.f && volume <= 100.f);
	} body {
		sfMusic_SetVolume(music, volume);
	}
	
	public float getVolume() {
		return sfMusic_GetVolume(music);
	}
	
	public void setPosition(float[3] position) {
		sfMusic_SetPosition(music, position[0], position[1], position[2]);
	}
	
	public void setPosition(int x, int y, int z) {
		sfMusic_SetPosition(music, x, y, z);
	}
	
	public float[3] getPosition() {
		float[3] position;
		sfMusic_GetPosition(music, position.ptr, position.ptr + 1, position.ptr + 2);
		return position;
	}
	
	public void setRelativeToListener(bool relative) {
		sfMusic_SetRelativeToListener(music, relative);
	}
	
	public bool isRelativeToListener() {
		return sfMusic_IsRelativeToListener(music);
	}
	
	public void setMinDistance(float distance) {
		sfMusic_SetMinDistance(music, distance);
	}
	
	public float getMinDistance() {
		return sfMusic_GetMinDistance(music);
	}
	
	public void setAttenuation(float attenuation) {
		sfMusic_SetAttenuation(music, attenuation);
	}
	
	public float getAttenuation() {
		return sfMusic_GetAttenuation(music);
	}
	
	// Dummy function to handle compatibility with soundStream.
	protected final void onSeek(uint timeOffset) {}
	protected final bool onGetData(const short[] data) {
		return false;
	}
}


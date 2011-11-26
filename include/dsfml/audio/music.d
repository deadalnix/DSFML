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
	
	public this(const void[] data) {
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
	
	public uint getChannelsCount() const {
		return sfMusic_GetChannelsCount(music);
	}
	
	public uint getSampleRate() const {
		return sfMusic_GetSampleRate(music);
	}
	
	public sfSoundStatus getStatus() const {
		return sfMusic_GetStatus(music);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfMusic_SetPlayingOffset(music, timeOffset);
	}
	
	public uint getPlayingOffset() const {
		return sfMusic_GetPlayingOffset(music);
	}
	
	public void setLoop(bool loop) {
		sfMusic_SetLoop(music, loop);
	}
	
	public void getLoop() const {
		return sfMusic_GetLoop(music);
	}
	
	public void setMinDistance(float distance) {
		sfMusic_SetMinDistance(music, distance);
	}
	
	public float getMinDistance() const {
		return sfMusic_GetMinDistance(music);
	}
	
	public void setAttenuation(float attenuation) {
		sfMusic_SetAttenuation(music, attenuation);
	}
	
	public float getAttenuation() const {
		return sfMusic_GetAttenuation(music);
	}
	
	// Dummy function to handle compatibility with soundStream.
	deprecated private final void onSeek(uint timeOffset) {}
	deprecated private final bool onGetData(const short[] data) {
		return false;
	}
}


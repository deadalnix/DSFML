module sfml.audio.sound;

import csfml.audio.sound;

import dsfml.audio.soundsource;
import dsfml.audio.soundbuffer;

class Sound : SoundSource {
	private sfSound* sound;
	
	public this() {
		sound = sfSound_Create();
	}
	
	public this(SoundBuffer buffer) {
		sound = sfSound_Create();
		setBuffer(buffer);
	}
	
	public Sound clone() {
		return new Sound(this);
	}
	
	private this(Sound s) {
		sound = sfSound_Copy(s.sound);
	}
	
	public ~this() {
		sfSound_Destroy(sound);
	}
	
	public void play() {
		sfSound_Play(sound);
	}
	
	public void pause() {
		sfSound_Pause(sound);
	}
	
	public void stop() {
		sfSound_Stop(sound);
	}
	
	public void setBuffer(SoundBuffer buffer) {
		if(buffer is null) throw new Exception("NullParameterException : SoundBuffer is null."); 
		
		sfSound_SetBuffer(sound, buffer.getCSoundBuffer());
	}
	
	public const(SoundBuffer) getBuffer() const {
		return new SoundBuffer(sfSound_GetBuffer(sound));
	}
	
	public void setLoop(bool loop) {
		sfSound_SetLoop(sound, loop);
	}
	
	public void getLoop() const {
		return sfSound_GetLoop(sound);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfSound_SetPlayingOffset(sound, timeOffset);
	}
	
	public uint getPlayingOffset() const {
		return sfSound_GetPlayingOffset(sound);
	}
	
	public sfSoundStatus getStatus() const {
		return sfSound_GetStatus(sound);
	}
	
	public void setMinDistance(float distance) {
		sfSound_SetMinDistance(sound, distance);
	}
	
	public float getMinDistance() const {
		return sfSound_GetMinDistance(sound);
	}
	
	public void setAttenuation(float attenuation) {
		sfSound_SetAttenuation(sound, attenuation);
	}
	
	public float getAttenuation() const {
		return sfSound_GetAttenuation(sound);
	}
}


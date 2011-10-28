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
		sfSound_SetBuffer(sound, buffer.getCSoundBuffer());
	}
	
	public SoundBuffer getBuffer() {
		return new SoundBuffer(sfSound_GetBuffer(sound));
	}
	
	public void setLoop(bool loop) {
		sfSound_SetLoop(sound, loop);
	}
	
	public void getLoop() {
		return sfSound_GetLoop(sound);
	}
	
	public void setPlayingOffset(uint timeOffset) {
		sfSound_SetPlayingOffset(sound, timeOffset);
	}
	
	public uint getPlayingOffset() {
		return sfSound_GetPlayingOffset(sound);
	}
	
	public sfSoundStatus getStatus() {
		return sfSound_GetStatus(sound);
	}
	
	public void setPitch(float pitch) {
		sfSound_SetPitch(sound, pitch);
	}
	
	public float getPitch() {
		return sfSound_GetPitch(sound);
	}
	
	public void setVolume(float volume) in {
		assert(volume >= 0.f && volume <= 100.f);
	} body {
		sfSound_SetVolume(sound, volume);
	}
	
	public float getVolume() {
		return sfSound_GetVolume(sound);
	}
	
	public void setPosition(float[3] position) {
		sfSound_SetPosition(sound, position[0], position[1], position[2]);
	}
	
	public void setPosition(int x, int y, int z) {
		sfSound_SetPosition(sound, x, y, z);
	}
	
	public float[3] getPosition() {
		float[3] position;
		sfSound_GetPosition(sound, position.ptr, position.ptr + 1, position.ptr + 2);
		return position;
	}
	
	public void setRelativeToListener(bool relative) {
		sfSound_SetRelativeToListener(sound, relative);
	}
	
	public bool isRelativeToListener() {
		return sfSound_IsRelativeToListener(sound);
	}
	
	public void setMinDistance(float distance) {
		sfSound_SetMinDistance(sound, distance);
	}
	
	public float getMinDistance() {
		return sfSound_GetMinDistance(sound);
	}
	
	public void setAttenuation(float attenuation) {
		sfSound_SetAttenuation(sound, attenuation);
	}
	
	public float getAttenuation() {
		return sfSound_GetAttenuation(sound);
	}
}


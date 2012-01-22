module dsfml.audio.sound;

import dsfml.audio.soundsource;
import dsfml.audio.soundbuffer;
import dsfml.system.time;
import dsfml.sizes;

final class Sound : SoundSource {
	private void[soundSize - soundSourceSize] data = void;
	
	@property
	package final inout(sfSound)* sound() inout {
		return cast(inout(sfSound)*) soundSource;
	}
	
	this() {
		sfSound_Create(sound);
	}
	
	this(const SoundBuffer buffer) {
		sfSound_Create(sound, *buffer.soundBuffer);
	}
	
	this(const Sound s) {
		sfSound_Copy(s.sound, sound);
	}
	
	~this() {
		sfSound_Destroy(sound);
	}
	
	void play() {
		sfSound_Play(sound);
	}
	
	void pause() {
		sfSound_Pause(sound);
	}
	
	void stop() {
		sfSound_Stop(sound);
	}
	
	@property
	void buffer(const SoundBuffer buffer) in {
		assert(buffer, "SoundBuffer " ~ /* to!string(buffer) ~ */ " is not usable.");
	} body {
		sfSound_SetBuffer(sound, *buffer.soundBuffer);
	}
	
	@property
	const(SoundBuffer) buffer() const {
		const(sfSoundBuffer)* buffer = sfSound_GetBuffer(sound);
		return new SoundBuffer(*buffer);
	}
	
	@property
	void loop(bool loop) {
		sfSound_SetLoop(sound, loop);
	}
	
	@property
	bool loop() const {
		return sfSound_GetLoop(sound);
	}
	
	@property
	void playingOffset(Time timeOffset) {
		sfSound_SetPlayingOffset(sound, *(cast(sfTime*) &timeOffset));
	}
	
	@property
	Time playingOffset() const {
		sfTime tmp = sfSound_GetPlayingOffset(sound);
		return *(cast(Time*) &tmp);
	}
	
	@property
	override Status status() const {
		return sfSound_GetStatus(sound);
	}
}

package extern(C++) {
	struct sfSound {
		void[soundSize] data = void;
	}
	
	void sfSound_Create(sfSound* sound);
	void sfSound_Create(sfSound* sound, ref const sfSoundBuffer buffer);
	void sfSound_Copy(const sfSound* sound, sfSound* destination);
	void sfSound_Destroy(sfSound* sound);
	
	void sfSound_Play(sfSound* sound);
	void sfSound_Pause(sfSound* sound);
	void sfSound_Stop(sfSound* sound);
	
	void sfSound_SetBuffer(sfSound* sound, ref const sfSoundBuffer buffer);
	const(sfSoundBuffer)* sfSound_GetBuffer(const sfSound* sound);
	void sfSound_SetLoop(sfSound* sound, bool loop);
	bool sfSound_GetLoop(const sfSound* sound);
	void sfSound_SetPlayingOffset(sfSound* sound, sfTime timeOffset);
	sfTime sfSound_GetPlayingOffset(const sfSound* sound);
	Status sfSound_GetStatus(const sfSound* sound);
}


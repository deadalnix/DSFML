module dsfml.audio.soundsource;

import dsfml.sizes;

enum Status {
	Stopped, ///< Sound is not playing
	Paused, ///< Sound is paused
	Playing, ///< Sound is playing
};

package T getSoundSource(T)(void* soundSource) if(is(T : SoundSource)) {
	return cast(T)(soundSource - SoundSource.dataOffset);
}

class SoundSource {
	private void[soundSourceSize] data = void;
	
	// Usefull to get back the SoundSource object from C pointer to data.
	static private immutable size_t dataOffset = data.offsetof;
	
	// TODO: Go inout for D2.056
	@property
	package final sfSoundSource* soundSource() {
		return cast(sfSoundSource*) data.ptr;
	}
	
	@property
	package final const(sfSoundSource)* soundSource() const {
		return cast(const(sfSoundSource)*) data.ptr;
	}
	
	protected this() {
		sfSoundSource_Create(soundSource);
	}
	
	this(const SoundSource s) {
		sfSoundSource_Copy(s.soundSource, soundSource);
	}
	
	~this() {
		sfSoundSource_Destroy(soundSource);
	}
	
	@property
	final void pitch(float pitch) {
		sfSoundSource_SetPitch(soundSource, pitch);
	}
	
	@property
	final float pitch() const {
		return sfSoundSource_GetPitch(soundSource);
	}
	
	@property
	final void volume(float volume) in {
		assert(volume >= 0.f && volume <= 100.f);
	} body {
		sfSoundSource_SetVolume(soundSource, volume);
	}
	
	@property
	final float volume() const {
		return sfSoundSource_GetVolume(soundSource);
	}
	
	@property
	final void position(ref const float[3] position) {
		sfSoundSource_SetPosition(soundSource, position.ptr);
	}
	
	@property
	final float[3] position() const {
		return sfSoundSource_GetPosition(soundSource);
	}
	
	@property
	final void relativeToListener(bool relative) {
		sfSoundSource_SetRelativeToListener(soundSource, relative);
	}
	
	@property
	final bool relativeToListener() const {
		return sfSoundSource_IsRelativeToListener(soundSource);
	}
	
	@property
	final void minDistance(float distance) {
		sfSoundSource_SetMinDistance(soundSource, distance);
	}
	
	@property
	final float minDistance() const {
		return sfSoundSource_GetMinDistance(soundSource);
	}
	
	@property
	final void attenuation(float attenuation) {
		return sfSoundSource_SetAttenuation(soundSource, attenuation);
	}
	
	@property
	final float attenuation() const {
		return sfSoundSource_GetAttenuation(soundSource);
	}
	
	@property
	protected Status status() const {
		return sfSoundSource_GetStatus(soundSource);
	}
}

private extern(C++) {
	// Scary, right ? Where is my opaque struct ?
	struct sfSoundSource {
		void[soundSourceSize] data = void;
	}
	
	void sfSoundSource_Create(sfSoundSource* soundSource);
	void sfSoundSource_Copy(const sfSoundSource* soundSource, sfSoundSource* destination);
	void sfSoundSource_Destroy(sfSoundSource* soundSource);
	
	void sfSoundSource_SetPitch(sfSoundSource* soundSource, float pitch);
	float sfSoundSource_GetPitch(const sfSoundSource* soundSource);
	
	void sfSoundSource_SetVolume(sfSoundSource* soundSource, float volume);
	float sfSoundSource_GetVolume(const sfSoundSource* soundSource);
	
	void sfSoundSource_SetPosition(sfSoundSource* soundSource, const float* position);
	float[3] sfSoundSource_GetPosition(const sfSoundSource* soundSource);
	
	void sfSoundSource_SetRelativeToListener(sfSoundSource* soundSource, bool relative);
	bool sfSoundSource_IsRelativeToListener(const sfSoundSource* soundSource);
	
	void sfSoundSource_SetMinDistance(sfSoundSource* soundSource, float distance);
	float sfSoundSource_GetMinDistance(const sfSoundSource* soundSource);
	
	void sfSoundSource_SetAttenuation(sfSoundSource* soundSource, float attenuation);
	float sfSoundSource_GetAttenuation(const sfSoundSource* soundSource);
	
	Status sfSoundSource_GetStatus(const sfSoundSource* soundSource);
}


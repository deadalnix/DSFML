module dsfml.audio.soundsource;

import csfml.audio.soundstatus;

private immutable size = @Audio/SoundSource@;

abstract class SoundSource {
	protected ubyte[size] data = void;
	
	final void setPitch(float pitch) {
		SetPitch(data.ptr, pitch);
	}
	
	final float getPitch() const {
		return GetPitch(data.ptr);
	}
	
	abstract void setVolume(float volume);
	abstract float getVolume() const;
	
	abstract void setPosition(float[3] position);
	abstract void setPosition(float x, float y, float z);
	abstract float[3] getPosition() const;
	
	abstract void setRelativeToListener(bool relative);
	abstract bool isRelativeToListener() const;
	
	abstract void setMinDistance(float distance);
	abstract float getMinDistance() const;
	
	abstract void setAttenuation(float attenuation);
	abstract float getAttenuation() const;
	
	abstract sfSoundStatus getStatus() const;
}

private extern(C++) {
	void SetPitch(ubyte* soundSource, float pitch);
	float GetPitch(const ubyte* soundSource)
}


module dsfml.audio.soundsource;

import csfml.audio.soundstatus;

// XXX: This is mostly an interface for now, but will ends up being a real class.
abstract class SoundSource {
	abstract void setPitch(float pitch);
	abstract float getPitch() const;
	
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


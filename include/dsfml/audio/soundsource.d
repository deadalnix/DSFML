module dsfml.audio.soundsource;

import csfml.audio.soundstatus;

abstract class SoundSource {
	abstract void setPitch(float pitch);
	abstract float getPitch();
	
	abstract void setVolume(float volume);
	abstract float getVolume();
	
	abstract void setPosition(float[3] position);
	abstract void setPosition(float x, float y, float z);
	abstract float[3] getPosition();
	
	abstract void setRelativeToListener(bool relative);
	abstract bool isRelativeToListener();
	
	abstract void setMinDistance(float distance);
	abstract float getMinDistance();
	
	abstract void setAttenuation(float attenuation);
	abstract float getAttenuation();
	
	abstract sfSoundStatus getStatus();
}


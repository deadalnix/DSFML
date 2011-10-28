module dsfml.audio.soundbuffer;

import csfml.audio.types;

class SoundBuffer {
	public this(sfSoundBuffer* buffer);
	public sfSoundBuffer* getCSoundBuffer();
}


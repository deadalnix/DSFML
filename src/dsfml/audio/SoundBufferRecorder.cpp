#include<SFML/Audio/SoundBufferRecorder.hpp>
#include<new>

typedef sf::SoundBufferRecorder sfSoundBufferRecorder;

void sfSoundBufferRecorder_Create(sfSoundBufferRecorder* soundBufferRecorder) {
	new(soundBufferRecorder) sfSoundBufferRecorder();
}

void sfSoundBufferRecorder_Destroy(sfSoundBufferRecorder* soundBufferRecorder) {
	soundBufferRecorder->~sfSoundBufferRecorder();
}

typedef sf::SoundBuffer sfSoundBuffer;

const sfSoundBuffer sfSoundBufferRecorder_GetBuffer(const sfSoundBufferRecorder* soundBufferRecorder) {
	return soundBufferRecorder->GetBuffer();
}


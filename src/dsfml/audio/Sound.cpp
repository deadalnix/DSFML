#include<SFML/Audio/Sound.hpp>
#include<new>

typedef sf::Sound sfSound;

void sfSound_Create(sfSound* sound) {
	new(sound) sfSound();
}

typedef sf::SoundBuffer sfSoundBuffer;

void sfSound_Create(sfSound* sound, const sfSoundBuffer& buffer) {
	new(sound) sfSound(buffer);
}

void sfSound_Copy(const sfSound* sound, sfSound* destination) {
	new(destination) sfSound(*sound);
}

void sfSound_Destroy(sfSound* sound) {
	sound->~sfSound();
}

void sfSound_Play(sfSound* sound) {
	sound->Play();
}

void sfSound_Pause(sfSound* sound) {
	sound->Pause();
}

void sfSound_Stop(sfSound* sound) {
	sound->Stop();
}

void sfSound_SetBuffer(sfSound* sound, const sfSoundBuffer& buffer) {
	sound->SetBuffer(buffer);
}

const sfSoundBuffer* sfSound_GetBuffer(const sfSound* sound) {
	return sound->GetBuffer();
}

void sfSound_SetLoop(sfSound* sound, bool loop) {
	sound->SetLoop(loop);
}

bool sfSound_GetLoop(const sfSound* sound) {
	return sound->GetLoop();
}

void sfSound_SetPlayingOffset(sfSound* sound, sf::Uint32 timeOffset) {
	sound->SetPlayingOffset(timeOffset);
}

sf::Uint32 sfSound_GetPlayingOffset(const sfSound* sound) {
	return sound->GetPlayingOffset();
}

sf::SoundSource::Status sfSound_GetStatus(const sfSound* sound) {
	return sound->GetStatus();
}


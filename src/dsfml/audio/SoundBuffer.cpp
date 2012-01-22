#include<SFML/Audio/SoundBuffer.hpp>
#include<new>

typedef sf::SoundBuffer sfSoundBuffer;

void sfSoundBuffer_Create(sfSoundBuffer* soundBuffer) {
	new(soundBuffer) sfSoundBuffer();
}

void sfSoundBuffer_Copy(const sfSoundBuffer* soundBuffer, sfSoundBuffer* destination) {
	new(destination) sfSoundBuffer(*soundBuffer);
}

void sfSoundBuffer_Destroy(sfSoundBuffer* soundBuffer) {
	soundBuffer->~sfSoundBuffer();
}

bool sfSoundBuffer_LoadFromFile(sfSoundBuffer* soundBuffer, const char* filename) {
	return soundBuffer->LoadFromFile(filename);
}

bool sfSoundBuffer_LoadFromMemory(sfSoundBuffer* soundBuffer, const void* data, size_t sizeInBytes) {
	return soundBuffer->LoadFromMemory(data, sizeInBytes);
}

typedef sf::InputStream sfInputStream;

bool sfSoundBuffer_LoadFromStream(sfSoundBuffer* soundBuffer, sfInputStream* stream) {
	return soundBuffer->LoadFromStream(*stream);
}

bool sfSoundBuffer_LoadFromSamples(sfSoundBuffer* soundBuffer, const sf::Int16* samples, size_t samplesCount, unsigned int channelsCount, unsigned int sampleRate) {
	return soundBuffer->LoadFromSamples(samples, samplesCount, channelsCount, sampleRate);
}

bool sfSoundBuffer_SaveToFile(const sfSoundBuffer* soundBuffer, const char* filename) {
	return soundBuffer->SaveToFile(filename);
}

const sf::Int16* sfSoundBuffer_GetSamples(const sfSoundBuffer* soundBuffer) {
	return soundBuffer->GetSamples();
}

size_t sfSoundBuffer_GetSampleCount(const sfSoundBuffer* soundBuffer) {
	return soundBuffer->GetSampleCount();
}

unsigned int sfSoundBuffer_GetSampleRate(const sfSoundBuffer* soundBuffer) {
	return soundBuffer->GetSampleRate();
}

unsigned int sfSoundBuffer_GetChannelCount(const sfSoundBuffer* soundBuffer) {
	return soundBuffer->GetChannelCount();
}

typedef sf::Time sfTime;

sfTime sfSoundBuffer_GetDuration(const sfSoundBuffer* soundBuffer) {
	return soundBuffer->GetDuration();
}


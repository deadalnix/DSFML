#include<SFML/Audio/SoundSource.hpp>

typedef sf::SoundSource sfSoundSource;

void sfSoundSource_Destroy(sfSoundSource* soundSource) {
	soundSource->~sfSoundSource();
}

void sfSoundSource_SetPitch(sfSoundSource* soundSource, float pitch) {
	soundSource->SetPitch(pitch);
}

float sfSoundSource_GetPitch(const sfSoundSource* soundSource) {
	return soundSource->GetPitch();
}

void sfSoundSource_SetVolume(sfSoundSource* soundSource, float volume) {
	soundSource->SetVolume(volume);
}

float sfSoundSource_GetVolume(const sfSoundSource* soundSource) {
	return soundSource->GetVolume();
}

void sfSoundSource_SetPosition(sfSoundSource* soundSource, float x, float y, float z) {
	soundSource->SetPosition(x, y, z);
}

void sfSoundSource_SetPosition(sfSoundSource* soundSource, const float* position) {
	soundSource->SetPosition(*reinterpret_cast<const sf::Vector3f*>(position));
}

sf::Vector3f sfSoundSource_GetPosition(const sfSoundSource* soundSource) {
	return soundSource->GetPosition();
}

void sfSoundSource_SetRelativeToListener(sfSoundSource* soundSource, bool relative) {
	soundSource->SetRelativeToListener(relative);
}

bool sfSoundSource_IsRelativeToListener(const sfSoundSource* soundSource) {
	return soundSource->IsRelativeToListener();
}

void sfSoundSource_SetMinDistance(sfSoundSource* soundSource, float distance) {
	soundSource->SetMinDistance(distance);
}

float sfSoundSource_GetMinDistance(const sfSoundSource* soundSource) {
	return soundSource->GetMinDistance();
}

void sfSoundSource_SetAttenuation(sfSoundSource* soundSource, float attenuation) {
	soundSource->SetAttenuation(attenuation);
}

float sfSoundSource_GetAttenuation(const sfSoundSource* soundSource) {
	return soundSource->GetAttenuation();
}

typedef sf::SoundSource::Status Status;

// Trick to get The status (GetStatus is protected in SoundSource).
struct sfSoundSource_GetStatusSoundSource : sfSoundSource {
	Status GetStatus() const {
		return sfSoundSource::GetStatus();
	}
};

Status sfSoundSource_GetStatus(const sfSoundSource* soundSource) {
	return (reinterpret_cast<const sfSoundSource_GetStatusSoundSource*>(soundSource))->GetStatus();
}


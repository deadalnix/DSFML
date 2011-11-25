#include<SFML/Audio/SoundSource.hpp>

void SetPitch(SoundSource* soundSource, float pitch) {
	soundSource->SetPitch(pitch);
}

float GetPitch(const SoundSource* soundSource) {
	return soundSource->GetPitch();
}


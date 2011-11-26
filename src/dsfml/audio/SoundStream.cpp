#include<SFML/Audio/SoundStream.hpp>
#include<new>

typedef sf::SoundStream::Chunk sfSoundStreamChunk;
class sfSoundStream;

// Function to get back in D.
bool __dsfml_sfSoundStream_getDataCallback(sfSoundStreamChunk* data, sfSoundStream* soundStream);
void __dsfml_sfSoundStream_seekCallback(sf::Uint32 timeOffset, sfSoundStream* soundStream);

class sfSoundStream : public sf::SoundStream {
private :
	virtual bool OnGetData(Chunk& Data) {
		return __dsfml_sfSoundStream_getDataCallback(&Data, this);
	}
	
	virtual void OnSeek(sf::Uint32 TimeOffset) {
		__dsfml_sfSoundStream_seekCallback(TimeOffset, this);
	}
};

void sfSoundStream_Play(sfSoundStream* soundStream) {
	soundStream->Play();
}

void sfSoundStream_Pause(sfSoundStream* soundStream) {
	soundStream->Pause();
}

void sfSoundStream_Stop(sfSoundStream* soundStream) {
	soundStream->Stop();
}

sf::Uint32 sfSoundStream_GetChannelsCount(const sfSoundStream* soundStream) {
	soundStream->GetChannelsCount();
}

sf::Uint32 sfSoundStream_GetSampleRate(const sfSoundStream* soundStream) {
	soundStream->GetSampleRate();
}

typedef sf::SoundSource::Status Status;

Status sfSoundStream_GetStatus(const sfSoundStream* soundStream) {
	soundStream->GetStatus();
}

void sfSoundStream_SetPlayingOffset(sfSoundStream* soundStream, sf::Uint32 timeOffset) {
	soundStream->SetPlayingOffset(timeOffset);
}

sf::Uint32 sfSoundStream_GetPlayingOffset(const sfSoundStream* soundStream) {
	return soundStream->GetPlayingOffset();
}

void sfSoundStream_SetLoop(sfSoundStream* soundStream, bool loop) {
	soundStream->SetLoop(loop);
}

bool sfSoundStream_GetLoop(const sfSoundStream* soundStream) {
	return soundStream->GetLoop();
}


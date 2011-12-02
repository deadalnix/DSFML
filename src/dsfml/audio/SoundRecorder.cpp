#include<SFML/Audio/SoundRecorder.hpp>
#include<new>

class sfSoundRecorder;

// Function to get back in D.
bool __dsfml_sfSoundRecorder_onStartCallback(sfSoundRecorder* soundStream);
bool __dsfml_sfSoundRecorder_onProcessSamplesCallback(const sf::Int16* samples, std::size_t samplesCount, sfSoundRecorder* soundStream);
void __dsfml_sfSoundRecorder_onStopCallback(sfSoundRecorder* soundStream);

class sfSoundRecorder : public sf::SoundRecorder {
public:
	sfSoundRecorder() : sf::SoundRecorder() {}
	
private :
	bool OnStart() {
		return __dsfml_sfSoundRecorder_onStartCallback(this);
	}
	
	bool OnProcessSamples(const sf::Int16* samples, std::size_t samplesCount) {
		return __dsfml_sfSoundRecorder_onProcessSamplesCallback(samples, samplesCount, this);
	}
	
	void OnStop() {
		__dsfml_sfSoundRecorder_onStopCallback(this);
	}
};

void sfSoundRecorder_Create(sfSoundRecorder* soundRecorder) {
	new(soundRecorder) sfSoundRecorder();
}

void sfSoundRecorder_Destroy(sfSoundRecorder* soundRecorder) {
	soundRecorder->~sfSoundRecorder();
}

void sfSoundRecorder_Start(sfSoundRecorder* soundRecorder, unsigned int sampleRate) {
	soundRecorder->Start(sampleRate);
}

unsigned int sfSoundRecorder_GetSampleRate(const sfSoundRecorder* soundRecorder) {
	return soundRecorder->GetSampleRate();
}

bool sfSoundRecorder_IsAvailable() {
	return sf::SoundRecorder::IsAvailable();
}


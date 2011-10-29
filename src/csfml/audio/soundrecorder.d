module csfml.audio.soundrecorder;

public import csfml.audio.types;

extern(C) {
	alias bool function(void* userData) sfSoundRecorderStartCallback;
	alias bool function(const short* samples, size_t samplesCount, void* userData) sfSoundRecorderProcessCallback;
	alias void function(void* userData) sfSoundRecorderStopCallback;
	
	sfSoundRecorder* sfSoundRecorder_Create(sfSoundRecorderStartCallback onStart, sfSoundRecorderProcessCallback onProcess, sfSoundRecorderStopCallback onStop, void* userData);
	void sfSoundRecorder_Destroy(sfSoundRecorder* soundRecorder);
	void sfSoundRecorder_Start(sfSoundRecorder* soundRecorder, uint sampleRate);
	void sfSoundRecorder_Stop(sfSoundRecorder* soundRecorder);
	uint sfSoundRecorder_GetSampleRate(const sfSoundRecorder* soundRecorder);
	bool sfSoundRecorder_IsAvailable();
}


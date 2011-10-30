module csfml.audio.soundbufferrecorder;

public import csfml.audio.types;

extern(C) {
	sfSoundBufferRecorder* sfSoundBufferRecorder_Create();
	void sfSoundBufferRecorder_Destroy(sfSoundBufferRecorder* soundBufferRecorder);
	void sfSoundBufferRecorder_Start(sfSoundBufferRecorder* soundBufferRecorder, uint sampleRate);
	void sfSoundBufferRecorder_Stop(sfSoundBufferRecorder* soundBufferRecorder);
	uint sfSoundBufferRecorder_GetSampleRate(const sfSoundBufferRecorder* soundBufferRecorder);
	const(sfSoundBuffer*) sfSoundBufferRecorder_GetBuffer(const sfSoundBufferRecorder* soundBufferRecorder);
}


module dsfml.audio.soundrecorder;

import dsfml.sizes;

package T getSoundRecorder(T)(void* soundRecorder) if(is(T : SoundRecorder)) {
	return cast(T)(soundRecorder - SoundRecorder.dataOffset);
}

abstract class SoundRecorder {
	private void[soundRecorderSize] data = void;
	
	// Usefull to get back the SoundRecorder object from C pointer to data.
	static private immutable size_t dataOffset = data.offsetof;
	
	// TODO: Go inout for D2.056
	@property
	package final sfSoundRecorder* soundRecorder() {
		return cast(sfSoundRecorder*) data.ptr;
	}
	
	@property
	package final const(sfSoundRecorder)* soundRecorder() const {
		return cast(const(sfSoundRecorder)*) data.ptr;
	}
	
	protected this() {
		sfSoundRecorder_Create(soundRecorder);
	}
	
	public ~this() {
		sfSoundRecorder_Destroy(soundRecorder);
	}
	
	final void start(uint sampleRate = 44100) {
		sfSoundRecorder_Start(soundRecorder, sampleRate);
	}
	
	final void stop() {
		sfSoundRecorder_Stop(soundRecorder);
	}
	
	@property
	final uint sampleRate() const {
		return sfSoundRecorder_GetSampleRate(soundRecorder);
	}
	
	@property
	final static bool available() {
		return sfSoundRecorder_IsAvailable();
	}
	
	protected bool onStart() {
		return true;
	}
	
	protected abstract bool onProcessSamples(const(short)[] samples);
	
	protected void onStop() {}
}

package extern(C++) {
	struct sfSoundRecorder {
		void[soundRecorderSize] data = void;
	}
	
	bool __dsfml_sfSoundRecorder_onStartCallback(sfSoundRecorder* soundRecorder) {
		return getSoundRecorder!(SoundRecorder)(soundRecorder).onStart();
	}
	
	bool __dsfml_sfSoundRecorder_onProcessSamplesCallback(const short* samples, size_t samplesCount, sfSoundRecorder* soundRecorder) {
		return getSoundRecorder!(SoundRecorder)(soundRecorder).onProcessSamples(samples[0 .. samplesCount]);
	}
	
	void __dsfml_sfSoundRecorder_onStopCallback(sfSoundRecorder* soundRecorder) {
		getSoundRecorder!(SoundRecorder)(soundRecorder).onStop();
	}
	
	void sfSoundRecorder_Create(sfSoundRecorder* soundRecorder);
	void sfSoundRecorder_Destroy(sfSoundRecorder* soundRecorder);
	
	void sfSoundRecorder_Start(sfSoundRecorder* soundRecorder, uint sampleRate);
	void sfSoundRecorder_Stop(sfSoundRecorder* soundRecorder);
	
	uint sfSoundRecorder_GetSampleRate(const sfSoundRecorder* soundRecorder);
	bool sfSoundRecorder_IsAvailable();
}


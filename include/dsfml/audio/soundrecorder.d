module dsfml.audio.soundrecorder;

import csfml.audio.soundrecorder;

class SoundRecorder {
	private sfSoundRecorder* soundRecorder;
	
	public this() {
		soundRecorder = sfSoundRecorder_Create(&soundRecorderStartCallback, &soundRecorderProcessCallback, &soundRecorderStopCallback, cast(void*) this);
	}
	
	public ~this() {
		sfSoundRecorder_Destroy(soundRecorder);
	}
	
	public void start(uint sampleRate = 44100) {
		sfSoundRecorder_Start(soundRecorder, sampleRate);
	}
	
	public void stop() {
		sfSoundRecorder_Stop(soundRecorder);
	}
	
	public uint getSampleRate() {
		return sfSoundRecorder_GetSampleRate(soundRecorder);
	}
	
	public static bool isAvailable() {
		return sfSoundRecorder_IsAvailable();
	}
	
	protected abstract bool onStart();
	protected abstract bool onProcessSamples(const(short)[] samples);
	protected abstract void onStop();
}

private {
	extern(C) {
		bool soundRecorderStartCallback(void* userData) {
			SoundRecorder soundRecorder = cast(SoundRecorder) userData;
			
			return soundRecorder.onStart();
		}
		
		bool soundRecorderProcessCallback(const short* samples, size_t samplesCount, void* userData) {
			SoundRecorder soundRecorder = cast(SoundRecorder) userData;
			
			return soundRecorder.onProcessSamples(samples[0 .. samplesCount]);
		}
		
		void soundRecorderStopCallback(void* userData) {
			SoundRecorder soundRecorder = cast(SoundRecorder) userData;
			
			soundRecorder.onStop();
		}
	}
}


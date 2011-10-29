module dsfml.audio.soundbufferrecorder;

import csfml.audio.soundbufferrecorder;

import dsfml.audio.soundbuffer;
import dsfml.audio.soundrecorder;

class SoundBufferRecorder : SoundRecorder {
	private sfSoundBufferRecorder* soundBufferRecorder;
	
	public this() {
		soundBufferRecorder = sfSoundBufferRecorder_Create();
	}
	
	public ~this() {
		sfSoundBufferRecorder_Destroy(soundBufferRecorder);
	}
	
	public void start(uint sampleRate = 44100) {
		sfSoundBufferRecorder_Start(soundBufferRecorder, sampleRate);
	}
	
	public void stop() {
		sfSoundBufferRecorder_Stop(soundBufferRecorder);
	}
	
	public uint getSampleRate() {
		return sfSoundBufferRecorder_GetSampleRate(soundBufferRecorder);
	}
	
	public const(SoundBuffer) getSoundBuffer() const {
		return new SoundBuffer(sfSoundBufferRecorder_GetBuffer(soundBufferRecorder));
	}
}


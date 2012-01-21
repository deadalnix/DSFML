module dsfml.audio.soundbufferrecorder;

import dsfml.audio.soundbuffer;
import dsfml.audio.soundrecorder;
import dsfml.sizes;

final class SoundBufferRecorder : SoundRecorder {
	private void[soundBufferRecorderSize - soundRecorderSize] data = void;
	
	@property
	package final inout(sfSoundBufferRecorder)* soundBufferRecorder() inout {
		return cast(inout(sfSoundBufferRecorder)*) soundRecorder;
	}
	
	this() {
		sfSoundBufferRecorder_Create(soundBufferRecorder);
	}
	
	~this() {
		sfSoundBufferRecorder_Destroy(soundBufferRecorder);
	}
	
	@property
	const(SoundBuffer) buffer() const {
		const(sfSoundBuffer) buffer = sfSoundBufferRecorder_GetBuffer(soundBufferRecorder);
		return new SoundBuffer(buffer);
	}
	
	// Currently completely useless.
	protected override bool onProcessSamples(const(short)[] samples) {
		return false;
	}
}

package extern(C++) {
	struct sfSoundBufferRecorder {
		void[soundBufferRecorderSize] data = void;
	}
	
	void sfSoundBufferRecorder_Create(sfSoundBufferRecorder* soundBufferRecorder);
	void sfSoundBufferRecorder_Copy(const sfSoundBufferRecorder* soundBufferRecorder, sfSoundBufferRecorder* destination);
	void sfSoundBufferRecorder_Destroy(sfSoundBufferRecorder* soundBufferRecorder);
	
	const(sfSoundBuffer) sfSoundBufferRecorder_GetBuffer(const sfSoundBufferRecorder* soundBufferRecorder);
}


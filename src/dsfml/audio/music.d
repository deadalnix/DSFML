module dsfml.audio.music;

import dsfml.audio.soundstream;
import dsfml.system.inputstream;
import dsfml.sizes;

import std.string;

final class Music : SoundStream {
	private void[musicSize - soundStreamSize] data = void;
	
	// TODO: Go inout for D2.056
	@property
	package final sfMusic* music() {
		return cast(sfMusic*) soundStream;
	}
	
	@property
	package final const(sfMusic)* music() const {
		return cast(const(sfMusic)*) soundStream;
	}
	
	this() {
		sfMusic_Create(music);
	}
	
	~this() {
		sfMusic_Destroy(music);
	}
	
	bool openFromFile(string filename) {
		return sfMusic_OpenFromFile(music, toStringz(filename));
	}
	
	bool openFromMemory(const void[] data) {
		return sfMusic_OpenFromMemory(music, data.ptr, data.length);
	}
	
	bool openFromStream(InputStream stream) {
		return sfMusic_OpenFromStream(music, stream);
	}
	
	@property
	uint duration() const {
		return sfMusic_GetDuration(music);
	}
	
	// Dummy function to handle compatibility with soundStream.
	private final void onSeek(uint timeOffset) {}
	private final bool onGetData(ref short[] data) {
		return false;
	}
}

extern(C++) {
	// Opaque struct ?
	struct sfMusic {}
	
	void sfMusic_Create(sfMusic* music);
	void sfMusic_Destroy(sfMusic* music);
	
	bool sfMusic_OpenFromFile(sfMusic* music, const char* filename);
	bool sfMusic_OpenFromMemory(sfMusic* music, const void* data, size_t sizeInBytes);
	bool sfMusic_OpenFromStream(sfMusic* music, InputStream stream);
	uint sfMusic_GetDuration(const sfMusic* music);
}


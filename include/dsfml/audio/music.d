module dsfml.audio.music;

import csfml.audio.music;

import dsfml.audio.soundstream;
import dsfml.system.inputstream;

import std.string;

class Music : SoundStream {
	private sfMusic* music;
	
	public this(string filename) {
		if(filename is null || filename.length == 0) throw new Exception("LoadingException : Filename is invalid.");
		
		music = sfMusic_CreateFromFile(toStringz(filename));
	}
	
	public this(const void[] data) {
		if(data is null || data.length == 0) throw new Exception("LoadingException : Memory stream is invalid.");
		
		music = sfMusic_CreateFromMemory(data.ptr, data.length);
	}
	
	public this(InputStream inputStream) {
		if(inputStream is null) throw new Exception("LoadingException : InputStream is invalid.");
		
		music = sfMusic_CreateFromStream(inputStream.getCInputStream());
	}
	
	public ~this() {
		sfMusic_Destroy(music);
	}
	
	// Dummy function to handle compatibility with soundStream.
	deprecated private final void onSeek(uint timeOffset) {}
	deprecated private final bool onGetData(const short[] data) {
		return false;
	}
}


module csfml.system.inputstream;

extern(C) {
	alias long function(byte* data, long size, void* userData) sfInputStreamReadFunc;
	alias long function(long position, void* userData) sfInputStreamSeekFunc;
	alias long function(void* userData) sfInputStreamTellFunc;
	alias long function(void* userData) sfInputStreamGetSizeFunc;
}

struct sfInputStream {
	sfInputStreamReadFunc		read;
	sfInputStreamSeekFunc		seek;
	sfInputStreamTellFunc		tell;
	sfInputStreamGetSizeFunc	getSize;
	void*						userData;
}


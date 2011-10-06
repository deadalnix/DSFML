module dsfml.system.inputstream;

import csfml.system.inputstream;

private {
	extern(C) {
		long inputStreamRead(byte* data, long size, void* userData) {
			InputStream istream = cast(InputStream) userData;
			return istream.read(data[0 .. size]);
		};
		
		long inputStreamSeek(long position, void* userData) {
			InputStream istream = cast(InputStream) userData;
			return istream.seek(position);
		};
		
		long inputStreamTell(void* userData) {
			InputStream istream = cast(InputStream) userData;
			return istream.tell();
		};
		
		long inputStreamGetSize(void* userData) {
			InputStream istream = cast(InputStream) userData;
			return istream.getSize();
		};
	}
}

abstract class InputStream {
	private sfInputStream cis = {
		read		: &inputStreamRead,
		seek		: &inputStreamSeek,
		tell		: &inputStreamTell,
		getSize		: &inputStreamGetSize,
	};
	
	protected this() {
		cis.userData = cast(void*)this;
	}
	
	abstract long read(byte[] data);
	abstract long seek(long position);
	abstract long tell();
	abstract long getSize();
}


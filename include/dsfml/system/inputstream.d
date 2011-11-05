module dsfml.system.inputstream;

import csfml.system.inputstream;

abstract class InputStream {
	private sfInputStream inputStream = {
		read		: &inputStreamRead,
		seek		: &inputStreamSeek,
		tell		: &inputStreamTell,
		getSize		: &inputStreamGetSize,
	};
	
	protected this() {
		inputStream.userData = cast(void*) this;
	}
	
	abstract long read(byte[] data);
	abstract long seek(long position);
	abstract long tell();
	abstract long getSize();
	
	// deprecated
	public const(sfInputStream*) getCInputStream() const {
		return &inputStream;
	}
	
	public immutable(sfInputStream*) getCInputStream() immutable {
		return &inputStream;
	}
	
	public sfInputStream* getCInputStream() {
		return &inputStream;
	}
}

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


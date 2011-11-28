module dsfml.system.inputstream;

extern(C++) interface sfInputStream {
	long read(byte[] data);
	long seek(long position);
	long tell();
	long getSize();
}

alias sfInputStream InputStream;


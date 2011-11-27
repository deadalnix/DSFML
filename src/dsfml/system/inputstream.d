module dsfml.system.inputstream;

extern(C++) interface InputStream {
	long read(byte[] data);
	long seek(long position);
	long tell();
	long getSize();
}


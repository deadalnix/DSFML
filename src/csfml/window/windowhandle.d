module csfml.window.windowhandle;

version(Windows) {
	// Window handle is HWND (HWND__*) on Windows
	struct HWND__;
	alias HWND__* sfWindowHandle;
} else version(Posix) {
	// Window handle is Window (unsigned long) on Unix - X11
	version(X86) {
		alias uint sfWindowHandle;
	} else version(X86_64) {
		alias ulong sfWindowHandle;
	}
} else version(OSX) {
	alias void* sfWindowHandle;
}

static assert(is(sfWindowHandle), "Plateform not supported");


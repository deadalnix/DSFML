module dsfml.window.windowhandle;

version(Windows) {
	// Window handle is HWND (HWND__*) on Windows
	struct HWND__;
	alias HWND__* WindowHandle;
} else version(Posix) {
	// Window handle is Window (unsigned long) on Unix - X11
	import core.stdc.config;
	
	alias c_ulong WindowHandle;
} else version(OSX) {
	alias void* WindowHandle;
}

static assert(is(WindowHandle), "Plateform not supported");

